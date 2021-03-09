# Задание по сценарию
# Написать сценарий с параметрами, показывающий список процессов
# Параметры:

#1. Строка - фильтр для процессов
#2. Число - фильтр для процессов
#3. Число - управляет сортировкой
#4. Строка - упарвляет форматированием результата


# Сначало перебираем все процессы по имени
# Потом сортируем их по загрузке ЦПУ и ID
# После выводим результат на экран различными способами

Get-Process | Get-Member -MemberType Property

Get-Process |
    Where-Object -Property ProcessName -Like "*" |   #1
    Where-Object -Property CPU -GT 0 | #2
    Sort-Object -Property ID -Descending | #3
    FT Id, CPU, ProcessName, StartTime #4



$ProcessList = Get-Process
$MaxCPU = 33
$PN = ""
$Format = "StartTime"
$AllPr = @()


ForEach ($P in $ProcessList)
    {
    
    If ($P.CPU -GT $MaxCPU -and $P.ProcessName -match $PN)
        {
        #$P
        $AllPr = $AllPr + $P
        }
  
    }
$Allpr | FT -Property $Format -AutoSize


#$Allpr | Sort-Object -Property Handles -Descending | FT 
#$AllPr.Count


   
 

  