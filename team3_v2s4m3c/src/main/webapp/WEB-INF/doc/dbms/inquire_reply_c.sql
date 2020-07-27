/**********************************/
/* Table Name: 1��1���� ��� */
/**********************************/
DROP TABLE inquire_reply;
CREATE TABLE inquire_reply(
		inquire_replyno     NUMBER(10)		 NOT NULL PRIMARY KEY, -- ��� ��ȣ
        inquireno            NUMBER(10)		 NOT NULL, -- ���� ��ȣ
		mem_no             NUMBER(10)		 NOT NULL, -- ȸ�� ��ȣ
		reply_content       VARCHAR2(300)	 NOT NULL, -- �亯 ����
		reply_passwd       VARCHAR2(20)      NOT NULL, -- �н�����
		reply_rdate          DATE		             NOT NULL, -- �����
  FOREIGN KEY (inquireno) REFERENCES inquire (inquireno),
  FOREIGN KEY (mem_no) REFERENCES mem (mem_no)
);

COMMENT ON TABLE inquire_reply is '1��1���� �亯';
COMMENT ON COLUMN inquire_reply.replyno is '��� ��ȣ';
COMMENT ON COLUMN inquire_reply.inquireno is '���� ��ȣ';
COMMENT ON COLUMN inquire_reply.mem_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN inquire_reply.reply_content is '�亯 ����';
COMMENT ON COLUMN inquire_reply.reply_passwd is '�н�����';
COMMENT ON COLUMN inquire_reply.reply_rdate is '�����';


DROP SEQUENCE inquire_reply_seq;
CREATE SEQUENCE inquire_reply_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

1) ���
INSERT INTO inquire_reply(inquire_replyno, inquireno, mem_no, reply_content, reply_passwd, reply_rdate)
VALUES(inquire_reply_seq.nextval, 1, 1, '���1', '1234', sysdate);

INSERT INTO inquire_reply(inquire_replyno, inquireno, mem_no, reply_content, reply_passwd, reply_rdate)
VALUES(inquire_reply_seq.nextval, 1, 1, '���2', '1234', sysdate);

INSERT INTO inquire_reply(inquire_replyno, inquireno, mem_no, reply_content, reply_passwd, reply_rdate)
VALUES(inquire_reply_seq.nextval, 1, 1, '���3', '1234', sysdate);             

COMMIT;


2) ��ü ���
SELECT inquire_replyno, inquireno, mem_no, reply_content, reply_passwd, reply_rdate
FROM inquire_reply
ORDER BY inquire_replyno DESC;

SELECT inquire_replyno, inquireno, mem_no, reply_content, reply_passwd, reply_rdate
FROM inquire_reply
ORDER BY inquire_replyno ASC;

COMMIT;

 REPLYNO CONTENTSNO mem_no CONTENT PASSWD RDATE
 ------- ---------- -------- ------- ------ ---------------------
       3          1        1 ���3     1234   2019-12-17 16:59:38.0
       2          1        1 ���2     1234   2019-12-17 16:59:37.0
       1          1        1 ���1     1234   2019-12-17 16:59:36.0


3) inquireno �� ���
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
       3          1        1 ���3     1234   2019-12-17 16:59:38.0
       2          1        1 ���2     1234   2019-12-17 16:59:37.0
       1          1        1 ���1     1234   2019-12-17 16:59:36.0


4) ����
-- �н����� �˻�
SELECT count(reply_passwd) as cnt
FROM inquire_reply
WHERE inquire_replyno=1 AND reply_passwd='1234';

 CNT
 ---
   1
   
-- ����
DELETE FROM inquire_reply
WHERE inquire_replyno=4;

COMMIT;

5) inquireno �ش��ϴ� ��� �� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM inquire_reply
WHERE inquireno=1;

 CNT
 ---
   3

DELETE FROM inquire_reply
WHERE inquireno=1;

COMMIT;

6) mem_no�� �ش��ϴ� ��� �� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM inquire_reply
WHERE mem_no=1;

 CNT
 ---
   1

DELETE FROM inquire_reply
WHERE mem_no=1;

7) ȸ�� ID�� ���
SELECT m.mem_id,
           r.inquire_replyno, r.inquireno, r.mem_no, r.reply_content, r.reply_passwd, r.reply_rdate
FROM mem m,  inquire_reply r
WHERE (m.mem_no = r.mem_no) AND r.inquireno=1
ORDER BY inquire_replyno DESC;


 ID    REPLYNO CONTENTSNO MEMBERNO CONTENT                                                                                                                                                                         PASSWD RDATE
 ----- ------- ---------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------ ---------------------
 user1       3          1        1 ��� 3                                                                                                                                                                            123    2019-12-18 16:46:43.0
 user1       2          1        1 ��� 2                                                                                                                                                                            123    2019-12-18 16:46:39.0
 user1       1          1        1 ��� 1                                                                                                                                                                            123    2019-12-18 16:46:35.0
 
 
8) ������ �н����� �˻�
SELECT COUNT(*) as cnt
FROM inquire_reply
WHERE inquire_replyno=1 AND reply_passwd='1234';

 CNT
 ---
   0

9) ����
DELETE FROM inquire_reply
WHERE inquire_replyno=1;


