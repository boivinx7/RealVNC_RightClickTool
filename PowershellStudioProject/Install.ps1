<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2017 v5.4.145
	 Created on:   	2017-12-14 8:34 PM
	 Created by:   	MaximeB
	 Organization: 	MB_Tools
	 Filename:     	Install.Ps1
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

$SCCMPluginsList = "ed9dee86-eadd-4ac8-82a1-7234a4646e62", "3514f0ab-7d2a-41c6-a344-4d49edce9a52", "c8137990-aa6b-4e1f-867a-4971fb2a08ef", "a92615d6-9df3-49ba-a8c9-6ecb0e8b956b"
$SCCMPath = "C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\XmlStorage\Extensions\Actions"
$InstallPath = "C:\Program Files\MB_tools\RealVNC_RightClickTool\"
New-Item -Path "C:\Program Files\MB_tools\RealVNC_RightClickTool\" -ItemType Directory -Force -Verbose

foreach ($path in $SCCMPluginsList)
{
	if (Test-Path -Path "$SCCMPath\$path")
	{
		Copy-Item -Path "$PSScriptRoot\RealVNC_RightClickTool.xml" -Destination "$SCCMPath\$path" -Force -Verbose
	}
	else {
		New-Item -Path "$SCCMPath\$path" -ItemType Directory -Force -Verbose
		Copy-Item -Path "$PSScriptRoot\RealVNC_RightClickTool.xml" -Destination "$SCCMPath\$path" -Force -Verbose
	}
}

Copy-Item -Path "$PSScriptRoot\DartRightClickTool\RealVNCRightClickTool\bin\Debug\RealVNCConnection.exe" -Destination $InstallPath -Force -Verbose
Copy-Item -Path "$PSScriptRoot\bin\x64\Start-RealVNCConnection.exe" -Destination $InstallPath -Force -Verbose