/**********************************/
/* Table Name: �������� */
/**********************************/
drop table MEM;
DROP TABLE SURV_RES;
DROP TABLE SURV_ITEM;
DROP TABLE SURV cascade constraints;
CREATE TABLE surv(
SURV_NO                        NUMBER(10)  NOT NULL  PRIMARY KEY,
        SURV_SEQNO                          NUMBER(10)  NOT NULL,
SURV_TITLE                     VARCHAR2(300)  NOT NULL,
        SURV_PASSWD                         VARCHAR2(15)          NOT NULL,
SURV_STARTDATE                 VARCHAR2(50)  NOT NULL,
SURV_ENDDATE                   VARCHAR2(50)  NOT NULL,
        SURV_CNT                       NUMBER(10)  NOT NULL,
SURV_CONTINUE                  VARCHAR2(100)  NOT NULL,
        surv_item_nowdate  DATE               NOT NULL
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
COMMENT ON COLUMN SURV.surv_item_nowdate is '����ð�';




/**********************************/
/* Table Name: �����׸� */
/**********************************/
drop table surv_item CASCADE CONSTRAINTS;
CREATE TABLE surv_item(
surv_item_no NUMERIC(10) NOT NULL PRIMARY KEY,
surv_item_seqno  NUMERIC(10) NOT NULL,
surv_item_ans  VARCHAR(1000)  NULL,
        surv_item_passwd VARCHAR(1000) NOT NULL,
        surv_item_cnt  NUMERIC(10) NULL, 
surv_no NUMERIC(10) NOT NULL,
        mem_no NUMERIC(10) NOT NULL,
  FOREIGN KEY (mem_no) REFERENCES MEM (mem_no),
  FOREIGN KEY (surv_no) REFERENCES surv (surv_no)
);

COMMENT ON TABLE SURV_ITEM is '�����׸�';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_NO is '�����׸��ȣ';
COMMENT ON COLUMN SURV_ITEM.SURV_NO is '���������ȣ';
COMMENT ON COLUMN SURV_ITEM.mem_no is 'ȸ����ȣ';
COMMENT ON COLUMN SURV_ITEM.surv_item_seqno is '�����׸����';
COMMENT ON COLUMN surv_item.surv_item_ans is '�亯';
COMMENT ON COLUMN SURV_ITEM.surv_item_cnt is '�����׸����ο�';
COMMENT ON COLUMN SURV_ITEM.surv_item_passwd is '�����׸��н�����';


/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE surv_apply(
    surv_apply_no                NUMBER(10) NOT NULL PRIMARY KEY,
    surv_item_no                  NUMBER(10) NULL ,
    mem_no                           NUMBER(6) NULL ,
    surv_no                           NUMBER(6) NULL ,
    surv_apply_date                         DATE NOT NULL,
      FOREIGN KEY (surv_item_no) REFERENCES surv_item (surv_item_no),
      FOREIGN KEY (mem_no) REFERENCES MEM (mem_no),
      FOREIGN KEY (surv_no) REFERENCES surv (surv_no)
);
 
COMMENT ON TABLE surv_apply is '���� ���� ȸ��';
COMMENT ON COLUMN surv_apply.surv_apply_no is '���� ���� ȸ�� ��ȣ';
COMMENT ON COLUMN surv_apply.surv_item_no is '���� ���� �׸� ��ȣ';
COMMENT ON COLUMN surv_apply.mem_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN surv_apply.surv_no is '���� ��ȣ';
COMMENT ON COLUMN surv_apply.surv_apply_date is '���� ���� ��¥';