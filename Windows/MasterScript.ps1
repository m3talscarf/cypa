#account that is being used should be user account so that all files can be saved to correct place.
Write-output 'UserName:'
#$CompUser = Read-Host
#Write-output 'drive letter of usb'
#$DriveLetter = Read-Host

#Creates folder to store all files created by script in one place
New-item -itemType Directory -Path c:\Users\CyberPatriotCompetitionFile
New-item -itemType File -Path C:\Users\Desktop\CyberPatriotCompetitionFile\interestingprocess.txt


#Region Windows FireWall Stuff:
#sets Firewall to active
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

#Editing firewall rules
Write-Warning 'editing firewall'
Set-NetFirewallProfile -DefaultInboundAction Block -DefaultOutboundAction Allow -NotifyOnListen True -AllowUnicastResponseToMulticast True -LogFileName %SystemRoot%\System32\LogFiles\Firewall\pfirewall.log
netsh advfirewall firewall set rule group="Network Discovery" new enable=No
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=No
netsh advfirewall firewall add rule name="block_RemoteRegistry_in" dir=in service="RemoteRegistry" action=block enable=yes
netsh advfirewall firewall add rule name="block_RemoteRegistry_out" dir=out service="RemoteRegistry" action=block enable=yes  
netsh advfirewall firewall set rule name="Remote Assistance (DCOM-In)" new enable=no 
netsh advfirewall firewall set rule name="Remote Assistance (PNRP-In)" new enable=no 
netsh advfirewall firewall set rule name="Remote Assistance (RA Server TCP-In)" new enable=no 
netsh advfirewall firewall set rule name="Remote Assistance (SSDP TCP-In)" new enable=no 
netsh advfirewall firewall set rule name="Remote Assistance (SSDP UDP-In)" new enable=no 
netsh advfirewall firewall set rule name="Remote Assistance (TCP-In)" new enable=no 
netsh advfirewall firewall set rule name="Telnet Server" new enable=no
netsh advfirewall firewall set rule name="netcat" new enable=no

#Blocking high risk ports
New-NetFirewallRule -DisplayName "Block Port 23" -Direction Inbound -LocalPort 23 -Protocol TCP -Action Block -Asjob
New-NetFirewallRule -DisplayName "Block Port 20" -Direction Inbound -LocalPort 20 -Protocol TCP -Action Block -Asjob
New-NetFirewallRule -DisplayName "Block Port 21" -Direction Inbound -LocalPort 21 -Protocol TCP -Action Block -Asjob
New-NetFirewallRule -DisplayName "Block Port 22" -Direction Inbound -LocalPort 22 -Protocol TCP -Action Block -AsJob
New-NetFirewallRule -DisplayName "Block Port 69" -Direction Inbound -LocalPort 69 -Protocol TCP -Action Block -AsJob
New-NetFirewallRule -DisplayName "Block Port 3389" -Direction Inbound -LocalPort 3389 -Protocol TCP -Action Block -AsJob
New-NetFirewallRule -DisplayName "Block Port 5900,5901,5902" -Direction Inbound -LocalPort 5900,5901,5902 -Protocol TCP -Action Block -AsJob
New-NetFirewallRule -DisplayName "Block Port 5112,513,514" -Direction Inbound -LocalPort 512,513,514 -Protocol TCP -Action Block -AsJob
New-NetFirewallRule -DisplayName "Block Port 873" -Direction Inbound -LocalPort 873 -Protocol TCP -Action Block -AsJob
New-NetFirewallRule -DisplayName "Block Port 25" -Direction Inbound -LocalPort 25 -Protocol TCP -Action Block -AsJob
New-NetFirewallRule -DisplayName "Block Port 110" -Direction Inbound -LocalPort 110 -Protocol TCP -Action Block -AsJob
New-NetFirewallRule -DisplayName "Block Port 143" -Direction Inbound -LocalPort 143 -Protocol TCP -Action Block -AsJob
New-NetFirewallRule -DisplayName "Block Port 1433" -Direction Inbound -LocalPort 1433 -Protocol TCP -Action Block -Asjob
New-NetFirewallRule -DisplayName "Block Port 1521" -Direction Inbound -LocalPort 1521 -Protocol TCP -Action Block -Asjob
New-NetFirewallRule -DisplayName "Block Port 3306" -Direction Inbound -LocalPort 3306 -Protocol TCP -Action Block -Asjob
New-NetFirewallRule -DisplayName "Block Port 5000" -Direction Inbound -LocalPort 5000 -Protocol TCP -Action Block -Asjob
New-NetFirewallRule -DisplayName "Block Port 5432" -Direction inbound -LocalPort 5432 -Protocol TCP -Action Block -Asjob
New-NetFirewallRule -DisplayName "Block Port 6379" -Direction Inbound -LocalPort 6379 -Protocol TCP -Action Block -Asjob
New-NetFirewallRule -DisplayName "Block Port 27017,27018" -Direction Inbound -LocalPort 27017,27018 -Protocol TCP -Action Block -Asjob
#EndRegion

