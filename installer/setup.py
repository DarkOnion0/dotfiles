import os
with open("/etc/os-release", "r") as f:
    os_info = f.read()
    os_info = os_info.split("\n")
        
    count = 0
    while count < len(os_info) - 1:
        
        tmp = os_info[count].split("=")
        os_name_tmp = list(tmp[1])
        
        if count == 0:
            #print(os_name_tmp)
            count2 = 1
            tmp_arg2 = str()

            while count2 < len(os_name_tmp) - 1:
                tmp_arg2 += os_name_tmp[count2]
                
                count2 += 1
        
            #print(tmp_arg2)
 
        os_info[count] = [tmp[0], tmp_arg2]
        
        count += 1

#print(os_info, type(os_info))
os_name = os_info[0][1]
#os_name = "Pop!_OS"
#print(os_name, type(os_name), os_name_tmp, type(os_name_tmp))

#if str(os_name) == "Pop!_OS":
#    print("Hello World")

#if == "ubuntu":
if os_name == "Pop!_OS" or os_name == "Ubuntu":

    os.system("sudo apt -qq install -y python3-pip")
    os.system("pip3 install pyyaml rich")
    import yaml
    import rich

    with open("apps.yml", "r") as f:
        app_list = dict(yaml.safe_load(f))

    print(app_list)

    try:
        repos_tmp = app_list.get("ubuntu")
        repos = repos_tmp.get("repos")
        #repos_tmp = list(repos_tmp.items())
        #repos_keys = list(repos.keys())

        print(repos, len(repos))
        #print(repos_keys)

        for key in repos:
            print("KEY ===> ", key)
            command_list = repos.get(key)
            print("\nCOMMAND_LIST ===> ", command_list)
            #for command in command_list:
            #command_list = command_list[0]
            print("\n", command_list)
        
            for command in command_list:
                print("\n\n", command)
                os.system(f"{command}")

                #print(key, command)

            print(command_list)
            #os.system(f"{command[0]}")
    
    except:
        rich.print("[bold red]ERROR:[/bold red] You haven't setup any additional repository")

else:
    print(f"Your OS {os_name} with python type = {type(os_name)} is not supported")