/**********************************/
/* Table Name: ȸ�� */
/**********************************/



-- �� ���� ���ǰ� �Բ� ����(���� ������ �־ ������, �������� ����.)
DROP TABLE mem CASCADE CONSTRAINTS; 
 
-- �� ����
CREATE TABLE MEM(
		MEM_NO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_ID                        		VARCHAR2(60)		 NOT NULL UNIQUE,
		MEM_PW                        		VARCHAR2(60)		 NOT NULL,
		MEM_NAME                      		VARCHAR2(20)		 NOT NULL,
		MEM_NICK                      		VARCHAR2(20)		 NOT NULL UNIQUE,
		MEM_ADDR1                     		VARCHAR2(400)		 NULL ,
		MEM_ADDR2                     		VARCHAR2(400)		 NULL ,
		MEM_ZIP                       		VARCHAR2(10)		 NULL ,
		MEM_TEL                       		VARCHAR2(20)		 NOT NULL UNIQUE,
		MEM_PT                        		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		MEM_DATE                      		DATE		 NOT NULL,
		MEM_STS                       		NUMBER(1)		 DEFAULT 0		 NOT NULL,

		MEM_PIC_NAME_UP               		VARCHAR2(100)		 NULL ,
		MEM_PIC_TH                   		VARCHAR2(100)		 NULL ,
		MEM_PIC_SIZE                 		NUMBER(10)		 DEFAULT 0     NULL 
);

COMMENT ON TABLE MEM is 'ȸ��';
COMMENT ON COLUMN MEM.MEM_NO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN MEM.MEM_ID is '���̵�';
COMMENT ON COLUMN MEM.MEM_PW is '��й�ȣ';
COMMENT ON COLUMN MEM.MEM_NAME is '�̸�';
COMMENT ON COLUMN MEM.MEM_NICK is '�г���';
COMMENT ON COLUMN MEM.MEM_ADDR1 is '�ּ�1';
COMMENT ON COLUMN MEM.MEM_ADDR2 is '�ּ�2';
COMMENT ON COLUMN MEM.MEM_ZIP is '�����ȣ';
COMMENT ON COLUMN MEM.MEM_TEL is '��ȭ��ȣ';
COMMENT ON COLUMN MEM.MEM_PT is '����Ʈ';
COMMENT ON COLUMN MEM.MEM_DATE is '������';
COMMENT ON COLUMN MEM.MEM_STS is 'ȸ�� ����';
COMMENT ON COLUMN MEM.MEM_PIC_NAME_UP is 'ȸ�� ���� ���ε��';
COMMENT ON COLUMN MEM.MEM_PIC_TH is 'ȸ�� ���� �����';
COMMENT ON COLUMN MEM.MEM_PIC_SIZE is 'ȸ�� ���� ũ��';


 
 -- �������� ����
DROP SEQUENCE mem_seq;  
 

-- �� ������ ����
CREATE SEQUENCE mem_seq
    START WITH 1                     -- ���� ��ȣ
    INCREMENT BY 1                -- ������
    MAXVALUE 9999999999      --�ִ�:9999999999 �� NUMBER(10) ����
    CACHE 2                              -- 2���� �޸𸮿��� ��� (insert�� ū �������� ��� ĳ�� ���� ũ�� ���)
    NOCYCLE;                            -- ��ȯ x, �ٽ� 1���� �����Ǵ� ���� ����
    



-- �� ���
 
-- �� id �ߺ� Ȯ��

SELECT COUNT(mem_id) as cnt
FROM mem
WHERE mem_id='user1';
 
 cnt
 ---
   0   �� �ߺ� X
   
   delete * from mem;
   
-- �� ���
 
INSERT INTO mem(mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date)
VALUES (mem_seq.nextval, 'user1', '1234', '��浿', '�񵿾ƺ�', '12345', '����� ���α�', '��ö��', '010-4511-4757', 0, 0, sysdate);

INSERT INTO mem(mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date)
VALUES (mem_seq.nextval, 'user2', '1234', '��Ű', '�������', '12345', '����� ���α�', '��ö��', '010-5511-4757',  '0', '0', sysdate);
             
INSERT INTO mem(mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date)
VALUES (mem_seq.nextval, 'user3', '1234', '��', '�����Ӹ�', '12345', '����� ���α�', '��ö��', '010-5571-4733', 0, 0, sysdate);
			 
INSERT INTO mem(mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date)
VALUES (mem_seq.nextval, 'user4', '1234', 'ü��', 'ī��ĸ��', '12345', '����� ���α�', '��ö��', '010-8511-4757',  '0', '0', sysdate );

INSERT INTO mem(mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date)
VALUES (mem_seq.nextval, 'user5', '1234', 'Ǫ', '������', '12345', '����� ���α�', '��ö��', '010-8585-4757',  '0', '0', sysdate );
 
 
 
 
-- �� ���( mem_no ���� ���� ����)

SELECT mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date, 
							mem_pic_name_up, mem_pic_th, mem_pic_size
FROM mem
ORDER BY mem_no DESC;



-- �� ���( contentsno ���� ���� ����, attachfileno ���� ��������)

SELECT mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date, 
							mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size
FROM mem
WHERE mem_no=9;



-- ������

-- ��Ư�� ��� ����
DELETE FROM mem
WHERE mem_no = 9;

-- ����ü ���ڵ� ����
DELETE FROM mem;

COMMIT;
 

-- ���н����� ����

SELECT COUNT(mem_no) as cnt
FROM mem
WHERE mem_no=7 AND mem_pw='1234' ;


-- ���α���

SELECT COUNT(*) as cnt
FROM mem
WHERE mem_id='user1' AND mem_pw='1234';

--ALTER TABLE mem ADD UNIQUE (mem_id);
--SELECT * FROM user_constraints WHERE table_name = 'MEM';

 
-- �� mem_id �̿� ȸ�� ���� ��ȸ

SELECT mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date, 
							mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size
FROM mem
WHERE mem_id = 'user1'



-- �� �˻� +  ����¡
-- step 1
SELECT  mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts
FROM mem
WHERE mem_id LIKE '%user%' 
ORDER BY mem_no DESC;

-- step 2
SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, rownum as r
FROM (
            SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts
            FROM mem
            WHERE mem_id LIKE '%user%' 
            ORDER BY mem_no DESC
);

-- step 3, 1 page
SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, r
FROM (
            SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, rownum as r
            FROM (
                        SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts
                        FROM mem
                        WHERE mem_id LIKE '%user%' 
                        ORDER BY mem_no DESC
            )      
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, r
FROM (
            SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, rownum as r
            FROM (
                        SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts
                        FROM mem
                        WHERE mem_id LIKE '%user%' 
                        ORDER BY mem_no DESC
            )      
)
WHERE r >= 11 AND r <= 20;


-- �� ����
  UPDATE mem 
  SET mem_pw=1234, mem_tel='010-1111-1234', mem_zip=1235
  WHERE mem_no=1;
  
  commit;
   

