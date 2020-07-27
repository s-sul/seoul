/**********************************/
/* Table Name: ȸ�� ���ø���Ʈ */
/**********************************/

DROP TABLE MEM_WISH CASCADE CONSTRAINTS;


CREATE TABLE mem_wish(
		mem_wish_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		at_no                         		NUMBER(10)		 NOT NULL       UNIQUE,
		mem_no                        		NUMBER(10)		 NOT NULL,
		mem_wish_seqno                		NUMBER(10)		 DEFAULT 1		 NOT NULL,
        word                                    VARCHAR2(100)   NULL,
        FOREIGN KEY (mem_no) REFERENCES mem (mem_no),
        FOREIGN KEY (at_no) REFERENCES at (at_no)
);

COMMENT ON TABLE mem_wish is 'ȸ�� ���ø���Ʈ';
COMMENT ON COLUMN mem_wish.mem_wish_no is 'ȸ�� ���� ��ȣ';
COMMENT ON COLUMN mem_wish.at_no is '��ǰ ��ȣ';
COMMENT ON COLUMN mem_wish.mem_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN mem_wish.mem_wish_seqno is 'ȸ�� ���� ��� ��ȣ';
COMMENT ON COLUMN mem_wish.word is 'ȸ�� ���� �˻���';



-- ALTER TABLE mem_wish ADD (word VARCHAR2(100));


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
VALUES (at_seq.nextval, 1, 1, 'Y', '�����ڶ�', '���޴� �̿��', 50000, '�߱���', 'Y', 'Y', 0, 2, '����', 'http://www.daum.net', 0);



 -- �������� ����
DROP SEQUENCE mem_wish_seq;  
 

-- �������� ����
CREATE SEQUENCE mem_wish_seq
    START WITH 1                     -- ���� ��ȣ
    INCREMENT BY 1                -- ������
    MAXVALUE 9999999999      --�ִ�:9999999999 �� NUMBER(10) ����
    CACHE 2                              -- 2���� �޸𸮿��� ��� (insert�� ū �������� ��� ĳ�� ���� ũ�� ���)
    NOCYCLE;                            -- ��ȯ x, �ٽ� 1���� �����Ǵ� ���� ����
    
    
 
 
1. ���


SELECT NVL(MAX(mem_wish_seqno), 0) + 1 as mem_wish_seqno FROM mem_wish;

 

INSERT INTO mem_wish(mem_wish_no, at_no, mem_wish_seqno, mem_no)
VALUES (mem_wish_seq.nextval, '1', (SELECT NVL(MAX(mem_wish_seqno), 0) + 1 as mem_wish_seqno FROM mem_wish), '2');

INSERT INTO mem_wish(mem_wish_no, at_no, mem_wish_seqno, mem_no)
VALUES (mem_wish_seq.nextval, '1', (SELECT NVL(MAX(mem_wish_seqno), 0) + 1 as mem_wish_seqno FROM mem_wish), '2');

INSERT INTO mem_wish(mem_wish_no, at_no, mem_wish_seqno, mem_no)
VALUES (mem_wish_seq.nextval, '1', (SELECT NVL(MAX(mem_wish_seqno), 0) + 1 as mem_wish_seqno FROM mem_wish), '1');


INSERT INTO mem_wish(mem_wish_no, at_no, mem_wish_seqno, mem_no)
VALUES (mem_wish_seq.nextval, '2', (SELECT NVL(MAX(mem_wish_seqno), 0) + 1 as mem_wish_seqno FROM mem_wish), '1');


INSERT INTO mem_wish(mem_wish_no, at_no, mem_wish_seqno, mem_no)
VALUES (mem_wish_seq.nextval, '1', (SELECT NVL(MAX(mem_wish_seqno), 0) + 1 as mem_wish_seqno FROM mem_wish), '1');

 COMMIT;
 
 
 
2. ���

 
 SELECT mem_wish_no, at_no, mem_wish_seqno, mem_no
 FROM mem_wish
 ORDER BY mem_wish_no ASC;
 
   
