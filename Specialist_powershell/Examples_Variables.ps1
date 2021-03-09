Get-Command -Noun Variable

Get-Variable -Name PSVersionTable | Get-Member

Get-Help New-Variable

New-Variable -Name Test1
New-Variable -Name Test2 -Value 2015
New-Variable -Name Test3 -Value "Specialist"

Get-Variable

Get-PSDrive

Dir Variable:\Test3
Dir Variable:\PSVersionTable

$PSVersionTable | Get-Member

$Test2 | Get-Member
$Test2.GetType()

$Test3.Length
$Test3.Substring(3,5)


[int]$Test5 = 100

Dir Variable:\Test?

[int]$Test6 = 3
$Test6 = 15
Dir C:\Windows | Select-Object -First $Test6

$Test6 * ($Test6 -1)

$Test7 = 10, 20, 30, 40, 50
$Test7 | GM
$Test7[0]
$Test7[1]

#Кол-во элементов в массиве
$Test7.Count

#Последний элемент в массиве
$Test7[$Test7.Count - 1]
$Test7[2].GetType()
$Test7.GetType()

$Test7[2] = "Brazil-2018"

[int]$Test8 = 10, 20, 30

$SrvList = Get-Service
$SrvList | GM
$SrvList[11]
$SrvList[11].Status.ToString().Length
$SrvList[11].Name.ToString().Length
$SrvList[11].Status
