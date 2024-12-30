# Admin-Me-and-RDP
# The contents of this PowerShell script are not be used for illegal activities.
# This is all for test purposes to find vulnerabilities, and to exploit vulnerabilities.
# The development of this PowerShell is due to an idea I had for my OSCP.

This script will do the following on a Windows device:
- Check if you have admin privileges.
- Create a new local user with username and password that is specified.
- Add the user to the "Administrators" and "Remote Desktop Users" group.
- Open port 3389
- Create a registry key to allow "Pass the Hash" techniques for RDP.
