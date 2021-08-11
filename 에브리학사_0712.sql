/* ?���??�� */
DROP TABLE student 
	CASCADE CONSTRAINTS;

/* ?��?���? ?��?�� */
DROP TABLE award 
	CASCADE CONSTRAINTS;

/* ?��?���? */
DROP TABLE scholarship 
	CASCADE CONSTRAINTS;

/* ?��?��?��?�� */
DROP TABLE student_state 
	CASCADE CONSTRAINTS;

/* 증명?��발급 */
DROP TABLE certification 
	CASCADE CONSTRAINTS;

/* ?��록금 */
DROP TABLE tuition 
	CASCADE CONSTRAINTS;

/* 과제 */
DROP TABLE assignment 
	CASCADE CONSTRAINTS;

/* ?���? */
DROP TABLE department 
	CASCADE CONSTRAINTS;

/* ?���? */
DROP TABLE faculty 
	CASCADE CONSTRAINTS;

/* 교수 */
DROP TABLE professor 
	CASCADE CONSTRAINTS;


/* 강의?���? */
DROP TABLE subj_eval 
	CASCADE CONSTRAINTS;

/* ?��강신�? */
DROP TABLE registration 
	CASCADE CONSTRAINTS;

/* ?��?�� */
DROP TABLE evaluation 
	CASCADE CONSTRAINTS;

/* 개설교과과정 */
DROP TABLE open_subj 
	CASCADE CONSTRAINTS;

/* 과제?���? */
DROP TABLE distribute_assign 
	CASCADE CONSTRAINTS;

/* 강의계획 */
DROP TABLE syllabus 
	CASCADE CONSTRAINTS;

/* ?��?��?��간표 */
DROP TABLE regi_timetable 
	CASCADE CONSTRAINTS;

/* 교수직책 */
DROP TABLE prof_position 
	CASCADE CONSTRAINTS;

/* 건물 */
DROP TABLE building 
	CASCADE CONSTRAINTS;

/* 과목 */
DROP TABLE subject 
	CASCADE CONSTRAINTS;

/* ?��?��구분 */
DROP TABLE subj_type 
	CASCADE CONSTRAINTS;

/* ?��?��?���? */
DROP TABLE footer 
	CASCADE CONSTRAINTS;

/* ???�� */
DROP TABLE bank 
	CASCADE CONSTRAINTS;

/* 계좌?���? */
DROP TABLE account_info 
	CASCADE CONSTRAINTS;

/* �?계자 ?��?��?���? */
DROP TABLE official_info 
	CASCADE CONSTRAINTS;

/* 쪽�? 발신?�� */
DROP TABLE outbox 
	CASCADE CONSTRAINTS;

/* 쪽�? ?��?��?�� */
DROP TABLE inbox 
	CASCADE CONSTRAINTS;

/* 강의?�� */
DROP TABLE classroom 
	CASCADE CONSTRAINTS;

/* 강의?��간표 */
DROP TABLE subj_time 
	CASCADE CONSTRAINTS;

/* 즐겨찾기 */
DROP TABLE bookmark 
	CASCADE CONSTRAINTS;

/* 기본?��간표 */
DROP TABLE timetable 
	CASCADE CONSTRAINTS;

/* 게시?�� */
DROP TABLE board 
	CASCADE CONSTRAINTS;

/* 카테고리 */
DROP TABLE category 
	CASCADE CONSTRAINTS;

/* 권한 */
DROP TABLE authority 
	CASCADE CONSTRAINTS;

/* ?��직원 */
DROP TABLE employee 
	CASCADE CONSTRAINTS;

/* �??�� */
DROP TABLE emp_depart 
	CASCADE CONSTRAINTS;

/* ?��직원 직책 */
DROP TABLE emp_position 
	CASCADE CONSTRAINTS;

/* 게시�? */
DROP TABLE post 
	CASCADE CONSTRAINTS;

/* ?���? */
DROP TABLE reply 
	CASCADE CONSTRAINTS;

/* ???���? */
DROP TABLE rereply 
	CASCADE CONSTRAINTS;

/* ?��?�� */
DROP TABLE board_file 
	CASCADE CONSTRAINTS;

/* 증명?�� 종류 */
DROP TABLE certification_type 
	CASCADE CONSTRAINTS;

/* 출석�? */
DROP TABLE attendance
	CASCADE CONSTRAINTS;


/* ?���??�� */
CREATE TABLE student (
	stu_no VARCHAR2(500) NOT NULL, /* ?���? */
	student_id VARCHAR2(500), /* ?��?��?�� */
	pwd VARCHAR2(500), /* 비�?번호 */
	name VARCHAR2(500), /* ?���? */
	semester VARCHAR2(500), /* ?���? */
	major VARCHAR2(500), /* ?���? */
	minor VARCHAR2(500), /* �??���? */
	admission_date DATE, /* ?��?��?�� */
	graduation_date DATE, /* 졸업?�� */
	credits NUMBER, /* ?��?��?��?�� */
	indentity_state CHAR(1), /* 본인?��증상?�� */
	indentity_code VARCHAR2(200), /* 본인?��증코?�� */
	change_date DATE, /* 비�?번호 �?경일 */
	state VARCHAR2(500), /* ?��?��?��?��번호 */
	dept_no NUMBER, /* ?��과번?�� */
    phonenum VARCHAR2(15) /*?��???��?��*/
);

