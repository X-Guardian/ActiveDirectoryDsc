<#PSScriptInfo
.VERSION 1.0.1
.GUID b4beb2be-8852-4591-ac46-bc8005528183
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
        This configuration will add a domain controller to the domain
        contoso.com using the information from media.
#>
Configuration ADDomainController_AddDomainControllerToDomainUsingIFM_Config
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $SafeModePassword
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName ActiveDirectoryDsc

    node localhost
    {
        WindowsFeature 'InstallADDomainServicesFeature'
        {
            Ensure = 'Present'
            Name   = 'AD-Domain-Services'
        }

        WindowsFeature 'RSATADPowerShell'
        {
            Ensure    = 'Present'
            Name      = 'RSAT-AD-PowerShell'

            DependsOn = '[WindowsFeature]InstallADDomainServicesFeature'
        }

        WaitForADDomain 'WaitForestAvailability'
        {
            DomainName = 'contoso.com'
            Credential = $Credential

            DependsOn  = '[WindowsFeature]RSATADPowerShell'
        }

        ADDomainController 'DomainControllerWithIFM'
        {
            DomainName                    = 'contoso.com'
            Credential                    = $Credential
            SafeModeAdministratorPassword = $SafeModePassword
            InstallationMediaPath         = 'F:\IFM'

            DependsOn                     = '[WaitForADDomain]WaitForestAvailability'
        }
    }
}
