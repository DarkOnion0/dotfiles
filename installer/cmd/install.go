package cmd

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"os/exec"
	"strings"

	"github.com/AlecAivazis/survey/v2"
	"github.com/spf13/cobra"
	"gopkg.in/yaml.v2"

	"github.com/fatih/color"
)

// installCmd represents the install command
var installCmd = &cobra.Command{
	Use:   "install",
	Short: "Launch the installation / configuration of the OS",
	//Long: ``,
	Run: func(cmd *cobra.Command, args []string) {
		// fmt.Println("install called")
		launchInstaller()
	},
}

func init() {
	rootCmd.AddCommand(installCmd)
}

//////////
// TYPE //
//////////
type answersInstallT struct {
	Hostname string
	Os       string
}

type answersUbuntuT struct {
	InstallPackage      bool
	ImportConfiguration bool
	SelectedVersion     string `survey:"version"`
}

type answersConfigurationT struct {
	SelectedConfiguration []string
}
type osListT struct {
	ubuntu []string
}

// INSTALL FILE TYPE

type repositoryT struct {
	Commands []string
	Version  string
}

type packageYamlT struct {
	Ubuntu packageYamlOST
}

type packageYamlOST struct {
	Prerequisites []string
	Repos         []repositoryT
	Packages      []string
}

// launchInstaller launch the install script by asking basics question to the user to install prerequisites and some distro specific actions.
// It also do some basics stuff that should be ask first (even if I did that, it should be avoided 😅).
func launchInstaller() {
	statusDisplay := color.New(color.FgWhite).Add(color.Bold)

	osList := osListT{ubuntu: []string{"21.04"}}

	answersInstall := answersInstallT{}

	var qsInstall = []*survey.Question{
		{
			Name:   "hostname",
			Prompt: &survey.Input{Message: "Defined a machine hostname (leave it blank to change anything):"},
			//Validate: survey.Required,
			Transform: survey.Title,
		},
		{
			Name: "os",
			Prompt: &survey.Select{
				Message: "Choose your os and os version:",
				Options: []string{"ubuntu", "archlinux"},
				Default: "ubuntu",
			},
		},
	}

	err := survey.Ask(qsInstall, &answersInstall)

	if err != nil {
		fmt.Println("error during setup :", err.Error())
		return
	}

	if answersInstall.Os == "archlinux" {
		// Archlinux specific configuration
		//fmt.Println(answersInstall, *answersInstall.Version)
		statusDisplay.Println("😕 ARCHLINUX is currently not configured, sorry")

	} else if answersInstall.Os == "ubuntu" {
		// Ubuntu specific configuration
		answerUbuntu := answersUbuntuT{}
		var qsUbuntu = []*survey.Question{
			{
				Name: "version",
				Prompt: &survey.Select{
					Message: "Choose your os version:",
					Options: osList.ubuntu,
					Default: osList.ubuntu[0],
				},
			},
			{
				Name: "installPackage",
				Prompt: &survey.Confirm{
					Message: "Do you want to install package ?",
				},
			},
			{
				Name: "importConfiguration",
				Prompt: &survey.Confirm{
					Message: "Do you want to install configuration ?",
				},
			},
		}

		err := survey.Ask(qsUbuntu, &answerUbuntu)

		if err != nil {
			fmt.Println(err.Error())
			return
		}
		downloadRepo(answersInstall.Os)
		installPackage(answersInstall.Os, answerUbuntu.SelectedVersion, answerUbuntu.InstallPackage)
		importConfiguration(answerUbuntu.ImportConfiguration)
		if answersInstall.Hostname != "" {
			editHostname(answersInstall.Hostname)
		}
		// fmt.Println(osList.ubuntu, answersInstall, *answersInstall.Version)
	} else {
		boldRed := color.New(color.FgRed).Add(color.Bold)
		boldRed.Println("ERROR: invalid os")
	}
}