CREATE UNIQUE INDEX PK_student
	ON student (
		stu_no ASC
	);

ALTER TABLE student
	ADD
		CONSTRAINT PK_student
		PRIMARY KEY (
			stu_no
		);

/* ?��?���? ?��?�� */
CREATE TABLE award (
	award_no NUMBER NOT NULL, /* ?��?��금수?��번호 */
	stu_no VARCHAR2(500), /* ?���? */
	scholarship_no NUMBER, /* ?��?��금번?�� */
	awarding_date DATE /* ?��?��?�� */
);

CREATE UNIQUE INDEX PK_award
	ON award (
		award_no ASC
	);

ALTER TABLE award
	ADD
		CONSTRAINT PK_award
		PRIMARY KEY (
			award_no
		);

/* ?��?���? */
CREATE TABLE scholarship (
	scholarship_no NUMBER NOT NULL, /* ?��?��금번?�� */
	scholarship_type VARCHAR2(500), /* ?��?��금종�? */
	scholarship NUMBER /* ?��?���? 금액 */
);

CREATE UNIQUE INDEX PK_scholarship
	ON scholarship (
		scholarship_no ASC
	);

ALTER TABLE scholarship
	ADD
		CONSTRAINT PK_scholarship
		PRIMARY KEY (
			scholarship_no
		);

/* ?��?��?��?�� */
CREATE TABLE student_state (
	state VARCHAR2(500) NOT NULL, /* ?��?��?��?��번호 */
	state_name VARCHAR2(500) /* ?��?��?��?��?���? */
);

CREATE UNIQUE INDEX PK_student_state
	ON student_state (
		state ASC
	);

ALTER TABLE student_state
	ADD
		CONSTRAINT PK_student_state
		PRIMARY KEY (
			state
		);

/* 증명?��발급 */
CREATE TABLE certification (
	no NUMBER NOT NULL, /* 발급번호 */
	certification_code NUMBER, /* 증명?��코드 */
	stu_no VARCHAR2(500), /* ?���? */
	qty NUMBER, /* ?��?�� */
	reg_date DATE, /* 발급?�� */
	is_print CHAR(1) /* 출력?���? */
);

CREATE UNIQUE INDEX PK_certification
	ON certification (
		no ASC
	);

ALTER TABLE certification
	ADD
		CONSTRAINT PK_certification
		PRIMARY KEY (
			no
		);

/* ?��록금 */
CREATE TABLE tuition (
	tuition_no NUMBER NOT NULL, /* ?��록금번호 */
	stu_no VARCHAR2(500), /* ?���? */
	semester VARCHAR2(500), /* ?���? */
	tuition NUMBER, /* 금액 */
	deposit_state CHAR(1), /* ?���??���? */
	deposit_date DATE /* ?���??�� */
);

CREATE UNIQUE INDEX PK_tuition
	ON tuition (
		tuition_no ASC
	);

ALTER TABLE tuition
	ADD
		CONSTRAINT PK_tuition
		PRIMARY KEY (
			tuition_no
		);

/* 과제 */
CREATE TABLE assignment (
	assign_no NUMBER NOT NULL, /* 과제번호 */
	open_sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(500), /* ?���? */
	file_name VARCHAR2(500), /* ?��?��?���? */
	file_size NUMBER, /* ?��?��?��?���? */
	original_file_name VARCHAR2(500), /* ?��본파?��?���? */
	apply_date DATE /* ?��출일 */
);

CREATE UNIQUE INDEX PK_assignment
	ON assignment (
		assign_no ASC,
		open_sub_code ASC
	);

ALTER TABLE assignment
	ADD
		CONSTRAINT PK_assignment
		PRIMARY KEY (
			assign_no,
			open_sub_code
		);

/* ?���? */
CREATE TABLE department (
	dept_no NUMBER NOT NULL, /* ?��과번?�� */
	faculty_no NUMBER, /* ?���?번호 */
	dept_name VARCHAR2(500) NOT NULL, /* ?��과명 */
	tel VARCHAR2(500), /* ?��무실?��?��번호 */
	building_code VARCHAR2(500), /* 건물코드 */
	total_credit NUMBER /* 졸업?��?��?��?�� */
);

CREATE UNIQUE INDEX PK_department
	ON department (
		dept_no ASC
	);

ALTER TABLE department
	ADD
		CONSTRAINT PK_department
		PRIMARY KEY (
			dept_no
		);

