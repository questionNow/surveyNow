-- 테이블 DROP
DROP TABLE ATTENDANCE;
DROP TABLE BUYPRODUCT;
DROP TABLE PRODUCTPHOTO;
DROP TABLE PRODUCT;
DROP TABLE PRODUCTCATEGORY;
DROP TABLE REPLY;
DROP TABLE QNA;
DROP TABLE NOTICE;
DROP TABLE POINT;
DROP TABLE RESULT;
DROP TABLE ETC_ANSWER;
DROP TABLE USER_INFO;
DROP TABLE ANSWER;
DROP TABLE QUESTION;
DROP TABLE QUESTION_TYPE;
DROP TABLE SURVEY;
DROP TABLE SURVEY_TYPE;


-- 시퀀스 드랍
DROP SEQUENCE SEQ_ATTENDANCE;
DROP SEQUENCE SEQ_PRODUCT;
DROP SEQUENCE SEQ_PRODUCTCATEGORY;
DROP SEQUENCE SEQ_BUYPRODUCT;
DROP SEQUENCE SEQ_PRODUCTPHOTO;
DROP SEQUENCE SEQ_NOTICE;
DROP SEQUENCE SEQ_REPLY;
DROP SEQUENCE SEQ_QNA;
DROP SEQUENCE SEQ_POINT;
DROP SEQUENCE SEQ_SURVEY;
DROP SEQUENCE SEQ_QUESTION;
DROP SEQUENCE SEQ_ANSWER;
DROP SEQUENCE SEQ_ETC_ANSWER;
DROP SEQUENCE SEQ_RESULT;

-- user 테이블 생성
CREATE TABLE USER_INFO(
    USERID VARCHAR(20) NOT NULL,
    USERPWD VARCHAR(255) NOT NULL,
    USERNAME VARCHAR(20) NOT NULL,
    AGE NUMBER(5),
    GENDER VARCHAR(6),
     EMAIL    VARCHAR(50),
    PHONE    VARCHAR(11),
    ADDRESS VARCHAR(100),
    RECOMMEND_ID VARCHAR(20),
    SURVEYCOUNT NUMBER(38) DEFAULT 0,
    VISITCOUNT NUMBER(38) DEFAULT 0,
    USERTYPE NUMBER(1) DEFAULT '2',
    STATUS VARCHAR(1) DEFAULT 'N',     
    FINAL_EDUCATION VARCHAR(50),
    JOB VARCHAR(20),
    INCOME VARCHAR(50),
    LIVING_TYPE VARCHAR(10),
    HOUSE_TYPE VARCHAR(20),
    RELIGION VARCHAR(10),
    MARITAL_STATUS VARCHAR(10),
    LIVING_WITH VARCHAR(15),
    ARMY_GO VARCHAR(10), 
    INTEREST VARCHAR(300),
     PWDDATE DATE DEFAULT SYSDATE,
    CONSTRAINT USER_INFO_PK PRIMARY KEY (USERID)
);

-- 공지사항 및 이벤트 테이블
CREATE TABLE NOTICE (
    NNUM NUMBER(38) NOT NULL,
    NWRITER VARCHAR(20) NOT NULL,
     NWNAME VARCHAR(20),
    NTITLE VARCHAR(100),
    NCONTENT LONG,
    NCREATEDT DATE,
    NUPDATEDT DATE,
    NTYPE VARCHAR(1),
    NSTATUS VARCHAR(1) DEFAULT 'N',
     CONSTRAINT NOTICE_PK PRIMARY KEY(NNUM),
     CONSTRAINT NOTICE_FK FOREIGN KEY(NWRITER) REFERENCES USER_INFO(USERID)
);

CREATE SEQUENCE SEQ_NOTICE;

-- 덧글 테이블
CREATE TABLE REPLY(
    REPLYNUM NUMBER(38) NOT NULL,
    NNUM NUMBER(38) NOT NULL,
    REPLYID VARCHAR(20) NOT NULL,
    REPLYTEXT LONG,
    REPLYDATE DATE DEFAULT SYSDATE,
    REPLYSTATUS VARCHAR(1) DEFAULT 'N',
     CONSTRAINT REPLY_PK PRIMARY KEY(REPLYNUM),
     CONSTRAINT REPLY_CNUM_FK FOREIGN KEY(NNUM) REFERENCES NOTICE(NNUM),
     CONSTRAINT CREPLY_REPLYID_FK FOREIGN KEY(REPLYID) REFERENCES USER_INFO(USERID)
);
 
CREATE SEQUENCE SEQ_REPLY;

