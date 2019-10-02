# Module manifest for module 'CMHealthCheck'
# Generated by: David Stein
# Generated on: 02/18/2019

@{
RootModule = '.\CMHealthCheck.psm1'
ModuleVersion = '1.0.11'
GUID = 'e61ecfc4-1895-4e5d-a91e-10fb4311b09a'
Author = 'David Stein'
CompanyName = 'skatterbrainz'
Copyright = '(c) 2017-2019 David Stein. All rights reserved.'
Description = 'ConfigMgr healthcheck data collection and reporting functions'
PowerShellVersion = '4.0'
PowerShellHostVersion = '4.0'
RequiredModules = @('dbatools')

FunctionsToExport = @(
    'Get-CMHealthCheck',
    'Get-CMHealthCheckSummary',
    'Export-CMHealthReport',
    'Invoke-CMHealthCheck'
)

CmdletsToExport = @()
VariablesToExport = '*'
AliasesToExport = @()

FileList = @(
    '.\Assets\cmhealthcheck.xml',
    '.\Assets\messages.xml',
    '.\Assets\default.css',
    '.\Assets\ocean.css',
    '.\Assets\monochrome.css',
    '.\Assets\emerald.css',
    '.\Assets\buildnumbers.txt',
    ".\Assets\windows_update_errorcodes.txt",
    '.\Assets\cmhclogo-275x237.png',
    '.\Docs\Export-CMHealthReport.md',
    '.\Docs\Get-CMHealthCheck.md'
)

PrivateData = @{
    PSData = @{
        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('cmhealthcheck','healthcheck','health','sccm','configmgr','systemcenter')
        LicenseUri = 'https://opensource.org/licenses/MIT'
        ProjectUri = 'https://github.com/Skatterbrainz/CMHealthCheck'
        IconUri = 'https://user-images.githubusercontent.com/11505001/32978293-2be8336e-cc0d-11e7-9606-0c3412aaa7cc.png'
        ReleaseNotes = @'
* Thanks to Rafael Perez for inventing this - http://www.rflsystems.co.uk
* Thanks to Carl Webster for the basis of Word functions - http://www.carlwebster.com
* Thanks to David O'Brien for additional Word function - http://www.david-obrien.net/2013/06/20/huge-powershell-inventory-script-for-configmgr-2012/
* Thanks to Starbucks for empowering me to survive hours of clicking through the Office Word API reference
* Support: Database name must be CM_<SITECODE> (you need to adapt the queries if not this format)

1.0.0  - DS - first release
1.0.1  - DS - updates for documentation, error handling, cleanup functions
1.0.2  - DS - added user-appx cleanup handling
1.0.3  - DS - Added support for dbatools features
1.0.4  - DS - Updated SCCM build numbers reference table, bug fixes
1.0.5  - DS - Added HTML report output option
1.0.6  - DS - Updated SCCM and SQL build numbers reference table
1.0.7  - DS - Added Get-CMHealthCheckSummary for making a quick inventory report
1.0.8  - DS - changed default Word body style from "No Spacing" to "Normal", added autoconfig file option
              combined Export functions into one: Export-CMHealthReport
1.0.9  - DS - merged changes to cmhealthcheck.xml to correct reporting layout (thanks to @CodyMathis123 !)
1.0.10 - DS - expanded error message lookups, bug fixes
1.0.11 - DS - added Invoke-CMHealthCheck as wrapper for Get- and Export- functions as one function
'@
    } # End of PSData hashtable
} # End of PrivateData hashtable
}