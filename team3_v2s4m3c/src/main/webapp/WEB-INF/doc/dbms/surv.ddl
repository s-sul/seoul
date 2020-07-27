/**********************************/
/* Table Name: �������� */
/**********************************/
drop table MEM;
DROP TABLE SURV_RES;
DROP TABLE SURV_ITEM;
DROP TABLE SURV cascade constraints;
CREATE TABLE surv(
        SURV_NO                             NUMBER(10)       NOT NULL        PRIMARY KEY,
        SURV_SEQNO                          NUMBER(10)       NOT NULL,
        SURV_TITLE                          VARCHAR2(300)        NOT NULL,
        SURV_PASSWD                         VARCHAR2(15)          NOT NULL,
        SURV_STARTDATE                      VARCHAR2(50)         NOT NULL,
        SURV_ENDDATE                        VARCHAR2(50)         NOT NULL,
        SURV_rdate                          date                not null,
        SURV_CNT                            NUMBER(10)       NOT NULL,
        SURV_CONTINUE                  VARCHAR2(100)             NOT NULL,
        MEM_NO                              NUMBER(10)       NULL ,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE SURV is '��������';
COMMENT ON COLUMN SURV.SURV_NO is '���������ȣ';
COMMENT ON COLUMN SURV.SURV_SEQNO is '����������¼���';
COMMENT ON COLUMN SURV.SURV_TITLE is '������������';
COMMENT ON COLUMN SURV.SURV_PASSWD  is '���������н�����';
COMMENT ON COLUMN SURV.SURV_STARTDATE is '����������۳�¥';
COMMENT ON COLUMN SURV.SURV_ENDDATE is '�����������ᳯ¥';
COMMENT ON COLUMN SURV.SURV_CNT is '�������������ο�';
COMMENT ON COLUMN SURV.SURV_CONTINUE is '�����������࿩��';
COMMENT ON COLUMN SURV.SURV_rdate is '������������';
COMMENT ON COLUMN SURV.MEM_NO is 'ȸ����ȣ';

DROP SEQUENCE SURV_seq;
CREATE SEQUENCE SURV_seq
    START WITH 1         -- ���۹�ȣ
    INCREMENT BY 1     -- ���� ��
    MAXVALUE 9999999999 -- �ִ밪 : 9999999999 --> NUMBER(10) ����
    CACHE 2                  -- 2���� �޸𸮿����� ���(������Ʈ�� ����ؼ� ���� ���� ), insert�� ������ cache�� 100~200������ �ϸ� ����Ŭ �ӵ��� ������..
    NOCYCLE;   

commit;
1) ���
INSERT INTO surv(surv_no, surv_seqno, surv_title,surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_rdate, mem_no)
VALUES(SURV_seq.nextval, 1, '������������', '1234', '2020-07-07', '2020-07-14', 0, '��������',sysdate, 1);

INSERT INTO surv(surv_no, surv_seqno, surv_title,surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_rdate, mem_no)
VALUES(SURV_seq.nextval, 2, '������������2', '1234', '2020-07-07', '2020-07-14', 0, '��������',sysdate, 1);

INSERT INTO surv(surv_no, surv_seqno, surv_title,surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_rdate, mem_no)
VALUES(SURV_seq.nextval, 3, '������������', '1234', '2020-07-07', '2020-07-14', 0, '��������',sysdate, 1);

INSERT INTO surv(surv_no, surv_seqno, surv_title,surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_rdate, mem_no)
VALUES(SURV_seq.nextval, 4, '������������', '1234', '2020-07-07', '2020-07-14', 0, '��������',sysdate, 1);

commit;
2) ���
SELECT surv_no, surv_seqno, surv_title,surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_rdate, mem_no
FROM SURV
ORDER BY SURV_NO DESC;
 
commit;


3-1) ��ȸ
SELECT surv_no, surv_seqno, surv_title,surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_rdate, mem_no
FROM SURV
WHERE SURV_NO = 6;

COMMIT;

3-2) ��ȸ�� ����
UPDATE SURV 
SET surv_cnt=surv_cnt+1 
WHERE surv_no = 4;       

4) ����
UPDATE SURV
SET  surv_seqno=4, surv_title ='��������׽�Ʈ', surv_startdate='2020-05-16', surv_enddate='2020-06-15',surv_continue='��������'
WHERE surv_no = 4;


5) ����
DELETE FROM SURV
WHERE SURV_NO=4;

commit;

6) �˻�

7) ����¡
-- step1
select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
from surv
where surv_no=1 and surv_word like '%����%'
order by surv_no desc;

-- step2
select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO, rownum as r
from(
        select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
        from surv
        where surv_no=1 and surv_word like '%����%'
        order by surv_no desc
);

-- step3(rownum�� �ٱ����� ������), 1page
-- r�� 1���� ũ�ų� ���� 10���� �۰ų� ������ 1������.
select surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no, r
from(
        select surv_no, surv_seqno, surv_title, surv_content, surv_passwd, surv_startdate, surv_enddate, surv_cnt, surv_continue, surv_word, mem_no, rownum as r
        from(
                select SURV_NO, surv_seqno, SURV_TITLE, surv_content, surv_passwd, SURV_STARTDATE, SURV_ENDDATE, SURV_CNT, SURV_CONTINUE, surv_word, MEM_NO 
                from surv
                where surv_no=1 and surv_word like '%����%'
                order by surv_no desc
        )
)
where r >=1 and r<=10;

commit;
8) �˻��Ȱ���
select count(*) as cnt
from surv
