[int]$A = 0

Try
    {
    
    $A + 1
    $A * 2
    10 / $A
    $A - 1

    Write-Host "Ошибок нет"

    }
Catch
    {

    #Write-Host "Случилась Ошибка!"
    #Write-Error "Произошла ошибка!"
    Write-Warning "Случилась мать моя ошибка"
    
    $Error.ErrorDetails | GM
    
    }


Get-Command -Verb Write
Get-Service -Verbose -Debug

