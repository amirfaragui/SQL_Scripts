@echo off

set SERVER=(local)\sqlexpress
set DATABASE=PermitManagerCashier
set USER=sa
set "PASSWORD=S&Bca@4711"

if not exist C:\Exports mkdir C:\Exports

for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyyMM"') do set YM=%%i
set OUTPUT=C:\Exports\POLDER_LIST_%YM%.csv

sqlcmd -S "%SERVER%" -d "%DATABASE%" -U "%USER%" -P "%PASSWORD%" ^
-i export.sql ^
-s "," -W -o "%OUTPUT%"

echo Export completed!
pause
