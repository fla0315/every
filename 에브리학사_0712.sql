/* ?•™ë¶??ƒ */
DROP TABLE student 
	CASCADE CONSTRAINTS;

/* ?¥?•™ê¸? ?ˆ˜?—¬ */
DROP TABLE award 
	CASCADE CONSTRAINTS;

/* ?¥?•™ê¸? */
DROP TABLE scholarship 
	CASCADE CONSTRAINTS;

/* ?•™? ?ƒ?ƒœ */
DROP TABLE student_state 
	CASCADE CONSTRAINTS;

/* ì¦ëª…?„œë°œê¸‰ */
DROP TABLE certification 
	CASCADE CONSTRAINTS;

/* ?“±ë¡ê¸ˆ */
DROP TABLE tuition 
	CASCADE CONSTRAINTS;

/* ê³¼ì œ */
DROP TABLE assignment 
	CASCADE CONSTRAINTS;

/* ?•™ê³? */
DROP TABLE department 
	CASCADE CONSTRAINTS;

/* ?•™ë¶? */
DROP TABLE faculty 
	CASCADE CONSTRAINTS;

/* êµìˆ˜ */
DROP TABLE professor 
	CASCADE CONSTRAINTS;


/* ê°•ì˜?‰ê°? */
DROP TABLE subj_eval 
	CASCADE CONSTRAINTS;

/* ?ˆ˜ê°•ì‹ ì²? */
DROP TABLE registration 
	CASCADE CONSTRAINTS;

/* ?„±?  */
DROP TABLE evaluation 
	CASCADE CONSTRAINTS;

/* ê°œì„¤êµê³¼ê³¼ì • */
DROP TABLE open_subj 
	CASCADE CONSTRAINTS;

/* ê³¼ì œ?“±ë¡? */
DROP TABLE distribute_assign 
	CASCADE CONSTRAINTS;

/* ê°•ì˜ê³„íš */
DROP TABLE syllabus 
	CASCADE CONSTRAINTS;

/* ?š”?•½?‹œê°„í‘œ */
DROP TABLE regi_timetable 
	CASCADE CONSTRAINTS;

/* êµìˆ˜ì§ì±… */
DROP TABLE prof_position 
	CASCADE CONSTRAINTS;

/* ê±´ë¬¼ */
DROP TABLE building 
	CASCADE CONSTRAINTS;

/* ê³¼ëª© */
DROP TABLE subject 
	CASCADE CONSTRAINTS;

/* ?´?ˆ˜êµ¬ë¶„ */
DROP TABLE subj_type 
	CASCADE CONSTRAINTS;

/* ?•˜?‹¨? •ë³? */
DROP TABLE footer 
	CASCADE CONSTRAINTS;

/* ???–‰ */
DROP TABLE bank 
	CASCADE CONSTRAINTS;

/* ê³„ì¢Œ? •ë³? */
DROP TABLE account_info 
	CASCADE CONSTRAINTS;

/* ê´?ê³„ì ?ƒ?„¸? •ë³? */
DROP TABLE official_info 
	CASCADE CONSTRAINTS;

/* ìª½ì? ë°œì‹ ?•¨ */
DROP TABLE outbox 
	CASCADE CONSTRAINTS;

/* ìª½ì? ?ˆ˜?‹ ?•¨ */
DROP TABLE inbox 
	CASCADE CONSTRAINTS;

/* ê°•ì˜?‹¤ */
DROP TABLE classroom 
	CASCADE CONSTRAINTS;

/* ê°•ì˜?‹œê°„í‘œ */
DROP TABLE subj_time 
	CASCADE CONSTRAINTS;

/* ì¦ê²¨ì°¾ê¸° */
DROP TABLE bookmark 
	CASCADE CONSTRAINTS;

/* ê¸°ë³¸?‹œê°„í‘œ */
DROP TABLE timetable 
	CASCADE CONSTRAINTS;

/* ê²Œì‹œ?Œ */
DROP TABLE board 
	CASCADE CONSTRAINTS;

