/**********************************/
/* Table Name: 1대1문의 댓글 */
/**********************************/
DROP TABLE inquire_reply;
CREATE TABLE inquire_reply(
		inquire_replyno     NUMBER(10)		 NOT NULL PRIMARY KEY, -- 댓글 번호
        inquireno            NUMBER(10)		 NOT NULL, -- 문의 번호
		mem_no             NUMBER(10)		 NOT NULL, -- 회원 번호
		reply_content       VARCHAR2(300)	 NOT NULL, -- 답변 내용
		reply_passwd       VARCHAR2(20)      NOT NULL, -- 패스워드
		reply_rdate          DATE		             NOT NULL, -- 등록일
  FOREIGN KEY (inquireno) REFERENCES inquire (inquireno),
  FOREIGN KEY (mem_no) REFERENCES mem (mem_no)
);

COMMENT ON TABLE inquire_reply is '1대1문의 답변';
COMMENT ON COLUMN inquire_reply.replyno is '댓글 번호';
COMMENT ON COLUMN inquire_reply.inquireno is '문의 번호';
COMMENT ON COLUMN inquire_reply.mem_no is '회원 번호';
COMMENT ON COLUMN inquire_reply.reply_content is '답변 내용';
COMMENT ON COLUMN inquire_reply.reply_passwd is '패스워드';
COMMENT ON COLUMN inquire_reply.reply_rdate is '등록일';


DROP SEQUENCE inquire_reply_seq;
CREATE SEQUENCE inquire_reply_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

1) 등록
INSERT INTO inquire_reply(inquire_replyno, inquireno, mem_no, reply_content, reply_passwd, reply_rdate)
VALUES(inquire_reply_seq.nextval, 1, 1, '댓글1', '1234', sysdate);

INSERT INTO inquire_reply(inquire_replyno, inquireno, mem_no, reply_content, reply_passwd, reply_rdate)
VALUES(inquire_reply_seq.nextval, 1, 1, '댓글2', '1234', sysdate);

INSERT INTO inquire_reply(inquire_replyno, inquireno, mem_no, reply_content, reply_passwd, reply_rdate)
VALUES(inquire_reply_seq.nextval, 1, 1, '댓글3', '1234', sysdate);             

COMMIT;


2) 전체 목록
SELECT inquire_replyno, inquireno, mem_no, reply_content, reply_passwd, reply_rdate
FROM inquire_reply
ORDER BY inquire_replyno DESC;

SELECT inquire_replyno, inquireno, mem_no, reply_content, reply_passwd, reply_rdate
FROM inquire_reply
ORDER BY inquire_replyno ASC;

COMMIT;

 REPLYNO CONTENTSNO mem_no CONTENT PASSWD RDATE
 ------- ---------- -------- ------- ------ ---------------------
       3          1        1 댓글3     1234   2019-12-17 16:59:38.0
       2          1        1 댓글2     1234   2019-12-17 16:59:37.0
       1          1        1 댓글1     1234   2019-12-17 16:59:36.0


3) inquireno 별 목록
SELECT inquire_replyno, inquireno, mem_no, reply_content, reply_passwd, reply_rdate
FROM inquire_reply
WHERE inquireno=1
ORDER BY inquire_replyno DESC;

SELECT inquire_replyno, inquireno, mem_no, reply_content, reply_passwd, reply_rdate
FROM inquire_reply
WHERE inquireno=1
ORDER BY inquire_replyno ASC;

 REPLYNO CONTENTSNO mem_no CONTENT PASSWD RDATE
 ------- ---------- -------- ------- ------ ---------------------
       3          1        1 댓글3     1234   2019-12-17 16:59:38.0
       2          1        1 댓글2     1234   2019-12-17 16:59:37.0
       1          1        1 댓글1     1234   2019-12-17 16:59:36.0


4) 삭제
-- 패스워드 검사
SELECT count(reply_passwd) as cnt
FROM inquire_reply
WHERE inquire_replyno=1 AND reply_passwd='1234';

 CNT
 ---
   1
   
-- 삭제
DELETE FROM inquire_reply
WHERE inquire_replyno=4;

COMMIT;

5) inquireno 해당하는 댓글 수 확인 및 삭제
SELECT COUNT(*) as cnt
FROM inquire_reply
WHERE inquireno=1;

 CNT
 ---
   3

DELETE FROM inquire_reply
WHERE inquireno=1;

COMMIT;

6) mem_no에 해당하는 댓글 수 확인 및 삭제
SELECT COUNT(*) as cnt
FROM inquire_reply
WHERE mem_no=1;

 CNT
 ---
   1

DELETE FROM inquire_reply
WHERE mem_no=1;

7) 회원 ID의 출력
SELECT m.mem_id,
           r.inquire_replyno, r.inquireno, r.mem_no, r.reply_content, r.reply_passwd, r.reply_rdate
FROM mem m,  inquire_reply r
WHERE (m.mem_no = r.mem_no) AND r.inquireno=1
ORDER BY inquire_replyno DESC;


 ID    REPLYNO CONTENTSNO MEMBERNO CONTENT                                                                                                                                                                         PASSWD RDATE
 ----- ------- ---------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------ ---------------------
 user1       3          1        1 댓글 3                                                                                                                                                                            123    2019-12-18 16:46:43.0
 user1       2          1        1 댓글 2                                                                                                                                                                            123    2019-12-18 16:46:39.0
 user1       1          1        1 댓글 1                                                                                                                                                                            123    2019-12-18 16:46:35.0
 
 
8) 삭제용 패스워드 검사
SELECT COUNT(*) as cnt
FROM inquire_reply
WHERE inquire_replyno=1 AND reply_passwd='1234';

 CNT
 ---
   0

9) 삭제
DELETE FROM inquire_reply
WHERE inquire_replyno=1;


