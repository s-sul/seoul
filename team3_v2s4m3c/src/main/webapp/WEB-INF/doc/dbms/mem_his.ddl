/**********************************/
/* Table Name: ȸ�� �����̷� */
/**********************************/

DROP TABLE MEM_HIS CASCADE CONSTRAINTS;

CREATE TABLE MEM_HIS(
		mem_his_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
     
        mem_no                        		NUMBER(10)		 NOT NULL,
		at_no                         		NUMBER(10)		 NOT NULL,
        payment_no                       NUMBER(10)		 NOT NULL,

		
        FOREIGN KEY (mem_no) REFERENCES mem (mem_no),
        FOREIGN KEY (at_no) REFERENCES at (at_no),
        FOREIGN KEY (payment_no) REFERENCES payment (payment_no)
);


COMMENT ON TABLE MEM_HIS is 'ȸ�� �����̷�';
COMMENT ON COLUMN MEM_HIS.mem_his_no is 'ȸ�� �̷� ��ȣ';

COMMENT ON COLUMN MEM_HIS.mem_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN MEM_HIS.at_no is '��ǰ ��ȣ';
COMMENT ON COLUMN MEM_HIS.payment_no is '������ȣ';


 -- �������� ����
DROP SEQUENCE mem_his_seq;  
 

-- �������� ����
CREATE SEQUENCE mem_his_seq
    START WITH 1                     -- ���� ��ȣ
    INCREMENT BY 1                -- ������
    MAXVALUE 9999999999      --�ִ�:9999999999 �� NUMBER(10) ����
    CACHE 2                              -- 2���� �޸𸮿��� ��� (insert�� ū �������� ��� ĳ�� ���� ũ�� ���)
    NOCYCLE;                            -- ��ȯ x, �ٽ� 1���� �����Ǵ� ���� ����
    
    
 
 
1. ���


SELECT NVL(MAX(mem_his_seqno), 0) + 1 as mem_his_seqno FROM mem_his;


INSERT INTO mem_his(mem_his_no, at_no, mem_his_seqno, mem_no)
VALUES (mem_his_seq.nextval, '1', (SELECT NVL(MAX(mem_his_seqno), 0) + 1 as mem_his_seqno FROM mem_his), '1', sysdate);

INSERT INTO mem_his(mem_his_no, at_no, mem_his_seqno, mem_no)
VALUES (mem_his_seq.nextval, '1', (SELECT NVL(MAX(mem_his_seqno), 0) + 1 as mem_his_seqno FROM mem_his), '1', sysdate);

INSERT INTO mem_his(mem_his_no, at_no, mem_his_seqno, mem_no)
VALUES (mem_his_seq.nextval, '1', (SELECT NVL(MAX(mem_his_seqno), 0) + 1 as mem_his_seqno FROM mem_his), '1', sysdate);

 
 COMMIT;
 
 
 
2. ���

 
SELECT mem_his_no, at_no,  mem_no
FROM mem_his
ORDER BY mem_his_no ASC;



 
SELECT h.mem_his_no, h.mem_no,
            p.payment_no , p.payment_total, p.payment_way, p.payment_date, p.cart_cnt, p.at_price, p.at_name, p.mem_no
FROM mem_his h, payment p
WHERE (h.mem_no = p.mem_no) AND h.mem_no = 1
ORDER BY h.payment_no DESC;
 



SELECT h.mem_his_no as h_mem_his_no, r.name as r_name, r.rdate as r_date,
        c.cateno , c.categrpno, c.name, c.seqno, c.visible, c.rdate, c.cnt
FROM categrp r, cate c
WHERE (r.categrpno = c.categrpno) AND r.categrpno = 2
ORDER BY r.categrpno ASC, c.seqno ASC;


  SELECT mem_his_no,  mem_wish_seqno, mem_no, w.at_no as w_at_no,
               at_visible, at_name, at_detail, at_price, a.at_no as a_at_no  
  FROM mem_wish w, at a
  WHERE (w.at_no  = a.at_no) and mem_no = #{mem_no}
  ORDER BY mem_wish_seqno ASC



  -- ��  �� ���� VO (categrp + cate INNER JOIN (1:��) ),  ��categrpno�� cate ���

    SELECT r.categrpno as r_categrpno, r.name as r_name, r.rdate as r_date,
                c.cateno , c.categrpno, c.name, c.seqno, c.visible, c.rdate, c.cnt
    FROM categrp r, cate c
    WHERE (r.categrpno = c.categrpno) AND r.categrpno = 2
    ORDER BY r.categrpno ASC, c.seqno ASC;
 
 
 
   
3. ��ȸ

  
  SELECT mem_his_no, at_no, mem_his_seqno, mem_no
  FROM mem_his
  WHERE mem_his_no = 1;


   
4. ����


UPDATE mem_his 
SET  mem_his_seqno='4'
WHERE mem_his_no=1;
 

 
 
6. ����

1) ��� ����
DELETE FROM mem_his;
 
 
 
2) Ư�� ����
DELETE FROM mem_his
WHERE mem_his_no=9;
 
 

