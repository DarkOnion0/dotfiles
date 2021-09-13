/*
Copyright © 2021 NAME HERE <EMAIL ADDRESS>

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

	"github.com/AlecAivazis/survey/v2"
	"github.com/spf13/cobra"

	"github.com/fatih/color"

	"os/exec"
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
type answerVersionT struct {
		SelectedVersion string `survey:"version"`
	}

	type answersInstallT struct {
		Hostname string
		Os       string
		Version  *answerVersionT
	}

	type osListT struct {
		ubuntu []string
	}


func launchInstaller() {
	

	osList := osListT{ubuntu: []string{"21.04"}}

	answersVersion := answerVersionT{}

	answersInstall := answersInstallT{Version: &answersVersion}

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
		fmt.Println(err.Error())
		return
	}

	if answersInstall.Os == "archlinux" {
		answersInstall.Version.SelectedVersion = "rolling"
		fmt.Println(answersInstall, *answersInstall.Version)

	} else if answersInstall.Os == "ubuntu" {

		var qsVersion = []*survey.Question{
			{
				Name: "version",
				Prompt: &survey.Select{
					Message: "Choose your os version:",
					Options: osList.ubuntu,
					Default: osList.ubuntu[0],
				},
			},
		}

		err := survey.Ask(qsVersion, &answersVersion)

		if err != nil {
			fmt.Println(err.Error())
			return
		}

		installPackage(answersInstall)

		// fmt.Println(osList.ubuntu, answersInstall, *answersInstall.Version)
	} else {
		boldRed := color.New(color.FgRed).Add(color.Bold)
		boldRed.Println("ERROR: invalid os")
	}
}

func installPackage(installInfo answersInstallT) {
	statusDisplay := color.New(color.FgWhite).Add(color.Bold)

	if len(installInfo.Hostname) != 0 {
		statusDisplay.Println("\n🏟️  editing hostname...")
		out, err := exec.Command("echo", installInfo.Hostname).Output()

		if err != nil {

			fmt.Printf("\n%s", err)
			output := string(out[:])
			fmt.Println(output)

		} else {
			statusDisplay.Println("🏟️  editing hostname finished successfully !!!")
		}
	}
}