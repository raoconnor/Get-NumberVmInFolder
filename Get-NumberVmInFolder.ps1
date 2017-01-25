<# 
Get-NumberVmInFolder

.Description
    Get number of vms in a folder
	russ 02/02/2016
	
.Acknowledgments 	
    
.Example
    ./Get-NumberVmInFolder.ps1
#>



# Choose folder
Get-folder

Write-host "`n" 
	Write-host "To run on all vms in a blue folder, enter folder name"  "`n"  -ForegroundColor White 	
	$choice = Read-Host " "
	Try
	{
	$f = Get-Folder "$choice"  
	}
	
	Catch
	{
	Write-Warning "You must enter the folder name or run with the -VM <vm name> switch..!"
	Break
	}

$folder = (Get-Folder $f | Get-View)

# Add vms to variable
$vms = Get-View -SearchRoot $folder.MoRef -ViewType "VirtualMachine" | Select Name
$vmsPerFolder  = [math]::round(($vms.count), 1)

Write-host $vmsPerFolder -ForegroundColor Green 	

