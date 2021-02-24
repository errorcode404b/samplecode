#$curLo = "C:\temp"

$curLo = Split-Path -Parent $MyInvocation.MyCommand.Path

$codeTest = "LoadCheck"

    Describe "$codeTest Pester Tests" {

    Context 'Path and Code Check'{
        It "$codeTest.ps1 file is in the C:\temp folder" {
            "$curLo\$codeTest.ps1" | Should Exist
        }  

        It "Checks to see if $codeTest has vaild code"{
            $codeCheck = Get-Content -Path "$curLo\$codeTest.ps1" -ErrorAction Stop
            $outError = $null
            $null = [System.Management.Automation.PSParser]::Tokenize($codeCheck, [ref]$outError)
            $outError.Count | Should Be 0
        }
    }

    Context 'This Test Will Fail'{
        It "This test should fail"{
            #$failIt = Get-ChildItem -Path "C:\temp\Nate" -ErrorAction SilentlyContinue
            #$failIt | Should -BeFalse
            "$curLo\$codeTest.ps1" | Should -Contain 'Nate'
        }
    }
}  
