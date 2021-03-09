#Examples PipeLines
#1
Dir "D:\Downloads"  |
Select-Object -Property Name, Length, @{n="Size in KB"; e={$_.Length / 1024}} |
Sort-Object -Property "Size in KB" -Descending |
Select-Object -Skip 10 -First 10

#2
Dir "D:\Downloads" | 
Where-Object -FilterScript { $_.Extension -like ".exe" -and $_.Name -like "c*" -and $_.Length -ge 100 }

#3
Dir "D:\Downloads" | 
Where { $_.Extension -like ".exe" -and $_.Name -like "c*" -and $_.Length -ge 100 }

#4
Get-Process |
Where { $_.CPU -gt 40 -and $_.ProcessName -like "sv*" }

#5
Dir "D:\Downloads" | 
Where-Object Extension -Like ".exe" |
Measure-Object -Property Length -Sum -Maximum -Minimum -Average

#6
Dir "D:\Downloads" | 
Group-Object -Property Extension

#7
Dir "D:\Downloads\Новая папка" | 
Where-Object Extension -EQ ".txt" |
ForEach-Object Delete

