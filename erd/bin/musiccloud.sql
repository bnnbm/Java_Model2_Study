SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS boardcomment;
DROP TABLE IF EXISTS NEW_TABLE;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS member;




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
	boardgubun int NOT NULL,
	id varchar(20) NOT NULL,
	PRIMARY KEY (num)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE boardcomment
(
	commentnum int NOT NULL,
	regdate date,
	content varchar(500) NOT NULL,
	num int NOT NULL,
	id varchar(20) NOT NULL,
	PRIMARY KEY (commentnum, num)
);


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


CREATE TABLE NEW_TABLE
(
	num int NOT NULL,
	id varchar(20) NOT NULL,
	PRIMARY KEY (num, id)
);



/* Create Foreign Keys */

ALTER TABLE boardcomment
	ADD FOREIGN KEY (num)
	REFERENCES board (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (num)
	REFERENCES board (num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE boardcomment
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



