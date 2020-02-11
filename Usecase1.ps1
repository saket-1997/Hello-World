#Getting Timezone and Current Time of few Countries.
#Taking input from users
$city=Read-Host "Enter the name of City"  
 #setting Path where csv will get create.                         
$Path="C:\Users\saket.maheshwari\Desktop\time.csv"
#Using Switch Statement                
switch($city)                                                 
             {
               {($_ -match "Mumbai") -or ($_ -match "Bareilly")}
                {
                  $Timezone=(Get-TimeZone -Name *India*)[0]
                  $date=Get-Date
                  $h1=@{Current_Time=[System.TimeZoneInfo]::ConvertTime($date, $Timezone).ToString('T') ; Time_Zone=$Timezone.id;Country="India"}
                  $ob1 = New-Object -TypeName PSCustomObject -Property $h1
                  $ob1 | Export-Csv -Path $path -NoTypeInformation
               }
           "Auckland"
            {
              $Timezone=(Get-TimeZone -Name *Zealand*)[0]
              $date=Get-Date
              $h2=@{Current_Time=[System.TimeZoneInfo]::ConvertTime($date, $Timezone).ToString('T') ; Time_Zone=$Timezone.id;Country="New Zealand"}
              $ob2 = New-Object -TypeName PSCustomObject -Property $h2
              $ob2 | Export-Csv -Path $path -NoTypeInformation -Append
            }
           "Brisbane"
            {
              $Timezone=(Get-TimeZone -Name *Australia*)[2]
              $date=Get-Date
              $h3=@{Current_Time=[System.TimeZoneInfo]::ConvertTime($date, $Timezone).ToString('T') ; Time_Zone=$Timezone.id ;Country="Australia"}
              $ob3 = New-Object -TypeName PSCustomObject -Property $h3 
              $ob3 | Export-Csv -Path $path -NoTypeInformation -Append
            }
           "Ontario"
            {
              $Timezone=(Get-TimeZone -Name *canada*)[0]
              $date=Get-Date
              $h4=@{Current_Time=[System.TimeZoneInfo]::ConvertTime($date, $Timezone).ToString('T') ; Time_Zone=$Timezone.id;Country="Canada"}
              $ob4 = New-Object -TypeName PSCustomObject -Property $h4
              $ob4 | Export-Csv -Path $path -NoTypeInformation -Append
            }
          
default 
       { 
          "Entered City is not a defined city! Please use Mumbai,Bareilly,Ontario,Brisbane,Auckland"
       } 
         }