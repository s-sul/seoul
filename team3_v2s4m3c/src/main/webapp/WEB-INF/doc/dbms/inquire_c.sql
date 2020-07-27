/**********************************/
/* Table Name: 1��1���� */
/**********************************/
DROP TABLE inquire;
CREATE TABLE inquire(
		inquireno          	NUMBER(10)		 NOT NULL PRIMARY KEY, -- ���� ��ȣ
        mem_no             NUMBER(10)		 NOT NULL, -- ȸ�� ��ȣ
		inquire_title       	VARCHAR2(100)	 NOT NULL, -- ���� ����
		inquire_content  	VARCHAR2(300)	 NOT NULL, -- ���� ����
		inquire_rname   	VARCHAR2(10)		 NOT NULL, -- �����
		inquire_passwd 		VARCHAR2(15)		 NOT NULL, -- �н�����
        word                 VARCHAR2(300)	 NULL, -- �˻���
		inquire_rdate        DATE		             NOT NULL, -- �����
        FOREIGN KEY (mem_no) REFERENCES mem (mem_no)
);

COMMENT ON TABLE inquire is '1��1����';
COMMENT ON COLUMN inquire.inquireno is '���� ��ȣ';
COMMENT ON COLUMN inquire.mem_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN inquire.inquire_title is '���� ����';
COMMENT ON COLUMN inquire.inquire_content is '���� ����';
COMMENT ON COLUMN inquire.inquire_rname is '�����';
COMMENT ON COLUMN inquire.inquire_passwd is '�н�����';
COMMENT ON COLUMN inquire.word is '�˻���';
COMMENT ON COLUMN inquire.inquire_rdate is '�����';


DROP SEQUENCE inquire_seq;
CREATE SEQUENCE inquire_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


1) ���� ���
INSERT INTO inquire(inquireno, mem_no, inquire_title, inquire_content, inquire_rname, inquire_passwd, inquire_rdate)
VALUES(inquire_seq.nextval, 1, '����1', '���ǻ���1', 'ȸ��1', '1234', sysdate);

INSERT INTO inquire(inquireno, mem_no, inquire_title, inquire_content, inquire_rname, inquire_passwd, inquire_rdate)
VALUES(inquire_seq.nextval, 1, '����2', '���ǻ���2', 'ȸ��1', '1234', sysdate);
            
INSERT INTO inquire(inquireno, mem_no, inquire_title, inquire_content, inquire_rname, inquire_passwd, inquire_rdate)
VALUES(inquire_seq.nextval, 1, '����3', '���ǻ���3', 'ȸ��1', '1234', sysdate);

commit;

2) ��ü���
SELECT inquireno, mem_no, inquire_title, inquire_content, inquire_rname, inquire_passwd, inquire_rdate
FROM inquire 
ORDER BY inquireno DESC;


3) 1�� ��ȸ
SELECT inquireno, mem_no, inquire_title, inquire_content, inquire_rname, inquire_passwd, inquire_rdate
FROM inquire 
WHERE inquireno = 1;

4) ����
UPDATE inquire 
SET inquire_title='����11', inquire_content='����11'
WHERE inquireno = 4;

COMMIT;

5) �н����� �˻�
SELECT COUNT(*) as inquire_passwd_cnt
FROM inquire
WHERE inquireno=1 AND inquire_passwd='1234';

SELECT inquireno, inquire_passwd
FROM inquire 
ORDER BY inquireno DESC;    

6) ����
DELETE FROM inquire
WHERE inquireno=4;

COMMIT;  


7) ����¡
SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate
FROM inquire
ORDER BY inquireno DESC;

-- step 1
SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate
FROM inquire
ORDER BY inquireno DESC;

-- step 2
SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate, rownum as r
FROM (
          SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate
          FROM inquire
          ORDER BY inquireno DESC
);

-- step 3, 1 page
SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate, r
FROM (
           SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate, rownum as r
           FROM (
                     SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate
                     FROM inquire
                     ORDER BY inquireno DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate, r
FROM (
           SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate, rownum as r
           FROM (
                     SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate
                     FROM inquire
                     ORDER BY inquireno DESC
           )          
)
WHERE r >= 11 AND r <= 20;