/* ?���? */
CREATE TABLE faculty (
	faculty_no NUMBER NOT NULL, /* ?���?번호 */
	faculty_name VARCHAR2(500) NOT NULL /* ?���??���? */
);

CREATE UNIQUE INDEX PK_faculty
	ON faculty (
		faculty_no ASC
	);

ALTER TABLE faculty
	ADD
		CONSTRAINT PK_faculty
		PRIMARY KEY (
			faculty_no
		);

/* 교수 */
CREATE TABLE professor (
	prof_no VARCHAR2(500) NOT NULL, /* 교수번호 */
	position_no NUMBER, /* 직책번호 */
	dept_no NUMBER, /* ?��과번?�� */
	prof_name VARCHAR2(500), /* 교수�? */
	prof_id VARCHAR2(500), /* ?��?��?�� */
	prof_pwd VARCHAR2(500), /* 비�?번호 */
    prof_ph VARCHAR2(500), /* ?��?��번호 */
	prof_email VARCHAR2(500), /* ?��메일 */
	prof_start_date DATE, /* ?��?��?�� */
	prof_end_date DATE, /* ?��직일 */
	identity_state CHAR(1), /* 본인?��증상?�� */
	identity_code VARCHAR2(500), /* 본인?��증코?�� */
	change_date DATE /* 비�?번호 �?경일 */
);

CREATE UNIQUE INDEX PK_professor
	ON professor (
		prof_no ASC
	);

ALTER TABLE professor
	ADD
		CONSTRAINT PK_professor
		PRIMARY KEY (
			prof_no
		);



/* 강의?���? */
CREATE TABLE subj_eval (
	open_sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(500) NOT NULL, /* ?���? */
	classification VARCHAR2(500) NOT NULL, /* ?��강구�? */
	q1 NUMBER, /* 문항1 */
	q2 NUMBER, /* 문항2 */
	q3 NUMBER, /* 문항3 */
	q4 NUMBER, /* 문항4 */
	q5 NUMBER, /* 문항5 */
	content CLOB /* ?���??��?�� */
);

CREATE UNIQUE INDEX PK_subj_eval
	ON subj_eval (
		open_sub_code ASC,
		stu_no ASC,
		classification ASC
	);

ALTER TABLE subj_eval
	ADD
		CONSTRAINT PK_subj_eval
		PRIMARY KEY (
			open_sub_code,
			stu_no,
			classification
		);

/* ?��강신�? */
CREATE TABLE registration (
	open_sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(500) NOT NULL, /* ?���? */
	classification VARCHAR2(500) NOT NULL, /* ?��강구�? */
	reg_date DATE, /* ?��강일?�� */
	score NUMBER, /* ?��?�� */
	lecture_eval_flag CHAR(1) /* 강의?���??��료여�? */
);

CREATE UNIQUE INDEX PK_registration
	ON registration (
		open_sub_code ASC,
		stu_no ASC,
		classification ASC
	);

ALTER TABLE registration
	ADD
		CONSTRAINT PK_registration
		PRIMARY KEY (
			open_sub_code,
			stu_no,
			classification
		);

/* ?��?�� */
CREATE TABLE evaluation (
	sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(500) NOT NULL, /* ?���? */
	classification VARCHAR2(500) NOT NULL, /* ?��강구�? */
	midterm NUMBER, /* 중간고사 */
	finals NUMBER, /* 기말고사 */
	assignment NUMBER, /* 과제 */
	attendance NUMBER, /* 출석 */
	etc NUMBER, /* 기�? */
	total_grade NUMBER, /* 총점 */
	reg_date DATE, /* ?��?��?���? */
	edit_date DATE /* ?��?��?���? */
);

CREATE UNIQUE INDEX PK_evaluation
	ON evaluation (
		sub_code ASC,
		stu_no ASC,
		classification ASC
	);

ALTER TABLE evaluation
	ADD
		CONSTRAINT PK_evaluation
		PRIMARY KEY (
			sub_code,
			stu_no,
			classification
		);

/* 개설교과과정 */
CREATE TABLE open_subj (
	open_sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	subj_code VARCHAR2(500), /* 과목코드 */
	prof_no VARCHAR2(500), /* 교수번호 */
	open_date DATE, /* 개설?��?�� */
	close_date DATE /* ?���??��?�� */
);

CREATE UNIQUE INDEX PK_open_subj
	ON open_subj (
		open_sub_code ASC
	);

ALTER TABLE open_subj
	ADD
		CONSTRAINT PK_open_subj
		PRIMARY KEY (
			open_sub_code
		);

/* 과제?���? */
CREATE TABLE distribute_assign (
	assign_no NUMBER NOT NULL, /* 과제번호 */
	open_sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	assign_name VARCHAR2(500), /* 과제�? */
	reg_date DATE /* ?��록일 */
);

CREATE UNIQUE INDEX PK_distribute_assign
	ON distribute_assign (
		assign_no ASC,
		open_sub_code ASC
	);

