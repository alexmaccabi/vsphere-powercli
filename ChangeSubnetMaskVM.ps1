Connect-VIServer -Server vcenter
$vms = Get-Cluster cluster-name | Get-VM
foreach($vm in $vms) {
Get-VMGuestNetworkInterface $vm  -GuestCredential $guestcred | where {$_.SubnetMask -eq "255.255.0.0"} 
Set-VMGuestNetworkInterface -Netmask 255.255.252.0 }