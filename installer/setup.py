#########################################
# TODO add os version check
# TODO add auto-configuration in script (copy conf files from git)
# DONE test the project
#########################################
import yaml, os, rich, sys

def ubuntu():
    with open("apps.yml", "r") as f:
        app_list = dict(yaml.safe_load(f))

    #print(app_list)

    try: # try to add listed repository
        repos_tmp = app_list.get("ubuntu")
        repos = repos_tmp.get("repos")

        #print(repos, len(repos))

        for key in repos: # get the repos name
            #print("KEY ===> ", key)
            command_list = repos.get(key)
            #print("\nCOMMAND_LIST ===> ", command_list)
            #print("\n", command_list)

            for command in command_list: # get all the command listed in the repo
                #print("\n\n", command)
                os.system(f"{command}")

                #print(key, command)
            
            os.system("sudo apt update")

            #print(command_list)

    except:
        rich.print("[bold red]ERROR:[/bold red] You haven't setup any additional repository")
        pass

    try:
        software = repos_tmp.get("packages")
        
        try:
            software_deb = software.get("deb")
            for apps in software_deb:
                #print(apps)
                os.system(f"sudo apt install -y {apps}")
        except:
            pass
        
        try:
            software_flatpak = software.get("flatpak")
            for apps in software_flatpak:
                #print(apps)
                os.system(f"flatpak install {apps}")
        except:
            pass
        
        try:
            software_src = software.get("external")
            for key in software_src:
                software_src_app = software_src.get(key)

                for command in software_src_app:
                    os.system(f"cd /tmp/ && {command}")

            #for apps in software_src:
            #    #print(apps)
            #    os.system(f"{apps}")
        except:
            pass

        
        #print(software)
    except:
        rich.print("[bold red]ERROR:[/bold red] An error occurred when installing packages")
        pass

if sys.argv[1] == "ubuntu":
    ubuntu()