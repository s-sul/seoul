/**********************************/
/* Table Name: ���� ���� ���� */
/**********************************/
DROP TABLE faq;
CREATE TABLE faq(
        faqno                   NUMBER(10)       NOT NULL, -- ���� ��ȣ
        faq_title               VARCHAR2(100)    NOT NULL, -- ���� ����
        faq_content             VARCHAR2(100)    NOT NULL, -- ���� ����
        faq_rname           VARCHAR2(10)         NOT NULL, -- �����
        faq_passwd          VARCHAR2(15)         NOT NULL, -- �н�����
        faq_seqno            NUMBER(10)      NOT NULL, -- ��� ����
        faq_division          VARCHAR2(10)    NOT NULL, -- ����
        word                  VARCHAR2(300)   NULL , -- �˻���
        faq_date              DATE                   NOT NULL -- �����
);

COMMENT ON TABLE faq is '���� ���� ����';
COMMENT ON COLUMN faq.faqno is '���� ��ȣ';
COMMENT ON COLUMN faq.faq_title is '���� ����';
COMMENT ON COLUMN faq.faq_content is '���� ����';
COMMENT ON COLUMN faq.faq_rname is '�����';
COMMENT ON COLUMN faq.faq_passwd is '�н�����';
COMMENT ON COLUMN faq.faq_seqno is '��� ����';
COMMENT ON COLUMN faq.faq_division is '����';
COMMENT ON COLUMN faq.word is '�˻���';
COMMENT ON COLUMN faq.faq_date is '�����';


DROP SEQUENCE faq_seq;
CREATE SEQUENCE faq_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  
1) ���� ���� ���� ���
INSERT INTO faq(faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date)
VALUES(faq_seq.nextval, 'faq1', 'faq1', '������1', '1234', 1, '��ǰ', sysdate);

INSERT INTO faq(faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date)
VALUES(faq_seq.nextval, 'faq2', 'faq2', '������2', '1234', 2, '����', sysdate);
            
INSERT INTO faq(faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date)
VALUES(faq_seq.nextval, 'faq3', 'faq3', '������3', '1234', 3, '����', sysdate);

commit;


2-1) ��ü���
1) ��ü ���
SELECT faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date
FROM faq 
ORDER BY faqno DESC;

2) ��� ������ ��ü ���
SELECT faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date
FROM faq
ORDER BY faq_seqno DESC;

2-2) �˻� ���
1) �˻�
�� �˻� ���
-- title, content, word column search
SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date
FROM faq
WHERE (faq_title LIKE '%faq%' OR faq_content LIKE '%faq%')
ORDER BY faqno DESC;


�� �˻� ���ڵ� ����
-- ��ü ���ڵ� ����
SELECT COUNT(*) as cnt
FROM faq
WHERE faqno=1;

-- �˻��� ���ڵ� ����
SELECT COUNT(*) as cnt
FROM faq
WHERE faqno=1 AND faq_title LIKE '%faq%';

SELECT COUNT(*) as cnt
FROM faq
WHERE faqno=1 AND (faq_title LIKE '%faq%' OR faq_content LIKE '%faq%')


3) 1�� ��ȸ
SELECT faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date
FROM faq 
WHERE faqno = 1;

4) ����
UPDATE faq 
SET faq_title='��������11', faq_content='��������2', faq_rname='����'
WHERE faqno = 4;

COMMIT;

5) �н����� �˻�
SELECT COUNT(*) as faq_passwd_cnt
FROM faq
WHERE faqno=1 AND faq_passwd='1234';

5-1) �н����� Ȯ��
SELECT faqno, faq_passwd
FROM faq 
ORDER BY faqno DESC;    

6) ����
DELETE FROM faq
WHERE faqno=4;

COMMIT;  


7) ��� ���� ����, 10 �� 1
UPDATE faq
SET faq_seqno = faq_seqno - 1
WHERE faqno=1;
 
SELECT faqno, faq_title, faq_content, faq_rname, faq_passwd, faq_seqno, faq_division, faq_date
FROM faq 
WHERE faqno = 1;

8) ��¼��� ����, 1 �� 10
UPDATE faq
SET faq_seqno = faq_seqno + 1
WHERE faqno=1;

commit;
  
9) �˻� + ����¡
SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date
FROM faq
WHERE faqno=1 AND (faq_title LIKE '%faq%' OR faq_content LIKE '%faq%')
ORDER BY faqno DESC;

-- step 1
SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date
FROM faq
WHERE faqno=1 AND faq_content LIKE '%faq%')
ORDER BY faqno DESC;

-- step 2
SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date, rownum as r
FROM (
          SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date
          FROM faq
          WHERE (faq_title LIKE '%faq%' OR faq_content LIKE '%faq%')
          ORDER BY faqno DESC
);

-- step 3, 1 page
SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date, r
FROM (
           SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date, rownum as r
           FROM (
                     SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date
                     FROM faq
                     WHERE (faq_title LIKE '%faq%' OR faq_content LIKE '%faq%')
                     ORDER BY faqno DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date, r
FROM (
           SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date, rownum as r
           FROM (
                     SELECT faqno, faq_title, faq_content, faq_rname, faq_seqno, faq_division, faq_date
                     FROM faq
                     WHERE (faq_title LIKE '%faq%' OR faq_content LIKE '%faq%')
                     ORDER BY faqno DESC
           )          
)
WHERE r >= 11 AND r <= 20;  