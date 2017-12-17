<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2017 v5.4.145
	 Created on:   	2017-12-14 8:34 PM
	 Created by:   	MaximeB
	 Organization: 	MB_Tools
	 Filename:     	Uninstall.Ps1
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

$SCCMPluginsList = "ed9dee86-eadd-4ac8-82a1-7234a4646e62", "3514f0ab-7d2a-41c6-a344-4d49edce9a52", "c8137990-aa6b-4e1f-867a-4971fb2a08ef", "a92615d6-9df3-49ba-a8c9-6ecb0e8b956b"
$SCCMPath = "C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\XmlStorage\Extensions\Actions"
$InstallPath = "C:\Program Files\MB_tools\RealVNC_RightClickTool\"

foreach ($path in $SCCMPluginsList)
{
	Remove-Item -Path "$SCCMPath\$path\RealVNC_RightClickTool.xml" -Force -Verbose
	Get-ChildItem "$SCCMPath\$path" -recurse | Where { $_.PSIsContainer -and @(Get-ChildItem -LiteralPath:$_.fullname).Count -eq 0 } | remove-item -Verbose
}

Remove-Item -Path $InstallPath -Recurse -Force -Verbose