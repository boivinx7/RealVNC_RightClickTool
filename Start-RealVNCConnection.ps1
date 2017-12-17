<#
Written by André Picker
http://www.clientmgmt.de/
DateCreated: 2016-05-02
#>

param(
    [parameter(Mandatory=$true)]
        $ResourceID,
    [parameter(Mandatory=$true)]
        $SiteServer
)

try {
$SCCMSiteCode = Get-WmiObject -Namespace "root\SMS" -Class SMS_ProviderLocation -ComputerName $SiteServer | Select-Object -ExpandProperty SiteCode
$IPAddresses = Get-WmiObject -Namespace "root\SMS\site_$($SCCMSiteCode)" -Class SMS_R_System -ComputerName $SiteServer -Filter "ResourceID like '$ResourceID'" | Select-Object -ExpandProperty IPAddresses
}

catch [Exception] {
$Popup.Popup("Cannot connect to the ConfigMgr-Site: Error-Message: $_.Exception.Message",0,"Error",0)
Break
}
try {
	Start-Process -FilePath "$env:ProgramFiles\RealVNC\VNC Viewer\vncviewer.exe" -ArgumentList "$IPAddresses + ':0'"
}

catch [Exception] {
$Popup.Popup("Cannot open VNCViewer: Error-Message: $_.Exception.Message",0,"Error",0)
Break
}

