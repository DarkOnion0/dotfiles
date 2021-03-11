import os
# DEFINED OS LIST

os_supported = {
    "ubuntu": ['"20.10"'],
    "pop": ['"20.10"'],
    "fedora": ['"33"'],
    "archlinux": ['"latest"']
}


with open("/etc/os-release", "r") as f:
    os_info = f.read()
    os_info = os_info.split("\n")
        
    count = 0

    while count < len(os_info) - 1:
        
        tmp = os_info[count].split("=")
#        print(tmp)

        if tmp[0] == "ID":
            ID = tmp[1]
        if tmp[0] == "VERSION_ID":
            VERSION_ID = tmp[1]

        count += 1
    
#    print("\nInformation ==> ", ID, VERSION_ID)
    check = False
    for data in os_supported:
        print(data)
        version_list = os_supported[data]

        if str(ID) == data:
#            print("ID is ", ID)
            
            for version in version_list:
#                print(version)
                
                if data == "archlinux":
                    check = True
                else:
                    if VERSION_ID == version:
#                        print("VERSION IS ==> ", VERSION_ID)
                        check = True
#print(os_info, type(os_info))
#os_name = os_info[0][1]
#print(os_name, type(os_name), os_name_tmp, type(os_name_tmp))

#print(check)

if check == True:

    if ID == "pop" or ID == "ubuntu":
    
        os.system("sudo apt install -y python3-pip curl wget")
        os.system("pip3 install pyyaml rich")
    
        os.system(f"python3 setup.py ubuntu {VERSION_ID}")
    
    else:
        print("\nERROR")

    
else:
    print(f"""
Your Linux OS is not supported :
================================
OS ==> {ID}
ID ==> {VERSION_ID}
    """)