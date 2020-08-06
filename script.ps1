#written on ubtuntu, e.g / instead of \

Start-Transcript -Path './hosts.txt'
#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
$InputFile = './IPAdresses.txt'

$Lista = New-Object System.Collections.Generic.List[string]
$Listb = New-Object System.Collections.Generic.List[string]

$addresses = get-content $InputFile

$reader = New-Object IO.StreamReader $InputFile

    while($reader.ReadLine() -ne $null){
     $TotalIPs++
      }

      $counter= 0
 foreach($address in $addresses) {
 
          
if(!$address){
    write-Host "adresss is null"
}else{
                if (test-Connection $address -Count 2 -Quiet ) { 
                
                    write-Host "$address responded" -ForegroundColor Green       
                    [system.net.dns]::resolve($address)    
                    [System.Net.Dns]::GetHostEntry($address).HostName

                    $Lista.Add($address)
                    $Listb.Add([System.Net.Dns]::GetHostEntry($address).HostName)
               
    

                }
   
                }
 }
                foreach($address in $Lista){
                    Write-Host 'Address: '  $address    'HostName:  '  $Listb[$counter];
                    $counter++
                }
             

  # $Lista , $Listb

           

      #  write-host    "                  "  

       # Stop-Transcript
