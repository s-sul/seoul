DROP TABLE at CASCADE CONSTRAINTS;
DROP SEQUENCE at_seq;

/**********************************/
/* Table Name: ��ǰ */
/**********************************/
CREATE TABLE AT(
		AT_NO                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_GRP_NO                     		NUMBER(10)		 NOT NULL,
		AT_SEQNO                      		NUMBER(7)		 NOT NULL,
		AT_VISIBLE                    		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		AT_NAME                       		VARCHAR2(100)		 NOT NULL,
		AT_DETAIL                     		VARCHAR2(100)		 NOT NULL,
		AT_PRICE                      		NUMBER(10)		 NOT NULL,
		AT_CONTENT                    		CLOB		 NOT NULL,
		AT_CANCLE                     		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		AT_LOWEST                     		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		AT_HIT                        		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		AT_DUR                        		NUMBER(10)		 NOT NULL,
		AT_LANG                       		VARCHAR2(100)		 NOT NULL,
		AT_TAG                        		VARCHAR2(1000)		 NOT NULL,
		AT_MAP                        		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (AT_GRP_NO) REFERENCES AT_GRP (AT_GRP_NO)
);

COMMENT ON TABLE AT is '��ǰ';
COMMENT ON COLUMN AT.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN AT.AT_GRP_NO is '��ǰ�׷��ȣ';
COMMENT ON COLUMN AT.AT_SEQNO is '��ǰ��¼���';
COMMENT ON COLUMN AT.AT_VISIBLE is '��ǰ��¸��';
COMMENT ON COLUMN AT.AT_NAME is '��ǰ��';
COMMENT ON COLUMN AT.AT_DETAIL is '��ǰ���';
COMMENT ON COLUMN AT.AT_PRICE is '��ǰ����';
COMMENT ON COLUMN AT.AT_CONTENT is '��ǰ����';
COMMENT ON COLUMN AT.AT_CANCLE is '��ǰ��Ұ��ɿ���';
COMMENT ON COLUMN AT.AT_LOWEST is '��ǰ���������忩��';
COMMENT ON COLUMN AT.AT_HIT is '��ǰ��ȸ��';
COMMENT ON COLUMN AT.AT_DUR is '��ǰ�ҿ�ð�';
COMMENT ON COLUMN AT.AT_LANG is '��ǰ�������';
COMMENT ON COLUMN AT.AT_TAG is '��ǰ�±�;
COMMENT ON COLUMN AT.AT_MAP is '��ǰ����';

DROP SEQUENCE at_seq;
CREATE SEQUENCE at_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  commit;
  
  ---------------------------------------------------------------

-- 1)Create

INSERT INTO at(at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail, 
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map)
VALUES (at_seq.nextval, 1, 1, 'Y', '�����ڶ�', '���޴� �̿��', 50000, '�߱���', 'Y', 'Y', 0, 2, '����', 'http://www.daum.net', 0);

INSERT INTO at(at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail, 
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map)
VALUES (at_seq.nextval, 1, 1, 'Y', 'Ƽ����24', '3�� ��Ʈ', 40000, 'ȣ�� � ����', 'Y', 'Y', 0, 2, '����', 'http://www.daum.net', 0);

INSERT INTO at(at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail, 
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map)
VALUES (at_seq.nextval, 1, 1, 'Y', '����ġŲ', '�ݹ�', 50000, '�̹�ȣ ���� ġŲ��', 'Y', 'Y', 0, 2, '����', 'http://www.daum.net', 0);

INSERT INTO at(at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail, 
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map)
VALUES (at_seq.nextval, 2, 1, 'Y', '�Ѻ�ü��', '�溹�� �Ѻ�ü��', 50000, '�Ѻ� ����� �溹�� ���� ����!', 'Y', 'Y', 0, 2, '����', 'http://www.daum.net', 0);

