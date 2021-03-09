[int]$Index = 8

# 1. Цикл с предусловием
while ($Index -GT 0) # Условие продолжения цикла
    {
    $Index; # Полезная нагрузка в цикле
    $Index = $Index -1;
    }

# 2. Циклы с постусловием
Do
    {
    $Index; # Полезная нагрузка в цикле
    $Index = $Index -1;
    }
while ($Index -GT 0) # Условие продолжения цикла, пока условие верное
   
$Index

# 3. Циклы с постусловием
Do
    {
    $Index; # Полезная нагрузка в цикле
    $Index = $Index -1;
    }
Until ($Index -EQ 1) # Условие _окончания_ цикла. До тех пор, пока условие ложное

# 4. Цикл FOR с переменной

[int]$Index = 8

For (
    [int]$ForIndex = $Index; # Выполняется один раз в самом начале до входа в цикл
    $ForIndex -GT 0; # Условие продолжения цикла
    $ForIndex = $ForIndex -1 # Выполняется после каждого повторения
    )
    {
        $ForIndex; # Полезная нагрузка в цикле
    }

# Цикл FOR простой
For (
    [int]$Index = 8; # Выполняется один раз в самом начале до входа в цикл
    $Index -GT 0; # Условие продолжения цикла
    $Index = $Index -1 # Выполняется после каждого повторения
    )
    {
        $Index; # Полезная нагрузка в цикле
    }

# Примеры циклов
$Srv = Get-Service
$Srv.Count

For (
    [int]$i = 0;
    $i -LT $Srv.Count;
    $i = $i + 1
     )
     {
        $Srv[$i].Name
     }


# 5. Перебор ForEach
$Srv = Get-Service
ForEach ($s in $Srv)
    {
        $s.Name
    }

# 6. Условие If
# Простая форма:
[int]$Test9 = 5

If ($Test9 -GT 3)
    {
        Write-Host "Больше трех"
    }

# Средняя форма:
[int]$Test9 = 2

If ($Test9 -GT 3)
    {
        Write-Host "Больше трех"
    }
Else
    {
        Write-Host "Не больше трех"
    }

# Сложная форма:
[int]$Test9 = 3

If ($Test9 -GT 3)
    {
        Write-Host "Раз"
    }
ElseIf ($Test9 -GT 4)
    {
        Write-Host "Два"
    }
ElseIf ($Test9 -GT 5)
    {
        Write-Host "Три"
    }
Else
    {
        Write-Host "Четыре"
    }