<#Finds files created by user and puts them into a file located in the Users c drive
Get-ChildItem -Path C:\users\$CompUser*.txt -Recurse -Force -Depth 2 > c:\Users\$CompUser\CyberPatriotCompetitionFile\txtOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.png  -Recurse -Force -Depth 1 > c:\Users\$CompUser\CyberPatriotCompetitionFile\pngOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.jpeg  -Recurse -Force -Depth 2 > c:\Users\$CompUser\CyberPatriotCompetitionFile\jpegOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.doc  -Recurse -Force -Depth 2 > c:\Users\$CompUser\CyberPatriotCompetitionFile\docOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.mp3  -Recurse -Force -Depth 2 > c:\Users\$CompUser\CyberPatriotCompetitionFile\mp3OutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.sql  -Recurse -Force -Depth 2 > c:\Users\$CompUser\CyberPatriotCompetitionFile\sqlOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.exe  -Recurse -Force -Depth 2 > c:\Users\$CompUser\CyberPatriotCompetitionFile\exeOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.mp4  -Recurse -Force -Depth 2 > c:\Users\$CompUser\CyberPatriotCompetitionFile\mp4OutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.docx  -Recurse -Force -Depth 2 > c:\Users\$CompUser\CyberPatriotCompetitionFile\docxOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.pdf  -Recurse -Force -Depth 2 > c:\Users\$CompUser\CyberPatriotCompetitionFile\pdfOutPut -ErrorAction SilentlyContinue#>

#find files created by user and puts them in a file located and then removes those files.
Write-Warning 'finding files: putting into file:'
Get-ChildItem -Path C:\Users\* -Include *.jpg,*.png,*.aac,*.ac3,*.avi,*.aiff,*.bat,*.bmp,*.exe,*.flac,*.gif,*.jpeg,*.mov,*.m3u,*.m4p,*.mp2,*.mp3,*.mp4,*.mpeg4,*.midi,*.msi,*.ogg,*.png,*.txt,*.sh,*.wav,*.wma,*.vqf,*.pcap,*.zip,*.pdf,*.json -Recurse -Depth 1 > C:\Users\Desktop\CyberPatriotCompetitionFile
$Files = Get-ChildItem -Path C:\Users\* -Include *.jpg,*.png,*.aac,*.ac3,*.avi,*.aiff,*.bat,*.bmp,*.exe,*.flac,*.gif,*.jpeg,*.mov,*.m3u,*.m4p,*.mp2,*.mp3,*.mp4,*.mpeg4,*.midi,*.msi,*.ogg,*.png,*.txt,*.sh,*.wav,*.wma,*.vqf,*.pcap,*.zip,*.pdf,*.json -Recurse -Depth 1 
Write-Warning 'listing all located files in user directory'
Write-output $Files
Write-output 'Would you like to remove all of these files^: if yes=1, No=0'
$1 = Read-Host
if ($1 -eq 1){
    Write-Warning 'Removing all found files'
    Remove-Item -Path C:\Users\* -Include *.jpg,*.png,*.aac,*.ac3,*.avi,*.aiff,*.bat,*.bmp,*.exe,*.flac,*.gif,*.jpeg,*.mov,*.m3u,*.m4p,*.mp2,*.mp3,*.mp4,*.mpeg4,*.midi,*.msi,*.ogg,*.png,*.txt,*.sh,*.wav,*.wma,*.vqf,*.pcap,*.zip,*.pdf,*.json -Recurse -Depth 1 
}

