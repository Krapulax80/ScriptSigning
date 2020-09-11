# Dotsource signer script
. C:\Scripts\ScriptSigning\New-SignedScript.ps1
$config = import-csv C:\Scripts\ScriptSigning\config\config.csv

#region SCRIPTS TO SIGN
# Signer script
$ScriptFolders = $null
$ScriptFolders = @(

    # HR to AD sync
    "\\$($config.InfraServer)\c$\Scripts\AD\HR2ADSync"
    #signer script
    "C:\Scripts\ScriptSigning\New-SignedScript.ps1",
    #lockout scripts
    "\\$($config.InfraServer)\c$\Scripts\Generic\Lockouts",
    #offboarding
    "\\bnwinfrats01\c$\Scripts\AD\OffBoarding",
    "\\BNWINFRATS01.westcoast.co.uk\c$\Scripts\AD\Offboarding02",
    "\\$($config.InfraServer)\c$\Scripts\AD\OffBoarding\Tools",
    #onboarding
    "\\bnwinfrats01\c$\Scripts\AD\OnBoarding",
    #inactive users
    "\\$($config.InfraServer)\c$\Scripts\InactiveUsers",
    #DNS flips
    "\\BNWITRDS01.westcoast.co.uk\C$\Scripts\DNSFlips",
    #HR sync - WC
    "\\$($config.InfraServer)\c$\Scripts\AD\ADandHRSync",
    "\\$($config.InfraServer)\c$\Scripts\AD\ADandHRSync\Functions"
    # "\\bnxinfrats01.xma.co.uk\ADandHRSync"
    # "\\bnxinfrats01.xma.co.uk\ADandHRSync\Functions"

)
#endregion


#region SIGNING
foreach ($SF in $ScriptFolders) {
    New-SignedScript -ScriptFolder $SF
}
#endregion
