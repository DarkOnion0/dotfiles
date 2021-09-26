/*
Copyright © 2021 DarkOnion0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
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

	"github.com/fatih/color"

	"github.com/goccy/go-yaml"
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

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// installCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// installCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}

// TYPE

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

type packageYamlT struct {
	Ubuntu struct {
		Prerequisites []string
		Repos         []string
		Package       []string
	}
}

// type callBackT string

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

func installPackage(os, version string, wantToInstallPackage bool) {
	if wantToInstallPackage {
		data, err := ioutil.ReadFile("/tmp/dotfiles/installer/package.yaml")

		if err != nil {
			fmt.Printf("\n%s", err)
			return
		} else {

			packageList := packageYamlT{}

			if err := yaml.Unmarshal([]byte(data), &packageList); err != nil {
				fmt.Printf("%s", packageList)
			}
		}
	}
}

func importConfiguration(wantToImportConfiguration bool) {
	fmt.Println("importConfiguration")
	answersConfiguration := answersConfigurationT{}

	var qsConfiguration = []*survey.Question{
		{
			Name: "SelectedConfiguration",
			Prompt: &survey.Select{
				Message: "Choose your configuration file to import:",
				// Options: osList.ubuntu,
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

func backupFile(oldPath, newPath string) {
	e := os.Rename(oldPath, newPath)
	if e != nil {
		log.Fatal(e)
	}
}

func downloadRepo(os string) {
	if os == "ubuntu" {
		fmt.Println("\n💾 installing git...")
		out, err := exec.Command("apt", "install", "git").Output()

		if err != nil {

			fmt.Printf("\n%s", err)
			output := string(out[:])
			fmt.Println(output)

		} else {
			fmt.Println("💾 installing git finished successfully !!!")
		}
	} else {
		fmt.Printf("Your os %q is not supported", os)
		return
	}

	files, err := ioutil.ReadDir("/tmp/")
	alreadyDownloaded := false

	if err != nil {
		log.Fatal(err)
	}

	for _, f := range files {
		if f.Name() == "dotfiles" {
			alreadyDownloaded = true
		}
	}

	if alreadyDownloaded {
		fmt.Println("📂 updating GitHub repo...")
		out, err := exec.Command("git", "pull", "/tmp/dotfiles/").Output()

		if err != nil {

			fmt.Printf("\n%s", err)
			output := string(out[:])
			fmt.Println(output)

		} else {
			fmt.Println("📂 updating GitHub repo finished successfully !!!")
		}
	} else {

		fmt.Println("📂 downloading GitHub repo...")
		out, err := exec.Command("git", "clone", "https://github.com/DarkOnion0/dotfiles.git", "/tmp/dotfiles").Output()

		if err != nil {

			fmt.Printf("\n%s", err)
			output := string(out[:])
			fmt.Println(output)

		} else {
			fmt.Println("📂 downloading GitHub repo finished successfully !!!")
		}
	}
}
