-- user 테이블 생성
CREATE TABLE user_info1(
	 userId VARCHAR(20) NOT NULL,
	 userPwd VARCHAR(255) NOT NULL,
	 userName VARCHAR(20) NOT NULL,
	 age NUMBER(5),
	 gender VARCHAR(6),
	 email 	VARCHAR(50),
	 phone 	VARCHAR(11),
	 address VARCHAR(100),
             recommend_id VARCHAR(20),
	 surveyCount NUMBER(100) DEFAUTL '0',
	 visitCount NUMBER(100) DEFAULT '0',
	 userType NUMBER(1) DEFAULT '2',
	 status VARCHAR(1) DEFAULT 'N',
     CONSTRAINT user_info_pk PRIMARY KEY (userId)
);

-- 회원가입 2단계 
CREATE TABLE user_info2(
    userId VARCHAR(20) NOT NULL,
    final_education VARCHAR(50),
    job VARCHAR(20),
    income VARCHAR(50),
    living_type VARCHAR(10),
    house_type VARCHAR(20),
    religion VARCHAR(10),
    marital_status VARCHAR(10),
    living_with VARCHAR(15),
    army_go VARCHAR(10),
    interest VARCHAR(300),
     CONSTRAINT user_info_fk FOREIGN KEY (userId) REFERENCES user_info1(userId) 
);

-- 공지사항 및 이벤트 테이블
CREATE TABLE notice (
    nNum NUMBER(38) NOT NULL,
    nWriter VARCHAR(20) NOT NULL,
     nWName VARCHAR(20),
    nTitle VARCHAR(100),
    nContent LONG,
    nCreateDT DATE,
    nUpdateDT DATE,
    nType VARCHAR(1),
    nStatus VARCHAR(1) DEFAULT 'N',
     CONSTRAINT notice_pk PRIMARY KEY(nNUM),
     CONSTRAINT notice_fk FOREIGN KEY(nWriter) REFERENCES user_info1(userId)
);

-- 덧글 테이블
CREATE TABLE comment (
    cNum NUMBER(38) NOT NULL,
    nNum NUMBER(38) NOT NULL,
    cWriter VARCHAR(20) NOT NULL,
    cContent LONG,
    cCreateDT DATE DEFAULT SYSDATE,
    cUpdateDT DATE DEFAULT SYSDATE,
    cStatus VARCHAR(1) DEFAULT 'N',
     CONSTRAINT comment_pk PRIMARY KEY(cNum),
     CONSTRAINT comment_cNUM_fk FOREIGN KEY(nNum) REFERENCES notice(nNum),
     CONSTRAINT comment_cWriter_fk FOREIGN KEY(cWriter) REFERENCES user_info1(userId)
);

-- QnA 테이블
CREATE TABLE QnA(
    qnaNum NUMBER(38) NOT NULL,
    userId VARCHAR(20) NOT NULL,
    qnaTitle VARCHAR(100),
    qnaContent LONG,
    qnaType VARCHAR(1),
    aContent LONG,
     CONSTRAINT QnA_pk PRIMARY KEY(qnaNum),
     CONSTRAINT QnA_fk FOREIGN KEY(userId) REFERENCES user_info1(userId)
);
                  
-- point 테이블
CREATE TABLE  point  (
    pNum NUMBER(38) NOT NULL,
     userId VARCHAR(20) NOT NULL,
    point NUMBER(38),
    pDate DATE,
    pContent VARCHAR(100),
     CONSTRAINT point_pk PRIMARY KEY(pNum),
     CONSTRAINT point_fk FOREIGN KEY(userId) REFERENCES user_info1(userId)
);

-- survey 테이블
CREATE TABLE  survey (
    sNum NUMBER(38) NOT NULL,
    sType VARCHAR(255) NOT NULL,
    sTitle VARCHAR(255),
    sStartDT DATE,
    sEndDT DATE,
    sCount VARCHAR(255),
    sStatus VARCHAR(255),
    sTarget VARCHAR(255),
     sPoint NUMBER(38),   -- 설문조사 포인트
     sCreateDT DATE, -- 설문만든날짜
     sUserId VARCHAR(20) -- 설문등록 아이디
);