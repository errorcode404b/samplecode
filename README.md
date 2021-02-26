#Description

- LoadCheck.ps1 was used to check host post automated build to ensure all required services were installed. The LoadCheck.ps1 runs using If/Else blocks by checking to see if a given service is installed and if not reports that service as not installed. If the service is intall, reports the status of the service. 

- The LoadCheck.Tests.ps1 provides three basic Pester test plans. 
    - First test, test the path C:\temp where the files should be located. 
    - Second test, checks to see if the PowerShell code is valid. 
    - Third test, a failure test. Checks LoadCheck.ps1 for my name.

- LoadCheck.RunHelper.ps1, loads the Pester module if not loaded, runs the Pester test then provides the out by opening the log in xml format. This was also to highlight different ways to craft PowerShell script blocks using Begin/Process/End. 

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
- Create the "temp" folder C root
- Download the zip from the repo.
    - Unpack the zip in the C:\temp
- Run Windows PowerShell ISE for the test scripts.  

#Running the code.

- Open Windows PowerShell ISE with admin rights.
- Open file LoadCheck.RunHelper.ps1
- Hit the run button or F5 to execute the script
    - This will execute Invoke-Pester using LoadCheck.Tests.ps1 test plan. The plan running test on LoadCheck.ps1.
    - Provides the output of the Pester tests. 
- Next open LoadCheck.ps1 and execute to check the image load.
    - Checks if default services are installed and if installed, the service status.
