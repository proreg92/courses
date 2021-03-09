Function Get-MyInfo
    {

        [CmdletBinding()]
        Param(
        [Parameter(Mandatory=$True)]
        [string]$FileName
        )

    Get-Content -Path $FileName 

    }


##############################################

Function Set-MyInfo
    {

        [CmdletBinding()]
        Param(
        [Parameter(Mandatory=$True)]
        [string]$FileName,
        [Parameter(Mandatory=$True)]
        [string]$TextInfo
        )

    Set-Content -Path $FileName -Value $TextInfo
    }

###############################################


Function Clear-MyInfo
    {

        Param(
        [Parameter(Mandatory=$True)]
        [string]$FileName
        )

    Clear-Content -Path $FileName
    
    }

###############################################

Set-MyInfo -FileName "C:\Services.txt" -TextInfo "Sochi-2039" # Записываем текст в файл
Get-MyInfo -FileName "C:\Services.txt"                        # Читаем текс из файла
Clear-MyInfo -FileName "C:\Services.txt"                      # Удаляем файл





