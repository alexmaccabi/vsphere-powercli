﻿Get-VM | where { ($_ | Get-NetworkAdapter | where {$_.networkname -match "DMZ"})}