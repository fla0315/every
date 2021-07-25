/* 학부생 */
DROP TABLE student 
	CASCADE CONSTRAINTS;

/* 장학금 수여 */
DROP TABLE award 
	CASCADE CONSTRAINTS;

/* 장학금 */
DROP TABLE scholarship 
	CASCADE CONSTRAINTS;

/* 학적상태 */
DROP TABLE student_state 
	CASCADE CONSTRAINTS;

/* 증명서발급 */
DROP TABLE certification 
	CASCADE CONSTRAINTS;

/* 등록금 */
DROP TABLE tuition 
	CASCADE CONSTRAINTS;

/* 과제 */
DROP TABLE assignment 
	CASCADE CONSTRAINTS;

/* 학과 */
DROP TABLE department 
	CASCADE CONSTRAINTS;

/* 학부 */
DROP TABLE faculty 
	CASCADE CONSTRAINTS;

/* 교수 */
DROP TABLE professor 
	CASCADE CONSTRAINTS;


/* 강의평가 */
DROP TABLE subj_eval 
	CASCADE CONSTRAINTS;

/* 수강신청 */
DROP TABLE registration 
	CASCADE CONSTRAINTS;

/* 성적 */
DROP TABLE evaluation 
	CASCADE CONSTRAINTS;

/* 개설교과과정 */
DROP TABLE open_subj 
	CASCADE CONSTRAINTS;

/* 과제등록 */
DROP TABLE distribute_assign 
	CASCADE CONSTRAINTS;

/* 강의계획 */
DROP TABLE syllabus 
	CASCADE CONSTRAINTS;

/* 요약시간표 */
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

/* 이수구분 */
DROP TABLE subj_type 
	CASCADE CONSTRAINTS;

/* 하단정보 */
DROP TABLE footer 
	CASCADE CONSTRAINTS;

/* 은행 */
DROP TABLE bank 
	CASCADE CONSTRAINTS;

/* 계좌정보 */
DROP TABLE account_info 
	CASCADE CONSTRAINTS;

/* 관계자 상세정보 */
DROP TABLE official_info 
	CASCADE CONSTRAINTS;

/* 쪽지 발신함 */
DROP TABLE outbox 
	CASCADE CONSTRAINTS;

/* 쪽지 수신함 */
DROP TABLE inbox 
	CASCADE CONSTRAINTS;

/* 강의실 */
DROP TABLE classroom 
	CASCADE CONSTRAINTS;

/* 강의시간표 */
DROP TABLE subj_time 
	CASCADE CONSTRAINTS;

/* 즐겨찾기 */
DROP TABLE bookmark 
	CASCADE CONSTRAINTS;

/* 기본시간표 */
DROP TABLE timetable 
	CASCADE CONSTRAINTS;

/* 게시판 */
DROP TABLE board 
	CASCADE CONSTRAINTS;

/* 카테고리 */
DROP TABLE category 
	CASCADE CONSTRAINTS;

/* 권한 */
DROP TABLE authority 
	CASCADE CONSTRAINTS;

/* 임직원 */
DROP TABLE employee 
	CASCADE CONSTRAINTS;

/* 부서 */
DROP TABLE emp_depart 
	CASCADE CONSTRAINTS;

/* 임직원 직책 */
DROP TABLE emp_position 
	CASCADE CONSTRAINTS;

/* 게시글 */
DROP TABLE post 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE reply 
	CASCADE CONSTRAINTS;

/* 대댓글 */
DROP TABLE rereply 
	CASCADE CONSTRAINTS;

/* 파일 */
DROP TABLE board_file 
	CASCADE CONSTRAINTS;

/* 증명서 종류 */
DROP TABLE certification_type 
	CASCADE CONSTRAINTS;

/* 출석부 */
DROP TABLE attendance
	CASCADE CONSTRAINTS;

DROP SEQUENCE INBOX_SEQ;
DROP SEQUENCE OUTBOX_SEQ;

