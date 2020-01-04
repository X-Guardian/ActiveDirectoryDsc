<#PSScriptInfo
.VERSION 1.0.1
.GUID 3d2af0ab-3470-4da7-a38b-1c05ef384e05
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
        This configuration will create an AD Replication Subnet.
#>
Configuration ADReplicationSubnet_CreateReplicationSubnet_Config
{
    Import-DscResource -Module ActiveDirectoryDsc

    Node localhost
    {
        ADReplicationSubnet 'LondonSubnet'
        {
            Name        = '10.0.0.0/24'
            Site        = 'London'
            Location    = 'Datacenter 3'
            Description = 'Datacenter Management Subnet'
        }
    }
}
