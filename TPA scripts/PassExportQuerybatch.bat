@echo off

sqlplus -s db/db@TCP-LOOPBACK.WORLD @C:\PassportExportQuery.sql 

REM Get yesterday’s date as YYMMDD
for /f %%i in ('powershell -NoProfile -Command "Get-Date (Get-Date).AddDays(-1) -Format yyMMdd"') do set filedate=%%i


REM Rename the file
rename "C:\ReportExport\DWH_EXP\PAS-temp-8125-00.txt" "PAS-%filedate%-8125-00.txt"
echo Export complete: %OUTFILE%
