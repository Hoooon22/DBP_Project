CREATE OR REPLACE PROCEDURE INSERTGRADE
-- 【5-⑫】
(   sScore IN VARCHAR2,
    sSid IN VARCHAR2,
    sCid IN VARCHAR2,
    nCidno IN NUMBER,
    nYear NUMBER,
    nSemester NUMBER,
    result OUT VARCHAR2)
IS
    noCurrent EXCEPTION;
    isVacation EXCEPTION;
    cur_year NUMBER;
    cur_month CHAR(10);
    cur_semester NUMBER;
    nScore NUMBER;
    sCname VARCHAR2(50);
    sGrade VARCHAR(10);
BEGIN
    result:= '';
    cur_year := Date2GradeYear(SYSDATE);
    cur_semester := Date2GradeSemester(SYSDATE);  
    IF(regexp_like(sScore, '[^[:digit:]]') = false) THEN
        nScore := TO_NUMBER(sScore);
    END IF;

    SELECT c_name
    INTO sCname
    FROM course
    WHERE c_id=sCid and c_id_no=nCidno;

    SELECT TO_CHAR(SYSDATE, 'MM')
    INTO cur_month
    FROM DUAL;

    IF(cur_month='07' or cur_month='08' or cur_month='01' or cur_month='02') THEN
        RAISE isVacation;
    END IF;

    IF (cur_year != nYear) THEN
        RAISE noCurrent;
    END IF;
    IF (cur_semester != nSemester) THEN
        RAISE noCurrent;
    END IF;

    IF(regexp_like(sScore, ' ')) THEN
        result := '등록 불가 (사유 : 점수에는 공백을 입력할 수 없습니다.)'; 
    ELSIF(regexp_like(sScore, '[^[:digit:]]')) THEN
        result := '등록 불가 (사유 : 숫자 외에 다른 문자를 입력할 수 없습니다.)';
    ELSIF((nScore >= 0 and nScore <= 100) = false) THEN
        result := '등록 불가 (사유 : 점수는 0~100사이의 값만 입력 가능합니다.)';
    ELSIF(sScore is null) THEN
        result := '등록 불가 (사유 : 점수를 입력하지 않았습니다.)'; 
    ELSE
        UPDATE ENROLL 
        SET e_score = sScore
        WHERE s_id = sSid and c_id = sCid and c_id_no = nCidno and e_year = nYear and e_semester = nSemester;
        result := '등록 완료';
    END IF;

    sGrade := ChangeGrade(nScore);
    UPDATE ENROLL
    SET e_grade = sGrade
    WHERE s_id = sSid and 
    c_id = sCid and 
    c_id_no = nCidno and
    e_year = nYear and
    e_semester = nSemester;

    EXCEPTION
    WHEN noCurrent THEN
        RAISE_APPLICATION_ERROR(-20002, '등록 불가(사유 : 현재 학기 성적만 입력 가능합니다.)');
    WHEN isVacation THEN
        RAISE_APPLICATION_ERROR(-20003, '등록 불가(사유 : 학기 중에만 성적 입력 가능합니다.)');
END;
/