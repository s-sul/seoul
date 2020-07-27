/**********************************/
/* Table Name: 설문조사 */
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

COMMENT ON TABLE SURV is '설문조사';
COMMENT ON COLUMN SURV.SURV_NO is '설문조사번호';
COMMENT ON COLUMN SURV.SURV_SEQNO is '설문조사출력순서';
COMMENT ON COLUMN SURV.SURV_TITLE is '설문조사제목';
COMMENT ON COLUMN SURV.SURV_PASSWD  is '설문조사패스워드';
COMMENT ON COLUMN SURV.SURV_STARTDATE is '설문조사시작날짜';
COMMENT ON COLUMN SURV.SURV_ENDDATE is '설문조사종료날짜';
COMMENT ON COLUMN SURV.SURV_CNT is '설문조사참여인원';
COMMENT ON COLUMN SURV.SURV_CONTINUE is '설문조사진행여부';
COMMENT ON COLUMN SURV.surv_item_nowdate is '현재시간';




/**********************************/
/* Table Name: 설문항목 */
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

COMMENT ON TABLE SURV_ITEM is '설문항목';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_NO is '설문항목번호';
COMMENT ON COLUMN SURV_ITEM.SURV_NO is '설문조사번호';
COMMENT ON COLUMN SURV_ITEM.mem_no is '회원번호';
COMMENT ON COLUMN SURV_ITEM.surv_item_seqno is '설문항목순서';
COMMENT ON COLUMN surv_item.surv_item_ans is '답변';
COMMENT ON COLUMN SURV_ITEM.surv_item_cnt is '설문항목선택인원';
COMMENT ON COLUMN SURV_ITEM.surv_item_passwd is '설문항목패스워드';


/**********************************/
/* Table Name: 설문참여 */
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
 
COMMENT ON TABLE surv_apply is '설문 참여 회원';
COMMENT ON COLUMN surv_apply.surv_apply_no is '설문 참여 회원 번호';
COMMENT ON COLUMN surv_apply.surv_item_no is '설문 조사 항목 번호';
COMMENT ON COLUMN surv_apply.mem_no is '회원 번호';
COMMENT ON COLUMN surv_apply.surv_no is '설문 번호';
COMMENT ON COLUMN surv_apply.surv_apply_date is '설문 참여 날짜';