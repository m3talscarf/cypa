Write-Output 'Remove User? Yes=1, No=0'
$i = Read-Host

while ($i -eq 1) {
    Write-Output 'What users would you like to remove?'
    $User = Read-Host
    Remove-LocalUser -Name $User

    Write-Output 'Remove User? Yes=1, No=0'
$i = Read-Host
}







