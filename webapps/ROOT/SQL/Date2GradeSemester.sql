CREATE OR REPLACE FUNCTION DATE2GRADESEMESTER
-- 【5-⑩】
(dDate IN DATE)
RETURN NUMBER
IS
    nSemester NUMBER;
    sMonth CHAR(10);
BEGIN
    SELECT TO_CHAR(dDate, 'MM')
    INTO sMonth
    FROM DUAL;
    IF (sMonth >='03' and sMonth<='08') THEN 
        nSemester := 1;
    ELSE
        nSemester := 2;
    END IF;
RETURN nSemester;
END;
/