-- QnA 테이블

    CREATE TABLE QNA(
    QNANUM NUMBER(38) NOT NULL,
    USERID VARCHAR(20) NOT NULL,
    QNATITLE VARCHAR(100),
    QNACONTENT NVARCHAR2(2000),
    QNATYPE VARCHAR(1),
    ACONTENT NVARCHAR2(2000),
     CONSTRAINT QNA_PK PRIMARY KEY(QNANUM),
     CONSTRAINT QNA_FK FOREIGN KEY(USERID) REFERENCES USER_INFO(USERID)
);

CREATE SEQUENCE SEQ_QNA;

-- point 테이블
CREATE TABLE POINT(
    PNUM NUMBER(38) NOT NULL,
     USERID VARCHAR(20) NOT NULL,
    POINT NUMBER(38),
    PDATE DATE,
    PCONTENT VARCHAR(100),
     CONSTRAINT POINT_PK PRIMARY KEY(PNUM),
     CONSTRAINT POINT_FK FOREIGN KEY(USERID) REFERENCES USER_INFO(USERID)
);

CREATE SEQUENCE SEQ_POINT;

-- 설문타입 테이블
CREATE TABLE SURVEY_TYPE(
    STYPE VARCHAR(20) NOT NULL,
    STNAME VARCHAR(20),
      CONSTRAINT SURVEY_TYPE_PK PRIMARY KEY(STYPE)
);

-- survey 테이블
CREATE TABLE SURVEY(
    SNUM NUMBER(38) NOT NULL,
    STYPE VARCHAR(20) NOT NULL,
    STITLE VARCHAR(100),
    SSTARTDT DATE,
    SENDDT DATE,
    SCOUNT NUMBER(38),
    SPOINT NUMBER(38),   -- 설문조사 포인트
    QCount number(38),
    ACOUNT NUMBER(38),
    SSTATUS VARCHAR(1),
    STARGET VARCHAR(200),
     SCREATEDT DATE, -- 설문만든날짜
     SUSERID VARCHAR(20), -- 설문등록 아이디
     CONSTRAINT SURVEY_PK PRIMARY KEY(SNUM),
     CONSTRAINT SURVEY_FK FOREIGN KEY(STYPE) REFERENCES SURVEY_TYPE(STYPE)
);

CREATE SEQUENCE SEQ_SURVEY;

-- 질문 타입 테이블
CREATE TABLE QUESTION_TYPE(
    QTYPE VARCHAR(255)   NOT NULL,
    QTNAME VARCHAR(255),
     CONSTRAINT QUESTION_TYPE_PK PRIMARY KEY(QTYPE)
);

-- 질문 테이블
CREATE TABLE QUESTION(
    QNUM NUMBER(38) NOT NULL,
    SNUM NUMBER(38) NOT NULL,
    QTYPE VARCHAR(20) NOT NULL,
    QTITLE VARCHAR(100),
     CONSTRAINT QUESTION_PK PRIMARY KEY(QNUM),
     CONSTRAINT QUESTION_SNUM_FK FOREIGN KEY(SNUM) REFERENCES SURVEY(SNUM),
     CONSTRAINT QUESTION_QTYPE_FK FOREIGN KEY(QTYPE) REFERENCES QUESTION_TYPE(QTYPE)
);

CREATE SEQUENCE SEQ_QUESTION;

-- 항목 테이블
CREATE TABLE ANSWER(
    ANUM NUMBER(38) NOT NULL,
    QNUM NUMBER(38) NOT NULL,
    ACONTENT VARCHAR(200),
     CONSTRAINT ANSWER_PK PRIMARY KEY(ANUM),
     CONSTRAINT ANSWER_FK FOREIGN KEY(QNUM) REFERENCES QUESTION(QNUM)
);

CREATE SEQUENCE SEQ_ANSWER;

-- 선택형 답안테이블 (기타 항목 선택 후 사용자가 임의로 항목을 만들어 설문에 응답했을 때 저장되는 테이블)
CREATE TABLE ETC_ANSWER(
    EANUM NUMBER(38) NOT NULL,
    ANUM NUMBER(38) NOT NULL,
    EACONTENT LONG,
    EAYN VARCHAR(1) DEFAULT 'N',
     CONSTRAINT ETC_ANSWER_PK PRIMARY KEY(EANUM),
     CONSTRAINT ETC_ANSWER_FK FOREIGN KEY(ANUM) REFERENCES ANSWER(ANUM)
);

CREATE SEQUENCE SEQ_ETC_ANSWER;

