--------------------------------------------------------
--  파일이 생성됨 - 목요일-7월-22-2021   
--------------------------------------------------------

-- 학부
Insert into EVERY.FACULTY (FACULTY_NO,FACULTY_NAME) values (1,'경영학부');
Insert into EVERY.FACULTY (FACULTY_NO,FACULTY_NAME) values (2,'사회과학학부');
Insert into EVERY.FACULTY (FACULTY_NO,FACULTY_NAME) values (3,'인문학부');
Insert into EVERY.FACULTY (FACULTY_NO,FACULTY_NAME) values (4,'법학부');
Insert into EVERY.FACULTY (FACULTY_NO,FACULTY_NAME) values (5,'공과대학');
Insert into EVERY.FACULTY (FACULTY_NO,FACULTY_NAME) values (6,'IT융합대학');

-- 건물
Insert into EVERY.BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL) values ('1','경영대학',null);
Insert into EVERY.BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL) values ('2','사회과학대학',null);
Insert into EVERY.BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL) values ('3','인문대학',null);
Insert into EVERY.BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL) values ('4','법과대학',null);
Insert into EVERY.BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL) values ('5','공과대학1',null);
Insert into EVERY.BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL) values ('6','공과대학2',null);
Insert into EVERY.BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL) values ('7','IT융합대학',null);
Insert into EVERY.BUILDING (BUILDING_CODE,BUILDING_NAME,DETAIL) values ('8','중앙도서관',null);

-- 카테고리
Insert into EVERY.CATEGORY (CATEGORY_CODE,CATEGORY_NAME,USAGE,REG_DATE) values (1,'공지사항',null,null);
Insert into EVERY.CATEGORY (CATEGORY_CODE,CATEGORY_NAME,USAGE,REG_DATE) values (2,'자유게시판',null,null);
Insert into EVERY.CATEGORY (CATEGORY_CODE,CATEGORY_NAME,USAGE,REG_DATE) values (3,'거래게시판',null,null);
Insert into EVERY.CATEGORY (CATEGORY_CODE,CATEGORY_NAME,USAGE,REG_DATE) values (4,'개설교과목공지',null,null);

