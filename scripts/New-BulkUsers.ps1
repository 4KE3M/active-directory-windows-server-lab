# Bulk user creation script for Active Directory
# Reads employee data from a CSV and provisions AD accounts

$domain = "DC=corp,DC=lab"
$defaultPassword = Read-Host "Enter temporary password" -AsSecureString

$users = Import-Csv -Path "C:\Scripts\employees.csv"

foreach ($user in $users) {
    $ouPath = "OU=$($user.Department),$domain"
    $displayName = "$($user.FirstName) $($user.LastName)"
    $upn = "$($user.SamAccountName)@corp.lab"

    try {
        New-ADUser `
            -Name $displayName `
            -GivenName $user.FirstName `
            -Surname $user.LastName `
            -SamAccountName $user.SamAccountName `
            -UserPrincipalName $upn `
            -Path $ouPath `
            -Department $user.Department `
            -Title $user.Title `
            -AccountPassword $defaultPassword `
            -Enabled $true `
            -ChangePasswordAtLogon $true

        Add-ADGroupMember -Identity "$($user.Department)Staff" -Members $user.SamAccountName

        Write-Host "Created user: $displayName in $($user.Department)" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to create user: $displayName - $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`nBulk user creation complete." -ForegroundColor Cyan
Write-Host "Total users processed: $($users.Count)"

Get-ADUser -Filter * -SearchBase $domain -Properties Department |
    Where-Object { $_.Enabled -eq $true } |
    Select-Object Name, SamAccountName, Department, Enabled |
    Format-Table -AutoSize