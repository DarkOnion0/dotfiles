#########################################
# TODO add os version check
# TODO add auto-configuration in script
# TODO test the project
#########################################

#import os
#with open("/etc/os-release", "r") as f:
#    os_info = f.read()
#    os_info = os_info.split("\n")
#        
#    count = 0
#    while count < len(os_info) - 1:
#        
#        tmp = os_info[count].split("=")
#        os_name_tmp = list(tmp[1])
#        
#        if count == 0:
#            #print(os_name_tmp)
#            count2 = 1
#            tmp_arg2 = str()
#
#            while count2 < len(os_name_tmp) - 1:
#                tmp_arg2 += os_name_tmp[count2]
#                
#                count2 += 1
#        
#            #print(tmp_arg2)
# 
#        os_info[count] = [tmp[0], tmp_arg2]
#        
#        count += 1
#
##print(os_info, type(os_info))
#os_name = os_info[0][1]
##print(os_name, type(os_name), os_name_tmp, type(os_name_tmp))
#
#if os_name == "Pop!_OS" or os_name == "Ubuntu":
#
#    os.system("sudo apt -qq install -y python3-pip")
#    os.system("pip3 install pyyaml rich")

import yaml, os, rich

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
            
            os.system("sudo apt -qq update")

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
                os.system(f"sudo apt -qq install -y {apps}")
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



    