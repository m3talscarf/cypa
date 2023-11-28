

#Creates folder to store all files created by script in one place
New-item -itemType Directory -Path c:\Users\CyberPatriotCompetitionFile

#sets Firewall to active
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

#Blocking high risk ports
New-NetFirewallRule -DisplayName "Block Port 23" -Direction Outbound -LocalPort 23 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 20" -Direction Outbound -LocalPort 20 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 21" -Direction Outbound -LocalPort 21 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 22" -Direction Outbound -LocalPort 22 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 69" -Direction Outbound -LocalPort 69 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 3389" -Direction Outbound -LocalPort 3389 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 5900,5901,5902" -Direction Outbound -LocalPort 5900,5901,5902 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 5112,513,514" -Direction Outbound -LocalPort 512,513,514 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 873" -Direction Outbound -LocalPort 873 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 25" -Direction Outbound -LocalPort 25 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 110" -Direction Outbound -LocalPort 110 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 143" -Direction Outbound -LocalPort 143 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 1433" -Direction Outbound -LocalPort 1433 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 1521" -Direction Outbound -LocalPort 1521 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 3306" -Direction Outbound -LocalPort 3306 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 5000" -Direction Outbound -LocalPort 5000 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 5432" -Direction Outbound -LocalPort 5432 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 6379" -Direction Outbound -LocalPort 6379 -Protocol TCP -Action Block | Out-Null
New-NetFirewallRule -DisplayName "Block Port 27017,27018" -Direction Outbound -LocalPort 27017,27018 -Protocol TCP -Action Block| Out-Null

#Finds files created by user and puts them into a file located in the Users c drive
Get-ChildItem -Path C:\users\*.txt -Recurse -Force -Depth 2 > c:\Users\CyberPatriotCompetitionFile\txtOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.png  -Recurse -Force -Depth 2 > c:\Users\CyberPatriotCompetitionFile\pngOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.jpeg  -Recurse -Force -Depth 2 > c:\Users\CyberPatriotCompetitionFile\jpegOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.doc  -Recurse -Force -Depth 2 > c:\Users\CyberPatriotCompetitionFile\docOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.mp3  -Recurse -Force -Depth 2 > c:\Users\CyberPatriotCompetitionFile\mp3OutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.sql  -Recurse -Force -Depth 2 > c:\Users\CyberPatriotCompetitionFile\sqlOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.exe  -Recurse -Force -Depth 2 > c:\Users\CyberPatriotCompetitionFile\exeOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.mp4  -Recurse -Force -Depth 2 > c:\Users\CyberPatriotCompetitionFile\mp4OutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.docx  -Recurse -Force -Depth 2 > c:\Users\CyberPatriotCompetitionFile\docxOutPut -ErrorAction SilentlyContinue
Get-ChildItem -Path C:\users\*.pdf  -Recurse -Force -Depth 2 > c:\Users\CyberPatriotCompetitionFile\pdfOutPut -ErrorAction SilentlyContinue

###Saves the local security policy configuration file to competition folder:
Get-Content LocalPassword\IntialConfig.cfg
###Updates the local security policy:
secedit /configure /db c:\windows\security\local.sdb /cfg "IntialConfig.cfg" /areas SECURITYPOLICY

#Shows active users on local computer
Get-LocalUser | Where-Object -Property enabled

#need to create microsoft defender script componennt. -temp

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
    
    Get-LocalUser |Where-Object -Property enabled
    Write-Output 'New User? yes=1, no=0 '
    $i = Read-Host
}

#Conditonal that removes a user on local computer as long as user inputs 1. When the user inputs 0 the script moves on. 
Write-Output 'Remove User? Yes=1, No=0'
$i = Read-Host

while ($i -eq 1) {
    Write-Output 'What users would you like to remove?'
    $User = Read-HostgePassword = Read-host "Enter the New Password" -AsSecureString
    Remove-LocalUser -Name $User

    Get-LocalUser | Where-Object -Property enabled
    Write-Output 'Remove User? Yes=1, No=0'
$i = Read-Host
}

#Changes all passwords of all users to one secure password:AsSecureString
$Password = "CyberSecure123!"
$UserAccount = Get-LocalUser | Where-Object -Property enabled
$UserAccount | Set-localuser -Password $Password

#Microsoft Defender stuff: 
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
