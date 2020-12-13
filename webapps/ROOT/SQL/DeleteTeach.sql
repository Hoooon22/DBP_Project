CREATE OR REPLACE PROCEDURE DELETETEACH
-- 【2-⑩】
(   pid IN VARCHAR2,
    cid IN VARCHAR2,
    cid_no IN NUMBER,
    result OUT VARCHAR2)
IS
    nYear NUMBER;
    nSemester NUMBER;
    nTMax NUMBER;
    nCnt NUMBER;
    OVERPERCENT EXCEPTION;
BEGIN 
    result := '';
    nYear := Date2EnrollYear(SYSDATE);
    nSemester := Date2EnrollSemester(SYSDATE);
    
    SELECT t_max
    INTO nTMax
    FROM teach
    WHERE t_year = nYear and t_semester = nSemester and c_id = cid and c_id_no= cid_no;
    
    SELECT COUNT(*)
    INTO nCnt
    FROM enroll
    WHERE e_year = nYear and e_semester = nSemester and c_id = cid and c_id_no = cid_no;

    IF(nTMax*0.5<nCnt) THEN
        RAISE OVERPERCENT;
    END IF;
    
    Delete from teach where p_id=pid and c_id=cid and c_id_no=cid_no;
    result :='해당 과목 개설 신청이 취소되었습니다.';
    commit;

    EXCEPTION 
    WHEN  OVERPERCENT THEN
    result :=' 해당 과목의 수강 인원이 정원의 50%보다 많아 개설 신청을 취소할 수 없습니다.';
    
END;
/