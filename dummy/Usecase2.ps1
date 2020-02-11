#Taking input from user
$input=Read-Host -Prompt "Enter the Type of Utilization you want(cpu,disk,memory)"
#Initializing an array.
$cpu=@(0..4)
$memory=@(0..4)
#intializing the values.
$avg=0
$avg2=0
$RoundMemory=@(0..4)
#Calculating CPU Utilization.
if($input -match "cpu")
  {
    Write-Host "Calculating CPU Utilization...."
   for($i=0;$i -lt 5 ;$i++)
     { 
      $cpu[$i]=(Get-WmiObject -Class win32_processor).LoadPercentage[0]
      Start-Sleep -seconds 1
      $avg+=$cpu[$i]
     }
   $avg_cpu_util=$avg/5
   Write-Host "Average Percentage of CPU Utilization is $avg_cpu_util"
  }

#Calculating Disk Utilization
elseif($input -match "disk")
{
   $drive=Read-Host "Enter the Drive for which you want to calculate Disk Utilization:"
   Write-Host "Calculating Disk Utilization...."
   $Disk = Get-WMIObject Win32_Logicaldisk -filter "deviceid='$drive'"
   $FreeSpacePer = ((($Disk.Freespace /1Gb -as [float]) / ($Disk.Size / 1Gb -as [float]))*100) -as [int]
   $SpaceUsePer = 100 - $FreeSpacePer
   Write-Host "Free Space Percentage of $drive Drive is $FreeSpacePer"
   Write-Host "Space Used Percentage of $drive Drive is $SpaceUsePer"
}

#calculating Memory Utilization
elseif($input -match "memory")
{
Write-Host "Calculating Memory Utilization...."
  for($i=0;$i -lt 5 ;$i++)
   {
    $ComputerMemory = Get-WmiObject -Class win32_operatingsystem -ErrorAction Stop
    $memory[$i] = ((($ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory)*100)/ $ComputerMemory.TotalVisibleMemorySize)
    $RoundMemory[$i] = [math]::Round($Memory[$i], 2)
    Start-Sleep -Seconds 1
    $avg2+=$RoundMemory[$i]
   }
   $avg_mem_util=$avg2/5
   Write-Host "Average Percentage of Memory Utilization is $avg_mem_util"
}
else
{
 Write-host "Please Enter a Valid Type! Your Type doesn't match."
}
