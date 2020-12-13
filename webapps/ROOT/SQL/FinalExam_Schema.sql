/* �ǽ� ���̺� */
/*
�л�(student) : �й�, �̸�, �ּ�,�г�,�к�, ����, �н�����
����(course) : �����ȣ, �й�, �����, ����
����(professor) : ������ȣ, �����̸�, ����, �а�, �н�����
���(enroll) : �й�, �����ȣ, �й�, ��Ͻñ�, ����б�, ����
����(teach) : ������ȣ, �����ȣ, �й�, ���ǽñ�, ����, ���, �����ִ��ο�
*/

DROP TABLE student CASCADE CONSTRAINTS;  
DROP TABLE course CASCADE CONSTRAINTS;  
DROP TABLE professor CASCADE CONSTRAINTS;  
DROP TABLE enroll CASCADE CONSTRAINTS;  
DROP TABLE teach CASCADE CONSTRAINTS;  

CREATE TABLE student
(
    s_id	    VARCHAR2(10),
    s_name  VARCHAR2(50)   not null,
    s_addr    VARCHAR2(200),
    s_year     NUMBER(1)   not null,
    s_college    VARCHAR2(50)   not null,
    s_major   VARCHAR2(50)   not null,
    s_pwd       VARCHAR2(10)   not null,
    CONSTRAINT s_pk PRIMARY KEY (s_id)
);


INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20011234', '�Ű�ȭ','��⵵ ȭ���� �ۻ�� ����1�� 540-2', 4, 'IT�к�', '��ǻ�Ͱ���','1234');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20011235', '���븸','��⵵ ���ν� ������ �󼭸� ��24', 4, 'IT�к�', '��ǻ�Ͱ���','1235');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20011236', '���ֿ�','��⵵ ������ �д籸 ���̵� 79���� ��ġ����', 4, 'IT�к�', '��ǻ�Ͱ���','1236');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20011237', '����ȯ','��⵵ ������ �ȴޱ� ��ź3�� 416����', 4, 'IT�к�', '��ǻ�Ͱ���','1237');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20021245', '����ȣ','��� �ȵ��� ��� 1234-5����', 3, 'IT�к�', '��ǻ�Ͱ���','3123');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20021246', '�ѽŵ�','���� ���α� ���۵� 81', 3, 'IT�к�', '��ǻ�Ͱ���','3124');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20021247', '��ȣ��','���� ���۱� ���3�� 183-2', 3, 'IT�к�', '��ǻ�Ͱ���','3125');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20023451', '�迵ö','���� ���빮�� ȸ�⵿ 101-6', 3, 'IT�к�', '��Ƽ�̵�����','3451');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20012454', '���¿�','���� ���ı� ������ 80-3', 4, 'IT�к�', '��Ƽ�̵�����','3454');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20012456', '������','��õ�� ���� ����2�� 400-5', 4, 'IT�к�', '��Ƽ�̵�����','3456');

CREATE TABLE course
(
    c_id   	VARCHAR2(10),
    c_id_no  NUMBER(1),
    c_name  VARCHAR2(50),
    c_unit     NUMBER(1),
    CONSTRAINT c_pk PRIMARY KEY (c_id, c_id_no)
);

INSERT INTO course VALUES ('C100', 1, '��ǻ�� ���α׷���', 3) ;
INSERT INTO course VALUES ('C200', 1, '�ڷᱸ��', 3) ;
INSERT INTO course VALUES ('C300', 1, '�˰���', 3) ;
INSERT INTO course VALUES ('C400', 1, '�����ͺ��̽� �ý���', 3) ;
INSERT INTO course VALUES ('C500', 1, '�ü��', 3) ;
INSERT INTO course VALUES ('C600', 1, '����Ʈ���� ����', 3) ;
INSERT INTO course VALUES ('C700', 1, '��Ʈ��ũ', 3) ;
INSERT INTO course VALUES ('C800', 1, '�����ͺ��̽� ���α׷���', 3) ;
INSERT INTO course VALUES ('C900', 1, '��ü���� �������� ���α׷���', 3) ;
INSERT INTO course VALUES ('M100', 1, '��Ƽ�̵�� ����', 3) ;
INSERT INTO course VALUES ('M200', 1, '�������', 3) ;
INSERT INTO course VALUES ('M300', 1, '�׷��� Ȱ��', 3) ;
INSERT INTO course VALUES ('M400', 1, '�������� ���α׷���', 3) ;
INSERT INTO course VALUES ('M500', 1, '��ǻ�� �׷��Ƚ�', 3) ;
INSERT INTO course VALUES ('M600', 1, '��Ƽ�̵�� ó��', 3) ;
INSERT INTO course VALUES ('M700', 1, '���� ���α׷���', 3) ;
INSERT INTO course VALUES ('C100', 2, '��ǻ�� ���α׷���', 3) ;
INSERT INTO course VALUES ('C400', 2, '�����ͺ��̽� �ý���', 3) ;
INSERT INTO course VALUES ('C700', 2, '��Ʈ��ũ', 3) ;
INSERT INTO course VALUES ('C900', 2, '��ü���� �������� ���α׷���', 3) ;
INSERT INTO course VALUES ('M100', 2, '��Ƽ�̵�� ����', 3) ;
INSERT INTO course VALUES ('M400', 2, '�������� ���α׷���', 3) ;
INSERT INTO course VALUES ('M700', 2, '���� ���α׷���', 3) ;



