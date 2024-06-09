DROP TABLE KSW_BOOK;
DROP TABLE KSW_NOTIFICATION;
DROP TABLE KSW_QNA;
DROP TABLE KSW_ORDERLIST ;
DROP TABLE KSW_cart;
DROP TABLE KSW_USERS ;

CREATE TABLE KSW_USERS(
	USERID VARCHAR2(50) PRIMARY KEY,	
	USERPW VARCHAR2(100) NOT NULL,
	USERNAME VARCHAR2(100) NOT NULL,
	USERBIRTH DATE NOT NULL,
	USERPHONE VARCHAR2(100) NOT NULL,
	USERADDR VARCHAR2(300) NOT NULL,
	USEREMAIL VARCHAR2(200) NOT NULL
);


SELECT * FROM KSW_USERS;

--------------------------------------------------------------------------------------------------------

DROP TABLE KSW_cart;
CREATE TABLE KSW_CART(
   CARTNUM NUMBER (10) PRIMARY KEY,
   USERID VARCHAR2(50) NOT NULL,
   title VARCHAR2(300) NOT NULL,
   discount NUMBER (10),   -- 책 가격 / 값이 null 인경우 매진, 절판 등등
   image VARCHAR2(500) NOT NULL,
   isbn varchar2(500) NOT NULL,   -- 국제표준 도서번호
   COUNT NUMBER (10) NOT NULL,      -- 책 수량
   FOREIGN KEY (USERID) REFERENCES KSW_USERS(USERID)
);


SELECT * FROM KSW_CART;

CREATE SEQUENCE cart_seq
START WITH 1
INCREMENT BY 1;

--------------------------------------------------------------------------------------------------------

DROP TABLE KSW_ORDERLIST ;
CREATE TABLE KSW_ORDERLIST(
   ORDERNUM NUMBER (10) PRIMARY KEY,
   ORDERDATE DATE NOT NULL,
   USERID VARCHAR2(50) NOT NULL,
   title VARCHAR2(300) NOT NULL,
   discount NUMBER(10),               -- 판매 가격
   isbn varchar2(500) NOT NULL,
   replystatus varchar2 (100) NOT NULL,
   COUNT NUMBER(10) NOT NULL,            -- 구매 수량
   FOREIGN KEY (USERID) REFERENCES KSW_USERS(USERID)
);

UPDATE KSW_ORDERLIST SET ORDERDATE = sysdate+5 WHERE ORDERNUM=360;

SELECT * FROM KSW_ORDERLIST;


CREATE SEQUENCE order_seq
START WITH 1
INCREMENT BY 1;

--------------------------------------------------------------------------------------------------------

/* INSERT INTO ORDERLIST VALUES (order_seq.nextval, USERID, title, title, author, discount, publisher, pubdate, DELIVERY_STATUS, COUNT, CATEGORY ); */

DROP TABLE KSW_QNA;
CREATE TABLE KSW_QNA(
	QNANUM NUMBER (10) PRIMARY KEY,
	USERID VARCHAR2(50) NOT NULL,
	QNATITLE VARCHAR2 (255) NOT NULL,
	QNADETAILS CLOB NOT NULL,	-- 문의 내용
	createdAt DATE,			-- 작성 날짜
    answerAt DATE,				-- 답변 날짜
    QNAanswer clob, 			-- 답변 내용
    FOREIGN KEY (USERID) REFERENCES KSW_USERS(USERID)
);

SELECT * FROM KSW_QNA;

CREATE SEQUENCE qna_seq
START WITH 1
INCREMENT BY 1;

--------------------------------------------------------------------------------------------------------

DROP TABLE KSW_NOTIFICATION;
CREATE TABLE KSW_NOTIFICATION(
	NOTIFICATIONNUM NUMBER(10) PRIMARY KEY,
	USERID VARCHAR2(50) NOT NULL,
	NOTIFICATIONTITLE VARCHAR2(255) NOT NULL,
	NOTIFICATIONDETAILS CLOB NOT NULL,
	createdAt DATE , -- 작성 날짜
    updatedAt DATE , -- 수정 날짜	
	FOREIGN KEY (USERID) REFERENCES KSW_USERS(USERID)	
);

SELECT * FROM KSW_NOTIFICATION;

CREATE SEQUENCE notification_seq
START WITH 1
INCREMENT BY 1;

--------------------------------------------------------------------------------------------------------

DROP TABLE KSW_BOOK;
CREATE TABLE KSW_BOOK(
   isbn varchar2(355) ,
   title varchar2(355),
   image varchar2(355),
   author varchar2(355),
   discount number(38),
   publisher varchar2(355),
   description clob,
   pubdate DATE
);


SELECT * FROM KSW_BOOK;

CREATE TABLE ksw_reply (
	replynum number(38) PRIMARY KEY,  -- 리뷰 고유 숫자(int)
	isbn varchar2(355) NOT null,  -- 책 isbn 값(String)
	userid varchar2(355) NOT null,  -- 유저 id(String)
	replyinsertdate DATE NOT null, -- 리뷰 작성 날짜(date)
	replygrade number(10) NOT null, -- 리뷰 평점(int)
	reply clob NOT NULL, -- 리뷰 내용
	FOREIGN KEY (USERID) REFERENCES KSW_USERS(USERID)
);
SELECT * FROM KSW_REPLY;