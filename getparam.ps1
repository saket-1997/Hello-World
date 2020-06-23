param( 
    [Parameter(Mandatory=$True)] 
    [string]$User, 
    [Parameter(Mandatory=$True)] 
    [string]$Pass
) 
$username=$user
$Password = $Pass | ConvertTo-SecureString -asPlainText -Force 
$credential = New-Object –TypeName System.Management.Automation.PSCredential –ArgumentList $username, $password 
 
$url="$url"
$method="get"
$content="application/json"



$Requests = Invoke-RestMethod -Uri $URl -Credential $credential -Method GET -ContentType "application/json" 

 