CREATE TABLE professor
(
    p_id	       VARCHAR2(10),
    p_name      VARCHAR2(50)   not null,
    p_college    VARCHAR2(50)   not null,
    p_major      VARCHAR2(50)   not null,
    p_pwd         VARCHAR2(10)   not null,
    p_research      VARCHAR2(100),
    CONSTRAINT p_pk PRIMARY KEY (p_id)
);

INSERT INTO professor VALUES ('CS4580', '�ڱ���', 'IT�к�', '��ǻ�Ͱ���','4580', null);
INSERT INTO professor VALUES ('CS4581', 'ȫ�浿', 'IT�к�', '��ǻ�Ͱ���','4581', null);
INSERT INTO professor VALUES ('CS4582', '������', 'IT�к�', '��ǻ�Ͱ���','4582', null);
INSERT INTO professor VALUES ('CS4583', '����ȫ', 'IT�к�', '��ǻ�Ͱ���','4583', null);
INSERT INTO professor VALUES ('CS4584', '��ɼ�', 'IT�к�', '��ǻ�Ͱ���','4584', null);
INSERT INTO professor VALUES ('CS4585', '������', 'IT�к�', '��ǻ�Ͱ���','4585', null);
INSERT INTO professor VALUES ('MM4570', '������', 'IT�к�', '��Ƽ�̵�����','4570', null);
INSERT INTO professor VALUES ('MM4571', '�ű��', 'IT�к�', '��Ƽ�̵�����','4571', null);
INSERT INTO professor VALUES ('MM4572', '�̻���', 'IT�к�', '��Ƽ�̵�����','4572', null);


CREATE TABLE enroll
(
    s_id	     VARCHAR2(10),
    c_id	     VARCHAR2(10),
    c_id_no    NUMBER(1),
    e_year      NUMBER(4),
    e_semester    NUMBER(1),
    e_score    NUMBER(3),
    e_grade     VARCHAR(5),
    CONSTRAINT e_pk PRIMARY KEY (s_id, c_id, c_id_no),
    CONSTRAINT e_c_id_fk FOREIGN KEY (c_id, c_id_no) REFERENCES  course (c_id, c_id_no)
);