#searches for proccess that are using lots of system memory so user can see if they should be on the computer
Write-Warning "investigating processes"
Get-Process | Where-Object {$_.WorkingSet -gt 20000000} > C:\Users\Desktop\CyberPatriotCompetitionFile\interestingprocess

#Updates the password policy configuration file:
Write-Warning 'setting password policy'
Start-Process -FilePath secedit -ArgumentList "/configure", "/db", "c:\windows\security\local.sdb", "/cfg", "$(Get-Content -Path LocalPassword\IntialConfig.cfg)", "/areas", "SECURITYPOLICY" -Wait

#Region Creating groups and local users
#Shows active users on local computer
Get-LocalUser | Where-Object -Property enabled

#creates any groups that are required by the compettion:
Write-Output 'Want to add a group? yes=1, no=0'
$i = Read-Host
while ($i -eq 1){
    Write-Output 'Name of group'
    $GroupName = Read-Host
    New-LocalGroup -Name $GroupName
    Write-Output 'Want to add a group? yes=1, no=0'
    $i = Read-Host
}

#Conditonal that creates new user on local computer as long as the user inputs 1 and when the user inputs 0 the script moves on.
Write-Output 'New User? yes=1, no=0 '
$i = Read-Host

while ($i -eq 1) {
    Write-Output 'UserName:'
    $UserName = Read-Host
    Write-Output 'Full Name:'
    $FullName = Read-Host
    Write-Output 'Group: (seperate with , then a space for mulitple groups)'
    $Group = Read-Host
    
    New-LocalUser -Name $UserName -FullName $FullName -AccountNeverExpires -UserMayNotChangePassword
    Add-LocalGroupMember -Group "$Group" -Member $UserName 
    Add-LocalGroupMember -Group "Users" -Member $UserName 
    
    Get-LocalUser |Where-Object -Property enabled
    Write-Output 'New User? yes=1, no=0 '
    $i = Read-Host
}

#Conditonal that removes a user on local computer as long as user inputs 1. When the user inputs 0 the script moves on. 
Write-Output 'Remove User? Yes=1, No=0'
$i = Read-Host

while ($i -eq 1) {
    Write-Output 'What users would you like to remove?'
    $User = Read-Host
    Remove-LocalUser -Name $User

    Get-LocalUser | Where-Object -Property enabled
    Write-Output 'Remove User? Yes=1, No=0'
$i = Read-Host
}

#Changes all passwords of all users to one secure password:AsSecureString
Write-Output 'password for all users is CyberSecure123!    copy this password into the next field:'
$Password = Read-Host -AsSecureString
$UserAccount = Get-LocalUser |Where-Object -Property enabled
$UserAccount | Set-localuser -Password $Password
#EndRegion 

#Region Microsoft Defender stuff: 
#Use Defender module on microsoft learn for info: https://learn.microsoft.com/en-us/powershell/module/defender/?view=windowsserver2022-ps
#need to test on windows vm
#should make it to where all solutions are exported to file

#gets the status of anitmalware software on the computer:
Get-MpComputerStatus

#Makes it to where the scan wont scan scripts usb and have false positives. 
Set-MpPreference -DisableRemovableDriveScanning $true
#Scans network drives if there are any
Set-MpPreference -DisableScanningMappedNetworkDrivesForFullScan $false
#Makes sure defender doesent scan folder made by user during competition.
Set-MpPreference -ExclusionPath c:\Users\CyberPatriotCompetitionFile

#to check settings were completed correctly, then stores in file for later use if needed
Get-MpPreference > c:\users\CyberPatriotCompetitionFile\DefenderSettings
#see all past and current threats detected on computer
Get-MpThreat > c:\users\CyberPatriotCompetitionFile\ThreatsDetected


###can use Get-MpThreatCatalog to check what any threats that are found do, by using the process id of any dicoverd threats to help figure out how to defend against it. - this needs to be a conditional that would be very helpful, mayber shoudl be at bottom or near bottom of script.


#updates the antimalware: should run before you start scan.
Update-MpSignature
#run after updates: starts the scan
Start-MpScan -ScanType QuickScan
#Removes detected active threats from local computer:
Remove-MpThreat
#EndRegion