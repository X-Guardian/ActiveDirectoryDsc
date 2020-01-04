<#PSScriptInfo
.VERSION 1.0.1
.GUID bd5991db-7382-41cf-aefa-ba2b57af227a
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
    This configuration will manage the Service and User Principal name suffixes in
    the forest by adding and removing the desired suffixes. This will not overwrite
    existing suffixes in the forest.
#>
Configuration ADForestProperties_AddRemoveForestProperties_Config
{
    Import-DscResource -ModuleName ActiveDirectoryDsc

    node localhost
    {
        ADForestProperties 'ContosoProperties'
        {
            ForestName                         = 'contoso.com'
            ServicePrincipalNameSuffixToAdd    = 'test.net'
            ServicePrincipalNameSuffixToRemove = 'test.com'
            UserPrincipalNameSuffixToAdd       = 'cloudapp.net', 'fabrikam.com'
            UserPrincipalNameSuffixToRemove    = 'pester.net'
        }
    }
}