ALTER TABLE distribute_assign
	ADD
		CONSTRAINT PK_distribute_assign
		PRIMARY KEY (
			assign_no,
			open_sub_code
		);

/* 강의계획 */
CREATE TABLE syllabus (
	open_sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	syllabus VARCHAR2(500), /* 강의계획?�� */
	theory_time NUMBER, /* ?��론시�? */
	training_time NUMBER /* ?��?��?���? */
);

CREATE UNIQUE INDEX PK_syllabus
	ON syllabus (
		open_sub_code ASC
	);

ALTER TABLE syllabus
	ADD
		CONSTRAINT PK_syllabus
		PRIMARY KEY (
			open_sub_code
		);

/* ?��?��?��간표 */
CREATE TABLE regi_timetable (
	open_sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	short_name VARCHAR2(500) /* ?��?���? */
);

CREATE UNIQUE INDEX PK_regi_timetable
	ON regi_timetable (
		open_sub_code ASC
	);

ALTER TABLE regi_timetable
	ADD
		CONSTRAINT PK_regi_timetable
		PRIMARY KEY (
			open_sub_code
		);

/* 교수직책 */
CREATE TABLE prof_position (
	position_no NUMBER NOT NULL, /* 직책번호 */
	position_name VARCHAR2(500) /* 직책�? */
);

CREATE UNIQUE INDEX PK_prof_position
	ON prof_position (
		position_no ASC
	);

ALTER TABLE prof_position
	ADD
		CONSTRAINT PK_prof_position
		PRIMARY KEY (
			position_no
		);

/* 건물 */
CREATE TABLE building (
	building_code VARCHAR2(500) NOT NULL, /* 건물코드 */
	building_name VARCHAR2(500), /* 건물�? */
	detail VARCHAR2(500) /* ?��?��?���? */
);

CREATE UNIQUE INDEX PK_building
	ON building (
		building_code ASC
	);

ALTER TABLE building
	ADD
		CONSTRAINT PK_building
		PRIMARY KEY (
			building_code
		);

/* 과목 */
CREATE TABLE subject (
	subj_code VARCHAR2(500) NOT NULL, /* 과목코드 */
	type_code VARCHAR2(500), /* 구분코드 */
	subj_name VARCHAR2(500), /* 과목�? */
	explanation varchar2(4000), /* 과목?���? */
	credit NUMBER, /* ?��?��?��?�� */
	personnel NUMBER /* ?��?�� */
);

CREATE UNIQUE INDEX PK_subject
	ON subject (
		subj_code ASC
	);

ALTER TABLE subject
	ADD
		CONSTRAINT PK_subject
		PRIMARY KEY (
			subj_code
		);

/* ?��?��구분 */
CREATE TABLE subj_type (
	type_code VARCHAR2(500) NOT NULL, /* 구분코드 */
	type VARCHAR2(500) /* ?��?��구분 */
);

CREATE UNIQUE INDEX PK_subj_type
	ON subj_type (
		type_code ASC
	);

ALTER TABLE subj_type
	ADD
		CONSTRAINT PK_subj_type
		PRIMARY KEY (
			type_code
		);

/* ?��?��?���? */
CREATE TABLE footer (
	company_name VARCHAR2(200), /* ?��?���? */
	tel VARCHAR2(200), /* ?��?��번호 */
	zipcode VARCHAR2(200), /* ?��?��번호 */
	address1 VARCHAR2(200), /* 주소1 */
	address2 VARCHAR2(200), /* 주소2 */
	policy CLOB, /* 개인?��보처리방�? */
	start_year VARCHAR2(200) /* ?��립연?�� */
);

/* ???�� */
CREATE TABLE bank (
	bank_code VARCHAR2(500) NOT NULL, /* ???��코드 */
	bank_name VARCHAR2(500) /* ???���? */
);

CREATE UNIQUE INDEX PK_bank
	ON bank (
		bank_code ASC
	);

ALTER TABLE bank
	ADD
		CONSTRAINT PK_bank
		PRIMARY KEY (
			bank_code
		);

/* 계좌?���? */
CREATE TABLE account_info (
	bank_code VARCHAR2(500) NOT NULL, /* ???��코드 */
	official_no VARCHAR2(500), /* �?계자번호 */
	account_no VARCHAR2(500), /* 계좌번호 */
	account_name VARCHAR2(500) /* ?��금주�? */
);

CREATE UNIQUE INDEX PK_account_info
	ON account_info (
		bank_code ASC
	);

ALTER TABLE account_info
	ADD
		CONSTRAINT PK_account_info
		PRIMARY KEY (
			bank_code
		);

