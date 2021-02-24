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

You will need Admin access to Windows host.
You need have internet access to download Pester or access to local Nuget repo to load the Pester module.
Either download the zip or clone with repo.
    Unpack the zip in the C:\temp
    Clone the repo to C:\temp
Best to use Windows ISE for the test scripts.  

#Running the code.

Open PowerShell ISE with admin rights.
Open file LoadCheck.RunHelper.ps1
Hit the run button or F5 to execute the script
    This will execute Invoke-Pester using LoadCheck.Tests.ps1 running the test on LoadCheck.ps1
Next open LoadCheck.ps1 and execute to check the image load.
