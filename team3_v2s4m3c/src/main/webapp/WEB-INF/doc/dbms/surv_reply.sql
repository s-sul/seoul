/**********************************/
/* Table Name: ���� ��� */
/**********************************/
CREATE TABLE surv_reply(
surv_reply_no                  NUMBER(10) NOT NULL PRIMARY KEY,
mem_no                            NUMBER(6) NULL ,
surv_no                      NUMBER(10) NULL ,
content                        VARCHAR2(500) NOT NULL,
replycnt                      NUMBER(7) DEFAULT 0 NOT NULL,
  FOREIGN KEY (mem_no) REFERENCES MEM (mem_no),
  FOREIGN KEY (surv_no) REFERENCES surv (surv_no)
);
 
COMMENT ON TABLE surv_reply is '���� ���';
COMMENT ON COLUMN surv_reply.surv_reply_no is '���� ��� ��ȣ';
COMMENT ON COLUMN surv_reply.mem_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN surv_reply.surv_no is '���� ���� ��ȣ';
COMMENT ON COLUMN surv_reply.content is '����';
COMMENT ON COLUMN surv_reply.replycnt is '��ۼ�';
 
 