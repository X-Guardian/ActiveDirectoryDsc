<#PSScriptInfo
.VERSION 1.0.1
.GUID f486afc3-63c8-4809-a84a-34bd227023a3
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
        This configuration will create an Active Directory replication site called
        'Seattle'. If the 'Default-First-Site-Name' site exists, it will rename
        this site instead of create a new one.
#>
Configuration ADReplicationSite_CreateADReplicationSiteRenameDefault_Config
{
    Import-DscResource -Module ActiveDirectoryDsc

    Node localhost
    {
        ADReplicationSite 'SeattleSite'
        {
            Ensure                     = 'Present'
            Name                       = 'Seattle'
            RenameDefaultFirstSiteName = $true
        }
    }
}
