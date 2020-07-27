/**********************************/
/* Table Name: �������� */
/**********************************/
DROP TABLE notice;
CREATE TABLE notice(
      noticeno              NUMBER(10)     NOT NULL PRIMARY KEY, -- ���� ��ȣ
      notice_title           VARCHAR2(100)     NOT NULL, -- ���� ����
      notice_content      VARCHAR2(100)     NOT NULL, -- ���� ����
      notice_rname        VARCHAR2(10)    NOT NULL, -- �����
      notice_passwd       VARCHAR2(15)    NOT NULL, -- �н�����
      notice_visible        CHAR(1)    DEFAULT 'Y'     NOT NULL, -- ��� ���
      notice_cnt             NUMBER(7)     NOT NULL, -- ��ȸ��
      notice_division       VARCHAR2(10)    NOT NULL, -- ����
      word                  VARCHAR2(300)        NULL , -- �˻���
      notice_rdate          DATE               NOT NULL -- �����  
);

COMMENT ON TABLE notice is '��������';
COMMENT ON COLUMN notice.noticeno is '���� ��ȣ';
COMMENT ON COLUMN notice.notice_title is '���� ����';
COMMENT ON COLUMN notice.notice_content is '���� ����';
COMMENT ON COLUMN notice.notice_rname is '�����';
COMMENT ON COLUMN notice.notice_passwd is '�н�����';
COMMENT ON COLUMN notice.notice_visible is '��� ���';
COMMENT ON COLUMN notice.notice_cnt is '��ȸ��';
COMMENT ON COLUMN notice.notice_division is '����';
COMMENT ON COLUMN notice.word is '�˻���';
COMMENT ON COLUMN notice.notice_rdate is '�����';


DROP SEQUENCE notice_seq;
CREATE SEQUENCE notice_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����


1) �������� ���
INSERT INTO notice(noticeno, notice_title, notice_content, notice_rname, notice_passwd, notice_visible, notice_cnt, notice_division, notice_rdate)
VALUES(notice_seq.nextval, '��������1', '��������', '������1', '1234', 'Y', 0, '����', sysdate);

INSERT INTO notice(noticeno, notice_title, notice_content, notice_rname, notice_passwd, notice_visible, notice_cnt, notice_division, notice_rdate)
VALUES(notice_seq.nextval, '��������2', '������', '������2', '1234', 'Y', 0, '�Ϲ�', sysdate);
            
INSERT INTO notice(noticeno, notice_title, notice_content, notice_rname, notice_passwd, notice_visible, notice_cnt, notice_division, notice_rdate)
VALUES(notice_seq.nextval, '��������3', '����', '������3', '1234', 'Y', 0, '����', sysdate);

commit;

2-1) ��ü���
SELECT noticeno, notice_title, notice_content, notice_rname, notice_passwd, notice_visible, notice_cnt, notice_division, notice_rdate
FROM notice 
ORDER BY noticeno DESC;

2-2) �˻� ���
1) �˻�
�� �˻� ���
-- title, content, word column search
SELECT noticeno, notice_title, notice_content, notice_rname,
           notice_cnt, notice_division, notice_rdate
FROM notice
WHERE (notice_title LIKE '%����%' OR notice_content LIKE '%����%')
ORDER BY noticeno DESC;


�� �˻� ���ڵ� ����
-- ��ü ���ڵ� ����
SELECT COUNT(*) as cnt
FROM notice
WHERE noticeno=1;

-- cateno �� �˻��� ���ڵ� ����
SELECT COUNT(*) as cnt
FROM notice
WHERE noticeno=1 AND notice_title LIKE '%����%';

SELECT COUNT(*) as cnt
FROM notice
WHERE noticeno=1 AND (notice_title LIKE '%����%' OR notice_content LIKE '%����%')


3) 1�� ��ȸ
SELECT noticeno, notice_title, notice_content, notice_rname, notice_passwd, notice_visible, notice_cnt, notice_division, notice_rdate
FROM notice 
WHERE noticeno = 1;

4) ����
UPDATE notice 
SET notice_title='��������11', notice_content='��������2', notice_rname='����', notice_visible='N'
WHERE noticeno = 4;

COMMIT;

5) �н����� �˻�
SELECT COUNT(*) as notice_passwd_cnt
FROM notice
WHERE noticeno=1 AND notice_passwd='1234';

SELECT noticeno, notice_passwd
FROM notice 
ORDER BY noticeno DESC;    

6) ����
DELETE FROM notice
WHERE noticeno=4;

COMMIT;  


7) ��ȸ��
UPDATE notice
SET notice_cnt = notice_cnt + 1
WHERE noticeno = 1;

8) ��� ����� ����
UPDATE notice
SET notice_visible='Y'
WHERE noticeno=1;

UPDATE notice
SET notice_visible='N'
WHERE noticeno=1;

commit;  
  
  
12) �˻� + ����¡
SELECT noticeno, notice_title, notice_content, notice_rname,
           notice_cnt, notice_division, notice_rdate
FROM notice
WHERE noticeno=1 AND (notice_title LIKE '%����%' OR notice_content LIKE '%����%')
ORDER BY noticeno DESC;



-- step 1
SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate
FROM notice
WHERE noticeno=1 AND notice_title LIKE '%����%'
ORDER BY noticeno DESC;

-- step 2
SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate, rownum as r
FROM (
          SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate
          FROM notice
          WHERE (notice_title LIKE '%����%' OR notice_content LIKE '%����%')
          ORDER BY noticeno DESC
);

-- step 3, 1 page
SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate, r
FROM (
           SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate, rownum as r
           FROM (
                     SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate
                     FROM notice
                     WHERE (notice_title LIKE '%����%' OR notice_content LIKE '%����%')
                     ORDER BY noticeno DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate, r
FROM (
           SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate, rownum as r
           FROM (
                     SELECT noticeno, notice_title, notice_content, notice_rname, notice_cnt, notice_division, notice_rdate
                     FROM notice
                     WHERE (notice_title LIKE '%����%' OR notice_content LIKE '%����%')
                     ORDER BY noticeno DESC
           )          
)
WHERE r >= 11 AND r <= 20;
 




