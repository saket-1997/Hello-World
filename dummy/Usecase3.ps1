#-------------------Taking Input from User along with validation------------------------
$x=Read-host "Enter your Name:" 
$s=Read-Host "Enter your Sap-id:"
$y=Read-host "Hello $x, Enter the number of leaves you want:"
while($y -notmatch "^[\d\.]+$")
{
    "Please enter Leaves in Integer"
     $y=Read-host "Hello $x, Enter the number of leaves you want:"
}
$z=Read-host "Hello $x. Enter the number of Half-day you want:"
while($z -notmatch "^[\d\.]+$")
{
    "Please enter half day in integer"
     $z=Read-host "Hello $x. Enter the number of Half-day you want:"
}
while(8 -lt $y)
{
    Write-Host "You can not apply Leaves for more than 8 Days. Please enter the input again."
    $y=Read-host "Hello $x, Enter the number of leaves you want:"
}
while(8 -lt $z)
{
    Write-Host "You can not apply Half day for more than 8 Days.Please enter the input again."
    $z=Read-host "Hello $x. Enter the number of Half-day you want:"
}
#----------------Calculating acting hours--------------------------
$month=30
$weekend=8
$halfday=5 * $z
$acting_hours_day=9 *($month-$weekend-$z-$y) + $halfday
$sum+=$acting_hours_day
$h1=@{Acting_hours=$acting_hours_day;Sap_id=$s;Name=$x}
$ob1 = New-Object -TypeName PSCustomObject -Property $h1
$ob1 | Export-csv C:\Users\saket.maheshwari\Desktop\acting.csv -NoTypeInformation -Append
$Timesheet=Import-Csv C:\Users\saket.maheshwari\Desktop\acting.csv
for($i=0;$i -le $Timesheet.length;$i++)
{
    $hash=$Timesheet| Where-Object {$_.Name[$i] -ne "#"} | Export-Csv C:\Users\saket.maheshwari\Desktop\acting.csv -NoTypeInformation
}
$new=Import-Csv C:\Users\saket.maheshwari\Desktop\acting.csv
$sheet=($new| Measure-Object 'Acting_hours' -Sum).sum
$h2=@{Acting_hours=$sheet;Sap_id="#####";Name="#####"}
$ob2 = New-Object -TypeName PSCustomObject -Property $h2
$ob2| Export-csv C:\Users\saket.maheshwari\Desktop\acting.csv -NoTypeInformation -Append -Force

