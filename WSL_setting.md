# Windows Subsystem for Linux Setting

### 1. **Windows PowerShell**
> `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`

### 2. **Setting Ubuntu**
> a.升級所有套件
>> `sudo apt-get update && sudo apt-get upgrade`
> 
> b.建立 SSH 金鑰組
>> `ssh-keygen -t rsa -b 4096 -f $HOME/.ssh/id_rsa -P ""`
>> `touch ~/.ssh/authorized_keys`
>> `chmod 700 ~/.ssh`
>> `chmod 600 ~/.ssh/authorized_keys`