## Description
Optimized workflow, including:
1. Preventing the script from updating fiddler-everywhere, solving the problem of pro becoming unusable once updated;
2. PowerShell script automatically searches for the updateUserLicense function in main.js and replaces it;
3. No longer need to use software such as dnspy to decompile, directly overwrite the modified dll file, and package it as a PowerShell script to execute with a right-click.

## Steps
- Install fiddler-everywhere-4.0.1 and log in to your account
- Execute the disableUpdater.ps1 script to delete the downloaded content in the updater folder and prohibit access
- Execute the mockMainUserLicense.ps1 script to modify the pro certificate information in the obfuscated code
- Execute the mockDllFiles.ps1 script to modify the UserAccountDTO.id status judgment in the dll file
- Open the fiddler-everywhere program to use the permanent unlimited version

## TODOs
1. Write a shell script to adapt to the Intel chip version of macOS.
2. ADAPTS to later version 4.1.2