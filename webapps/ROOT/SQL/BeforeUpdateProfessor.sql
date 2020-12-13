CREATE OR REPLACE TRIGGER BEFOREUPDATEPROFESSOR
-- 【1-⑥】
BEFORE UPDATE ON professor
FOR EACH ROW
DECLARE
    pwd_str VARCHAR2(100) := '';
    pwd_num VARCHAR2(100) := '';
BEGIN
    /* 패스워드는 문자와 숫자를 조합하여 입력해야 함 */
    IF REGEXP_LIKE(:NEW.p_pwd, '[^[:digit:]]') != true OR REGEXP_LIKE(:NEW.p_pwd, '[^[:alpha:]]') != true THEN
        raise_application_error(-20002, '패스워드는 문자와 숫자를 조합해야 합니다.');
    END IF;

    /* 연구분야는 ‘데이터베이스’, ‘네트워크’, ‘운영체제’만 입력해야 함 */
    IF :NEW.p_research != '데이터베이스' AND :NEW.p_research != '네트워크' AND :NEW.p_research != '운영체제' THEN
        raise_application_error(-20003, '연구분야를 다시 입력해주세요.');
    END IF;

    /* 패스워드는 기존에 설정한 패스워드와 다르게 입력해야 함 / - 단, 연구분야를 수정한 경우 기존에 설정한 패스워드를 변경하지 않아도 됨 */
    IF :NEW.p_research = :OLD.p_research THEN
        IF :NEW.p_pwd = :OLD.p_pwd THEN
            raise_application_error(-20004, '패스워드는 기존과 동일하게 변경할 수 없습니다.');
        END IF;
    END IF;

END;
/