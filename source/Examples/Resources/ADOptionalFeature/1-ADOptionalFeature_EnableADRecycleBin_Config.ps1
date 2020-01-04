<#PSScriptInfo
.VERSION 1.0.1
.GUID 63447da7-3fe9-4d03-b680-2129a2e0318f
.AUTHOR DSC Community
.COMPANYNAME DSC Community
.COPYRIGHT DSC Community contributors. All rights reserved.
.TAGS DSCConfiguration
.LICENSEURI https://github.com/dsccommunity/<repositoryName>/blob/master/LICENSE
.PROJECTURI https://github.com/dsccommunity/<repositoryName>
.ICONURI https://dsccommunity.org/images/DSC_Logo_300p.png
.EXTERNALMODULEDEPENDENCIES
.REQUIREDSCRIPTS
.EXTERNALSCRIPTDEPENDENCIES
.RELEASENOTES
Updated author, copyright notice, and URLs.
.PRIVATEDATA
#>

#Requires -Module ActiveDirectoryDsc

<#
    .DESCRIPTION
        This configuration will enable the Active Directory Recycle Bin for a
        specified Domain
#>
Configuration ADOptionalFeature_EnableADRecycleBin_Config
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $ForestFQDN,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $EnterpriseAdministratorCredential
    )

    Import-DscResource -Module ActiveDirectoryDsc

    Node localhost
    {
        ADOptionalFeature RecycleBin
        {
            FeatureName                       = "Recycle Bin Feature"
            EnterpriseAdministratorCredential = $EnterpriseAdministratorCredential
            ForestFQDN                        = $ForestFQDN
        }
    }
}
