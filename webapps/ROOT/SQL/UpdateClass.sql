CREATE OR REPLACE PROCEDURE UPDATECLASS
-- 【3-③】
(
    cid IN VARCHAR2,
    cidno IN NUMBER,
    twhere IN VARCHAR2,
    ttime IN NUMBER,
    result OUT VARCHAR2)
IS
    cur_twhere VARCHAR2(50);
    cur_ttime VARCHAR(1);
    nYear NUMBER;
    nSemester NUMBER;
    overlap_name VARCHAR2(50);
BEGIN 
    result := '';
    overlap_name := null;

    nYear := Date2EnrollYear(SYSDATE);
    nSemester := Date2EnrollSemester(SYSDATE);

    SELECT t_time, t_where
    INTO cur_ttime, cur_twhere
    FROM teach 
    WHERE c_id = cid and c_id_no = cidno and t_year = nYear and t_semester = nSemester;

    SELECT c.c_name
    INTO overlap_name
    FROM teach t 
    JOIN course c 
    ON (c.c_id = t.c_id and c.c_id_no = t.c_id_no)
    WHERE t.t_where = twhere and t.t_time = ttime and t.t_year = nYear and t.t_semester = nSemester;    

    IF(cur_twhere = twhere and cur_ttime = ttime) THEN
        result := '변경된 내용이 없습니다';
    ELSIF(overlap_name is not null) THEN
        result := overlap_name || '과목과 중복되어 처리할 수 없습니다.'; 
    ELSE
        UPDATE teach 
        SET t_where = twhere, t_time = ttime
        WHERE c_id = cid 
        and c_id_no = cidno 
        and t_year = nYear 
        and t_semester = nSemester;
        result := '과목정보를 변경하였습니다.';       
    END IF; 

EXCEPTION
    WHEN no_data_found THEN
        UPDATE teach 
        SET t_where = twhere, t_time = ttime
        WHERE c_id = cid 
        and c_id_no = cidno 
        and t_year = nYear 
        and t_semester = nSemester;
        result := '과목정보를 변경하였습니다.';
    WHEN OTHERS THEN
        result := SQLERRM;   
END;
/