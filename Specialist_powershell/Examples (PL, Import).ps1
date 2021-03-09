Get-Process | Get-Member -MemberType Property
Get-Service | Get-Member -MemberType Method


Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 1
Get-Service | Select-Object -First 3 | ForEach-Object Start

Get-Service | Select-Object -First 3 | ForEach-Object Stop
Get-Service | Out-File "C:\Services.txt"
Get-Service | Export-CSV "C:\Services.csv"

Import-Csv "C:\Services.csv" 
Import-Csv "C:\Services.csv" | Get-Member

Import-Csv "C:\Services.csv" | Select-Object -First 1 | Format-Wide
Import-Csv "C:\Services.csv" | Select-Object -First 1 | Format-Table

Import-Csv "C:\Services.csv" | Select-Object -First 1 | ForEach-Object Stop
Get-Service | Select-Object -First 1
Import-Csv "C:\Services.csv" | Select-Object -First 1 | ForEach-Object Start | Format-List