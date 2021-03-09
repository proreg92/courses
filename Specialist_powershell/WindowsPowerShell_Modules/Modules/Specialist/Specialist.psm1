# Необходимо создать папки WindowsPowerShell\Modules\<Specialist> по пути C:\Users\admin\Documents\
# Необходимо, чтобы папка и модуль назывались одинаково и под каждый модуль создавалась своя папка
# Например dir .\Specialist\Specialist.psm1


Function Get-MyInfo
    {
<#
.SYNOPSIS
    Краткая сводка по команде
.DESCRIPTION
    Подробное описание
.PARAMETER FileName
    Параметр №1
.EXAMPLE
    Тут пример
#>

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

<#
.SYNOPSIS
    Краткая сводка по команде
.DESCRIPTION
    Подробное описание
.PARAMETER FileName
    Параметр №1
.PARAMETER TextInfo
    Параметр №2
.EXAMPLE
    Тут пример
#>

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