-- 결과 테이블
CREATE TABLE RESULT(
    RNUM NUMBER(38)NOT NULL,
    ANUM NUMBER(38)NOT NULL,
    EANUM NUMBER(38) NOT NULL,
     RUSERID VARCHAR(20) NOT NULL,
    RTEXT LONG,  -- 단답&서술형 답안 컬럼
    RDATE DATE DEFAULT SYSDATE, -- 회원 응답 날짜
    CONSTRAINT RESULT_PK PRIMARY KEY(EANUM),
     CONSTRAINT RESULT_ANUM_FK FOREIGN KEY(ANUM) REFERENCES ANSWER(ANUM),
     CONSTRAINT RESULT_EANUM_FK FOREIGN KEY(EANUM) REFERENCES ETC_ANSWER(EANUM),
     CONSTRAINT RESULT_USERID_FK FOREIGN KEY(RUSERID) REFERENCES USER_INFO(USERID)
);

CREATE SEQUENCE SEQ_RESULT;

CREATE TABLE ATTENDANCE(
    ATTNUM NUMBER(38) NOT NULL,
    USERID VARCHAR(20) NOT NULL,
    ATTPOINT NUMBER(38),    -- 출석 체크 했을 때 얻는 포인트
    ATTCOUNT NUMBER(38),    -- 총 출석한 수
    ATTDATE DATE,           -- 출석체크한 날
    CONSTRAINT ATTENDANCE_PK PRIMARY KEY(ATTNUM),
    CONSTRAINT ATTENDANCE_FK FOREIGN KEY(USERID) REFERENCES USER_INFO(USERID)
);

CREATE SEQUENCE SEQ_ATTENDANCE;


-- 제품 카테고리 
CREATE TABLE PRODUCTCATEGORY(
   CATEGORYID   VARCHAR(10) NOT NULL,
   CATEGORYNAME VARCHAR(20),
   PCATEGORY VARCHAR(10),
    CONSTRAINT PRODUCTCATEGORY_PK PRIMARY KEY(CATEGORYID)
);

CREATE SEQUENCE SEQ_PRODUCTCATEGORY;

-- 제품 테이블
CREATE TABLE PRODUCT(
   PRONUM NUMBER(38) NOT NULL,
   CATEGORYID VARCHAR(10) NOT NULL,
   PRONAME VARCHAR(20),
   PPRICE NUMBER(38),
   PROTEXT VARCHAR(255),
   PROCOUNT NUMBER(38),
    CONSTRAINT PRODUCT_PK PRIMARY KEY(PRONUM),
    CONSTRAINT PRODUCT_FK FOREIGN KEY(CATEGORYID) REFERENCES PRODUCTCATEGORY(CATEGORYID)
);

CREATE SEQUENCE SEQ_PRODUCT;


-- 제품을 구매한 사람의 테이블
CREATE TABLE BUYPRODUCT(
   BNUM NUMBER(38) NOT NULL,
   PRONUM NUMBER(38) NOT NULL,
   BUYID VARCHAR(20),
   BCOUNT   NUMBER(38),
   TOTALPRICE NUMBER(38),
   BDATE DATE,
    CONSTRAINT BUYPRODUCT_PK PRIMARY KEY(BNUM),
    CONSTRAINT BUYPRODUCT_PRONUM_FK FOREIGN KEY(PRONUM) REFERENCES PRODUCT(PRONUM),
    CONSTRAINT BUYPRODUCT_USERID_FK FOREIGN KEY(BUYID) REFERENCES USER_INFO(USERID)
);

CREATE SEQUENCE SEQ_BUYPRODUCT;

-- 제품 사진 테이블
CREATE TABLE PRODUCTPHOTO(
   PHOTONUM NUMBER(38) NOT NULL,
   PRONUM NUMBER(38) NOT NULL,
   PHOTONAME VARCHAR(255),
   PHOTOPATH VARCHAR(255),
    CONSTRAINT PRODUCTPHOTO_PK PRIMARY KEY(PHOTONUM),
    CONSTRAINT PRODUCTPHOTO_FK FOREIGN KEY(PRONUM) REFERENCES PRODUCT(PRONUM)
);

CREATE SEQUENCE SEQ_PRODUCTPHOTO;

INSERT INTO QUESTION_TYPE VALUES('객관식',NULL);
INSERT INTO QUESTION_TYPE VALUES('주관식',NULL);
INSERT INTO QUESTION_TYPE VALUES('선택식',NULL);
INSERT INTO QUESTION_TYPE VALUES('랭킹',NULL);

INSERT INTO SURVEY_TYPE VALUES('1','정치');
INSERT INTO SURVEY_TYPE VALUES('2','경제');
INSERT INTO SURVEY_TYPE VALUES('3','사회');

COMMIT;