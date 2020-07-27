
/**********************************/
/* Table Name: ȸ�� ���� */
/**********************************/

DROP TABLE mem_pic;

CREATE TABLE MEM_PIC(
		mem_pic_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		mem_pic_name                  		VARCHAR2(100)		 NOT NULL,
		mem_pic_name_up               		VARCHAR2(100)		 NOT NULL,
		mem_pic_th                    		VARCHAR2(100)		 NOT NULL,
		mem_pic_size                  		VARCHAR2(100)		 NOT NULL,
		mem_pic_date                  		VARCHAR2(100)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE MEM_PIC is 'ȸ�� ����';
COMMENT ON COLUMN MEM_PIC.mem_pic_no is 'ȸ�� ���� ��ȣ';
COMMENT ON COLUMN MEM_PIC.mem_pic_name is 'ȸ�� ���� ������';
COMMENT ON COLUMN MEM_PIC.mem_pic_name_up is 'ȸ�� ���� ���ε��';
COMMENT ON COLUMN MEM_PIC.mem_pic_th is 'ȸ�� ���� �����';
COMMENT ON COLUMN MEM_PIC.mem_pic_size is 'ȸ�� ���� ũ��';
COMMENT ON COLUMN MEM_PIC.mem_pic_date is 'ȸ�� ���� �����';
COMMENT ON COLUMN MEM_PIC.MEM_NO is 'ȸ�� ��ȣ';



-- �������� ����
DROP SEQUENCE mem_pic_seq;  
 

-- ��SEQUENCE ������ ����
CREATE SEQUENCE mem_pic_seq
    START WITH 1                     -- ���� ��ȣ
    INCREMENT BY 1                -- ������
    MAXVALUE 9999999999      --�ִ�:9999999999 �� NUMBER(10) ����
    CACHE 2                              -- 2���� �޸𸮿��� ��� (insert�� ū �������� ��� ĳ�� ���� ũ�� ���)
    NOCYCLE;                            -- ��ȯ x, �ٽ� 1���� �����Ǵ� ���� ����
    
    
    
    
-- 1) ���

INSERT INTO mem_pic(mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date)
VALUES(mem_pic_seq.nextval, 2, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO mem_pic(mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date)
VALUES(mem_pic_seq.nextval, 3, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO mem_pic(mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date)
VALUES(mem_pic_seq.nextval, 4, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);        
             
             
-- 2) ���( mem_no ���� ���� ����, mem_pic_no ���� ��������)
SELECT mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date
FROM mem_pic
ORDER BY mem_no DESC,  mem_pic_no ASC;




SELECT mem_pic_no, mem_pic_name, mem_pic_name_up, mem_pic_th
FROM mem_pic
ORDER BY mem_no DESC,  mem_pic_no ASC;

commit;
-- ������ �ϵ��ũ�� ����� ���ϸ�: mem_pic_name_up, mem_pic_th
-- �����ε� ��� ���ϸ�: mem_pic_name

-- 3) �ۺ� ���� ���(mem_no ���� ���� ����, mem_pic_no ���� ��������)
SELECT mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date
FROM mem_pic
WHERE mem_no = 2
ORDER BY mem_pic_name ASC;

 mem_pic_no CONTENTSNO mem_pic_name        mem_pic_name_up      mem_pic_th          mem_pic_size  mem_pic_date
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car1.jpg     car1_0.jpg   car1_0_t.jpg    12099 2019-12-04 15:01:20.0
            2          1 car2.jpg     car2_0.jpg   car2_0_t.jpg    10553 2019-12-04 15:01:20.0
            3          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            4          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            5          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0
            9          1 moon.zip     moon.zip     NULL           292777 2019-12-05 10:14:12.0
            6          1 spring18.jpg spring18.jpg spring18_t.jpg 444455 2019-12-05 09:55:07.0
            7          1 spring19.jpg spring19.jpg spring19_t.jpg 126983 2019-12-05 09:55:07.0
            8          1 spring20.jpg spring20.jpg spring20_t.jpg 345322 2019-12-05 09:55:07.0

-- 4) �ϳ��� ���� ����
DELETE FROM mem_pic
WHERE mem_pic_no = 7;


-- 5) FK mem_no �θ�Ű �� ��ȸ
SELECT mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date
FROM mem_pic
WHERE mem_no=1;

mem_pic_no CONTENTSNO mem_pic_name        mem_pic_name_up      mem_pic_th          mem_pic_size  mem_pic_date
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            2          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            3          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0

-- �θ�Ű�� ���� ����
SELECT COUNT(*) as cnt
FROM mem_pic
WHERE mem_no=1;

 CNT
 ---
   3             
             
-- 6) FK �θ� ���̺� ���ڵ� ����
DELETE FROM mem_pic
WHERE mem_no=1;

DELETE FROM mem_pic
WHERE mem_pic_no=6;

(3 rows affected)

commit;




   
-- 7) mem, mem_pic join
    SELECT m.mem_no, m.mem_id, m.mem_pw, m.mem_nick, m.mem_name, m.mem_addr1, m.mem_addr2, m.mem_zip, m.mem_tel, m.mem_date,
               p.mem_pic_no, p.mem_pic_name, p.mem_pic_name_up, p.mem_pic_th, p.mem_pic_size, p.mem_pic_date, p.mem_no
    FROM mem m, mem_pic p
    WHERE p.mem_no = m.mem_no AND m.mem_no = 1;
    

commit;
-- 8) ��ȸ
SELECT mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date
FROM mem_pic
WHERE mem_pic_no=1;

