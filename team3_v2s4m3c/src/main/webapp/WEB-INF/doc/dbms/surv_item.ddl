/**********************************/
/* Table Name: �����׸� */
/**********************************/
drop table surv_item CASCADE CONSTRAINTS;
CREATE TABLE surv_item(
        surv_item_no NUMERIC(10) NOT NULL PRIMARY KEY,
        surv_item_seqno  NUMERIC(10) NOT NULL,
        surv_item_ques VARCHAR(1000) NOT NULL,
        surv_item_passwd VARCHAR(1000) NOT NULL,
        surv_item_cnt  NUMERIC(10) NULL, 
        surv_no NUMERIC(10) NOT NULL,
  FOREIGN KEY (surv_no) REFERENCES surv (surv_no)
);

COMMENT ON TABLE SURV_ITEM is '�����׸�';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_NO is '�����׸��ȣ';
COMMENT ON COLUMN SURV_ITEM.SURV_NO is '���������ȣ';
COMMENT ON COLUMN SURV_ITEM.surv_item_seqno is '�����׸����';
COMMENT ON COLUMN SURV_ITEM.surv_item_ques is '�����׸�����';
COMMENT ON COLUMN SURV_ITEM.surv_item_cnt is '�����׸����ο�';
COMMENT ON COLUMN SURV_ITEM.surv_item_passwd is '�����׸��н�����';

DROP SEQUENCE SURV_ITEM_seq;
CREATE SEQUENCE SURV_ITEM_seq
    START WITH 1         -- ���۹�ȣ
    INCREMENT BY 1     -- ���� ��
    MAXVALUE 9999999999 -- �ִ밪 : 9999999999 --> NUMBER(10) ����
    CACHE 2                  -- 2���� �޸𸮿����� ���(������Ʈ�� ����ؼ� ���� ���� ), insert�� ������ cache�� 100~200������ �ϸ� ����Ŭ �ӵ��� ������..
    NOCYCLE;   
    
-- ���
INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, surv_item_cnt, surv_item_passwd)
VALUES(surv_item_seq.nextval, 2, 1, '��������1', 0, '1234'); 

INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, surv_item_cnt, surv_item_passwd)
VALUES(surv_item_seq.nextval, 2, 1, '��������1', 0, '1234'); 

INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, surv_item_cnt, surv_item_passwd)
VALUES(surv_item_seq.nextval, 2, 1, '��������1', 0, '1234');  

INSERT INTO SURV_ITEM(SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, surv_item_cnt, surv_item_passwd)
VALUES(surv_item_seq.nextval, 2, 1, '��������1', 0, '1234');  

2) ���
SELECT SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, surv_item_cnt, surv_item_passwd
FROM SURV_ITEM
ORDER BY SURV_item_SEQNO ASC;

3) ��ȸ
SELECT SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, surv_item_cnt, surv_item_passwd
FROM SURV_ITEM
where surv_item_seqno=1;

3-1) surv+surv_item list (by surv_no)
select s.surv_no as s_surv_no, s.surv_title as s_surv_title, 
       i.surv_item_no as i_surv_item_no, i.surv_no as i_surv_no, i.surv_item_seqno as i_surv_item_seqno, i.surv_item_ques as i_surv_item_ques,
       i.surv_item_cnt as i_surv_item_cnt
from surv s, surv_item i
where s.surv_no = i.surv_no and s.surv_no=2
order by i.surv_item_seqno asc;
    
3-2) surv+surv_item  read (by surv_item_no)
select s.surv_no as s_surv_no, s.surv_title as s_surv_title, 
       i.surv_item_no as i_surv_item_no, i.surv_no as i_surv_no, i.surv_item_seqno as i_surv_item_seqno, 
       i.surv_item_ques as i_surv_item_ques, i.surv_item_cnt as i_surv_item_cnt
from surv s, surv_item i
where s.surv_no = i.surv_no and i.surv_item_no=2
order by s.surv_no asc, i.surv_item_no asc;

4) ����
update surv_item
set surv_item_seqno=2, surv_item_ques='��������'
where surv_item_no=2;

5) ����
delete 
from surv_item
where surv_item_no=6;

commit;

-- �н����� Ȯ��
SELECT COUNT(*) as passwd_cnt
FROM surv_item
WHERE surv_item_no= 1 AND surv_item_passwd='1234'

--  surv�� surv_item ���̺� join

SELECT s.surv_no as s_surv_no, s.surv_seqno as s_surv_seqno, s.surv_title as s_surv_title, s.surv_content as s_surv_content, s.surv_passwd as surv_passwd, 
           s.surv_startdate as s_surv_startdate, s.surv_enddate as s_surv_enddate, s.surv_cnt as s_surv_cnt, s.surv_continue as s_surv_continue, s.mem_no as s_mem_no,
           i.surv_item_no as i_surv_item_no, i.surv_no as i_surv_no, i.surv_item_seqno as i_surv_item_seqno, i.surv_item_ques as i_surv_item_ques, i.surv_item_ans_1 as i_surv_item_ans_1, 
           i.surv_item_ans_2 as i_surv_item_ans_2, i.surv_item_ans_3 as i_surv_item_ans_3, i.surv_item_ans_4 as i_surv_item_ans_4, i.surv_item_resp as i_surv_item_resp, i.surv_item_passwd as i_surv_item_passwd
FROM surv s, surv_item i
WHERE (s.surv_no = i.surv_no) and s.surv_no = 4
ORDER BY  s.surv_no ASC, i.surv_no DESC;

SELECT s.surv_no as s_surv_no, s.surv_seqno as s_surv_seqno, s.surv_title as s_surv_title, s.surv_content as s_surv_content, s.surv_passwd as surv_passwd, 
           s.surv_startdate as s_surv_startdate, s.surv_enddate as s_surv_enddate, s.surv_cnt as s_surv_cnt, s.surv_continue as s_surv_continue, s.mem_no as s_mem_no,
           i.surv_item_no, i.surv_no, i.surv_item_seqno, i.surv_item_ques, i.surv_item_ans_1, i.surv_item_ans_2, i.surv_item_ans_3, i.surv_item_ans_4, i.surv_item_resp, i.surv_item_passwd
FROM surv s, surv_item i
WHERE s.surv_no = i.surv_no
ORDER BY  s.surv_no ASC, i.surv_no asc;

-- surv_no�� ���
SELECT SURV_ITEM_NO, SURV_NO, SURV_item_SEQNO, SURV_item_QUES, SURV_item_ANS_1, SURV_item_ANS_2, SURV_item_ANS_3, SURV_item_ANS_4, SURV_item_RESP,surv_item_passwd
FROM surv_item
WHERE surv_no = 1
ORDER BY surv_item_no DESC;

commit;

-- ������Ȳ
update surv_item
set surv_item_cnt = surv_item_cnt +1
where surv_item_no=1;