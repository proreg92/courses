# MyScript.ps1
# 3. Показать название каталога в корневой папке диска "C:", 
# в котором больше всего вложенных подкаталогов

$RootFolderName = "C:\Windows" # В этой папке будем искать....


################################################################################################

$RootC = Dir $RootFolderName -Directory # Это массив папок верхнего уровня. Будем их перебирать

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




# MyScript2.ps1
# 3. Показать название каталога в корневой папке диска "C:", 
# в котором больше всего вложенных подкаталогов

# Добавляем параметры Param

[CmdletBinding()] # Задание powershellу директивы задания сложных параметров

Param(
[Parameter(Mandatory=$True)] # Обязательный параметр задания каталога с логическим значение $True - Обязательно
[string]$RootFolderName,

[string]$Ext = "*" # Указываем значение по-умолчанию, чтобы искать все расширения
)


Write-Host ("Каталог: " + $RootFolderName)
Write-Host ("Расширение: " + $Ext)


$RootC = Dir $RootFolderName -Directory # Это массив папок верхнего уровня. Будем их перебирать
$MaxCount = 0 # Тут будем запоминать максимальное найденное число подкаталогов
$MaxName = "" # Тут будем запоминать название папки с максимальным числом подкаталогов

ForEach ($F in $RootC)  # Перебираем все каталоги верхнего уровня
    {
    $SubF = Dir -File ($F.FullName + "\*." + $Ext) # Получаем список вложенных папок
      
    If ($SubF.Count -GT $MaxCount) # Сравниваем число подпапок в текущем каталоге с папкой-"лидером"
        { # Если найден новый лидер гонки, запоминаем его параметры
        $MaxCount = $SubF.Count # Число подкаталогов у нового лидера
        $MaxName = $F.FullName  # Название нового лидера     
        } 
    
    }

$MaxName # После перебора всех папок в этой переменной будет выводиться папки лидера