3. ��ȸ

  
  SELECT mem_wish_no, at_no, mem_wish_seqno, mem_no, word
  FROM mem_wish
  WHERE mem_wish_no = 1;
  
  
  
  -- At, Mem_wish Join
  SELECT mem_wish_no,  mem_wish_seqno, mem_no, w.at_no as w_at_no,
                 at_visible, at_name, at_detail, at_price, a.at_no as a_at_no
  FROM mem_wish w, at a
  WHERE (w.at_no  = a.at_no) and mem_no = 12
  ORDER BY mem_wish_seqno DESC;
  


-- ��ǰ �̸� �˻� + ����¡
-- step 1

SELECT mem_wish_no,  mem_wish_seqno, mem_no, word, w.at_no as w_at_no,
             at_visible, at_name, at_detail, at_price, a.at_no as a_at_no
FROM mem_wish w, at a
WHERE w.at_no = a.at_no AND mem_no = 2
-- WHERE at_name LIKE '%����%'
ORDER BY mem_wish_seqno DESC;
  
  
-- step 2
SELECT mem_wish_no,  mem_wish_seqno, mem_no, word, w_at_no,
             at_visible, at_name, at_detail, at_price,  a_at_no, rownum as r
FROM (
            SELECT mem_wish_no,  mem_wish_seqno, mem_no, word,  w.at_no as w_at_no,
             at_visible, at_name, at_detail, at_price, a.at_no as a_at_no
             FROM mem_wish w, at a
             WHERE w.at_no = a.at_no AND mem_no = 2
             -- WHERE at_name LIKE '%����%'
             ORDER BY mem_wish_seqno DESC
);

-- step 3, 1 page
SELECT mem_wish_no,  mem_wish_seqno, mem_no, w_at_no,
             at_visible, at_name, at_detail, at_price,  a_at_no, r
FROM (
            SELECT mem_wish_no,  mem_wish_seqno, mem_no,  w_at_no,
                         at_visible, at_name, at_detail, at_price,  a_at_no, rownum as r
            FROM (
                        SELECT mem_wish_no,  mem_wish_seqno, mem_no, w.at_no as w_at_no,
                         at_visible, at_name, at_detail, at_price, a.at_no as a_at_no
                         FROM mem_wish w, at a
                          WHERE w.at_no = a.at_no AND mem_no = 1
                         -- WHERE at_name LIKE '%����%'
                         -- WHERE mem_no = 1 AND (w.at_no = a.at_no) AND at_name LIKE '%24%' 
                         ORDER BY mem_wish_seqno DESC
            )
)
WHERE r >= 1 AND r <= 10;


-- step 3, 2 page
SELECT mem_wish_no,  mem_wish_seqno, mem_no, word, w_at_no,
             at_visible, at_name, at_detail, at_price,  a_at_no, r
FROM (
            SELECT mem_wish_no,  mem_wish_seqno, mem_no, word, w_at_no,
                         at_visible, at_name, at_detail, at_price,  a_at_no, rownum as r
            FROM (
                        SELECT mem_wish_no,  mem_wish_seqno, mem_no, word, w.at_no as w_at_no,
                         at_visible, at_name, at_detail, at_price, a.at_no as a_at_no
                         FROM mem_wish w, at a
                         -- WHERE w.at_no = a.at_no AND mem_no = 2
                         -- WHERE at_name LIKE '%����%'
                         WHERE mem_no = 2 AND (w.at_no = a.at_no) AND at_name LIKE   '%ġ%' 
                         ORDER BY mem_wish_seqno DESC
            )
)
WHERE r >= 11 AND r <= 20;





 <!-- �˻� ���ڵ� ���� -->

SELECT COUNT(*) as cnt
FROM mem_wish w, at a
WHERE (w.at_no  = a.at_no) and mem_no = 1
--  at_name LIKE '%#{word}%'


 
select * from book;
   
4. ����


UPDATE mem_wish 
SET at_no='1', mem_wish_seqno='4',  mem_no='1'
WHERE mem_wish_no=1;
 

 
 
6. ����

1) ��� ����
DELETE FROM mem_wish;
 
 
 
2) Ư�� ����
DELETE FROM mem_wish
WHERE mem_wish_no=9;

DELETE FROM mem_wish
WHERE mem_no=1; 




 