/* ì¹´í…Œê³ ë¦¬ */
DROP TABLE category 
	CASCADE CONSTRAINTS;

/* ê¶Œí•œ */
DROP TABLE authority 
	CASCADE CONSTRAINTS;

/* ?„ì§ì› */
DROP TABLE employee 
	CASCADE CONSTRAINTS;

/* ë¶??„œ */
DROP TABLE emp_depart 
	CASCADE CONSTRAINTS;

/* ?„ì§ì› ì§ì±… */
DROP TABLE emp_position 
	CASCADE CONSTRAINTS;

/* ê²Œì‹œê¸? */
DROP TABLE post 
	CASCADE CONSTRAINTS;

/* ?Œ“ê¸? */
DROP TABLE reply 
	CASCADE CONSTRAINTS;

/* ???Œ“ê¸? */
DROP TABLE rereply 
	CASCADE CONSTRAINTS;

/* ?ŒŒ?¼ */
DROP TABLE board_file 
	CASCADE CONSTRAINTS;

/* ì¦ëª…?„œ ì¢…ë¥˜ */
DROP TABLE certification_type 
	CASCADE CONSTRAINTS;

/* ì¶œì„ë¶? */
DROP TABLE attendance
	CASCADE CONSTRAINTS;


/* ?•™ë¶??ƒ */
CREATE TABLE student (
	stu_no VARCHAR2(500) NOT NULL, /* ?•™ë²? */
	student_id VARCHAR2(500), /* ?•„?´?”” */
	pwd VARCHAR2(500), /* ë¹„ë?ë²ˆí˜¸ */
	name VARCHAR2(500), /* ?„±ëª? */
	semester VARCHAR2(500), /* ?•™ê¸? */
	major VARCHAR2(500), /* ? „ê³? */
	minor VARCHAR2(500), /* ë¶?? „ê³? */
	admission_date DATE, /* ?…?•™?¼ */
	graduation_date DATE, /* ì¡¸ì—…?¼ */
	credits NUMBER, /* ?´?ˆ˜?•™?  */
	indentity_state CHAR(1), /* ë³¸ì¸?¸ì¦ìƒ?ƒœ */
	indentity_code VARCHAR2(200), /* ë³¸ì¸?¸ì¦ì½”?“œ */
	change_date DATE, /* ë¹„ë?ë²ˆí˜¸ ë³?ê²½ì¼ */
	state VARCHAR2(500), /* ?•™? ?ƒ?ƒœë²ˆí˜¸ */
	dept_no NUMBER, /* ?•™ê³¼ë²ˆ?˜¸ */
    phonenum VARCHAR2(15) /*?œ´??? „?™”*/
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

/* ?¥?•™ê¸? ?ˆ˜?—¬ */
CREATE TABLE award (
	award_no NUMBER NOT NULL, /* ?¥?•™ê¸ˆìˆ˜?—¬ë²ˆí˜¸ */
	stu_no VARCHAR2(500), /* ?•™ë²? */
	scholarship_no NUMBER, /* ?¥?•™ê¸ˆë²ˆ?˜¸ */
	awarding_date DATE /* ?ˆ˜?—¬?¼ */
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

/* ?¥?•™ê¸? */
CREATE TABLE scholarship (
	scholarship_no NUMBER NOT NULL, /* ?¥?•™ê¸ˆë²ˆ?˜¸ */
	scholarship_type VARCHAR2(500), /* ?¥?•™ê¸ˆì¢…ë¥? */
	scholarship NUMBER /* ?¥?•™ê¸? ê¸ˆì•¡ */
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

/* ?•™? ?ƒ?ƒœ */
CREATE TABLE student_state (
	state VARCHAR2(500) NOT NULL, /* ?•™? ?ƒ?ƒœë²ˆí˜¸ */
	state_name VARCHAR2(500) /* ?•™? ?ƒ?ƒœ?´ë¦? */
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

/* ì¦ëª…?„œë°œê¸‰ */
CREATE TABLE certification (
	no NUMBER NOT NULL, /* ë°œê¸‰ë²ˆí˜¸ */
	certification_code NUMBER, /* ì¦ëª…?„œì½”ë“œ */
	stu_no VARCHAR2(500), /* ?•™ë²? */
	qty NUMBER, /* ?ˆ˜?Ÿ‰ */
	reg_date DATE, /* ë°œê¸‰?¼ */
	is_print CHAR(1) /* ì¶œë ¥?—¬ë¶? */
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

/* ?“±ë¡ê¸ˆ */
CREATE TABLE tuition (
	tuition_no NUMBER NOT NULL, /* ?“±ë¡ê¸ˆë²ˆí˜¸ */
	stu_no VARCHAR2(500), /* ?•™ë²? */
	semester VARCHAR2(500), /* ?•™ê¸? */
	tuition NUMBER, /* ê¸ˆì•¡ */
	deposit_state CHAR(1), /* ?‚©ë¶??—¬ë¶? */
	deposit_date DATE /* ?‚©ë¶??¼ */
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

/* ê³¼ì œ */
CREATE TABLE assignment (
	assign_no NUMBER NOT NULL, /* ê³¼ì œë²ˆí˜¸ */
	open_sub_code VARCHAR2(500) NOT NULL, /* ê°œì„¤êµê³¼ê³¼ëª©ì½”ë“œ */
	stu_no VARCHAR2(500), /* ?•™ë²? */
	file_name VARCHAR2(500), /* ?ŒŒ?¼?´ë¦? */
	file_size NUMBER, /* ?ŒŒ?¼?‚¬?´ì¦? */
	original_file_name VARCHAR2(500), /* ?›ë³¸íŒŒ?¼?´ë¦? */
	apply_date DATE /* ? œì¶œì¼ */
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

/* ?•™ê³? */
CREATE TABLE department (
	dept_no NUMBER NOT NULL, /* ?•™ê³¼ë²ˆ?˜¸ */
	faculty_no NUMBER, /* ?•™ë¶?ë²ˆí˜¸ */
	dept_name VARCHAR2(500) NOT NULL, /* ?•™ê³¼ëª… */
	tel VARCHAR2(500), /* ?‚¬ë¬´ì‹¤? „?™”ë²ˆí˜¸ */
	building_code VARCHAR2(500), /* ê±´ë¬¼ì½”ë“œ */
	total_credit NUMBER /* ì¡¸ì—…?´?ˆ˜?•™?  */
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

/* ?•™ë¶? */
CREATE TABLE faculty (
	faculty_no NUMBER NOT NULL, /* ?•™ë¶?ë²ˆí˜¸ */
	faculty_name VARCHAR2(500) NOT NULL /* ?•™ë¶??´ë¦? */
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

/* êµìˆ˜ */
CREATE TABLE professor (
	prof_no VARCHAR2(500) NOT NULL, /* êµìˆ˜ë²ˆí˜¸ */
	position_no NUMBER, /* ì§ì±…ë²ˆí˜¸ */
	dept_no NUMBER, /* ?•™ê³¼ë²ˆ?˜¸ */
	prof_name VARCHAR2(500), /* êµìˆ˜ëª? */
	prof_id VARCHAR2(500), /* ?•„?´?”” */
	prof_pwd VARCHAR2(500), /* ë¹„ë?ë²ˆí˜¸ */
    prof_ph VARCHAR2(500), /* ? „?™”ë²ˆí˜¸ */
	prof_email VARCHAR2(500), /* ?´ë©”ì¼ */
	prof_start_date DATE, /* ?„?š©?¼ */
	prof_end_date DATE, /* ?‡´ì§ì¼ */
	identity_state CHAR(1), /* ë³¸ì¸?¸ì¦ìƒ?ƒœ */
	identity_code VARCHAR2(500), /* ë³¸ì¸?¸ì¦ì½”?“œ */
	change_date DATE /* ë¹„ë?ë²ˆí˜¸ ë³?ê²½ì¼ */
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



/* ê°•ì˜?‰ê°? */
CREATE TABLE subj_eval (
	open_sub_code VARCHAR2(500) NOT NULL, /* ê°œì„¤êµê³¼ê³¼ëª©ì½”ë“œ */
	stu_no VARCHAR2(500) NOT NULL, /* ?•™ë²? */
	classification VARCHAR2(500) NOT NULL, /* ?ˆ˜ê°•êµ¬ë¶? */
	q1 NUMBER, /* ë¬¸í•­1 */
	q2 NUMBER, /* ë¬¸í•­2 */
	q3 NUMBER, /* ë¬¸í•­3 */
	q4 NUMBER, /* ë¬¸í•­4 */
	q5 NUMBER, /* ë¬¸í•­5 */
	content CLOB /* ?‰ê°??‚´?š© */
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

/* ?ˆ˜ê°•ì‹ ì²? */
CREATE TABLE registration (
	open_sub_code VARCHAR2(500) NOT NULL, /* ê°œì„¤êµê³¼ê³¼ëª©ì½”ë“œ */
	stu_no VARCHAR2(500) NOT NULL, /* ?•™ë²? */
	classification VARCHAR2(500) NOT NULL, /* ?ˆ˜ê°•êµ¬ë¶? */
	reg_date DATE, /* ?ˆ˜ê°•ì¼? */
	score NUMBER, /* ?„±?  */
	lecture_eval_flag CHAR(1) /* ê°•ì˜?‰ê°??™„ë£Œì—¬ë¶? */
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

/* ?„±?  */
CREATE TABLE evaluation (
	sub_code VARCHAR2(500) NOT NULL, /* ê°œì„¤êµê³¼ê³¼ëª©ì½”ë“œ */
	stu_no VARCHAR2(500) NOT NULL, /* ?•™ë²? */
	classification VARCHAR2(500) NOT NULL, /* ?ˆ˜ê°•êµ¬ë¶? */
	midterm NUMBER, /* ì¤‘ê°„ê³ ì‚¬ */
	finals NUMBER, /* ê¸°ë§ê³ ì‚¬ */
	assignment NUMBER, /* ê³¼ì œ */
	attendance NUMBER, /* ì¶œì„ */
	etc NUMBER, /* ê¸°í? */
	total_grade NUMBER, /* ì´ì  */
	reg_date DATE, /* ?…? ¥?‚ ì§? */
	edit_date DATE /* ?ˆ˜? •?‚ ì§? */
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

/* ê°œì„¤êµê³¼ê³¼ì • */
CREATE TABLE open_subj (
	open_sub_code VARCHAR2(500) NOT NULL, /* ê°œì„¤êµê³¼ê³¼ëª©ì½”ë“œ */
	subj_code VARCHAR2(500), /* ê³¼ëª©ì½”ë“œ */
	prof_no VARCHAR2(500), /* êµìˆ˜ë²ˆí˜¸ */
	open_date DATE, /* ê°œì„¤?¼? */
	close_date DATE /* ?ì§??¼? */
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

/* ê³¼ì œ?“±ë¡? */
CREATE TABLE distribute_assign (
	assign_no NUMBER NOT NULL, /* ê³¼ì œë²ˆí˜¸ */
	open_sub_code VARCHAR2(500) NOT NULL, /* ê°œì„¤êµê³¼ê³¼ëª©ì½”ë“œ */
	assign_name VARCHAR2(500), /* ê³¼ì œëª? */
	reg_date DATE /* ?“±ë¡ì¼ */
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

/* ê°•ì˜ê³„íš */
CREATE TABLE syllabus (
	open_sub_code VARCHAR2(500) NOT NULL, /* ê°œì„¤êµê³¼ê³¼ëª©ì½”ë“œ */
	syllabus VARCHAR2(500), /* ê°•ì˜ê³„íš?„œ */
	theory_time NUMBER, /* ?´ë¡ ì‹œê°? */
	training_time NUMBER /* ?‹¤?Šµ?‹œê°? */
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

/* ?š”?•½?‹œê°„í‘œ */
CREATE TABLE regi_timetable (
	open_sub_code VARCHAR2(500) NOT NULL, /* ê°œì„¤êµê³¼ê³¼ëª©ì½”ë“œ */
	short_name VARCHAR2(500) /* ?š”?•½ëª? */
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

/* êµìˆ˜ì§ì±… */
CREATE TABLE prof_position (
	position_no NUMBER NOT NULL, /* ì§ì±…ë²ˆí˜¸ */
	position_name VARCHAR2(500) /* ì§ì±…ëª? */
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

/* ê±´ë¬¼ */
CREATE TABLE building (
	building_code VARCHAR2(500) NOT NULL, /* ê±´ë¬¼ì½”ë“œ */
	building_name VARCHAR2(500), /* ê±´ë¬¼ëª? */
	detail VARCHAR2(500) /* ?ƒ?„¸?œ„ì¹? */
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

/* ê³¼ëª© */
CREATE TABLE subject (
	subj_code VARCHAR2(500) NOT NULL, /* ê³¼ëª©ì½”ë“œ */
	type_code VARCHAR2(500), /* êµ¬ë¶„ì½”ë“œ */
	subj_name VARCHAR2(500), /* ê³¼ëª©ëª? */
	explanation varchar2(4000), /* ê³¼ëª©?„¤ëª? */
	credit NUMBER, /* ?´?ˆ˜?•™?  */
	personnel NUMBER /* ?¸?› */
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

/* ?´?ˆ˜êµ¬ë¶„ */
CREATE TABLE subj_type (
	type_code VARCHAR2(500) NOT NULL, /* êµ¬ë¶„ì½”ë“œ */
	type VARCHAR2(500) /* ?´?ˆ˜êµ¬ë¶„ */
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

/* ?•˜?‹¨? •ë³? */
CREATE TABLE footer (
	company_name VARCHAR2(200), /* ?šŒ?‚¬ëª? */
	tel VARCHAR2(200), /* ? „?™”ë²ˆí˜¸ */
	zipcode VARCHAR2(200), /* ?š°?¸ë²ˆí˜¸ */
	address1 VARCHAR2(200), /* ì£¼ì†Œ1 */
	address2 VARCHAR2(200), /* ì£¼ì†Œ2 */
	policy CLOB, /* ê°œì¸? •ë³´ì²˜ë¦¬ë°©ì¹? */
	start_year VARCHAR2(200) /* ?„¤ë¦½ì—°?„ */
);

/* ???–‰ */
CREATE TABLE bank (
	bank_code VARCHAR2(500) NOT NULL, /* ???–‰ì½”ë“œ */
	bank_name VARCHAR2(500) /* ???–‰ëª? */
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

/* ê³„ì¢Œ? •ë³? */
CREATE TABLE account_info (
	bank_code VARCHAR2(500) NOT NULL, /* ???–‰ì½”ë“œ */
	official_no VARCHAR2(500), /* ê´?ê³„ìë²ˆí˜¸ */
	account_no VARCHAR2(500), /* ê³„ì¢Œë²ˆí˜¸ */
	account_name VARCHAR2(500) /* ?˜ˆê¸ˆì£¼ëª? */
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

/* ê´?ê³„ì ?ƒ?„¸? •ë³? */
CREATE TABLE official_info (
	official_no NUMBER NOT NULL, /* ê´?ê³„ìë²ˆí˜¸ */
	hp1 VARCHAR2(200), /* ?•¸?“œ?°1 */
	hp2 VARCHAR2(200), /* ?•¸?“œ?°2 */
	email1 VARCHAR2(200), /* ?´ë©”ì¼1 */
	email2 VARCHAR2(200), /* ?´ë©”ì¼2 */
	zipcode VARCHAR2(200), /* ?š°?¸ë²ˆí˜¸ */
	address VARCHAR2(200), /* ì£¼ì†Œ */
	addr_detail VARCHAR2(200), /* ì£¼ì†Œ?ƒ?„¸ */
	jumin VARCHAR2(200), /* ì£¼ë?¼ë²ˆ?˜¸ */
	gender VARCHAR2(200), /* ?„±ë³? */
	image_url VARCHAR2(200) /* ?‚¬ì§? */
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

/* ìª½ì? ë°œì‹ ?•¨ */
CREATE TABLE outbox (
	msg_no NUMBER NOT NULL, /* ìª½ì?ë²ˆí˜¸ */
	official_no VARCHAR2(500), /* ë°œì‹ ?¸ ë²ˆí˜¸ */
	contents CLOB, /* ?‚´?š© */
	send_date DATE, /* ë°œì†¡?¼ */
	official_name VARCHAR2(500), /* ë°œì‹ ?¸ëª? */
	del_flag CHAR(1) /* ?‚­? œ?—¬ë¶? */
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

/* ìª½ì? ?ˆ˜?‹ ?•¨ */
CREATE TABLE inbox (
	no NUMBER NOT NULL, /* ë²ˆí˜¸ */
	msg_no NUMBER, /* ìª½ì?ë²ˆí˜¸ */
	official_no VARCHAR2(500), /* ?ˆ˜?‹ ?¸ë²ˆí˜¸ */
	read_date DATE, /* ?½?? ?‚ ì§? */
	keep_flag CHAR(1) /* ë³´ê??—¬ë¶? */
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

/* ê°•ì˜?‹¤ */
CREATE TABLE classroom (
	classroom_code VARCHAR2(500) NOT NULL, /* ê°•ì˜?‹¤ì½”ë“œ */
	classroom_name VARCHAR2(500), /* ê°•ì˜?‹¤ëª? */
	building_code VARCHAR2(500) /* ê±´ë¬¼ì½”ë“œ */
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

/* ê°•ì˜?‹œê°„í‘œ */
CREATE TABLE subj_time (
	lecture_time_no NUMBER NOT NULL, /* ê°•ì˜?‹œê°„í‘œì½”ë“œ */
	open_sub_code VARCHAR2(500), /* ê°œì„¤êµê³¼ê³¼ëª©ì½”ë“œ */
	classroom_code VARCHAR2(500), /* ê°•ì˜?‹¤ì½”ë“œ */
	timetable_code VARCHAR2(500) /* ?‹œê°„ê¸°ì¤?ì½”ë“œ */
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

/* ì¦ê²¨ì°¾ê¸° */
CREATE TABLE bookmark (
	no NUMBER NOT NULL, /* ë²ˆí˜¸ */
	official_no VARCHAR2(200), /* ê´?ê³„ìë²ˆí˜¸ */
	name VARCHAR2(200), /* ë¶ë§ˆ?¬ëª? */
	url VARCHAR2(200) /* ë¶ë§ˆ?¬ì£¼ì†Œ */
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

/* ê¸°ë³¸?‹œê°„í‘œ */
CREATE TABLE timetable (
	timetable_code VARCHAR2(500) NOT NULL, /* ?‹œê°„ê¸°ì¤?ì½”ë“œ */
	timetable_name VARCHAR2(500), /* ?‘œ?‹œêµì‹œëª? */
	day VARCHAR2(500), /* ?š”?¼ */
	period NUMBER, /* êµì‹œ */
	short_name VARCHAR2(500) /* ?š”?•½êµì‹œëª? */
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

/* ê²Œì‹œ?Œ */
CREATE TABLE board (
	bd_code NUMBER NOT NULL, /* ê²Œì‹œ?Œì½”ë“œ */
	auth_code NUMBER, /* ê¶Œí•œì½”ë“œ */
	category_code NUMBER, /* ì¹´í…Œê³ ë¦¬ ì½”ë“œ */
	bd_name VARCHAR2(500), /* ê²Œì‹œ?Œ ?´ë¦? */
	reg_date DATE, /* ê²Œì‹œ?Œ ?“±ë¡ì¼ */
	edit_date DATE, /* ê²Œì‹œ?Œ ?ˆ˜? •?¼ */
	bd_order NUMBER, /* ê²Œì‹œ?Œ ?ˆœ?„œ */
	usage CHAR(1), /* ?‚¬?š©?—¬ë¶? */
	is_reply CHAR(1), /* ?Œ“ê¸??—¬ë¶? */
	is_comment CHAR(1), /* ?‹µê¸??—¬ë¶? */
	is_private CHAR(1), /* ë¹„ê³µê°œì—¬ë¶? */
	is_upload CHAR(1), /* ?—…ë¡œë“œ ê°??Š¥ ?—¬ë¶? */
	max_upfile NUMBER, /* ?—…ë¡œë“œ ê°??Š¥ ê°œìˆ˜ */
	max_filesize NUMBER /* ?—…ë¡œë“œ ê°??Š¥ ?ŒŒ?¼ ?‚¬?´ì¦? */
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

/* ì¹´í…Œê³ ë¦¬ */
CREATE TABLE category (
	category_code NUMBER NOT NULL, /* ì¹´í…Œê³ ë¦¬ ì½”ë“œ */
	category_name VARCHAR2(500), /* ì¹´í…Œê³ ë¦¬ ëª? */
	usage CHAR(1), /* ?‚¬?š©?—¬ë¶? */
	reg_date DATE /* ?“±ë¡ì¼ */
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

/* ê¶Œí•œ */
CREATE TABLE authority (
	auth_code NUMBER NOT NULL, /* ê¶Œí•œì½”ë“œ */
	auth_name VARCHAR2(500), /* ê¶Œí•œëª? */
	auth_desc VARCHAR2(500), /* ?„¤ëª? */
	reg_date DATE /* ?“±ë¡ì¼ */
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

/* ?„ì§ì› */
CREATE TABLE employee (
	emp_no VARCHAR2(500) NOT NULL, /* ?„ì§ì›ë²ˆí˜¸ */
	emp_id VARCHAR2(500), /* ?„ì§ì›?•„?´?”” */
	emp_name VARCHAR2(500), /* ?„ì§ì›ëª? */
	pwd VARCHAR2(500), /* ë¹„ë?ë²ˆí˜¸ */
	start_date DATE, /* ?…?‚¬?¼ */
	resignation_date DATE, /* ?‡´?‚¬?¼ */
	identity_state CHAR(1), /* ë³¸ì¸?¸ì¦ìƒ?ƒœ */
	dep_code NUMBER, /* ë¶??„œì½”ë“œ */
	position_code NUMBER, /* ì§ì±…ì½”ë“œ */
	auth_code NUMBER /* ê¶Œí•œì½”ë“œ */
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

/* ë¶??„œ */
CREATE TABLE emp_depart (
	dep_code NUMBER NOT NULL, /* ë¶??„œì½”ë“œ */
	dep_name VARCHAR2(500) /* ë¶??„œëª? */
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

/* ?„ì§ì› ì§ì±… */
CREATE TABLE emp_position (
	position_code NUMBER NOT NULL, /* ì§ì±…ì½”ë“œ */
	position_name VARCHAR2(500) /* ì§ì±…ëª? */
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

/* ê²Œì‹œê¸? */
CREATE TABLE post (
	post_no NUMBER NOT NULL, /* ê²Œì‹œê¸?ë²ˆí˜¸ */
	bd_code NUMBER, /* ê²Œì‹œ?Œì½”ë“œ */
	writer_code NUMBER, /* ?‘?„±?ì½”ë“œ */
	title VARCHAR2(500), /* ? œëª? */
	contents CLOB, /* ?‚´?š© */
	reg_date DATE, /* ?“±ë¡ì¼ */
	read_count NUMBER, /* ì¡°íšŒ?ˆ˜ */
	del_flag CHAR(1), /* ?‚­? œ?—¬ë¶? */
	group_no NUMBER, /* ?›ë³¸ê?ë²ˆí˜¸ */
	sort_no NUMBER, /* ? •? ¬ë²ˆí˜¸ */
	step NUMBER, /* ì°¨ìˆ˜ */
	edit_date DATE, /* ?ˆ˜? •?¼ */
	is_private CHAR(1) /* ë¹„ë?ê¸??—¬ë¶? */
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

/* ?Œ“ê¸? */
CREATE TABLE reply (
	reply_no NUMBER NOT NULL, /* ?Œ“ê¸?ë²ˆí˜¸ */
	writer_code NUMBER, /* ?Œ“ê¸??‘?„±? */
	post_no NUMBER, /* ê²Œì‹œê¸?ë²ˆí˜¸ */
	contents CLOB, /* ?‚´?š© */
	reg_date DATE, /* ?“±ë¡ì¼ */
	del_flag CHAR(1), /* ?‚­? œ?—¬ë¶? */
	step NUMBER, /* ê¸??˜ ?‹¨ê³? */
	sort_no NUMBER, /* ê¸??˜ ? •? ¬?ˆœ?„œ */
	group_no NUMBER /* ê·¸ë£¹ë²ˆí˜¸ */
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

/* ???Œ“ê¸? */
CREATE TABLE rereply (
	rereply_no NUMBER NOT NULL, /* ???Œ“ê¸?ë²ˆí˜¸ */
	writer_code NUMBER, /* ???Œ“ê¸??‘?„±? */
	reply_no NUMBER, /* ?Œ“ê¸?ë²ˆí˜¸ */
	reg_date DATE, /* ?“±ë¡ì¼ */
	contents CLOB, /* ?‚´?š© */
	del_flag CHAR(1) /* ?‚­? œ?—¬ë¶? */
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

/* ?ŒŒ?¼ */
CREATE TABLE board_file (
	no NUMBER NOT NULL, /* ê³ ìœ ë²ˆí˜¸ */
	post_no NUMBER, /* ê²Œì‹œê¸?ë²ˆí˜¸ */
	file_name VARCHAR2(500), /* ?ŒŒ?¼ëª? */
	file_size NUMBER, /* ?ŒŒ?¼?¬ê¸? */
	original_file_name VARCHAR2(500), /* ?›ë³¸íŒŒ?¼ëª? */
	down_count NUMBER, /* ?‹¤?š´ë¡œë“œ?ˆ˜ */
	upfile_date DATE /* ?—…ë¡œë“œ ?‚ ì§? */
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

/* ì¦ëª…?„œ ì¢…ë¥˜ */
CREATE TABLE certification_type (
	certification_code NUMBER NOT NULL, /* ì¦ëª…?„œì½”ë“œ */
	certification_name VARCHAR2(500) /* ì¦ëª…?„œ?´ë¦? */
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

/* ì¶œì„ë¶? */
CREATE TABLE attendance (
	open_sub_code VARCHAR2(500) NOT NULL, /* ê°œì„¤êµê³¼ê³¼ëª©ì½”ë“œ */
	stu_no VARCHAR2(500) NOT NULL, /* ?•™ë²? */
	classification VARCHAR2(500) NOT NULL, /* ?ˆ˜ê°•êµ¬ë¶? */
	first VARCHAR2(30), /* 1ì£¼ì°¨ */
	second VARCHAR2(30), /* 2ì£¼ì°¨ */
	third VARCHAR2(30), /* 3ì£¼ì°¨ */
	fourth VARCHAR2(30), /* 4ì£¼ì°¨ */
	fifth VARCHAR2(30), /* 5ì£¼ì°¨ */
	sixth VARCHAR2(30), /* 6ì£¼ì°¨ */
	seventh VARCHAR2(30), /* 7ì£¼ì°¨ */
	eighth VARCHAR2(30), /* 8ì£¼ì°¨ */
	ninth VARCHAR2(30), /* 9ì£¼ì°¨ */
	tenth VARCHAR2(30), /* 10ì£¼ì°¨ */
	point NUMBER /* ì¶œì„? ?ˆ˜ */
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