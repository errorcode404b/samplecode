#Description

- LoadCheck.ps1 was used to check host post build to ensure all required services were installed. The script will report that the services being checked are not installed. 

- The LoadCheck.Tests.ps1 provides three basic Pester tests plans. 
    - First test, test the path to C:\temp where the files should be located.
    - Second test, checks to see if the PowerShell code is valid.
    - Third test, this is just a failure test. Checks the file for a name.

- LoadCheck.RunHelper.ps1, to demo Pester test on LoadCheck.ps1 and highlight different ways to craft PowerShell scripts.

#Development environment
    
    Windows 10:
        Build 1909

    PowerSherll Version:
        Major  Minor  Build  Revision
        -----  -----  -----  --------
        5      1      18362  1171
    
    Pester Verion:
        3.4.0

#Getting started

- You will need Admin access to a Windows host.
- You need internet access to download Pester or access to local Nuget repo to load the Pester module.
 
#Development environment
    
    Windows 10:
        Build 1909

    PowerShell Version:
        Major  Minor  Build  Revision
        -----  -----  -----  --------
        5      1      18362  1171
    
    Pester Version:
        3.4.0

#Getting started

- You will need Admin access to Windows host.
- You need have internet access to download Pester or access to local Nuget repo to load the Pester module.
- Either download the zip or clone with repo.
    - Unpack the zip in the C:\temp
    - Clone the repo to C:\temp
- Best to use Windows ISE for the test scripts.  

#Running the code.

- Open PowerShell ISE with admin rights.
- Open file LoadCheck.RunHelper.ps1
- Hit the run button or F5 to execute the script
    - This will execute Invoke-Pester using LoadCheck.Tests.ps1 running the test on LoadCheck.ps1
- Next open LoadCheck.ps1 and execute to check the image load.

- Either download the zip or clone with repo.
    - Unpack the zip in the C:\temp
    - Clone the repo to C:\temp
    - Place the three files in the temp folder
- Best to use Windows ISE for the test script.  

#Running the code.

- Open PowerShell ISE with admin rights.
- Open file LoadCheck.RunHelper.ps1
- Hit the run button or F5 to execute the script
    - This will execute Invoke-Pester using LoadCheck.Tests.ps1 running the test on LoadCheck.ps1
- Next open LoadCheck.ps1 and execute to check the image load.