/* �?계자 ?��?��?���? */
CREATE TABLE official_info (
	official_no NUMBER NOT NULL, /* �?계자번호 */
	hp1 VARCHAR2(200), /* ?��?��?��1 */
	hp2 VARCHAR2(200), /* ?��?��?��2 */
	email1 VARCHAR2(200), /* ?��메일1 */
	email2 VARCHAR2(200), /* ?��메일2 */
	zipcode VARCHAR2(200), /* ?��?��번호 */
	address VARCHAR2(200), /* 주소 */
	addr_detail VARCHAR2(200), /* 주소?��?�� */
	jumin VARCHAR2(200), /* 주�?�번?�� */
	gender VARCHAR2(200), /* ?���? */
	image_url VARCHAR2(200) /* ?���? */
);

CREATE UNIQUE INDEX PK_official_info
	ON official_info (
		official_no ASC
	);

ALTER TABLE official_info
	ADD
		CONSTRAINT PK_official_info
		PRIMARY KEY (
			official_no
		);

/* 쪽�? 발신?�� */
CREATE TABLE outbox (
	msg_no NUMBER NOT NULL, /* 쪽�?번호 */
	official_no VARCHAR2(500), /* 발신?�� 번호 */
	contents CLOB, /* ?��?�� */
	send_date DATE, /* 발송?�� */
	official_name VARCHAR2(500), /* 발신?���? */
	del_flag CHAR(1) /* ?��?��?���? */
);

CREATE UNIQUE INDEX PK_outbox
	ON outbox (
		msg_no ASC
	);

ALTER TABLE outbox
	ADD
		CONSTRAINT PK_outbox
		PRIMARY KEY (
			msg_no
		);

/* 쪽�? ?��?��?�� */
CREATE TABLE inbox (
	no NUMBER NOT NULL, /* 번호 */
	msg_no NUMBER, /* 쪽�?번호 */
	official_no VARCHAR2(500), /* ?��?��?��번호 */
	read_date DATE, /* ?��?? ?���? */
	keep_flag CHAR(1) /* 보�??���? */
);

CREATE UNIQUE INDEX PK_inbox
	ON inbox (
		no ASC
	);

ALTER TABLE inbox
	ADD
		CONSTRAINT PK_inbox
		PRIMARY KEY (
			no
		);

/* 강의?�� */
CREATE TABLE classroom (
	classroom_code VARCHAR2(500) NOT NULL, /* 강의?��코드 */
	classroom_name VARCHAR2(500), /* 강의?���? */
	building_code VARCHAR2(500) /* 건물코드 */
);

CREATE UNIQUE INDEX PK_classroom
	ON classroom (
		classroom_code ASC
	);

ALTER TABLE classroom
	ADD
		CONSTRAINT PK_classroom
		PRIMARY KEY (
			classroom_code
		);

/* 강의?��간표 */
CREATE TABLE subj_time (
	lecture_time_no NUMBER NOT NULL, /* 강의?��간표코드 */
	open_sub_code VARCHAR2(500), /* 개설교과과목코드 */
	classroom_code VARCHAR2(500), /* 강의?��코드 */
	timetable_code VARCHAR2(500) /* ?��간기�?코드 */
);

CREATE UNIQUE INDEX PK_subj_time
	ON subj_time (
		lecture_time_no ASC
	);

ALTER TABLE subj_time
	ADD
		CONSTRAINT PK_subj_time
		PRIMARY KEY (
			lecture_time_no
		);

/* 즐겨찾기 */
CREATE TABLE bookmark (
	no NUMBER NOT NULL, /* 번호 */
	official_no VARCHAR2(200), /* �?계자번호 */
	name VARCHAR2(200), /* 북마?���? */
	url VARCHAR2(200) /* 북마?��주소 */
);

CREATE UNIQUE INDEX PK_bookmark
	ON bookmark (
		no ASC
	);

ALTER TABLE bookmark
	ADD
		CONSTRAINT PK_bookmark
		PRIMARY KEY (
			no
		);

/* 기본?��간표 */
CREATE TABLE timetable (
	timetable_code VARCHAR2(500) NOT NULL, /* ?��간기�?코드 */
	timetable_name VARCHAR2(500), /* ?��?��교시�? */
	day VARCHAR2(500), /* ?��?�� */
	period NUMBER, /* 교시 */
	short_name VARCHAR2(500) /* ?��?��교시�? */
);

CREATE UNIQUE INDEX PK_timetable
	ON timetable (
		timetable_code ASC
	);

ALTER TABLE timetable
	ADD
		CONSTRAINT PK_timetable
		PRIMARY KEY (
			timetable_code
		);

/* 게시?�� */
CREATE TABLE board (
	bd_code NUMBER NOT NULL, /* 게시?��코드 */
	auth_code NUMBER, /* 권한코드 */
	category_code NUMBER, /* 카테고리 코드 */
	bd_name VARCHAR2(500), /* 게시?�� ?���? */
	reg_date DATE, /* 게시?�� ?��록일 */
	edit_date DATE, /* 게시?�� ?��?��?�� */
	bd_order NUMBER, /* 게시?�� ?��?�� */
	usage CHAR(1), /* ?��?��?���? */
	is_reply CHAR(1), /* ?���??���? */
	is_comment CHAR(1), /* ?���??���? */
	is_private CHAR(1), /* 비공개여�? */
	is_upload CHAR(1), /* ?��로드 �??�� ?���? */
	max_upfile NUMBER, /* ?��로드 �??�� 개수 */
	max_filesize NUMBER /* ?��로드 �??�� ?��?�� ?��?���? */
);

