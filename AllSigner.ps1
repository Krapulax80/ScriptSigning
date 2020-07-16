# Dotsource signer script
. C:\Scripts\ScriptSigning\New-SignedScript.ps1
$config = import-csv C:\Scripts\ScriptSigning\config\config.csv

    #region SCRIPTS TO SIGN
# Signer script
$ScriptFolders = $null
$ScriptFolders = @(
    #signer script
    "C:\Scripts\ScriptSigning\New-SignedScript.ps1",
    #lockout scripts
    "\\$($config.InfraServer)\c$\Scripts\Generic\Lockouts",
    #offboarding
    "\\bnwinfrats01\c$\Scripts\AD\OffBoarding",
    "\\$($config.InfraServer)\c$\Scripts\AD\OffBoarding\Tools",
    #onboarding
    "\\bnwinfrats01\c$\Scripts\AD\OnBoarding",
    #inactive users
    "\\$($config.InfraServer)\c$\Scripts\InactiveUsers",
    #DNS flips
    "\\BNWITRDS01.westcoast.co.uk\C$\Scripts\DNSFlips",
    #HR sync
    "\\$($config.InfraServer)\c$\Scripts\AD\ADandHRSync",
    "\\$($config.InfraServer)\c$\Scripts\AD\ADandHRSync\Functions"
)
    #endregion


    #region SIGNING
foreach ($SF in $ScriptFolders){
    New-SignedScript -ScriptFolder $SF
}
    #endregion
