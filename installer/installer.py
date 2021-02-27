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
#print(os_name, type(os_name), os_name_tmp, type(os_name_tmp))

if os_name == "Pop!_OS" or os_name == "Ubuntu":

    os.system("sudo apt -qq install -y python3-pip")
    os.system("pip3 install pyyaml rich")

    from setup import ubuntu

    ubuntu()
else:
    print(f"Your Linux OS is not supported : \n\nOS ==> {os_name}")