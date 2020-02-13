param( 
    [Parameter(Mandatory=$True)] 
    [string]$User, 
    [Parameter(Mandatory=$True)] 
    [string]$Pass
) 
$username=$user
$Password = $Pass | ConvertTo-SecureString -asPlainText -Force 
$credential = New-Object –TypeName System.Management.Automation.PSCredential –ArgumentList $username, $password 
 
$url="https://hclgbpdev.service-now.com/api/now/table/incident?sysparm_limit=1&number=INC0304139"
$method="get"
$content="application/json"



$Requests = Invoke-RestMethod -Uri $URl -Credential $credential -Method GET -ContentType "application/json" 

 