CREATE UNIQUE INDEX PK_board
	ON board (
		bd_code ASC
	);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			bd_code
		);

/* 카테고리 */
CREATE TABLE category (
	category_code NUMBER NOT NULL, /* 카테고리 코드 */
	category_name VARCHAR2(500), /* 카테고리 �? */
	usage CHAR(1), /* ?��?��?���? */
	reg_date DATE /* ?��록일 */
);

CREATE UNIQUE INDEX PK_category
	ON category (
		category_code ASC
	);

ALTER TABLE category
	ADD
		CONSTRAINT PK_category
		PRIMARY KEY (
			category_code
		);

/* 권한 */
CREATE TABLE authority (
	auth_code NUMBER NOT NULL, /* 권한코드 */
	auth_name VARCHAR2(500), /* 권한�? */
	auth_desc VARCHAR2(500), /* ?���? */
	reg_date DATE /* ?��록일 */
);

CREATE UNIQUE INDEX PK_authority
	ON authority (
		auth_code ASC
	);

ALTER TABLE authority
	ADD
		CONSTRAINT PK_authority
		PRIMARY KEY (
			auth_code
		);

/* ?��직원 */
CREATE TABLE employee (
	emp_no VARCHAR2(500) NOT NULL, /* ?��직원번호 */
	emp_id VARCHAR2(500), /* ?��직원?��?��?�� */
	emp_name VARCHAR2(500), /* ?��직원�? */
	pwd VARCHAR2(500), /* 비�?번호 */
	start_date DATE, /* ?��?��?�� */
	resignation_date DATE, /* ?��?��?�� */
	identity_state CHAR(1), /* 본인?��증상?�� */
	dep_code NUMBER, /* �??��코드 */
	position_code NUMBER, /* 직책코드 */
	auth_code NUMBER /* 권한코드 */
);

CREATE UNIQUE INDEX PK_employee
	ON employee (
		emp_no ASC
	);

ALTER TABLE employee
	ADD
		CONSTRAINT PK_employee
		PRIMARY KEY (
			emp_no
		);

/* �??�� */
CREATE TABLE emp_depart (
	dep_code NUMBER NOT NULL, /* �??��코드 */
	dep_name VARCHAR2(500) /* �??���? */
);

CREATE UNIQUE INDEX PK_emp_depart
	ON emp_depart (
		dep_code ASC
	);

ALTER TABLE emp_depart
	ADD
		CONSTRAINT PK_emp_depart
		PRIMARY KEY (
			dep_code
		);

/* ?��직원 직책 */
CREATE TABLE emp_position (
	position_code NUMBER NOT NULL, /* 직책코드 */
	position_name VARCHAR2(500) /* 직책�? */
);

CREATE UNIQUE INDEX PK_emp_position
	ON emp_position (
		position_code ASC
	);

ALTER TABLE emp_position
	ADD
		CONSTRAINT PK_emp_position
		PRIMARY KEY (
			position_code
		);

/* 게시�? */
CREATE TABLE post (
	post_no NUMBER NOT NULL, /* 게시�?번호 */
	bd_code NUMBER, /* 게시?��코드 */
	writer_code NUMBER, /* ?��?��?��코드 */
	title VARCHAR2(500), /* ?���? */
	contents CLOB, /* ?��?�� */
	reg_date DATE, /* ?��록일 */
	read_count NUMBER, /* 조회?�� */
	del_flag CHAR(1), /* ?��?��?���? */
	group_no NUMBER, /* ?��본�?번호 */
	sort_no NUMBER, /* ?��?��번호 */
	step NUMBER, /* 차수 */
	edit_date DATE, /* ?��?��?�� */
	is_private CHAR(1) /* 비�?�??���? */
);

CREATE UNIQUE INDEX PK_post
	ON post (
		post_no ASC
	);

ALTER TABLE post
	ADD
		CONSTRAINT PK_post
		PRIMARY KEY (
			post_no
		);

/* ?���? */
CREATE TABLE reply (
	reply_no NUMBER NOT NULL, /* ?���?번호 */
	writer_code NUMBER, /* ?���??��?��?�� */
	post_no NUMBER, /* 게시�?번호 */
	contents CLOB, /* ?��?�� */
	reg_date DATE, /* ?��록일 */
	del_flag CHAR(1), /* ?��?��?���? */
	step NUMBER, /* �??�� ?���? */
	sort_no NUMBER, /* �??�� ?��?��?��?�� */
	group_no NUMBER /* 그룹번호 */
);

