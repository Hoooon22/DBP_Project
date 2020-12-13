CREATE OR REPLACE PROCEDURE UPDATEEQUIPMENT
(
    csid IN VARCHAR2,
    csname IN VARCHAR2,
    cname IN VARCHAR2,
    ename IN VARCHAR2,
    ecount OUT VARCHAR2)
IS
    cName VARCHAR2(50);
    nYear NUMBER;
    nSemester NUMBER;
    nCount NUMBER;
BEGIN
    result := '';

    nYear := DATE2ENROLLYEAR(SYSDATE);
    nSemester := DATE2ENROLLSEMESTER(SYSDATE);

    select course.c_name
    into cName
    from course, teach
    where course.c_id = cid and course.c_id = teach.c_id and course.c_id_no = cidno and teach.t_year = nYear and teach.t_semester = nSemester;

    select COUNT(*)
    into nCount
    from enroll
    where c_id = cid and e_year = nYear and e_semester = nSemester;

    -- 이 주석들 빼거나 수정 ㄱㄱ
    -- ① 수강정원에 공백(스페이스) 값을 입력할 수 없음 
    IF (REGEXP_LIKE(tmax, ' ') = true) THEN
        result := cName || ' : 변경 불가(사유 : 수강정원에는 공백을 입력할 수 없습니다.)';

    -- ② 수강정원에 숫자 외에 다른 문자를 입력할 수 없음 
    ELSIF (REGEXP_LIKE(tmax, '[^[:digit:]]') = true) THEN
        result := cName || ' : 변경 불가(사유 : 숫자 외에 다른문자를 입력할 수 없습니다.)';

    -- ③ 수강정원에 0~100 사이의 값만 입력할 수 있음 
    ELSIF (TO_NUMBER(tmax) < 0 OR TO_NUMBER(tmax) > 100) THEN
        result := cName || ' : 변경 불가(사유 : 수강정원은 0~100사이의 값만 입력 가능합니다.)';

    -- ④ 수강정원에 NULL 값을 입력할 수 없음
    ELSIF (tmax is null) THEN
        result := cName || ' : 변경 불가(사유 : 수강정원을 입력하지 않았습니다.)';

    -- ⑤ 수강정원은 현재 수강 신청 인원 미만으로 입력할 수 없음
    ELSIF (TO_NUMBER(tmax) < nCount) THEN
        result := cName || ' : 변경 불가(사유 : 강의를 신청한 학생 수 ' || nCount || '명 이상의 수를 입력해야 합니다.)';

    -- 이상 없을 경우
    ELSE 
        update teach
        set t_max = tmax
        where teach.c_id = cid and teach.c_id_no = cidno and teach.t_year = nYear and teach.t_semester = nSemester;
        result := cName || ' : 변경완료';
    END IF;
    EXCEPTION
        WHEN OTHERS THEN
            result := SQLERRM;

    COMMIT;
END;
/