INSERT INTO enroll VALUES ( '20011234', 'C100', 1, 2021, 1, 60, null);
INSERT INTO enroll VALUES ( '20011234', 'C200', 1, 2021, 1, 57, null);
INSERT INTO enroll VALUES ( '20011234', 'C300', 1, 2021, 1, null, null);
INSERT INTO enroll VALUES ( '20011234', 'C400', 1, 2021, 1, 85, null);
INSERT INTO enroll VALUES ( '20011234', 'C500', 1, 2021, 1, null, null);
INSERT INTO enroll VALUES ( '20011234', 'C600', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011234', 'C700', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011235', 'C100', 1, 2020, 2, 76, null);
INSERT INTO enroll VALUES ( '20011235', 'C200', 1, 2021, 1, 78, null);
INSERT INTO enroll VALUES ( '20011235', 'C300', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011235', 'C400', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011235', 'C500', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011235', 'C600', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011235', 'C700', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011235', 'C900', 1, 2021, 1, null, null);
INSERT INTO enroll VALUES ( '20011236', 'C100', 1, 2020, 2, 67, null);
INSERT INTO enroll VALUES ( '20011236', 'C200', 1, 2021, 1, 95, null);
INSERT INTO enroll VALUES ( '20011236', 'C300', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011236', 'C400', 1, 2021, 1, 95, null);
INSERT INTO enroll VALUES ( '20011236', 'C500', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011236', 'C600', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011236', 'C700', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011236', 'C900', 1, 2021, 1, null, null);
INSERT INTO enroll VALUES ( '20011237', 'C100', 1, 2020, 2, 45, null);
INSERT INTO enroll VALUES ( '20011237', 'C200', 1, 2021, 1, 68, null);
INSERT INTO enroll VALUES ( '20011237', 'C300', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011237', 'C400', 1, 2021, 1, 88, null);
INSERT INTO enroll VALUES ( '20011237', 'C500', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011237', 'C600', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011237', 'C700', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011237', 'C900', 1, 2021, 1, null, null);
INSERT INTO enroll VALUES ( '20021245', 'C100', 1, 2020, 2, 75, null);
INSERT INTO enroll VALUES ( '20021245', 'C200', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011245', 'C900', 1, 2021, 1, null, null);
INSERT INTO enroll VALUES ( '20021246', 'C100', 1, 2020, 2, 91, null);
INSERT INTO enroll VALUES ( '20021246', 'C200', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20011246', 'C900', 1, 2021, 1, null, null);
INSERT INTO enroll VALUES ( '20021247', 'C100', 1, 2020, 2, 87, null);
INSERT INTO enroll VALUES ( '20021247', 'C200', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20012454', 'C100', 1, 2020, 2, 67, null);
INSERT INTO enroll VALUES ( '20012454', 'M100', 1, 2020, 2, 57, null);
INSERT INTO enroll VALUES ( '20012454', 'M200', 1, 2021, 1, 71, null);
INSERT INTO enroll VALUES ( '20012454', 'M300', 1, 2021, 1, 83, null);
INSERT INTO enroll VALUES ( '20012454', 'M400', 1, 2021, 1, 89, null);
INSERT INTO enroll VALUES ( '20012454', 'M500', 1, 2020, 2, null, null);
INSERT INTO enroll VALUES ( '20012456', 'C100', 1, 2020, 2, 96, null);
INSERT INTO enroll VALUES ( '20012456', 'C200', 1, 2021, 1, 87, null);
INSERT INTO enroll VALUES ( '20012456', 'M100', 1, 2020, 2, 63, null);
INSERT INTO enroll VALUES ( '20012456', 'M200', 1, 2021, 1, 68, null);
INSERT INTO enroll VALUES ( '20012456', 'M300', 1, 2021, 1, 98, null);
INSERT INTO enroll VALUES ( '20012456', 'M400', 1, 2021, 1, 85, null);
INSERT INTO enroll VALUES ( '20012456', 'M500', 1, 2020, 2, null, null);

CREATE TABLE teach
(
    p_id	   VARCHAR2(10),
    c_id	   VARCHAR2(10),
    c_id_no  NUMBER(1),
    t_year    NUMBER(4),
    t_semester    NUMBER(1),
    t_time    NUMBER(1),
    t_where  VARCHAR2(50),
    t_max    NUMBER(2),
    CONSTRAINT t_pk PRIMARY KEY (p_id, c_id, c_id_no,t_year,t_semester ),
    CONSTRAINT t_c_id_fk FOREIGN KEY (c_id, c_id_no) REFERENCES  course (c_id, c_id_no)
 );

INSERT INTO teach VALUES ( 'CS4580', 'C100', 1 , 2021, 1, 4, '��-201', 5);
INSERT INTO teach VALUES ( 'CS4581', 'C200', 1 , 2021, 1, 5, '��-201', 6);
INSERT INTO teach VALUES ( 'CS4581', 'C200', 1 , 2020, 2, 5, '��-201', 5);
INSERT INTO teach VALUES ( 'CS4581', 'C300', 1 , 2021, 1, 2, '��-416', 7);
INSERT INTO teach VALUES ( 'CS4582', 'C400', 1 , 2021, 1, 6, '��-201', 5);
INSERT INTO teach VALUES ( 'CS4582', 'C400', 1 , 2020, 2, 6, '��-201', 7);
INSERT INTO teach VALUES ( 'CS4583', 'C500', 1 , 2021, 1, 3, '��-201', 5);
INSERT INTO teach VALUES ( 'CS4583', 'C700', 1 , 2020, 2, 4, '��-310', 7);
INSERT INTO teach VALUES ( 'CS4584', 'C600', 1 , 2020, 2, 1, '��-309', 6);
INSERT INTO teach VALUES ( 'CS4584', 'C800', 1 , 2021, 1, 7, '��-309', 5);
INSERT INTO teach VALUES ( 'MM4570', 'M100', 1 , 2021, 1, 5, '��-201', 8);
INSERT INTO teach VALUES ( 'MM4570', 'M400', 1 , 2021, 1, 5, '��-201', 5);
INSERT INTO teach VALUES ( 'MM4571', 'M200', 1 , 2021, 1, 3, '��-417', 7);
INSERT INTO teach VALUES ( 'MM4571', 'M200', 1 , 2020, 2, 3, '��-417', 8);
INSERT INTO teach VALUES ( 'MM4571', 'M500', 1 , 2020, 2, 6, '��-201', 5);
INSERT INTO teach VALUES ( 'MM4572', 'M300', 1 , 2021, 1, 3, '��-201', 9);
INSERT INTO teach VALUES ( 'MM4572', 'M300', 1 , 2020, 2, 3, '��-201', 6);
INSERT INTO teach VALUES ( 'MM4572', 'C900', 1 , 2021, 1, 2, '��-201', 5);
INSERT INTO teach VALUES ( 'MM4572', 'M700', 1 , 2021, 1, 8, '��-201', 8);

COMMIT;