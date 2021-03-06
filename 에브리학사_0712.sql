/* ?λΆ?? */
DROP TABLE student 
	CASCADE CONSTRAINTS;

/* ?₯?κΈ? ??¬ */
DROP TABLE award 
	CASCADE CONSTRAINTS;

/* ?₯?κΈ? */
DROP TABLE scholarship 
	CASCADE CONSTRAINTS;

/* ?? ?? */
DROP TABLE student_state 
	CASCADE CONSTRAINTS;

/* μ¦λͺ?λ°κΈ */
DROP TABLE certification 
	CASCADE CONSTRAINTS;

/* ?±λ‘κΈ */
DROP TABLE tuition 
	CASCADE CONSTRAINTS;

/* κ³Όμ  */
DROP TABLE assignment 
	CASCADE CONSTRAINTS;

/* ?κ³? */
DROP TABLE department 
	CASCADE CONSTRAINTS;

/* ?λΆ? */
DROP TABLE faculty 
	CASCADE CONSTRAINTS;

/* κ΅μ */
DROP TABLE professor 
	CASCADE CONSTRAINTS;


/* κ°μ?κ°? */
DROP TABLE subj_eval 
	CASCADE CONSTRAINTS;

/* ?κ°μ μ²? */
DROP TABLE registration 
	CASCADE CONSTRAINTS;

/* ?±?  */
DROP TABLE evaluation 
	CASCADE CONSTRAINTS;

/* κ°μ€κ΅κ³Όκ³Όμ  */
DROP TABLE open_subj 
	CASCADE CONSTRAINTS;

/* κ³Όμ ?±λ‘? */
DROP TABLE distribute_assign 
	CASCADE CONSTRAINTS;

/* κ°μκ³ν */
DROP TABLE syllabus 
	CASCADE CONSTRAINTS;

/* ??½?κ°ν */
DROP TABLE regi_timetable 
	CASCADE CONSTRAINTS;

/* κ΅μμ§μ± */
DROP TABLE prof_position 
	CASCADE CONSTRAINTS;

/* κ±΄λ¬Ό */
DROP TABLE building 
	CASCADE CONSTRAINTS;

/* κ³Όλͺ© */
DROP TABLE subject 
	CASCADE CONSTRAINTS;

/* ?΄?κ΅¬λΆ */
DROP TABLE subj_type 
	CASCADE CONSTRAINTS;

/* ??¨? λ³? */
DROP TABLE footer 
	CASCADE CONSTRAINTS;

/* ??? */
DROP TABLE bank 
	CASCADE CONSTRAINTS;

/* κ³μ’? λ³? */
DROP TABLE account_info 
	CASCADE CONSTRAINTS;

/* κ΄?κ³μ ??Έ? λ³? */
DROP TABLE official_info 
	CASCADE CONSTRAINTS;

/* μͺ½μ? λ°μ ?¨ */
DROP TABLE outbox 
	CASCADE CONSTRAINTS;

/* μͺ½μ? ?? ?¨ */
DROP TABLE inbox 
	CASCADE CONSTRAINTS;

/* κ°μ?€ */
DROP TABLE classroom 
	CASCADE CONSTRAINTS;

/* κ°μ?κ°ν */
DROP TABLE subj_time 
	CASCADE CONSTRAINTS;

/* μ¦κ²¨μ°ΎκΈ° */
DROP TABLE bookmark 
	CASCADE CONSTRAINTS;

/* κΈ°λ³Έ?κ°ν */
DROP TABLE timetable 
	CASCADE CONSTRAINTS;

/* κ²μ? */
DROP TABLE board 
	CASCADE CONSTRAINTS;

/* μΉ΄νκ³ λ¦¬ */
DROP TABLE category 
	CASCADE CONSTRAINTS;

/* κΆν */
DROP TABLE authority 
	CASCADE CONSTRAINTS;

/* ?μ§μ */
DROP TABLE employee 
	CASCADE CONSTRAINTS;