INSERT INTO at(at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail, 
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map)
VALUES (at_seq.nextval, 2, 1, 'Y', '�Ե�����Ÿ��', '������ �����', 50000, '�ʰ��� �����뿡�� �߰���!', 'Y', 'Y', 0, 2, '����', 'http://www.daum.net', 0);

COMMIT;

-- 2)List

SELECT at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail, 
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map
FROM at
ORDER BY at_no ASC; 

-- 3)Read
SELECT at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail, 
at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map
FROM at
WHERE at_no =1; 


-- 4)Update
UPDATE at
SET at_name='�����ڶ�'
WHERE at_no = 1;


-- 5)Delete
DELETE FROM at
WHERE at_no=1;  --���� ���̺��� ���� ���� �Ұ� (child record found)
-- ���� ��ǰ ���� ( child table���� row ����)

DELETE FROM at ON DELETE CASCADE 
WHERE at_no=1

 
-- ��� ���������� ��ü ���
SELECT at_no, at_grp_no, at_seqno, at_visible, at_name, at_detail, at_price, at_content, at_cancle, at_lowest, at_hit, at_dur, at_lang, at_sns, at_map
FROM at
ORDER BY at_seqno ASC;

-- ��� ���� ����, 10 �� 1
UPDATE at
SET at_seqno = at_seqno - 1
WHERE at_no=1;

-- ��¼��� ����, 1 �� 10
UPDATE at
SET at_seqno = at_seqno + 1
WHERE at_no=1;

 -- ��ü ���ڵ� ����
SELECT COUNT(*) as cnt
FROM at


-- at+ list + ����¡ +�˻�
select *
from at


SELECT at_no, at_img_fupname, at_grp_no, at_seqno, at_visible, at_name, at_detail, at_price, dates_date, r
FROM (
           SELECT at_no, at_img_fupname, at_grp_no, at_seqno, at_visible, at_name, at_detail, at_price, dates_date, rownum as r
           FROM (
                     SELECT a.at_no, b.at_img_fupname, a.at_grp_no, a.at_seqno, a.at_visible, a.at_name, a.at_detail, a.at_price, c.dates_date
                     FROM at a, at_img b, dates c
                     WHERE a.at_no = b.at_no and at_grp_no=1 and b.at_img_seqno=0 and (a.at_name like '%����%' or dates_date='2020-09-17')
                     ORDER BY at_seqno DESC
                )         
)
WHERE r >= 1 AND r <= 10;

-- Ư�� ��ǰ �ش糯¥ ��� ��� : at.at_no=1 �� ����������  dates.dates_date='2020-07-01' ����ϰ��� �� //��� ������ŭ �ݺ�
-- �ڡڡڡڡ� ������ at_no ����ϱ�!!!!(���� insert�������� nextval�� 1���� ���� �Ǵ� ��), ���� �� row ��� ����
INSERT  ALL
INTO    at   VALUES (at_seq.nextval, 1, 1, 'Y', '��������屹', '��ġ�ᳪ����', 15000, '100�� ������ ��ġ�ᳪ�������Դϴ�. ������� ������ ���', 'Y', 'Y', 0, 2, '����', 'http://www.daum.net', 0)
INTO    dates   VALUES (dates_seq.nextval, at_seq.nextval, '2020-07-28')
SELECT  *
FROM    DUAL;

rollback;


at_name ���� ���� ����Ʈ  + dates_date ���� ���� ����Ʈ

select a.at_no, a.at_name, b.at_img_fupname
from at a, at_img b
where a.at_no = b.at_no and at_img_seqno =0

union

select a.at_no, a.at_name, b.dates_date
from at a, dates b
where b.dates_date = '2020-09-05'



 https://richtiger.tistory.com/entry/UNION-GROUP-BY-%EC%9D%B4%EC%9A%A9%ED%95%9C-%EB%8D%B0%EC%9D%B4%ED%84%B0%EC%97%B0%EA%B2%B0%EA%B8%B0%EB%B2%95%EC%86%8C%EA%B0%9C%EC%9D%91%EC%9A%A9%EC%82%AC%EB%A1%80
