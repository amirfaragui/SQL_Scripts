SET ECHO OFF
SET FEEDBACK OFF
SET HEADING OFF     
SET PAGESIZE 0      
SET LINESIZE 1000
SET TRIMSPOOL ON
SET TERMOUT OFF
SET UNDERLINE OFF
SET COLSEP ;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD.MM.YYYY HH24:MI:SS';

SPOOL C:\ReportExport\DWH_EXP\PAS-temp-8125-00.txt

-- Print custom header row
SELECT '"tactiontime";"cepan";"ccustomerattribute";"cbusinesstransactionid"'
FROM dual;

-- Now print the data
SELECT '"' || tactiontime || '"'
     || ';"' || cepan || '"'
     || ';"' || ccustomerattribute || '"'
     || ';"' || cbusinesstransactionid || '"'
FROM udboa
WHERE tactiontime >= TRUNC(SYSDATE-20)
  AND tactiontime < TRUNC(SYSDATE)
  AND lcustomerid > 0;

SPOOL OFF
EXIT;