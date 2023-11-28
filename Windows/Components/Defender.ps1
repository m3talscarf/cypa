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
Get-MpPreference > c:\users\CyberPatriotCompetitionFile\DefenderStuff\DefenderSettings
#see all past and current threats detected on computer
Get-MpThreat > c:\users\CyberPatriotCompetitionFile\DefenderStuff\ThreatsDetected


###can use Get-MpThreatCatalog to check what any threats that are found do, by using the process id of any dicoverd threats to help figure out how to defend against it. - this needs to be a conditional that would be very helpful, mayber shoudl be at bottom or near bottom of script.


#updates the antimalware: should run before you start scan.
Update-MpSignature
#run after updates: starts the scan
Start-MpScan -ScanType QuickScan
#Removes detected active threats from local computer:
Remove-MpThreat



