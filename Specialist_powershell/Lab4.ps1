[CmdletBinding()] # Задание powershellу директивы задания сложных параметров

Param(
[string]$PN = "",
[Parameter(Mandatory=$True)]
[int]$MaxCPU,
[Parameter(Mandatory=$True)]
[string]$Format

)

Write-Host ("загрузка CPU: " + $MaxCPU)
Write-Host ("Имя процесса: " + $PN)

$ProcessList = Get-Process
$AllPr = @() 

ForEach ($P in $ProcessList)
    {
    
    If ($P.CPU -GT $MaxCPU -and $P.ProcessName -match $PN)
        {
        $AllPr = $AllPr + $P
        }            
    }
Write-Host  "Таких процессов не найдено"



$Allpr | FT -Property Handles, Id, CPU, ProcessName, NPM, PM, WS, VM, $Format 



