--CREATE SEQUENCE USERS_num
--increment by 1
--start with 1
--minvalue 1
--nomaxvalue
--nocycle
--nocache;

CREATE TABLE USERS(
    user_id varchar2(100) PRIMARY KEY not null,
    user_nick varchar2(100) UNIQUE not null,
    user_pwd varchar2(100) not null,
    user_name varchar2(100) not null,
    user_phone varchar2(100) not null,
    user_email varchar2(100) UNIQUE not null,
    user_zipcode varchar2(100) not null,
    user_address varchar2(200) not null,
    user_create_date DATE not null,
    authority varchar2(20) default 'ROLE_USER',
    enabled number(1) default 1,
    social_id varchar2(100), -- 소셜 로그인 ID (예: Google, Facebook ID)
    social_provider varchar2(50), -- 소셜 로그인 제공자 (예: google, facebook, naver 등)
    social_email varchar2(100), -- 소셜 로그인 이메일 (사용자 이메일과 다를 수 있음)
    failed_attempts NUMBER(5) DEFAULT 0,       -- 로그인 실패 시도 횟수
    account_locked NUMBER(1) DEFAULT 0 
);

SELECT * FROM USERS;      
    
SELECT ACCOUNT_LOCKED, FAILED_ATTEMPTS
FROM USERS
WHERE USER_ID = 'lckdrbs';

SELECT * FROM USERS;  

-- 더미 데이터 삽입
INSERT INTO USERS (user_id, user_nick, user_pwd, user_name, user_phone, user_email, user_zipcode, user_address, user_create_date, authority, enabled, social_id, social_provider, social_email, failed_attempts, account_locked)
VALUES ('user1_id', 'user1', 'pwd1', '사용자1', '010-1111-1111', 'user1@example.com', '12345', '서울시 강남구', SYSDATE, 'ROLE_USER', 1, NULL, NULL, NULL, 0, 0);

INSERT INTO USERS (user_id, user_nick, user_pwd, user_name, user_phone, user_email, user_zipcode, user_address, user_create_date, authority, enabled, social_id, social_provider, social_email, failed_attempts, account_locked)
VALUES ('user2_id', 'user2', 'pwd2', '사용자2', '010-2222-2222', 'user2@example.com', '23456', '서울시 서초구', SYSDATE, 'ROLE_USER', 1, NULL, NULL, NULL, 0, 0);

INSERT INTO USERS (user_id, user_nick, user_pwd, user_name, user_phone, user_email, user_zipcode, user_address, user_create_date, authority, enabled, social_id, social_provider, social_email, failed_attempts, account_locked)
VALUES ('user3_id', 'user3', 'pwd3', '사용자3', '010-3333-3333', 'user3@example.com', '34567', '서울시 송파구', SYSDATE, 'ROLE_USER', 1, NULL, NULL, NULL, 0, 0);

-- 추가 더미 데이터 삽입
INSERT INTO USERS (user_id, user_nick, user_pwd, user_name, user_phone, user_email, user_zipcode, user_address, user_create_date, authority, enabled, social_id, social_provider, social_email, failed_attempts, account_locked)
VALUES ('user4_id', 'user4', 'pwd4', '사용자4', '010-4444-4444', 'user4@example.com', '45678', '서울시 마포구', SYSDATE, 'ROLE_USER', 1, NULL, NULL, NULL, 0, 0);

INSERT INTO USERS (user_id, user_nick, user_pwd, user_name, user_phone, user_email, user_zipcode, user_address, user_create_date, authority, enabled, social_id, social_provider, social_email, failed_attempts, account_locked)
VALUES ('user5_id', 'user5', 'pwd5', '사용자5', '010-5555-5555', 'user5@example.com', '56789', '서울시 영등포구', SYSDATE, 'ROLE_USER', 1, NULL, NULL, NULL, 0, 0);

-- 데이터 반복 삽입
BEGIN
   FOR i IN 6..30 LOOP
      INSERT INTO USERS (user_id, user_nick, user_pwd, user_name, user_phone, user_email, user_zipcode, user_address, user_create_date, authority, enabled, social_id, social_provider, social_email, failed_attempts, account_locked)
      VALUES ('user' || i || '_id', 'user' || i, 'pwd' || i, '사용자' || i, '010-' || i || i || i || i || '-' || i || i || i || i, 'user' || i || '@example.com', 'zipcode' || i, '서울시 주소' || i, SYSDATE, 'ROLE_USER', 1, NULL, NULL, NULL, 0, 0);
   END LOOP;
END;
/
commit;