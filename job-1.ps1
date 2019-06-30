# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
#
#   Jenkins Test:   simple powershell script to test a Jenkins pipeline
#
#                   writes a simple text file next to this script file
#
#   Urs, 30.6.2019
#   Urs, 30.6.2019 - 2 test with GitHub
#   Urs, 30.6.2019 - 3 dummy change: check if new file is in Jenkins works space
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

Clear-Host

# user config
# ------------------------------------------------
$maxLines = 10
$waitTime = 3    # seconds

# system settings
# ------------------------------------------------
$scriptName = $MyInvocation.MyCommand.Name -replace '.ps1', ''
$ScriptPath = $MyInvocation.MyCommand.Path
$ScriptDir  = Split-Path -Parent $ScriptPath

# output file
$ts = Get-Date -format "yyyy.MM.dd-HH.mm.ss"
$workFileName = $scriptName + "_" + $ts + ".log"
$workFilePath = Join-Path -Path $ScriptDir -ChildPath $workFileName 

# write file
# ------------------------------------------------
For ($i=1; $i -le $maxLines; $i++) {
    Add-Content $workFilePath ( $scriptName + ": " + $i )

    # wait 
    Start-Sleep -Seconds $waitTime 
}

Write-Output ("end of script: " + $scriptName )
