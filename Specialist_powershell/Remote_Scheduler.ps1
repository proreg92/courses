# Удаленное подключение и выполнение команд PS:
# 1. -ComputerName
# 2. Enter-PSSession -ComputerName и Exit-PSSession 
# 3. Invoke-Command -ComputerName ... -ScriptBlock { Get-Service; Get-Process;.. }

CMD WinRM QuickConfig
Get-Service -ComputerName winsrv2
Enter-PSSession -ComputerName winsrv2
Invoke-Command -ComputerName winsrv2, winsrv1,...


# Фоновое исполнение заданий:
# Start-Job { Get-Process }
# Receive-Job -Id 2  or $Srv = Receive-Job -Id 2
# Get-Job -Id or Get-Job for All job

Start-Job { Get-Process }
Get-Job
Receive-Job -Id 1


# Планировщик заданий PS и назначение задания:

Get-Command -Noun ScheduledJob
Get-Help Set-ScheduledJob -examples
Get-ScheduledJob