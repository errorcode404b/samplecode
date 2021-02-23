Function Test-LoadCheck{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        [Parameter(Mandatory = $True,
                   ValueFromPipelineByPropertyName = $False,
                   ValueFromPipeline = $False,
                   Position = 0)]
        $logLocation
    )

#This file is used to run the Pester tests.

Begin{

    Write-host -ForegroundColor DarkCyan   "This PowerShell file is used to Pester test LoadCheck.ps1"
    Write-host -ForegroundColor DarkYellow "This PowerShell script will load the Pester module," -NoNewline; Write-host -ForegroundColor DarkYellow -BackgroundColor Red "Import-Module Pester" -NoNewline;
    Import-Module Pester
    Write-host " "
    }

Process{

    $fDate = Get-Date -Format "MMddyyyy_HHmmss"
    $logFile = "$logLocation\LoadCheckTest$fDate.xml"
    Write-host -ForegroundColor DarkCyan   "Pester test has started for," -NoNewline; Write-host -ForegroundColor Yellow -BackgroundColor Red "LoadCheck.Test.ps1"
    Invoke-Pester C:\temp\LoadCheck.Tests.ps1 -OutputFile $logFile 
    }

End{
    
    Write-host "Run log can be found here $logFile"
    Invoke-Item $logFile
    }

}

Test-LoadCheck