// This function handle all the things relative to installing package from the package.yaml file.
// PARAMATERS:
//============
// The os name should be the same as in the osListT type
// wantToInstallPackage | it is the answer of the question ask in the launchInstaller function that conditioned if the function will be executed or not
func installPackage(os, version string, wantToInstallPackage bool) {
	statusDisplay := color.New(color.FgWhite).Add(color.Bold)
	selectedPackage := packageYamlOST{}
	osInstallCmd := ""
	osInstallParams := ""

	if wantToInstallPackage {
		data, err := ioutil.ReadFile("/tmp/dotfiles/package.yaml")

		if err != nil {
			fmt.Printf("\n%s", err)
			return
		} else {

			packageList := packageYamlT{}

			err := yaml.Unmarshal([]byte(data), &packageList)
			if err != nil {
				log.Fatalf("error: %v", err)
			}

			if os == "ubuntu" {
				selectedPackage.Prerequisites = packageList.Ubuntu.Prerequisites
				selectedPackage.Repos = packageList.Ubuntu.Repos
				selectedPackage.Packages = packageList.Ubuntu.Packages
				osInstallCmd = "apt"
				osInstallParams = "install"
			}

			statusDisplay.Println("\n📥 downloading prerequisites...")

			for i := 0; i < len(selectedPackage.Prerequisites); i++ {
				out, err := exec.Command(osInstallCmd, osInstallParams, selectedPackage.Prerequisites[i]).Output()

				if err != nil {
					fmt.Printf("\n%s", err)
					output := string(out[:])
					fmt.Println(output)
				}
			}

			statusDisplay.Println("📥 downloading prerequisites finished successfully !!!")

			statusDisplay.Println("\n🗄️ adding repos...")

			for i := 0; i < len(selectedPackage.Repos); i++ {

				if selectedPackage.Repos[i].Version == "all" || selectedPackage.Repos[i].Version == version {

					for i2 := 0; i2 < len(selectedPackage.Repos[i].Commands); i2++ {

						out, err := exec.Command("/bin/sh", "-c", selectedPackage.Repos[i].Commands[i2]).Output()

						//fmt.Println(i, i2, selectedPackage.Repos[i].Commands[i2], len(selectedPackage.Repos[i].Commands))

						if err != nil {
							fmt.Printf("\n%s", err)
							output := string(out[:])
							fmt.Println(output)
						}
					}
				}
			}

			statusDisplay.Println("\n🗄️ adding repos finished successfully !!!")

			statusDisplay.Println("\n📦 installing packages...")

			for i := 0; i < len(selectedPackage.Packages); i++ {
				out, err := exec.Command("/bin/sh", "-c", selectedPackage.Packages[i]).Output()

				if err != nil {
					fmt.Printf("\n%s", err)
					output := string(out[:])
					fmt.Println(output)
				}
			}

			statusDisplay.Println("\n📦 installing packages finished successfully")

		}
	}
}

// This function handle all the things relative to importing dotfiles present in this repo from the dotfiles.yaml file.
// PARAMATERS:
//============
// wantToImportConfiguration | it is the answer of the question ask in the launchInstaller function that conditioned if the function will be executed or not
func importConfiguration(wantToImportConfiguration bool) {
	// fmt.Println("importConfiguration", wantToImportConfiguration)

	if wantToImportConfiguration {

		answersConfiguration := answersConfigurationT{}

		var qsConfiguration = []*survey.Question{
			{
				Name: "SelectedConfiguration",
				Prompt: &survey.Select{
					Message: "Choose your configuration file to import:",
					Options: []string{},
					// Default: osList.ubuntu[0],
				},
			},
		}

		err := survey.Ask(qsConfiguration, &answersConfiguration)

		if err != nil {
			fmt.Println(err.Error())
			return
		}
	}
}

// This function modify or not the current hostname of the linux box.
// The function execute only if the hostname length  different than 0
func editHostname(hostname string) {
	statusDisplay := color.New(color.FgWhite).Add(color.Bold)

	if len(hostname) != 0 {
		statusDisplay.Println("\n🏟️  editing hostname...")

		backupFile("/etc/hostname", "/etc/hostname.old")

		file, err := os.Create("/etc/hostname")

		if err != nil {
			log.Fatalf("failed creating file: %s", err)
		}

		defer file.Close()

		len, err := file.WriteString(strings.ToLower(hostname))

		if err != nil {
			fmt.Printf("\nLength: %d bytes", len)
			fmt.Printf("\nFile Name: %s", file.Name())
			log.Fatalf("failed writing to file: %s", err)
		} else {
			statusDisplay.Println("🏟️  editing hostname finished successfully !!!")
		}
	}
}

// This function is there to backup file. Therefor if the user execute the script and note that it he didn't backup his most precious dotfiles and that the script changed them.
// He can always recover them
func backupFile(oldPath, newPath string) {
	e := os.Rename(oldPath, newPath)
	if e != nil {
		log.Fatal(e)
	}
}

// This function is badlynamed and his role in th whole project is just to download the prerequisites needed by the script (git and bash)
// PARAMATERS:
//============
// The os name should be the same as in the osListT type
func downloadRepo(os string) {
	statusDisplay := color.New(color.FgWhite).Add(color.Bold)

	if os == "ubuntu" {
		statusDisplay.Println("\n💾 installing git and bash...")
		out, err := exec.Command("apt", "install", "git", "bash").Output()

		if err != nil {

			fmt.Printf("\n%s", err)
			output := string(out[:])
			fmt.Println(output)

		} else {
			statusDisplay.Println("💾 installing git and bash finished successfully !!!")
		}
	} else {
		fmt.Printf("Your os %q is not supported", os)
		return
	}

	statusDisplay.Println("📂 downloading GitHub repo...")
	out, err := exec.Command("rm", "-rf", "/tmp/dotfiles").Output()

	if err != nil {
		fmt.Printf("\n%s", err)
		output := string(out[:])
		fmt.Println(output)
	} else {

		out, err := exec.Command("git", "clone", "https://github.com/DarkOnion0/dotfiles.git", "/tmp/dotfiles").Output()

		if err != nil {

			fmt.Printf("\n%s", err)
			output := string(out[:])
			fmt.Println(output)

		} else {
			statusDisplay.Println("📂 downloading GitHub repo finished successfully !!!")
		}
	}
}