CREATE UNIQUE INDEX PK_reply
	ON reply (
		reply_no ASC
	);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			reply_no
		);

/* ???���? */
CREATE TABLE rereply (
	rereply_no NUMBER NOT NULL, /* ???���?번호 */
	writer_code NUMBER, /* ???���??��?��?�� */
	reply_no NUMBER, /* ?���?번호 */
	reg_date DATE, /* ?��록일 */
	contents CLOB, /* ?��?�� */
	del_flag CHAR(1) /* ?��?��?���? */
);

CREATE UNIQUE INDEX PK_rereply
	ON rereply (
		rereply_no ASC
	);

ALTER TABLE rereply
	ADD
		CONSTRAINT PK_rereply
		PRIMARY KEY (
			rereply_no
		);

/* ?��?�� */
CREATE TABLE board_file (
	no NUMBER NOT NULL, /* 고유번호 */
	post_no NUMBER, /* 게시�?번호 */
	file_name VARCHAR2(500), /* ?��?���? */
	file_size NUMBER, /* ?��?��?���? */
	original_file_name VARCHAR2(500), /* ?��본파?���? */
	down_count NUMBER, /* ?��?��로드?�� */
	upfile_date DATE /* ?��로드 ?���? */
);

CREATE UNIQUE INDEX PK_board_file
	ON board_file (
		no ASC
	);

ALTER TABLE board_file
	ADD
		CONSTRAINT PK_board_file
		PRIMARY KEY (
			no
		);

/* 증명?�� 종류 */
CREATE TABLE certification_type (
	certification_code NUMBER NOT NULL, /* 증명?��코드 */
	certification_name VARCHAR2(500) /* 증명?��?���? */
);

CREATE UNIQUE INDEX PK_certification_type
	ON certification_type (
		certification_code ASC
	);

ALTER TABLE certification_type
	ADD
		CONSTRAINT PK_certification_type
		PRIMARY KEY (
			certification_code
		);

/* 출석�? */
CREATE TABLE attendance (
	open_sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(500) NOT NULL, /* ?���? */
	classification VARCHAR2(500) NOT NULL, /* ?��강구�? */
	first VARCHAR2(30), /* 1주차 */
	second VARCHAR2(30), /* 2주차 */
	third VARCHAR2(30), /* 3주차 */
	fourth VARCHAR2(30), /* 4주차 */
	fifth VARCHAR2(30), /* 5주차 */
	sixth VARCHAR2(30), /* 6주차 */
	seventh VARCHAR2(30), /* 7주차 */
	eighth VARCHAR2(30), /* 8주차 */
	ninth VARCHAR2(30), /* 9주차 */
	tenth VARCHAR2(30), /* 10주차 */
	point NUMBER /* 출석?��?�� */
);

CREATE UNIQUE INDEX PK_attendance
	ON attendance (
		open_sub_code ASC,
		stu_no ASC,
		classification ASC
	);

ALTER TABLE attendance
	ADD
		CONSTRAINT PK_attendance
		PRIMARY KEY (
			open_sub_code,
			stu_no,
			classification
		);

ALTER TABLE student
	ADD
		CONSTRAINT FK_student_state_TO_student
		FOREIGN KEY (
			state
		)
		REFERENCES student_state (
			state
		);

ALTER TABLE student
	ADD
		CONSTRAINT FK_department_TO_student
		FOREIGN KEY (
			dept_no
		)
		REFERENCES department (
			dept_no
		);

ALTER TABLE award
	ADD
		CONSTRAINT FK_student_TO_award
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE award
	ADD
		CONSTRAINT FK_scholarship_TO_award
		FOREIGN KEY (
			scholarship_no
		)
		REFERENCES scholarship (
			scholarship_no
		);

ALTER TABLE certification
	ADD
		CONSTRAINT FK_certification
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE certification
	ADD
		CONSTRAINT FK_type_TO_certification
		FOREIGN KEY (
			certification_code
		)
		REFERENCES certification_type (
			certification_code
		);

ALTER TABLE tuition
	ADD
		CONSTRAINT FK_tuition
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE assignment
	ADD
		CONSTRAINT FK_assignment
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE assignment
	ADD
		CONSTRAINT FK_assign_TO_assignment
		FOREIGN KEY (
			assign_no,
			open_sub_code
		)
		REFERENCES distribute_assign (
			assign_no,
			open_sub_code
		);

ALTER TABLE department
	ADD
		CONSTRAINT FK_faculty_TO_department
		FOREIGN KEY (
			faculty_no
		)
		REFERENCES faculty (
			faculty_no
		);

ALTER TABLE department
	ADD
		CONSTRAINT FK_building_TO_department
		FOREIGN KEY (
			building_code
		)
		REFERENCES building (
			building_code
		);

ALTER TABLE professor
	ADD
		CONSTRAINT FK_department_TO_professor
		FOREIGN KEY (
			dept_no
		)
		REFERENCES department (
			dept_no
		);