/* λΆ?? */
DROP TABLE emp_depart 
	CASCADE CONSTRAINTS;

/* ?μ§μ μ§μ± */
DROP TABLE emp_position 
	CASCADE CONSTRAINTS;

/* κ²μκΈ? */
DROP TABLE post 
	CASCADE CONSTRAINTS;

/* ?κΈ? */
DROP TABLE reply 
	CASCADE CONSTRAINTS;

/* ???κΈ? */
DROP TABLE rereply 
	CASCADE CONSTRAINTS;

/* ??Ό */
DROP TABLE board_file 
	CASCADE CONSTRAINTS;

/* μ¦λͺ? μ’λ₯ */
DROP TABLE certification_type 
	CASCADE CONSTRAINTS;

/* μΆμλΆ? */
DROP TABLE attendance
	CASCADE CONSTRAINTS;


/* ?λΆ?? */
CREATE TABLE student (
	stu_no VARCHAR2(500) NOT NULL, /* ?λ²? */
	student_id VARCHAR2(500), /* ??΄? */
	pwd VARCHAR2(500), /* λΉλ?λ²νΈ */
	name VARCHAR2(500), /* ?±λͺ? */
	semester VARCHAR2(500), /* ?κΈ? */
	major VARCHAR2(500), /* ? κ³? */
	minor VARCHAR2(500), /* λΆ?? κ³? */
	admission_date DATE, /* ???Ό */
	graduation_date DATE, /* μ‘Έμ?Ό */
	credits NUMBER, /* ?΄???  */
	indentity_state CHAR(1), /* λ³ΈμΈ?Έμ¦μ? */
	indentity_code VARCHAR2(200), /* λ³ΈμΈ?Έμ¦μ½? */
	change_date DATE, /* λΉλ?λ²νΈ λ³?κ²½μΌ */
	state VARCHAR2(500), /* ?? ??λ²νΈ */
	dept_no NUMBER, /* ?κ³Όλ²?Έ */
    phonenum VARCHAR2(15) /*?΄??? ?*/
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

/* ?₯?κΈ? ??¬ */
CREATE TABLE award (
	award_no NUMBER NOT NULL, /* ?₯?κΈμ?¬λ²νΈ */
	stu_no VARCHAR2(500), /* ?λ²? */
	scholarship_no NUMBER, /* ?₯?κΈλ²?Έ */
	awarding_date DATE /* ??¬?Ό */
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

/* ?₯?κΈ? */
CREATE TABLE scholarship (
	scholarship_no NUMBER NOT NULL, /* ?₯?κΈλ²?Έ */
	scholarship_type VARCHAR2(500), /* ?₯?κΈμ’λ₯? */
	scholarship NUMBER /* ?₯?κΈ? κΈμ‘ */
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

/* ?? ?? */
CREATE TABLE student_state (
	state VARCHAR2(500) NOT NULL, /* ?? ??λ²νΈ */
	state_name VARCHAR2(500) /* ?? ???΄λ¦? */
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

/* μ¦λͺ?λ°κΈ */
CREATE TABLE certification (
	no NUMBER NOT NULL, /* λ°κΈλ²νΈ */
	certification_code NUMBER, /* μ¦λͺ?μ½λ */
	stu_no VARCHAR2(500), /* ?λ²? */
	qty NUMBER, /* ?? */
	reg_date DATE, /* λ°κΈ?Ό */
	is_print CHAR(1) /* μΆλ ₯?¬λΆ? */
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

/* ?±λ‘κΈ */
CREATE TABLE tuition (
	tuition_no NUMBER NOT NULL, /* ?±λ‘κΈλ²νΈ */
	stu_no VARCHAR2(500), /* ?λ²? */
	semester VARCHAR2(500), /* ?κΈ? */
	tuition NUMBER, /* κΈμ‘ */
	deposit_state CHAR(1), /* ?©λΆ??¬λΆ? */
	deposit_date DATE /* ?©λΆ??Ό */
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

/* κ³Όμ  */
CREATE TABLE assignment (
	assign_no NUMBER NOT NULL, /* κ³Όμ λ²νΈ */
	open_sub_code VARCHAR2(500) NOT NULL, /* κ°μ€κ΅κ³Όκ³Όλͺ©μ½λ */
	stu_no VARCHAR2(500), /* ?λ²? */
	file_name VARCHAR2(500), /* ??Ό?΄λ¦? */
	file_size NUMBER, /* ??Ό?¬?΄μ¦? */
	original_file_name VARCHAR2(500), /* ?λ³Έν?Ό?΄λ¦? */
	apply_date DATE /* ? μΆμΌ */
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

/* ?κ³? */
CREATE TABLE department (
	dept_no NUMBER NOT NULL, /* ?κ³Όλ²?Έ */
	faculty_no NUMBER, /* ?λΆ?λ²νΈ */
	dept_name VARCHAR2(500) NOT NULL, /* ?κ³Όλͺ */
	tel VARCHAR2(500), /* ?¬λ¬΄μ€? ?λ²νΈ */
	building_code VARCHAR2(500), /* κ±΄λ¬Όμ½λ */
	total_credit NUMBER /* μ‘Έμ?΄???  */
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

/* ?λΆ? */
CREATE TABLE faculty (
	faculty_no NUMBER NOT NULL, /* ?λΆ?λ²νΈ */
	faculty_name VARCHAR2(500) NOT NULL /* ?λΆ??΄λ¦? */
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

/* κ΅μ */
CREATE TABLE professor (
	prof_no VARCHAR2(500) NOT NULL, /* κ΅μλ²νΈ */
	position_no NUMBER, /* μ§μ±λ²νΈ */
	dept_no NUMBER, /* ?κ³Όλ²?Έ */
	prof_name VARCHAR2(500), /* κ΅μλͺ? */
	prof_id VARCHAR2(500), /* ??΄? */
	prof_pwd VARCHAR2(500), /* λΉλ?λ²νΈ */
    prof_ph VARCHAR2(500), /* ? ?λ²νΈ */
	prof_email VARCHAR2(500), /* ?΄λ©μΌ */
	prof_start_date DATE, /* ??©?Ό */
	prof_end_date DATE, /* ?΄μ§μΌ */
	identity_state CHAR(1), /* λ³ΈμΈ?Έμ¦μ? */
	identity_code VARCHAR2(500), /* λ³ΈμΈ?Έμ¦μ½? */
	change_date DATE /* λΉλ?λ²νΈ λ³?κ²½μΌ */
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



/* κ°μ?κ°? */
CREATE TABLE subj_eval (
	open_sub_code VARCHAR2(500) NOT NULL, /* κ°μ€κ΅κ³Όκ³Όλͺ©μ½λ */
	stu_no VARCHAR2(500) NOT NULL, /* ?λ²? */
	classification VARCHAR2(500) NOT NULL, /* ?κ°κ΅¬λΆ? */
	q1 NUMBER, /* λ¬Έν­1 */
	q2 NUMBER, /* λ¬Έν­2 */
	q3 NUMBER, /* λ¬Έν­3 */
	q4 NUMBER, /* λ¬Έν­4 */
	q5 NUMBER, /* λ¬Έν­5 */
	content CLOB /* ?κ°??΄?© */
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

/* ?κ°μ μ²? */
CREATE TABLE registration (
	open_sub_code VARCHAR2(500) NOT NULL, /* κ°μ€κ΅κ³Όκ³Όλͺ©μ½λ */
	stu_no VARCHAR2(500) NOT NULL, /* ?λ²? */
	classification VARCHAR2(500) NOT NULL, /* ?κ°κ΅¬λΆ? */
	reg_date DATE, /* ?κ°μΌ? */
	score NUMBER, /* ?±?  */
	lecture_eval_flag CHAR(1) /* κ°μ?κ°??λ£μ¬λΆ? */
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

/* ?±?  */
CREATE TABLE evaluation (
	sub_code VARCHAR2(500) NOT NULL, /* κ°μ€κ΅κ³Όκ³Όλͺ©μ½λ */
	stu_no VARCHAR2(500) NOT NULL, /* ?λ²? */
	classification VARCHAR2(500) NOT NULL, /* ?κ°κ΅¬λΆ? */
	midterm NUMBER, /* μ€κ°κ³ μ¬ */
	finals NUMBER, /* κΈ°λ§κ³ μ¬ */
	assignment NUMBER, /* κ³Όμ  */
	attendance NUMBER, /* μΆμ */
	etc NUMBER, /* κΈ°ν? */
	total_grade NUMBER, /* μ΄μ  */
	reg_date DATE, /* ?? ₯? μ§? */
	edit_date DATE /* ?? ? μ§? */
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

/* κ°μ€κ΅κ³Όκ³Όμ  */
CREATE TABLE open_subj (
	open_sub_code VARCHAR2(500) NOT NULL, /* κ°μ€κ΅κ³Όκ³Όλͺ©μ½λ */
	subj_code VARCHAR2(500), /* κ³Όλͺ©μ½λ */
	prof_no VARCHAR2(500), /* κ΅μλ²νΈ */
	open_date DATE, /* κ°μ€?Ό? */
	close_date DATE /* ?μ§??Ό? */
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

/* κ³Όμ ?±λ‘? */
CREATE TABLE distribute_assign (
	assign_no NUMBER NOT NULL, /* κ³Όμ λ²νΈ */
	open_sub_code VARCHAR2(500) NOT NULL, /* κ°μ€κ΅κ³Όκ³Όλͺ©μ½λ */
	assign_name VARCHAR2(500), /* κ³Όμ λͺ? */
	reg_date DATE /* ?±λ‘μΌ */
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

/* κ°μκ³ν */
CREATE TABLE syllabus (
	open_sub_code VARCHAR2(500) NOT NULL, /* κ°μ€κ΅κ³Όκ³Όλͺ©μ½λ */
	syllabus VARCHAR2(500), /* κ°μκ³ν? */
	theory_time NUMBER, /* ?΄λ‘ μκ°? */
	training_time NUMBER /* ?€?΅?κ°? */
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

/* ??½?κ°ν */
CREATE TABLE regi_timetable (
	open_sub_code VARCHAR2(500) NOT NULL, /* κ°μ€κ΅κ³Όκ³Όλͺ©μ½λ */
	short_name VARCHAR2(500) /* ??½λͺ? */
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

/* κ΅μμ§μ± */
CREATE TABLE prof_position (
	position_no NUMBER NOT NULL, /* μ§μ±λ²νΈ */
	position_name VARCHAR2(500) /* μ§μ±λͺ? */
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

/* κ±΄λ¬Ό */
CREATE TABLE building (
	building_code VARCHAR2(500) NOT NULL, /* κ±΄λ¬Όμ½λ */
	building_name VARCHAR2(500), /* κ±΄λ¬Όλͺ? */
	detail VARCHAR2(500) /* ??Έ?μΉ? */
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

/* κ³Όλͺ© */
CREATE TABLE subject (
	subj_code VARCHAR2(500) NOT NULL, /* κ³Όλͺ©μ½λ */
	type_code VARCHAR2(500), /* κ΅¬λΆμ½λ */
	subj_name VARCHAR2(500), /* κ³Όλͺ©λͺ? */
	explanation varchar2(4000), /* κ³Όλͺ©?€λͺ? */
	credit NUMBER, /* ?΄???  */
	personnel NUMBER /* ?Έ? */
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

/* ?΄?κ΅¬λΆ */
CREATE TABLE subj_type (
	type_code VARCHAR2(500) NOT NULL, /* κ΅¬λΆμ½λ */
	type VARCHAR2(500) /* ?΄?κ΅¬λΆ */
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

/* ??¨? λ³? */
CREATE TABLE footer (
	company_name VARCHAR2(200), /* ??¬λͺ? */
	tel VARCHAR2(200), /* ? ?λ²νΈ */
	zipcode VARCHAR2(200), /* ?°?Έλ²νΈ */
	address1 VARCHAR2(200), /* μ£Όμ1 */
	address2 VARCHAR2(200), /* μ£Όμ2 */
	policy CLOB, /* κ°μΈ? λ³΄μ²λ¦¬λ°©μΉ? */
	start_year VARCHAR2(200) /* ?€λ¦½μ°? */
);

/* ??? */
CREATE TABLE bank (
	bank_code VARCHAR2(500) NOT NULL, /* ???μ½λ */
	bank_name VARCHAR2(500) /* ???λͺ? */
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

/* κ³μ’? λ³? */
CREATE TABLE account_info (
	bank_code VARCHAR2(500) NOT NULL, /* ???μ½λ */
	official_no VARCHAR2(500), /* κ΄?κ³μλ²νΈ */
	account_no VARCHAR2(500), /* κ³μ’λ²νΈ */
	account_name VARCHAR2(500) /* ?κΈμ£Όλͺ? */
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

/* κ΄?κ³μ ??Έ? λ³? */
CREATE TABLE official_info (
	official_no NUMBER NOT NULL, /* κ΄?κ³μλ²νΈ */
	hp1 VARCHAR2(200), /* ?Έ??°1 */
	hp2 VARCHAR2(200), /* ?Έ??°2 */
	email1 VARCHAR2(200), /* ?΄λ©μΌ1 */
	email2 VARCHAR2(200), /* ?΄λ©μΌ2 */
	zipcode VARCHAR2(200), /* ?°?Έλ²νΈ */
	address VARCHAR2(200), /* μ£Όμ */
	addr_detail VARCHAR2(200), /* μ£Όμ??Έ */
	jumin VARCHAR2(200), /* μ£Όλ?Όλ²?Έ */
	gender VARCHAR2(200), /* ?±λ³? */
	image_url VARCHAR2(200) /* ?¬μ§? */
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

/* μͺ½μ? λ°μ ?¨ */
CREATE TABLE outbox (
	msg_no NUMBER NOT NULL, /* μͺ½μ?λ²νΈ */
	official_no VARCHAR2(500), /* λ°μ ?Έ λ²νΈ */
	contents CLOB, /* ?΄?© */
	send_date DATE, /* λ°μ‘?Ό */
	official_name VARCHAR2(500), /* λ°μ ?Έλͺ? */
	del_flag CHAR(1) /* ?­? ?¬λΆ? */
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

/* μͺ½μ? ?? ?¨ */
CREATE TABLE inbox (
	no NUMBER NOT NULL, /* λ²νΈ */
	msg_no NUMBER, /* μͺ½μ?λ²νΈ */
	official_no VARCHAR2(500), /* ?? ?Έλ²νΈ */
	read_date DATE, /* ?½?? ? μ§? */
	keep_flag CHAR(1) /* λ³΄κ??¬λΆ? */
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

/* κ°μ?€ */
CREATE TABLE classroom (
	classroom_code VARCHAR2(500) NOT NULL, /* κ°μ?€μ½λ */
	classroom_name VARCHAR2(500), /* κ°μ?€λͺ? */
	building_code VARCHAR2(500) /* κ±΄λ¬Όμ½λ */
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

/* κ°μ?κ°ν */
CREATE TABLE subj_time (
	lecture_time_no NUMBER NOT NULL, /* κ°μ?κ°νμ½λ */
	open_sub_code VARCHAR2(500), /* κ°μ€κ΅κ³Όκ³Όλͺ©μ½λ */
	classroom_code VARCHAR2(500), /* κ°μ?€μ½λ */
	timetable_code VARCHAR2(500) /* ?κ°κΈ°μ€?μ½λ */
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

/* μ¦κ²¨μ°ΎκΈ° */
CREATE TABLE bookmark (
	no NUMBER NOT NULL, /* λ²νΈ */
	official_no VARCHAR2(200), /* κ΄?κ³μλ²νΈ */
	name VARCHAR2(200), /* λΆλ§?¬λͺ? */
	url VARCHAR2(200) /* λΆλ§?¬μ£Όμ */
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

/* κΈ°λ³Έ?κ°ν */
CREATE TABLE timetable (
	timetable_code VARCHAR2(500) NOT NULL, /* ?κ°κΈ°μ€?μ½λ */
	timetable_name VARCHAR2(500), /* ??κ΅μλͺ? */
	day VARCHAR2(500), /* ??Ό */
	period NUMBER, /* κ΅μ */
	short_name VARCHAR2(500) /* ??½κ΅μλͺ? */
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

/* κ²μ? */
CREATE TABLE board (
	bd_code NUMBER NOT NULL, /* κ²μ?μ½λ */
	auth_code NUMBER, /* κΆνμ½λ */
	category_code NUMBER, /* μΉ΄νκ³ λ¦¬ μ½λ */
	bd_name VARCHAR2(500), /* κ²μ? ?΄λ¦? */
	reg_date DATE, /* κ²μ? ?±λ‘μΌ */
	edit_date DATE, /* κ²μ? ?? ?Ό */
	bd_order NUMBER, /* κ²μ? ?? */
	usage CHAR(1), /* ?¬?©?¬λΆ? */
	is_reply CHAR(1), /* ?κΈ??¬λΆ? */
	is_comment CHAR(1), /* ?΅κΈ??¬λΆ? */
	is_private CHAR(1), /* λΉκ³΅κ°μ¬λΆ? */
	is_upload CHAR(1), /* ?λ‘λ κ°??₯ ?¬λΆ? */
	max_upfile NUMBER, /* ?λ‘λ κ°??₯ κ°μ */
	max_filesize NUMBER /* ?λ‘λ κ°??₯ ??Ό ?¬?΄μ¦? */
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

/* μΉ΄νκ³ λ¦¬ */
CREATE TABLE category (
	category_code NUMBER NOT NULL, /* μΉ΄νκ³ λ¦¬ μ½λ */
	category_name VARCHAR2(500), /* μΉ΄νκ³ λ¦¬ λͺ? */
	usage CHAR(1), /* ?¬?©?¬λΆ? */
	reg_date DATE /* ?±λ‘μΌ */
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

/* κΆν */
CREATE TABLE authority (
	auth_code NUMBER NOT NULL, /* κΆνμ½λ */
	auth_name VARCHAR2(500), /* κΆνλͺ? */
	auth_desc VARCHAR2(500), /* ?€λͺ? */
	reg_date DATE /* ?±λ‘μΌ */
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

/* ?μ§μ */
CREATE TABLE employee (
	emp_no VARCHAR2(500) NOT NULL, /* ?μ§μλ²νΈ */
	emp_id VARCHAR2(500), /* ?μ§μ??΄? */
	emp_name VARCHAR2(500), /* ?μ§μλͺ? */
	pwd VARCHAR2(500), /* λΉλ?λ²νΈ */
	start_date DATE, /* ??¬?Ό */
	resignation_date DATE, /* ?΄?¬?Ό */
	identity_state CHAR(1), /* λ³ΈμΈ?Έμ¦μ? */
	dep_code NUMBER, /* λΆ??μ½λ */
	position_code NUMBER, /* μ§μ±μ½λ */
	auth_code NUMBER /* κΆνμ½λ */
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

/* λΆ?? */
CREATE TABLE emp_depart (
	dep_code NUMBER NOT NULL, /* λΆ??μ½λ */
	dep_name VARCHAR2(500) /* λΆ??λͺ? */
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

/* ?μ§μ μ§μ± */
CREATE TABLE emp_position (
	position_code NUMBER NOT NULL, /* μ§μ±μ½λ */
	position_name VARCHAR2(500) /* μ§μ±λͺ? */
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

/* κ²μκΈ? */
CREATE TABLE post (
	post_no NUMBER NOT NULL, /* κ²μκΈ?λ²νΈ */
	bd_code NUMBER, /* κ²μ?μ½λ */
	writer_code NUMBER, /* ??±?μ½λ */
	title VARCHAR2(500), /* ? λͺ? */
	contents CLOB, /* ?΄?© */
	reg_date DATE, /* ?±λ‘μΌ */
	read_count NUMBER, /* μ‘°ν? */
	del_flag CHAR(1), /* ?­? ?¬λΆ? */
	group_no NUMBER, /* ?λ³Έκ?λ²νΈ */
	sort_no NUMBER, /* ? ? ¬λ²νΈ */
	step NUMBER, /* μ°¨μ */
	edit_date DATE, /* ?? ?Ό */
	is_private CHAR(1) /* λΉλ?κΈ??¬λΆ? */
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

/* ?κΈ? */
CREATE TABLE reply (
	reply_no NUMBER NOT NULL, /* ?κΈ?λ²νΈ */
	writer_code NUMBER, /* ?κΈ???±? */
	post_no NUMBER, /* κ²μκΈ?λ²νΈ */
	contents CLOB, /* ?΄?© */
	reg_date DATE, /* ?±λ‘μΌ */
	del_flag CHAR(1), /* ?­? ?¬λΆ? */
	step NUMBER, /* κΈ?? ?¨κ³? */
	sort_no NUMBER, /* κΈ?? ? ? ¬?? */
	group_no NUMBER /* κ·Έλ£Ήλ²νΈ */
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

/* ???κΈ? */
CREATE TABLE rereply (
	rereply_no NUMBER NOT NULL, /* ???κΈ?λ²νΈ */
	writer_code NUMBER, /* ???κΈ???±? */
	reply_no NUMBER, /* ?κΈ?λ²νΈ */
	reg_date DATE, /* ?±λ‘μΌ */
	contents CLOB, /* ?΄?© */
	del_flag CHAR(1) /* ?­? ?¬λΆ? */
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

/* ??Ό */
CREATE TABLE board_file (
	no NUMBER NOT NULL, /* κ³ μ λ²νΈ */
	post_no NUMBER, /* κ²μκΈ?λ²νΈ */
	file_name VARCHAR2(500), /* ??Όλͺ? */
	file_size NUMBER, /* ??Ό?¬κΈ? */
	original_file_name VARCHAR2(500), /* ?λ³Έν?Όλͺ? */
	down_count NUMBER, /* ?€?΄λ‘λ? */
	upfile_date DATE /* ?λ‘λ ? μ§? */
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

/* μ¦λͺ? μ’λ₯ */
CREATE TABLE certification_type (
	certification_code NUMBER NOT NULL, /* μ¦λͺ?μ½λ */
	certification_name VARCHAR2(500) /* μ¦λͺ??΄λ¦? */
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

/* μΆμλΆ? */
CREATE TABLE attendance (
	open_sub_code VARCHAR2(500) NOT NULL, /* κ°μ€κ΅κ³Όκ³Όλͺ©μ½λ */
	stu_no VARCHAR2(500) NOT NULL, /* ?λ²? */
	classification VARCHAR2(500) NOT NULL, /* ?κ°κ΅¬λΆ? */
	first VARCHAR2(30), /* 1μ£Όμ°¨ */
	second VARCHAR2(30), /* 2μ£Όμ°¨ */
	third VARCHAR2(30), /* 3μ£Όμ°¨ */
	fourth VARCHAR2(30), /* 4μ£Όμ°¨ */
	fifth VARCHAR2(30), /* 5μ£Όμ°¨ */
	sixth VARCHAR2(30), /* 6μ£Όμ°¨ */
	seventh VARCHAR2(30), /* 7μ£Όμ°¨ */
	eighth VARCHAR2(30), /* 8μ£Όμ°¨ */
	ninth VARCHAR2(30), /* 9μ£Όμ°¨ */
	tenth VARCHAR2(30), /* 10μ£Όμ°¨ */
	point NUMBER /* μΆμ? ? */
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