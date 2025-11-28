SET SERVEROUTPUT ON

DECLARE 
  LDSBLIST number;
  RECIDBLIST number;
BEGIN 


  SELECT NVL(MAX(LDSVERSION), 0)
  INTO LDSBLIST
  FROM blist;

  SELECT NVL(MAX(LDSRECID), 0)
  INTO RECIDBLIST
  FROM blist;

  FOR bc_rec IN (SELECT cepan FROM congbarcode WHERE dayvald < 0 AND lastexit IS NULL)
  LOOP
   
    DECLARE
      rcnnt NUMBER;
    BEGIN
      SELECT COUNT(*) INTO rcnnt FROM blist WHERE CEPAN = bc_rec.cepan;
    
      IF (rcnnt < 1) THEN
         
          INSERT INTO blist (CEPAN, SIDTYPEREF, LENTRYVER, SREASON, SDSINSTANCEREF, LDSRECID, LDSVERSION) 
          VALUES (bc_rec.cepan, 3, 0, 4, 8001, RECIDBLIST + 1, LDSBLIST + 1);
          
          LDSBLIST := LDSBLIST + 1;
          RECIDBLIST := RECIDBLIST + 1;
      END IF;
      
      UPDATE congbarcode SET lastexit = lastentry WHERE cepan = bc_rec.cepan;
    END; 
  END LOOP;

END;
/
EXIT;