ALTER TABLE professor
	ADD
		CONSTRAINT FK_prof_position_TO_professor
		FOREIGN KEY (
			position_no
		)
		REFERENCES prof_position (
			position_no
		);

ALTER TABLE subj_eval
	ADD
		CONSTRAINT FK_registration_TO_subj_eval
		FOREIGN KEY (
			open_sub_code,
			stu_no,
			classification
		)
		REFERENCES registration (
			open_sub_code,
			stu_no,
			classification
		);

ALTER TABLE registration
	ADD
		CONSTRAINT FK_open_subj_TO_registration
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
		);

ALTER TABLE registration
	ADD
		CONSTRAINT FK_student_TO_registration
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE evaluation
	ADD
		CONSTRAINT FK_registration_TO_evaluation
		FOREIGN KEY (
			sub_code,
			stu_no,
			classification
		)
		REFERENCES registration (
			open_sub_code,
			stu_no,
			classification
		);
ALTER TABLE attendance
	ADD
		CONSTRAINT FK_registration_TO_attendance
		FOREIGN KEY (
			open_sub_code,
			stu_no,
			classification
		)
		REFERENCES registration (
			open_sub_code,
			stu_no,
			classification
		);
        
ALTER TABLE open_subj
	ADD
		CONSTRAINT FK_professor_TO_open_subj
		FOREIGN KEY (
			prof_no
		)
		REFERENCES professor (
			prof_no
		);

ALTER TABLE open_subj
	ADD
		CONSTRAINT FK_subject_TO_open_subj
		FOREIGN KEY (
			subj_code
		)
		REFERENCES subject (
			subj_code
		);

ALTER TABLE distribute_assign
	ADD
		CONSTRAINT FK_distribute_assign
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
		);

ALTER TABLE syllabus
	ADD
		CONSTRAINT FK_open_subj_TO_syllabus
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
		);

ALTER TABLE regi_timetable
	ADD
		CONSTRAINT FK_open_subj_TO_regi_timetable
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
		);

ALTER TABLE subject
	ADD
		CONSTRAINT FK_professor_TO_subject
		FOREIGN KEY (
			prof_no
		)
		REFERENCES professor (
			prof_no
		);

ALTER TABLE subject
	ADD
		CONSTRAINT FK_subj_type_TO_subject
		FOREIGN KEY (
			type_code
		)
		REFERENCES subj_type (
			type_code
		);

ALTER TABLE account_info
	ADD
		CONSTRAINT FK_bank_TO_account_info
		FOREIGN KEY (
			bank_code
		)
		REFERENCES bank (
			bank_code
		);

ALTER TABLE inbox
	ADD
		CONSTRAINT FK_outbox_TO_inbox
		FOREIGN KEY (
			msg_no
		)
		REFERENCES outbox (
			msg_no
		);

ALTER TABLE classroom
	ADD
		CONSTRAINT FK_building_TO_classroom
		FOREIGN KEY (
			building_code
		)
		REFERENCES building (
			building_code
		);

ALTER TABLE subj_time
	ADD
		CONSTRAINT FK_classroom_TO_subj_time
		FOREIGN KEY (
			classroom_code
		)
		REFERENCES classroom (
			classroom_code
		);

ALTER TABLE subj_time
	ADD
		CONSTRAINT FK_timetable_TO_subj_time
		FOREIGN KEY (
			timetable_code
		)
		REFERENCES timetable (
			timetable_code
		);

ALTER TABLE subj_time
	ADD
		CONSTRAINT FK_open_subj_TO_subj_time
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_category_TO_board
		FOREIGN KEY (
			category_code
		)
		REFERENCES category (
			category_code
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_authority_TO_board
		FOREIGN KEY (
			auth_code
		)
		REFERENCES authority (
			auth_code
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_authority_TO_employee
		FOREIGN KEY (
			auth_code
		)
		REFERENCES authority (
			auth_code
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_emp_depart_TO_employee
		FOREIGN KEY (
			dep_code
		)
		REFERENCES emp_depart (
			dep_code
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_emp_position_TO_employee
		FOREIGN KEY (
			position_code
		)
		REFERENCES emp_position (
			position_code
		);

ALTER TABLE post
	ADD
		CONSTRAINT FK_board_TO_post
		FOREIGN KEY (
			bd_code
		)
		REFERENCES board (
			bd_code
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_post_TO_reply
		FOREIGN KEY (
			post_no
		)
		REFERENCES post (
			post_no
		);

ALTER TABLE rereply
	ADD
		CONSTRAINT FK_reply_TO_rereply
		FOREIGN KEY (
			reply_no
		)
		REFERENCES reply (
			reply_no
		);

ALTER TABLE board_file
	ADD
		CONSTRAINT FK_post_TO_board_file
		FOREIGN KEY (
			post_no
		)
		REFERENCES post (
			post_no
		);