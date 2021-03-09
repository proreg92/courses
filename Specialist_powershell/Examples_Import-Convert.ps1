Get-Command -Verb Export -Module Microsoft.PowerShell.Utility
Get-Command -Verb ConvertTo
Get-Command -Verb Out

Get-Service |  
    ConvertTo-Html -Title "Список служб" -PreContent "<h1>Мои службы</h1>" |
    Out-File "C:\Службы.html" 

Get-Service |  
    ConvertTo-Json |
    Out-File "C:\Службы.json" 

Get-Service | Export-Csv "C:\Службы.csv" 

Get-Content "C:\Службы.csv" |
    ConvertFrom-Csv


Get-Content "C:\Службы.json"

Get-Service | Out-GridView

Get-Command -Verb Import