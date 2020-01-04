<#PSScriptInfo
.VERSION 1.0.1
.GUID 634194bb-189a-4b26-bd80-7c01270026ea
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
        This configuration will add a Service Principal Name to a computer account.
#>
Configuration ADServicePrincipalName_AddComputerServicePrincipalName_Config
{
    Import-DscResource -Module ActiveDirectoryDsc

    Node localhost
    {
        ADServicePrincipalName 'web.contoso.com'
        {
            ServicePrincipalName = 'HTTP/web.contoso.com'
            Account              = 'IIS01$'
        }
    }
}
