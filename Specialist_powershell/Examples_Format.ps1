Get-Сommand -Verb Format


Dir "c:\windows" | Format-Table -Property Name, Extension, Length



Get-Service | Sort-Object Status | FT Name, Status, CanStop, CanShutdown -AutoSize -GroupBy Status
Get-Service | Sort-Object Status | FT Name, Status, CanStop, CanShutdown, @{n="Имя"; e={$_.Name}; align="right"} -AutoSize
Get-Service | Format-List -Property Name, Status
Get-Service | Sort-Object Status | Format-wide -Property Name -Column 5 -GroupBy Status