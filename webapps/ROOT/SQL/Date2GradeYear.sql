CREATE OR REPLACE FUNCTION DATE2GRADEYEAR
-- 【5-⑨】
(dDate IN DATE)
RETURN NUMBER
IS
    nYear NUMBER;
    sMonth CHAR(10);
BEGIN
    SELECT TO_NUMBER(TO_CHAR(dDate, 'YYYY')), TO_CHAR(dDate, 'MM')
    INTO nYear, sMonth
    FROM DUAL;
    IF (sMonth ='01' or sMonth='02')  THEN
        nYear := nYear - 1;
    END IF; 
    RETURN nYear;
END;
/