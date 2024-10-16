CREATE TABLE INQUIRY_BOARD (
inquiry_num NUMBER PRIMARY KEY,
user_nick VARCHAR2(100) NOT NULL,
inquiry_title VARCHAR2(100) NOT NULL,
inquiry_content CLOB,
inquiry_create_date DATE DEFAULT SYSDATE NOT NULL,
inquiry_ofile VARCHAR2(200),
inquiry_sfile VARCHAR2(300),
downcount NUMBER(5) DEFAULT 0 NOT NULL,
visitcount NUMBER DEFAULT 0 NOT NULL,
CONSTRAINT fk_user_nick_inquiry FOREIGN KEY(user_nick) REFERENCES USERS(user_nick)
ON DELETE CASCADE
);

CREATE TABLE INQUIRY_COMMENT (
inquiry_comment_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
inquiry_num NUMBER NOT NULL,
user_nick VARCHAR2(100) NOT NULL,
inquiry_comment_content VARCHAR2(1000) NOT NULL,
created_at DATE DEFAULT SYSDATE NOT NULL,
CONSTRAINT fk_inquiry_num FOREIGN KEY (inquiry_num) REFERENCES inquiry_BOARD(inquiry_num)
ON DELETE CASCADE,
CONSTRAINT fk_user_nick_comment_inquiry FOREIGN KEY (user_nick) REFERENCES USERS(user_nick)
ON DELETE CASCADE
);

CREATE SEQUENCE inquiry_comment_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create sequence inquiry_board_seq
increment by 1  -- 1씩 증가
start with 1    
minvalue 1      
nomaxvalue      
nocycle         
nocache;    

commit;



--inquiry 좋아요 테이블 생성
CREATE TABLE INQUIRY_LIKES (
    like_id NUMBER PRIMARY KEY,
    inquiry_num NUMBER NOT NULL,
    user_nick VARCHAR2(100) NOT NULL,
    like_date DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT fk_like_inquirynew FOREIGN KEY(inquiry_num) REFERENCES INQUIRY_BOARD(inquiry_num)
    ON DELETE CASCADE,
    CONSTRAINT fk_like_usernew FOREIGN KEY(user_nick) REFERENCES USERS(user_nick)
    ON DELETE CASCADE
);

-- inquiry 좋아요 시퀀스 생성
CREATE SEQUENCE inquiry_likes_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE;

commit;

-- 더미 데이터 삽입
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (1, 'user1', '문의 제목 1', '문의 내용 1', SYSDATE, 'ofile1.txt', 'sfile1.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (2, 'user2', '문의 제목 2', '문의 내용 2', SYSDATE, 'ofile2.txt', 'sfile2.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (3, 'user3', '문의 제목 3', '문의 내용 3', SYSDATE, 'ofile3.txt', 'sfile3.png', 0, 0);
-- 추가 데이터
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (4, 'user4', '문의 제목 4', '문의 내용 4', SYSDATE, 'ofile4.txt', 'sfile4.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (5, 'user5', '문의 제목 5', '문의 내용 5', SYSDATE, 'ofile5.txt', 'sfile5.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (6, 'user6', '문의 제목 6', '문의 내용 6', SYSDATE, 'ofile6.txt', 'sfile6.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (7, 'user7', '문의 제목 7', '문의 내용 7', SYSDATE, 'ofile7.txt', 'sfile7.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (8, 'user8', '문의 제목 8', '문의 내용 8', SYSDATE, 'ofile8.txt', 'sfile8.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (9, 'user9', '문의 제목 9', '문의 내용 9', SYSDATE, 'ofile9.txt', 'sfile9.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (10, 'user10', '문의 제목 10', '문의 내용 10', SYSDATE, 'ofile10.txt', 'sfile10.png', 0, 0);
-- 더미 데이터 삽입
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (11, 'user11', '문의 제목 11', '문의 내용 11', SYSDATE, 'ofile1.txt', 'sfile1.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (12, 'user12', '문의 제목 12', '문의 내용 12', SYSDATE, 'ofile2.txt', 'sfile2.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (13, 'user13', '문의 제목 13', '문의 내용 13', SYSDATE, 'ofile3.txt', 'sfile3.png', 0, 0);
-- 추가 데이터
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (14, 'user14', '문의 제목 14', '문의 내용 14', SYSDATE, 'ofile4.txt', 'sfile4.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (15, 'user15', '문의 제목 15', '문의 내용 15', SYSDATE, 'ofile5.txt', 'sfile5.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (16, 'user16', '문의 제목 16', '문의 내용 16', SYSDATE, 'ofile6.txt', 'sfile6.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (17, 'user17', '문의 제목 17', '문의 내용 17', SYSDATE, 'ofile7.txt', 'sfile7.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (18, 'user18', '문의 제목 18', '문의 내용 18', SYSDATE, 'ofile8.txt', 'sfile8.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (19, 'user19', '문의 제목 19', '문의 내용 19', SYSDATE, 'ofile9.txt', 'sfile9.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (20, 'user20', '문의 제목 20', '문의 내용 20', SYSDATE, 'ofile10.txt', 'sfile10.png', 0, 0);
-- 더미 데이터 삽입
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (21, 'user1', '문의 제목 21', '문의 내용 21', SYSDATE, 'ofile1.txt', 'sfile1.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (22, 'user2', '문의 제목 22', '문의 내용 22', SYSDATE, 'ofile2.txt', 'sfile2.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (23, 'user23', '문의 제목 23', '문의 내용 23', SYSDATE, 'ofile3.txt', 'sfile3.png', 0, 0);
-- 추가 데이터
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (24, 'user4', '문의 제목 24', '문의 내용 24', SYSDATE, 'ofile4.txt', 'sfile4.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (25, 'user5', '문의 제목 25', '문의 내용 25', SYSDATE, 'ofile5.txt', 'sfile5.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (26, 'user26', '문의 제목 26', '문의 내용 26', SYSDATE, 'ofile6.txt', 'sfile6.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (27, 'user27', '문의 제목 27', '문의 내용 27', SYSDATE, 'ofile7.txt', 'sfile7.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (28, 'user28', '문의 제목 28', '문의 내용 28', SYSDATE, 'ofile8.txt', 'sfile8.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (29, 'user29', '문의 제목 29', '문의 내용 29', SYSDATE, 'ofile9.txt', 'sfile9.png', 0, 0);
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (30, 'user30', '문의 제목 30', '문의 내용 30', SYSDATE, 'ofile10.txt', 'sfile10.png', 0, 0);

commit;

SELECT inquiry_board_seq.NEXTVAL FROM dual;
SELECT inquiry_board_seq.currval FROM dual;