/* 학부생 */
CREATE TABLE student (
	stu_no VARCHAR2(500) NOT NULL, /* 학번 */
	student_id VARCHAR2(500), /* 아이디 */
	pwd VARCHAR2(500), /* 비밀번호 */
	name VARCHAR2(500), /* 성명 */
	semester VARCHAR2(500), /* 학기 */
	major VARCHAR2(500), /* 전공 */
	minor VARCHAR2(500), /* 부전공 */
	admission_date DATE, /* 입학일 */
	graduation_date DATE, /* 졸업일 */
	credits NUMBER, /* 이수학점 */
	indentity_state CHAR(1), /* 본인인증상태 */
	indentity_code VARCHAR2(200), /* 본인인증코드 */
	change_date DATE, /* 비밀번호 변경일 */
	state VARCHAR2(500), /* 학적상태번호 */
	dept_no NUMBER, /* 학과번호 */
    phonenum VARCHAR2(15) /*휴대전화*/
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

/* 장학금 수여 */
CREATE TABLE award (
	award_no NUMBER NOT NULL, /* 장학금수여번호 */
	stu_no VARCHAR2(500), /* 학번 */
	scholarship_no NUMBER, /* 장학금번호 */
	awarding_date DATE /* 수여일 */
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

/* 장학금 */
CREATE TABLE scholarship (
	scholarship_no NUMBER NOT NULL, /* 장학금번호 */
	scholarship_type VARCHAR2(500), /* 장학금종류 */
	scholarship NUMBER /* 장학금 금액 */
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

/* 학적상태 */
CREATE TABLE student_state (
	state VARCHAR2(500) NOT NULL, /* 학적상태번호 */
	state_name VARCHAR2(500) /* 학적상태이름 */
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

/* 증명서발급 */
CREATE TABLE certification (
	no NUMBER NOT NULL, /* 발급번호 */
	certification_code NUMBER, /* 증명서코드 */
	stu_no VARCHAR2(500), /* 학번 */
	qty NUMBER, /* 수량 */
	reg_date DATE, /* 발급일 */
	is_print CHAR(1) /* 출력여부 */
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

/* 등록금 */
CREATE TABLE tuition (
	tuition_no NUMBER NOT NULL, /* 등록금번호 */
	stu_no VARCHAR2(500), /* 학번 */
	semester VARCHAR2(500), /* 학기 */
	tuition NUMBER, /* 금액 */
	deposit_state CHAR(1), /* 납부여부 */
	deposit_date DATE /* 납부일 */
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
	stu_no VARCHAR2(500), /* 학번 */
	file_name VARCHAR2(500), /* 파일이름 */
	file_size NUMBER, /* 파일사이즈 */
	original_file_name VARCHAR2(500), /* 원본파일이름 */
	apply_date DATE /* 제출일 */
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

/* 학과 */
CREATE TABLE department (
	dept_no NUMBER NOT NULL, /* 학과번호 */
	faculty_no NUMBER, /* 학부번호 */
	dept_name VARCHAR2(500) NOT NULL, /* 학과명 */
	tel VARCHAR2(500), /* 사무실전화번호 */
	building_code VARCHAR2(500), /* 건물코드 */
	total_credit NUMBER /* 졸업이수학점 */
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

/* 학부 */
CREATE TABLE faculty (
	faculty_no NUMBER NOT NULL, /* 학부번호 */
	faculty_name VARCHAR2(500) NOT NULL /* 학부이름 */
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
	dept_no NUMBER, /* 학과번호 */
	prof_name VARCHAR2(500), /* 교수명 */
	prof_id VARCHAR2(500), /* 아이디 */
	prof_pwd VARCHAR2(500), /* 비밀번호 */
    prof_ph VARCHAR2(500), /* 전화번호 */
	prof_email VARCHAR2(500), /* 이메일 */
	prof_start_date DATE, /* 임용일 */
	prof_end_date DATE, /* 퇴직일 */
	identity_state CHAR(1), /* 본인인증상태 */
	identity_code VARCHAR2(500), /* 본인인증코드 */
	change_date DATE /* 비밀번호 변경일 */
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



/* 강의평가 */
CREATE TABLE subj_eval (
	open_sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(500) NOT NULL, /* 학번 */
	classification VARCHAR2(500) NOT NULL, /* 수강구분 */
	q1 NUMBER, /* 문항1 */
	q2 NUMBER, /* 문항2 */
	q3 NUMBER, /* 문항3 */
	q4 NUMBER, /* 문항4 */
	q5 NUMBER, /* 문항5 */
	content CLOB /* 평가내용 */
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

/* 수강신청 */
CREATE TABLE registration (
	open_sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(500) NOT NULL, /* 학번 */
	classification VARCHAR2(500) NOT NULL, /* 수강구분 */
	reg_date DATE, /* 수강일자 */
	score NUMBER, /* 성적 */
	lecture_eval_flag CHAR(1) /* 강의평가완료여부 */
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

/* 성적 */
CREATE TABLE evaluation (
	sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(500) NOT NULL, /* 학번 */
	classification VARCHAR2(500) NOT NULL, /* 수강구분 */
	midterm NUMBER, /* 중간고사 */
	finals NUMBER, /* 기말고사 */
	assignment NUMBER, /* 과제 */
	attendance NUMBER, /* 출석 */
	etc NUMBER, /* 기타 */
	total_grade NUMBER, /* 총점 */
	reg_date DATE, /* 입력날짜 */
	edit_date DATE /* 수정날짜 */
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
	open_date DATE, /* 개설일자 */
	close_date DATE /* 폐지일자 */
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

/* 과제등록 */
CREATE TABLE distribute_assign (
	assign_no NUMBER NOT NULL, /* 과제번호 */
	open_sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	assign_name VARCHAR2(500), /* 과제명 */
	reg_date DATE /* 등록일 */
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
	syllabus VARCHAR2(500), /* 강의계획서 */
	theory_time NUMBER, /* 이론시간 */
	training_time NUMBER /* 실습시간 */
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

/* 요약시간표 */
CREATE TABLE regi_timetable (
	open_sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	short_name VARCHAR2(500) /* 요약명 */
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
	position_name VARCHAR2(500) /* 직책명 */
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
	building_name VARCHAR2(500), /* 건물명 */
	detail VARCHAR2(500) /* 상세위치 */
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
	prof_no VARCHAR2(500), /* 교수번호 */
	type_code VARCHAR2(500), /* 구분코드 */
	subj_name VARCHAR2(500), /* 과목명 */
	explanation CLOB, /* 과목설명 */
	credit NUMBER, /* 이수학점 */
	personnel NUMBER /* 인원 */
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

/* 이수구분 */
CREATE TABLE subj_type (
	type_code VARCHAR2(500) NOT NULL, /* 구분코드 */
	type VARCHAR2(500) /* 이수구분 */
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

/* 하단정보 */
CREATE TABLE footer (
	company_name VARCHAR2(200), /* 회사명 */
	tel VARCHAR2(200), /* 전화번호 */
	zipcode VARCHAR2(200), /* 우편번호 */
	address1 VARCHAR2(200), /* 주소1 */
	address2 VARCHAR2(200), /* 주소2 */
	policy CLOB, /* 개인정보처리방침 */
	start_year VARCHAR2(200) /* 설립연도 */
);

/* 은행 */
CREATE TABLE bank (
	bank_code VARCHAR2(500) NOT NULL, /* 은행코드 */
	bank_name VARCHAR2(500) /* 은행명 */
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

/* 계좌정보 */
CREATE TABLE account_info (
	bank_code VARCHAR2(500) NOT NULL, /* 은행코드 */
	official_no VARCHAR2(500), /* 관계자번호 */
	account_no VARCHAR2(500), /* 계좌번호 */
	account_name VARCHAR2(500) /* 예금주명 */
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

/* 관계자 상세정보 */
CREATE TABLE official_info (
	official_no NUMBER NOT NULL, /* 관계자번호 */
	hp1 VARCHAR2(200), /* 핸드폰1 */
	hp2 VARCHAR2(200), /* 핸드폰2 */
	email1 VARCHAR2(200), /* 이메일1 */
	email2 VARCHAR2(200), /* 이메일2 */
	zipcode VARCHAR2(200), /* 우편번호 */
	address VARCHAR2(200), /* 주소 */
	addr_detail VARCHAR2(200), /* 주소상세 */
	jumin VARCHAR2(200), /* 주민번호 */
	gender VARCHAR2(200), /* 성별 */
	image_url VARCHAR2(200) /* 사진 */
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

/* 쪽지 발신함 */
CREATE TABLE outbox (
	msg_no NUMBER NOT NULL, /* 쪽지번호 */
	official_no VARCHAR2(500), /* 발신인 번호 */
	contents VARCHAR2(4000), /* 내용 */
	send_date DATE, /* 발송일 */
	official_name VARCHAR2(500), /* 발신인명 */
	del_flag CHAR(1) /* 삭제여부 */
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

/* 쪽지 수신함 */
CREATE TABLE inbox (
	no NUMBER NOT NULL, /* 번호 */
	msg_no NUMBER, /* 쪽지번호 */
	official_no VARCHAR2(500), /* 수신인번호 */
	read_date DATE, /* 읽은 날짜 */
	keep_flag CHAR(1) /* 보관여부 */
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

/* 강의실 */
CREATE TABLE classroom (
	classroom_code VARCHAR2(500) NOT NULL, /* 강의실코드 */
	classroom_name VARCHAR2(500), /* 강의실명 */
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

/* 강의시간표 */
CREATE TABLE subj_time (
	lecture_time_no NUMBER NOT NULL, /* 강의시간표코드 */
	open_sub_code VARCHAR2(500), /* 개설교과과목코드 */
	classroom_code VARCHAR2(500), /* 강의실코드 */
	timetable_code VARCHAR2(500) /* 시간기준코드 */
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
	official_no VARCHAR2(200), /* 관계자번호 */
	name VARCHAR2(200), /* 북마크명 */
	url VARCHAR2(200) /* 북마크주소 */
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

/* 기본시간표 */
CREATE TABLE timetable (
	timetable_code VARCHAR2(500) NOT NULL, /* 시간기준코드 */
	timetable_name VARCHAR2(500), /* 표시교시명 */
	day VARCHAR2(500), /* 요일 */
	period NUMBER, /* 교시 */
	short_name VARCHAR2(500) /* 요약교시명 */
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

/* 게시판 */
CREATE TABLE board (
	bd_code NUMBER NOT NULL, /* 게시판코드 */
	auth_code NUMBER, /* 권한코드 */
	category_code NUMBER, /* 카테고리 코드 */
	bd_name VARCHAR2(500), /* 게시판 이름 */
	reg_date DATE, /* 게시판 등록일 */
	edit_date DATE, /* 게시판 수정일 */
	bd_order NUMBER, /* 게시판 순서 */
	usage CHAR(1), /* 사용여부 */
	is_reply CHAR(1), /* 댓글여부 */
	is_comment CHAR(1), /* 답글여부 */
	is_private CHAR(1), /* 비공개여부 */
	is_upload CHAR(1), /* 업로드 가능 여부 */
	max_upfile NUMBER, /* 업로드 가능 개수 */
	max_filesize NUMBER /* 업로드 가능 파일 사이즈 */
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
	category_name VARCHAR2(500), /* 카테고리 명 */
	usage CHAR(1), /* 사용여부 */
	reg_date DATE /* 등록일 */
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
	auth_name VARCHAR2(500), /* 권한명 */
	auth_desc VARCHAR2(500), /* 설명 */
	reg_date DATE /* 등록일 */
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

/* 임직원 */
CREATE TABLE employee (
	emp_no VARCHAR2(500) NOT NULL, /* 임직원번호 */
	emp_id VARCHAR2(500), /* 임직원아이디 */
	emp_name VARCHAR2(500), /* 임직원명 */
	pwd VARCHAR2(500), /* 비밀번호 */
	start_date DATE, /* 입사일 */
	resignation_date DATE, /* 퇴사일 */
	identity_state CHAR(1), /* 본인인증상태 */
	dep_code NUMBER, /* 부서코드 */
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

/* 부서 */
CREATE TABLE emp_depart (
	dep_code NUMBER NOT NULL, /* 부서코드 */
	dep_name VARCHAR2(500) /* 부서명 */
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

/* 임직원 직책 */
CREATE TABLE emp_position (
	position_code NUMBER NOT NULL, /* 직책코드 */
	position_name VARCHAR2(500) /* 직책명 */
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

/* 게시글 */
CREATE TABLE post (
	post_no NUMBER NOT NULL, /* 게시글번호 */
	bd_code NUMBER, /* 게시판코드 */
	writer_code NUMBER, /* 작성자코드 */
	title VARCHAR2(500), /* 제목 */
	contents CLOB, /* 내용 */
	reg_date DATE, /* 등록일 */
	read_count NUMBER, /* 조회수 */
	del_flag CHAR(1), /* 삭제여부 */
	group_no NUMBER, /* 원본글번호 */
	sort_no NUMBER, /* 정렬번호 */
	step NUMBER, /* 차수 */
	edit_date DATE, /* 수정일 */
	is_private CHAR(1) /* 비밀글여부 */
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

/* 댓글 */
CREATE TABLE reply (
	reply_no NUMBER NOT NULL, /* 댓글번호 */
	writer_code NUMBER, /* 댓글작성자 */
	post_no NUMBER, /* 게시글번호 */
	contents CLOB, /* 내용 */
	reg_date DATE, /* 등록일 */
	del_flag CHAR(1), /* 삭제여부 */
	step NUMBER, /* 글의 단계 */
	sort_no NUMBER, /* 글의 정렬순서 */
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

/* 대댓글 */
CREATE TABLE rereply (
	rereply_no NUMBER NOT NULL, /* 대댓글번호 */
	writer_code NUMBER, /* 대댓글작성자 */
	reply_no NUMBER, /* 댓글번호 */
	reg_date DATE, /* 등록일 */
	contents CLOB, /* 내용 */
	del_flag CHAR(1) /* 삭제여부 */
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

/* 파일 */
CREATE TABLE board_file (
	no NUMBER NOT NULL, /* 고유번호 */
	post_no NUMBER, /* 게시글번호 */
	file_name VARCHAR2(500), /* 파일명 */
	file_size NUMBER, /* 파일크기 */
	original_file_name VARCHAR2(500), /* 원본파일명 */
	down_count NUMBER, /* 다운로드수 */
	upfile_date DATE /* 업로드 날짜 */
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

/* 증명서 종류 */
CREATE TABLE certification_type (
	certification_code NUMBER NOT NULL, /* 증명서코드 */
	certification_name VARCHAR2(500) /* 증명서이름 */
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

/* 출석부 */
CREATE TABLE attendance (
	open_sub_code VARCHAR2(500) NOT NULL, /* 개설교과과목코드 */
	stu_no VARCHAR2(500) NOT NULL, /* 학번 */
	classification VARCHAR2(500) NOT NULL, /* 수강구분 */
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
	point NUMBER /* 출석점수 */
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
		) on delete cascade;

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
        
alter table classroom add usable char(2) default 'Y' not null;

create sequence outbox_seq 
start with 1
increment by 1
nocache;

create sequence inbox_seq 
start with 1
increment by 1
nocache;


create or replace trigger tr_chitchat
    after insert on outbox
    for each row
BEGIN
    insert into inbox(no, msg_no, keep_flag)
    values(inbox_seq.nextval, :NEW.msg_no, 'N');
END;