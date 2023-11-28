Write-Output 'New User? yes=1, no=0 '
$i = Read-Host

while ($i -eq 1) {
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
    
    Write-Output 'New User? yes=1, no=0 '
    $i = Read-Host
}