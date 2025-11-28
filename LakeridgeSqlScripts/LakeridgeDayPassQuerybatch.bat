@echo off

REM Set Oracle home
SET ORACLE_HOME=C:\orant\db_home
SET PATH=%ORACLE_HOME%\bin;%PATH%

REM Run SQL script
"%ORACLE_HOME%\bin\sqlplus.exe" -s db/db@TCP-LOOPBACK.WORLD @C:\LakeridgeDayPassQuery.sql
