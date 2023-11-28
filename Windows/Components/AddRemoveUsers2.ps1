Write-Output 'Do you want to add a user? Yes=1, No=0'
$UserYesNo = Read-Host

if($UserYesNo -eq 1){
Write-Output 'UserName:'
$UserName = Read-Host
Write-Output 'Password:'
$Password = Read-Host -AsSecureString
Write-Output 'Full Name:'
$FullName = Read-Host
Write-Output 'Group: (seperate with , then a space for mulitple groups)'
$Group = Read-Host

New-LocalUser -Name $UserName -FullName $FullName -Password $Password -AccountNeverExpires -UserMayNotChangePassword

Add-LocalGroupMember -Group "$Group" -Member $UserName
}

Write-Output 'Do you want to remove any users? Yes=1, No=0'
$RemoveYesNo = Read-Host
if($RemoveYesNo -eq 1){
    Write-Output 'What users would you like to remove?'
$User = Read-Host
Remove-LocalUser -Name $User
}