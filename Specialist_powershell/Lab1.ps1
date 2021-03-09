# 1. Как называется самый большой EXE-файл в каталоге C:\windows\system32

Dir C:\Windows\System32 | Select-Object -Property Name, Length, Extension | Where-Object -Property Extension -EQ ".exe"

Dir C:\Windows\System32 | 
    Where-Object -Property Extension -EQ ".exe" | 
    Sort-Object -Property Length -Descending |
    Select-Object -First 1 |
    FT Name, Length, Extension -AutoSize


Dir C:\Windows\System32 | 
    Where-Object -FilterScript {$_.Extension -like ".exe"} |
    Sort-Object -Property Length -Descending |
    Select-Object -First 1 |
    FT Name, Length, Extension -AutoSize
 
Dir C:\Windows\System32 | 
    Measure-Object -Property Length -Maximum

        
Dir C:\Windows\System32 | 
    #Group-Object -Property Extension
    Where-Object -Property Extension -Like ".exe" | 
    Measure-Object -Property Length -Maximum 
 
Measure-Object | Get-Member

# 2. Сколько букв в названии этого файла?
# Get-Member=GM
# $_ = $PSItem - данные в конвеере

Dir C:\Windows\System32 | 
    Where-Object -Property Extension -EQ ".exe" | 
    Sort-Object -Property Length -Descending |
    Select-Object -First 1 -Property Name, Extension, Length, @{n="Symbol_length"; e={ ForEach-Object {$_.Name.Length}} } | 
    FT 

# 3. Показать название каталога в корневой папке диска "C:", 
# в котором больше всего вложенных подкаталогов

$RootC = Dir "C:\" -Directory # Это массив папок верхнего уровня. Будем их перебирать

$MaxCount = 0 # Тут будем запоминать максимальное найденное число подкаталогов
$MaxName = "" # Тут будем запоминать название папки с максимальным числом подкаталогов

ForEach ($F in $RootC)  # Перебираем все каталоги верхнего уровня
    {
    $SubF = Dir -Directory $F.FullName # Получаем список вложенных папок
      
    If ($SubF.Count -GT $MaxCount) # Сравниваем число подпапок в текущем каталоге с папкой-"лидером"
        { # Если найден новый лидер гонки, запоминаем его параметры
        $MaxCount = $SubF.Count # Число подкаталогов у нового лидера
        $MaxName = $F.FullName  # Название нового лидера     
        } 
    
    }

$MaxName # После перебора всех папок в этой переменной будет выводиться папки лидера


    
    
