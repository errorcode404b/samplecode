<#
.SYNOPSIS


.DESCRIPTION

This script is used to check system loads after being built

.EXAMPLE

PS> LoadCheck

#>

Function LoadCheck{

#Tivoli monitoring

$tivmonitorPath = Test-Path -Path "$env:ProgramFiles\ITM\InstallITM\kinconfg.exe" #"C:\Program Files\ITM\InstallITM\kinconfg.exe"
$tivmonitorReg  = Test-Path -Path HKLM:\SOFTWARE\Candle\KNT\Ver610\Primary\Environment\CT_CMSLIST #-Name "IP.PIPE:seedtems1.tivolimonitoring.thecompany.com;IP.PIPE:seedtems2.tivolimonitoring.thecompany.com"

If ($tivmonitorPath -eq $false -and $tivmonitorReg -eq $false){
    Write-host "Tivoli monitor is not installed."
}

If ($tivmonitorPath -eq $true -or $tivmonitorReg -eq $true) {
    Write-host "Tivoli monitor is installed:"
    Get-service -name "KNTCMA_Primary" <#Monitoring Agent for Windows OS - Primary#>, 'Monitoring Agent for Windows OS - Primary' <#Monitoring Agent for Windows OS - Watchdog"#>,'KNTCMA_FCProvider' <#Monitoring Agent for Windows OS - FCProvider#> | foreach-object {  
    If ($_.status -eq "Stopped") { write-host -f yellow $_.name $_.status }
    Else { Write-host -F green $_.name $_.status }
    }
}



#Tivoli Backup Check 

$tivbackupPath = Test-Path -Path "C:\Program Files\tivoli\tsm\baclient" 

If ($tivbackupPath -eq $false){
    Write-host "Tivoli backup is not installed."
}

If ($tivbackupPath -eq $true) {
    Write-host "Tivoli backup is installed:"
    Get-service -name "TSM Backup Agent(Started by Client Acceptor)" <#dsmcsvc.exe#>, 'TSM Remote Client Agent' <#dsmagent.exe"#>,'TSM CBMR Scheduler' <#dsmcsvc.exe#>,'TSM Client Acceptor' <#dsmcad.exe#> | foreach-object {  
    If ($_.status -eq "Stopped") { write-host -f yellow $_.name $_.status }
    Else { Write-host -F green $_.name $_.status }
    #If ($_.name -eq $_.name) { Write-host -F red $_.name "not found"}
    }
}


#SCCM patching check

$sccmProcess = Test-Path -Path "C:\Windows\CCM\CcmExec.exe"
$sccmReg     = Test-Path -Path HKLM:\SOFTWARE\Microsoft\CCM

If ($sccmProcess -eq $true -and $sccmReg -eq $true  ) {
    Write-host "SCCM is installed:"
    Get-service -name "CcmExec" <#SMS Agent Host#> | foreach-object {  
    If ($_.status -eq "Stopped") { write-host -f yellow $_.name $_.status }
    Else { Write-host -F green $_.name $_.status }
    }
}


#TheCompany checking

$Check = Test-Path -Path 'HKLM:\SOFTWARE\TheCompany\Windows Check Agent*'

If($Check -eq $false){
    Write-host "Windows Check Agent is not installed."
}

Else {
    Write-host "Windows Check Agent is installed."
}


#Local Administrators group members

write-host "Users and Groups in the local administrators group:"

Get-LocalGroupMember -Group "Administrators"  | ft -AutoSize

#Check SEP, DCS and Fireeye

$sepChk = Test-Path -Path "C:\Program Files (x86)\Symantec\Symantec Endpoint Protection"
$dcsChk = Test-Path -Path "C:\Program Files (x86)\Symantec\Data Center Security Server"
$feyChk = Test-Path -Path "C:\Program Files (x86)\FireEye"

If ($sepChk -eq $false){
    Write-Host "SEP is not installed."
}

If ($sepChk -eq $true ) {
    Write-host "SEP status:"
    Get-service -name "SepMasterService" <#Symantec Endpoint Protection#>  | foreach-object {  
    If ($_.status -eq "Stopped") { write-host -f yellow $_.name $_.status }
    Else { Write-host -F green $_.name $_.status }

    $sepDef = (Get-ItemProperty -Path "hklm:\SOFTWARE\Symantec\Symantec Endpoint Protection\CurrentVersion\public-opstate").LatestVirusDefsDate
    Write-host "SEP was last updated on $sepDef."
    }
}

If ($dcsChk -eq $false){
    Write-Host "DCS services are not installed."
}

If ($dcsChk -eq $true ) {
    Write-host "DCS status:"
    Get-service -name "SISIPSService" <#Symantec Data Center Security Server Agent#>,"SISIDSService" <#Symantec Data Center Security Server IDS Agen#>,"SISIPSUtil" <#Symantec Data Center Security Server Utility#>  | foreach-object {  
    If ($_.status -eq "Stopped") { write-host -f yellow $_.name $_.status }
    Else { Write-host -F green $_.name $_.status }

    
    #dcsDef = 
    }
}

If ($feyChk -eq $false){
    Write-Host "Fire service is not installed."
}

If ($feyChk -eq $true ) {
    Write-host "FireEye status:"
    Get-service -name "xagt" <#FireEye Endpoint Agent#>  | foreach-object {  
    If ($_.status -eq "Stopped") { write-host -f yellow $_.name $_.status }
    Else { Write-host -F green $_.name $_.status }

    
    #feDef  =
    }
}
 

#Check iLO SNMP

$iloChk = Test-Path -Path "C:\Program Files\Hewlett-Packard\AMS\service\hpqams.exe"

If ($iloChk -eq $false){
    Write-host "HPE Agentlesss Manager is not installed."
}


If ($iloChk -eq $true) {
        Write-host "HPE Agentlesss Manager & SNMP service status:"
        Get-service -name "hpqams" <#HP ProLiant Agentless Management Service#>, "SNMP" <#SNMP Service#> | foreach-object {  
        If ($_.status -eq "Stopped") { write-host -f yellow $_.name $_.status }
        Else { Write-host -F green $_.name $_.status }
        }
    }
}