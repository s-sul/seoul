DROP TABLE at_grp CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: ��ǰ�׷� */
/**********************************/
CREATE TABLE AT_GRP(
		AT_GRP_NO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_GRP_NAME                   		VARCHAR2(50)		 NOT NULL,
		AT_GRP_SEQNO                  		NUMBER(7)		 NOT NULL,
		AT_GRP_VISIBLE                		CHAR(1)		 DEFAULT 'Y'		 NOT NULL
);

COMMENT ON TABLE AT_GRP is '��ǰ�׷�';
COMMENT ON COLUMN AT_GRP.AT_GRP_NO is '��ǰ�׷��ȣ';
COMMENT ON COLUMN AT_GRP.AT_GRP_NAME is '��ǰ�׷��';
COMMENT ON COLUMN AT_GRP.AT_GRP_SEQNO is '��ǰ�׷���¼���';
COMMENT ON COLUMN AT_GRP.AT_GRP_VISIBLE is '��ǰ�׷���¸��';



DROP SEQUENCE at_grp_seq;
CREATE SEQUENCE at_grp_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

---------------------------------------------------------------

-- 1)Create

INSERT INTO at_grp(at_grp_no, at_grp_name, at_grp_seqno, at_grp_visible)
VALUES (at_grp_seq.nextval, '�α����', 1, 'Y');

INSERT INTO at_grp(at_grp_no, at_grp_name, at_grp_seqno,at_grp_visible)
VALUES (at_grp_seq.nextval, 'ü��', 2, 'Y');

INSERT INTO at_grp(at_grp_no, at_grp_name, at_grp_seqno,at_grp_visible)
VALUES (at_grp_seq.nextval, '���', 3, 'Y');

COMMIT;

-- 2)List

SELECT at_grp_no, at_grp_name, at_grp_seqno, at_grp_visible
FROM at_grp
ORDER BY at_grp_no ASC; 

-- 3)Read
SELECT at_grp_no, at_grp_name, at_grp_seqno, at_grp_visible
FROM at_grp
WHERE at_grp_no =1; 

-- 4)Update
UPDATE at_grp
SET at_grp_name='����', at_grp_seqno = 1
WHERE at_grp_no = 1;

-- 5)Delete
DELETE FROM at_grp
WHERE at_grp_no=1;  --���� ���̺��� ���� ���� �Ұ� (child record found)
 
-- ��� ���������� ��ü ���
SELECT at_grp_no, at_grp_name, at_grp_seqno,at_grp_visible
FROM at_grp
ORDER BY at_grp_seqno ASC;

-- ��� ���� ����, 10 �� 1
UPDATE at_grp
SET at_grp_seqno = at_grp_seqno - 1
WHERE at_grp_no=1;

-- ��¼��� ����, 1 �� 10
UPDATE at_grp
SET at_grp_seqno = at_grp_seqno + 1
WHERE at_grp_no=1;

-- ����¡
SELECT at_grp_no, at_grp_name, at_grp_seqno, at_grp_visible, r
FROM (
           SELECT at_grp_no, at_grp_name, at_grp_seqno, at_grp_visible, rownum as r
           FROM at_grp
           ORDER BY at_grp_seqno                
)
WHERE r >= 1 AND r <= 10;

 -- ��ü ���ڵ� ����
SELECT COUNT(*) as cnt
FROM at_grp
