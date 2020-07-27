/**********************************/
/* Table Name: 설문 댓글 */
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
 
COMMENT ON TABLE surv_reply is '설문 댓글';
COMMENT ON COLUMN surv_reply.surv_reply_no is '설문 댓글 번호';
COMMENT ON COLUMN surv_reply.mem_no is '회원 번호';
COMMENT ON COLUMN surv_reply.surv_no is '설문 조사 번호';
COMMENT ON COLUMN surv_reply.content is '내용';
COMMENT ON COLUMN surv_reply.replycnt is '답글수';
 
 