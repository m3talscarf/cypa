Write-Output 'Do you want to add a user? Yes=1, No=0'
$UserYesNo = Read-Host

if ($UserYesNo -eq 1) {
    Write-Output 'UserName:'
    $UserName = Read-Host
    Write-Output 'Password:'
    $Password = Read-Host -AsSecureString
    Write-Output 'Full Name:'
    $FullName = Read-Host
    Write-Output 'Group: (separate with , then a space for multiple groups)'
    $Group = Read-Host

    # Add input validation for $UserYesNo
    if ($UserName -and $Password -and $FullName -and $Group) {
        New-LocalUser -Name $UserName -FullName $FullName -Password $Password -AccountNeverExpires -UserMayNotChangePassword

        # Add error handling for Add-LocalGroupMember
        try {
            Add-LocalGroupMember -Group "$Group" -Member $UserName -ErrorAction Stop
            Write-Output "User '$UserName' added to group '$Group'."
        } catch {
            Write-Output "Error adding user to group: $_"
        }
    } else {
        Write-Output 'Invalid input. All fields are required.'
    }
}

Write-Output 'Do you want to remove any users? Yes=1, No=0'
$RemoveYesNo = Read-Host
if ($RemoveYesNo -eq 1) {
    Write-Output 'What users would you like to remove?'
    $User = Read-Host

    # Add input validation for $RemoveYesNo
    if ($User) {
        Remove-LocalUser -Name $User -ErrorAction SilentlyContinue
        Write-Output "User '$User' removed."
    } else {
        Write-Output 'Invalid input. User name is required.'
    }
}