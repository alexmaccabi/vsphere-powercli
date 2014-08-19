Connect-VIServer -Server vcenter
$guestcred = get-credential
$vms = Get-Cluster cluster-name | Get-VM 
foreach($vm in $vms) {
Get-VMGuestNetworkInterface $vm  -GuestCredential $guestcred | where {$_.SubnetMask -eq "255.255.0.0"} |
Set-VMGuestNetworkInterface -GuestCredential $guestcred -Netmask 255.255.252.0 }