-- 학과
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (1,1,'경영학과',null,'1',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (2,1,'금융수학과',null,'1',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (3,2,'미디어커뮤니케이션학과',null,'2',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (4,2,'관광경영학과',null,'2',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (5,2,'경제학과',null,'2',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (6,2,'의료경영학과',null,'2',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (7,2,'응용통계학과',null,'2',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (8,2,'사회복지학과',null,'2',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (9,2,'유아교육학과',null,'2',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (10,2,'심리학과',null,'2',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (11,3,'한국어문학과',null,'3',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (12,3,'영미어문학과',null,'3',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (13,3,'동양어문학과',null,'3',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (14,3,'유럽어문학과',null,'3',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (15,4,'법학과',null,'4',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (16,4,'경찰행정학과',null,'4',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (17,4,'행정학과',null,'4',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (18,5,'도시계획학과',null,'5',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (19,5,'조경학과',null,'5',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (20,5,'실내건축학과',null,'5',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (21,5,'건축공학과',null,'5',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (22,5,'설비소방공학과',null,'6',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (23,5,'화공생명공학과',null,'6',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (24,5,'기계공학과',null,'6',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (25,5,'토목환경공학과',null,'6',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (26,5,'신소재공학과',null,'6',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (27,6,'컴퓨터공학과',null,'7',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (28,6,'전자공학과',null,'7',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (29,6,'전기공학과',null,'7',null);
Insert into EVERY.DEPARTMENT (DEPT_NO,FACULTY_NO,DEPT_NAME,TEL,BUILDING_CODE,TOTAL_CREDIT) values (30,6,'에너지IT학과',null,'7',null);

-- 임직원 부서
insert into emp_depart values(1, '교무처');
insert into emp_depart values(2, '입학처');
insert into emp_depart values(3, '학생처');
insert into emp_depart values(4, '기획처');
insert into emp_depart values(5, '연구처');
insert into emp_depart values(6, '행정처');

-- 임직원 직책
insert into emp_position values(1, '처장');
insert into emp_position values(2, '부장');
insert into emp_position values(3, '과장');
insert into emp_position values(4, '대리');
insert into emp_position values(5, '사원');

-- 임직원 권한
insert into authority values(1, '관리자', 'ADMIN', sysdate);
insert into authority values(2, '부관리자', 'ASSISTANT', sysdate);
insert into authority values(3, '스태프', 'STAFF', sysdate);

-- 임직원 데이터
insert into employee(emp_no, emp_id, emp_name, pwd, start_date, dep_code, position_code, auth_code)
values('E00001', 'E00001', '관리자', '1', '10/11/10', 3,2,1);
insert into employee(emp_no, emp_id, emp_name, pwd, start_date, dep_code, position_code, auth_code)
values('E00002', 'E00002', '이관리', '1', '18/07/17', 5,4,3);
insert into employee(emp_no, emp_id, emp_name, pwd, start_date, dep_code, position_code, auth_code)
values('E00003', 'E00003', '홍관리', '1', '16/09/19', 2,3,2);

-- 교수 직책
Insert into EVERY.PROF_POSITION (POSITION_NO,POSITION_NAME) values (1,'정교수');
Insert into EVERY.PROF_POSITION (POSITION_NO,POSITION_NAME) values (2,'부교수');
Insert into EVERY.PROF_POSITION (POSITION_NO,POSITION_NAME) values (3,'조교수');
Insert into EVERY.PROF_POSITION (POSITION_NO,POSITION_NAME) values (4,'전임강사');
Insert into EVERY.PROF_POSITION (POSITION_NO,POSITION_NAME) values (5,'시간강사');

-- 교수
Insert into EVERY.PROFESSOR (PROF_NO,POSITION_NO,DEPT_NO,PROF_NAME,PROF_ID,PROF_PWD,PROF_PH,PROF_EMAIL,PROF_START_DATE,PROF_END_DATE,IDENTITY_STATE,IDENTITY_CODE,CHANGE_DATE) values ('P00001',1,27,'김교수','profkim','1',null,'profkim@every.com',null,null,null,null,null);

-- 재학상태
Insert into EVERY.STUDENT_STATE (STATE,STATE_NAME) values ('1','재학');
Insert into EVERY.STUDENT_STATE (STATE,STATE_NAME) values ('2','휴학');
Insert into EVERY.STUDENT_STATE (STATE,STATE_NAME) values ('3','졸업');
Insert into EVERY.STUDENT_STATE (STATE,STATE_NAME) values ('4','자퇴');
Insert into EVERY.STUDENT_STATE (STATE,STATE_NAME) values ('5','재적');
Insert into EVERY.STUDENT_STATE (STATE,STATE_NAME) values ('6','퇴학');

--학생
Insert into EVERY.STUDENT (STU_NO,STUDENT_ID,PWD,NAME,SEMESTER,MAJOR,MINOR,ADMISSION_DATE,GRADUATION_DATE,CREDITS,INDENTITY_STATE,INDENTITY_CODE,CHANGE_DATE,STATE,DEPT_NO,PHONENUM) values ('201224026','rimkim','1','김영림','5','컴퓨터공학과','항공운항학과',null,null,null,null,null,null,'1',27,null);
Insert into EVERY.STUDENT (STU_NO,STUDENT_ID,PWD,NAME,SEMESTER,MAJOR,MINOR,ADMISSION_DATE,GRADUATION_DATE,CREDITS,INDENTITY_STATE,INDENTITY_CODE,CHANGE_DATE,STATE,DEPT_NO,PHONENUM) values ('202100001','hong','1','홍길동','4','컴퓨터공학과',null,null,null,null,null,null,null,'1',27,null);
Insert into EVERY.STUDENT (STU_NO,STUDENT_ID,PWD,NAME,SEMESTER,MAJOR,MINOR,ADMISSION_DATE,GRADUATION_DATE,CREDITS,INDENTITY_STATE,INDENTITY_CODE,CHANGE_DATE,STATE,DEPT_NO,PHONENUM) values ('202100002','yhpark','1','박영희','4','컴퓨터공학과',null,null,null,null,null,null,null,'1',27,null);
Insert into EVERY.STUDENT (STU_NO,STUDENT_ID,PWD,NAME,SEMESTER,MAJOR,MINOR,ADMISSION_DATE,GRADUATION_DATE,CREDITS,INDENTITY_STATE,INDENTITY_CODE,CHANGE_DATE,STATE,DEPT_NO,PHONENUM) values ('202101111','ryan','1','라희언','2','경영학과',null,null,null,null,null,null,null,'1',1,null);

-- 이수구분
Insert into EVERY.SUBJ_TYPE (TYPE_CODE,TYPE) values ('1','전공필수');
Insert into EVERY.SUBJ_TYPE (TYPE_CODE,TYPE) values ('2','전공심화');
Insert into EVERY.SUBJ_TYPE (TYPE_CODE,TYPE) values ('3','전공선택');
Insert into EVERY.SUBJ_TYPE (TYPE_CODE,TYPE) values ('4','교양필수');
Insert into EVERY.SUBJ_TYPE (TYPE_CODE,TYPE) values ('5','일반교양');

-- 과목
Insert into EVERY.SUBJECT (SUBJ_CODE,PROF_NO,TYPE_CODE,SUBJ_NAME,CREDIT,PERSONNEL) values ('270001','P00001','1','웹프로그래밍',3,20);

-- 개설교과목
Insert into EVERY.OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,PROF_NO,OPEN_DATE,CLOSE_DATE) values ('21270001','270001','P00001',to_date('21/03/02','RR/MM/DD'),to_date('21/06/29','RR/MM/DD'));
Insert into EVERY.OPEN_SUBJ (OPEN_SUB_CODE,SUBJ_CODE,PROF_NO,OPEN_DATE,CLOSE_DATE) values ('21270002','270001','P00001',to_date('21/03/03','RR/MM/DD'),to_date('21/06/30','RR/MM/DD'));

-- 수강신청
Insert into EVERY.REGISTRATION (OPEN_SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('21270001','201224026','1',to_date('21/02/22','RR/MM/DD'),null,null);
Insert into EVERY.REGISTRATION (OPEN_SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('21270001','202100001','1',to_date('21/02/22','RR/MM/DD'),null,null);
Insert into EVERY.REGISTRATION (OPEN_SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('21270001','202100002','1',to_date('21/02/22','RR/MM/DD'),null,null);
Insert into EVERY.REGISTRATION (OPEN_SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('21270002','201224026','1',to_date('21/02/22','RR/MM/DD'),null,null);
Insert into EVERY.REGISTRATION (OPEN_SUB_CODE,STU_NO,CLASSIFICATION,REG_DATE,SCORE,LECTURE_EVAL_FLAG) values ('21270001','202101111','1',to_date('21/02/22','RR/MM/DD'),null,null);

-- 평가
Insert into EVERY.EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('21270001','201224026','1',70,90,85,30,null,90,null,to_date('21/07/22','RR/MM/DD'));
Insert into EVERY.EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('21270002','201224026','1',null,null,null,null,null,null,null,null);
Insert into EVERY.EVALUATION (SUB_CODE,STU_NO,CLASSIFICATION,MIDTERM,FINALS,ASSIGNMENT,ATTENDANCE,ETC,TOTAL_GRADE,REG_DATE,EDIT_DATE) values ('21270001','202101111','1',60,null,null,25,null,null,null,null);


-- 출석부
Insert into EVERY.ATTENDANCE (OPEN_SUB_CODE,STU_NO,CLASSIFICATION,FIRST,SECOND,THIRD,FOURTH,FIFTH,SIXTH,SEVENTH,EIGHTH,NINTH,TENTH,POINT) values ('21270001','201224026','1','출석','출석','출석',null,null,null,null,null,null,null,30);
Insert into EVERY.ATTENDANCE (OPEN_SUB_CODE,STU_NO,CLASSIFICATION,FIRST,SECOND,THIRD,FOURTH,FIFTH,SIXTH,SEVENTH,EIGHTH,NINTH,TENTH,POINT) values ('21270001','202100001','1','출석','출석','지각',null,null,null,null,null,null,null,25);
Insert into EVERY.ATTENDANCE (OPEN_SUB_CODE,STU_NO,CLASSIFICATION,FIRST,SECOND,THIRD,FOURTH,FIFTH,SIXTH,SEVENTH,EIGHTH,NINTH,TENTH,POINT) values ('21270001','202101111','1','출석','지각','출석',null,null,null,null,null,null,null,25);




--��
create or replace view professorDeptView
as
select p.*, d.dept_name, pp.position_name
from professor p join department d
on p.dept_no = d.dept_no
join prof_position pp
on p.position_no = pp.position_no;

create or replace view evaluationView
as
select s.name, s.major, trunc(s.semester/2) year, e.*
from student s join evaluation e
on s.stu_no = e.stu_no;

create or replace view attendanceView
as
select s.name, s.major, a.*
from student s join attendance a
on s.stu_no = a.stu_no;

create or replace view studentDeptView
as
(
    select s.*, d.dept_name  
    from student s join department d
    on s.dept_no = d.dept_no
);

--등록금 조회 view
create or replace view tuitionView
as
(
    select s.student_id , t.*
    from student s join tuition t
    on s.stu_no = t.stu_no
);

create or replace view scholarshipView
as
(
select sch.* , a.award_no, a.stu_no, a.awarding_date
from scholarship sch join award a
on sch.scholarship_no = a.scholarship_no
);

--쪽지 전체 조회
create or replace view chitchatView
as
select o.*, i.official_no as receiver, i.read_date, i.keep_flag
from outbox o join inbox i
on o.msg_no = i.msg_no;

create or replace view chitchatProfessor
as
select p.prof_name, p.prof_no , d.dept_name, pp.position_name
from professor p join department d
on p.dept_no = d.dept_no
join prof_position pp
on p.position_no = pp.position_no;

create or replace view chitchatEmployee
as
select e.emp_no, e.emp_name, d.dep_name, p.position_name
from employee e join emp_depart d
on e.dep_code = d.dep_code
join emp_position p
on e.position_code = p.position_code;

-- 쪽지 테스트
insert into outbox(msg_no, official_no, contents, send_date, official_name)
values(outbox_seq.nextval, '201224026', '안녕하세요 교수님', sysdate, '김영림');
insert into outbox(msg_no, official_no, contents, send_date, official_name)
values(outbox_seq.nextval, '201224026', '과제가 너무 많습니다...', sysdate, '김영림');
insert into outbox(msg_no, official_no, contents, send_date, official_name)
values(outbox_seq.nextval, 'P00001', '열심히 하게나^^', sysdate, '김교수');

commit;
