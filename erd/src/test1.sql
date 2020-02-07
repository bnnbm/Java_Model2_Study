SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Indexes */

DROP INDEX NO ON professor_101;



/* Drop Tables */

DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS dept;
DROP TABLE IF EXISTS dept2;
DROP TABLE IF EXISTS dept3;
DROP TABLE IF EXISTS depttest1;
DROP TABLE IF EXISTS depttest3;
DROP TABLE IF EXISTS depttest4;
DROP TABLE IF EXISTS dept_seoul;
DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS guest;
DROP TABLE IF EXISTS jdbctemp;
DROP TABLE IF EXISTS major;
DROP TABLE IF EXISTS major10;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS pointitem;
DROP TABLE IF EXISTS professor_101;
DROP TABLE IF EXISTS professor;
DROP TABLE IF EXISTS p_grade;
DROP TABLE IF EXISTS score;
DROP TABLE IF EXISTS scorebase;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS student1;
DROP TABLE IF EXISTS student_male;
DROP TABLE IF EXISTS subject;
DROP TABLE IF EXISTS test1;
DROP TABLE IF EXISTS test2;
DROP TABLE IF EXISTS test3;
DROP TABLE IF EXISTS test4;




/* Create Tables */

CREATE TABLE board
(
	num int NOT NULL,
	name varchar(30) DEFAULT 'NULL',
	pass varchar(20) DEFAULT 'NULL',
	subject varchar(100) DEFAULT 'NULL',
	content varchar(4000) DEFAULT 'NULL',
	file1 varchar(100) DEFAULT 'NULL',
	regdate datetime DEFAULT NULL,
	readcnt int DEFAULT NULL,
	grp int DEFAULT NULL,
	grplevel int DEFAULT NULL,
	grpstep int DEFAULT NULL,
	PRIMARY KEY (num)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE car
(
	no int NOT NULL AUTO_INCREMENT,
	name varchar(20) DEFAULT 'NULL',
	engine int DEFAULT NULL,
	makingdate datetime DEFAULT NULL,
	color varchar(30) DEFAULT 'NULL',
	PRIMARY KEY (no)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE dept
(
	deptno int NOT NULL,
	dname varchar(14) DEFAULT 'NULL',
	loc varchar(20) DEFAULT 'NULL',
	PRIMARY KEY (deptno)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE dept2
(
	deptno int NOT NULL
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE dept3
(
	deptno int NOT NULL,
	dname varchar(14) DEFAULT 'NULL',
	AREA varchar(100) DEFAULT 'NULL',
	PRIMARY KEY (deptno)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE depttest1
(
	deptno int NOT NULL,
	dname varchar(14) DEFAULT 'NULL',
	loc varchar(20) DEFAULT 'NULL'
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE depttest3
(
	deptno int NOT NULL,
	dname varchar(14) DEFAULT 'NULL'
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE depttest4
(
	deptno int NOT NULL,
	dname varchar(14) DEFAULT 'NULL',
	loc varchar(20) DEFAULT 'NULL'
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE dept_seoul
(
	deptno int NOT NULL,
	dname varchar(14) DEFAULT 'NULL',
	loc varchar(20) DEFAULT 'NULL'
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE emp
(
	empno int NOT NULL,
	ename varchar(10) DEFAULT 'NULL',
	job varchar(9) DEFAULT 'NULL',
	mgr int DEFAULT NULL,
	birthday date DEFAULT NULL,
	hiredate date DEFAULT NULL,
	salary int DEFAULT NULL,
	bonus int DEFAULT NULL,
	deptno int DEFAULT NULL,
	PRIMARY KEY (empno)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE guest
(
	no int NOT NULL,
	name varchar(12) DEFAULT 'NULL',
	point int DEFAULT NULL,
	PRIMARY KEY (no)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE jdbctemp
(
	id int NOT NULL,
	name varchar(100) DEFAULT 'NULL',
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE major
(
	code int NOT NULL,
	name varchar(20) NOT NULL,
	part int DEFAULT NULL,
	build varchar(14) DEFAULT 'NULL',
	PRIMARY KEY (code)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE major10
(
	code int NOT NULL,
	name varchar(20) NOT NULL,
	part int DEFAULT NULL,
	build varchar(14) DEFAULT 'NULL'
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE member
(
	id varchar(20) NOT NULL,
	pass varchar(20) DEFAULT 'NULL',
	name varchar(20) DEFAULT 'NULL',
	gender int DEFAULT NULL,
	tel varchar(50) DEFAULT 'NULL',
	picture varchar(200) DEFAULT 'NULL',
	email varchar(100) DEFAULT 'NULL',
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE pointitem
(
	no int DEFAULT NULL,
	name varchar(15) DEFAULT 'NULL',
	spoint int DEFAULT NULL,
	epoint int DEFAULT NULL
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE professor
(
	no int NOT NULL,
	name varchar(10) NOT NULL,
	id varchar(15) NOT NULL,
	position varchar(10) NOT NULL,
	salary int NOT NULL,
	hiredate date NOT NULL,
	bonus int DEFAULT NULL,
	deptno int DEFAULT NULL,
	email varchar(50) DEFAULT 'NULL',
	url varchar(50) DEFAULT 'NULL',
	PRIMARY KEY (no)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE professor_101
(
	NO int NOT NULL,
	NAME varchar(10) NOT NULL,
	deptno int DEFAULT NULL,
	POSITION varchar(10) NOT NULL
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE p_grade
(
	position varchar(10) DEFAULT 'NULL',
	s_age int DEFAULT NULL,
	e_age int DEFAULT NULL,
	s_year int DEFAULT NULL,
	e_year int DEFAULT NULL,
	s_pay int DEFAULT NULL,
	e_pay int DEFAULT NULL
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE score
(
	studno int NOT NULL,
	kor int DEFAULT NULL,
	math int DEFAULT NULL,
	eng int DEFAULT NULL,
	PRIMARY KEY (studno)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE scorebase
(
	grade char(3) DEFAULT 'NULL',
	min_point int DEFAULT NULL,
	max_point int DEFAULT NULL
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE student
(
	studno int NOT NULL,
	name varchar(10) NOT NULL,
	id varchar(20) NOT NULL,
	grade int DEFAULT NULL,
	jumin char(13) NOT NULL,
	birthday date DEFAULT NULL,
	tel varchar(15) DEFAULT 'NULL',
	height int DEFAULT NULL,
	weight int DEFAULT NULL,
	major1 int DEFAULT NULL,
	major2 int DEFAULT NULL,
	profno int DEFAULT NULL,
	PRIMARY KEY (studno),
	UNIQUE (id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE student1
(
	studno int NOT NULL,
	name varchar(10) NOT NULL,
	id varchar(20) NOT NULL,
	grade int DEFAULT NULL,
	jumin char(13) NOT NULL,
	birthday date DEFAULT NULL,
	tel varchar(15) DEFAULT 'NULL',
	height int DEFAULT NULL,
	weight int DEFAULT NULL,
	major1 int DEFAULT NULL,
	major2 int DEFAULT NULL,
	profno int DEFAULT NULL
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE student_male
(
	studno int NOT NULL,
	name varchar(10) NOT NULL,
	id varchar(20) NOT NULL,
	grade int DEFAULT NULL,
	jumin char(13) NOT NULL,
	birthday date DEFAULT NULL,
	tel varchar(15) DEFAULT 'NULL',
	height int DEFAULT NULL,
	weight int DEFAULT NULL,
	major1 int DEFAULT NULL,
	major2 int DEFAULT NULL,
	profno int DEFAULT NULL
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE subject
(
	NO int NOT NULL AUTO_INCREMENT,
	NAME varchar(20) DEFAULT 'NULL',
	HOUR int DEFAULT NULL,
	PRIMARY KEY (NO)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE test1
(
	NO int NOT NULL AUTO_INCREMENT,
	NAME varchar(20) DEFAULT 'NULL',
	birth datetime DEFAULT NULL,
	PRIMARY KEY (NO)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE test2
(
	seq int NOT NULL AUTO_INCREMENT,
	NAME varchar(20) DEFAULT 'NULL',
	birthday date DEFAULT NULL,
	PRIMARY KEY (seq)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE test3
(
	NO int NOT NULL,
	seq int NOT NULL,
	NAME varchar(20) DEFAULT 'NULL',
	PRIMARY KEY (NO, seq)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE test4
(
	NO int NOT NULL AUTO_INCREMENT,
	NAME varchar(30) DEFAULT '''ȫ�浿''',
	PRIMARY KEY (NO)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;



/* Create Foreign Keys */

ALTER TABLE professor_101
	ADD CONSTRAINT professor_101_ibfk_1 FOREIGN KEY (NO)
	REFERENCES professor (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



/* Create Indexes */

CREATE INDEX NO USING BTREE ON professor_101 (NO ASC);



