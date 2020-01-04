<#PSScriptInfo
.VERSION 1.0.1
.GUID 924568d9-9764-4277-ab85-5a03b818bf6d
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
.PRIVATEDATA 2016-Datacenter,2016-Datacenter-Server-Core
#>

#Requires -Module ActiveDirectoryDsc

<#
    .DESCRIPTION
        This configuration will set the content freshness to 100 days.
#>
Configuration ADDomainControllerProperties_SetContentFreshness_Config
{
    Import-DscResource -ModuleName ActiveDirectoryDsc

    node localhost
    {
        ADDomainControllerProperties 'ContentFreshness'
        {
            IsSingleInstance = 'Yes'
            ContentFreshness = 100
        }
    }
}
