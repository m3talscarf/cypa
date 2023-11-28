$ChangePassword = Read-host "Enter the New Password" -AsSecureString

$UserAccount = Get-LocalUser | Where-Object -Property enabled

$UserAccount | Set-localuser -Password $ChangePassword