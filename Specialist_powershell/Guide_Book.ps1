# Propeties of objects
Get-Service | Get-Member

# Groupping objects
Get-Service | Group-Object 

# Поиск командлетов по глаголу или существительному
Get-Command -Verb Format
Get-Command -Noun WebAppPool

# Получение алиасов командлетов (получение алиасов, имеющих в середине "f")
Get-Alias
Get-Alias *f*

# Просмотр провайдеров
Get-PSProvider

# Просмотр смонтированных источников
Get-PSDrive

# Политики исполнения скриптов и сценариев. Нужно проверять
Get-ExecutionPolicy -List
Set-ExecutionPolicy

# Импорт модулей PowerShell (свой модуль "Specialist" лежит в папке WindowsPowerShell_Moddules)
Import-Module WebAdministration
Import-Module Specialist

# Проверка сущетсвования файла или директории
Get-Help Test-Path
    