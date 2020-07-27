package dev.mvc.surv;

public class Surv_VO {
  /*
   * SURV_NO                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    SURV_SEQNO                          NUMBER(10)     NOT NULL,
  SURV_TITLE                        VARCHAR2(300)    NOT NULL,
    SURV_PASSWD                         VARCHAR2(15)          NOT NULL,
  SURV_STARTDATE                    VARCHAR2(50)     NOT NULL,
  SURV_ENDDATE                      VARCHAR2(50)     NOT NULL,
  SURV_rdate                          date                not null,
    SURV_CNT                          NUMBER(10)     NOT NULL,
  SURV_CONTINUE                  VARCHAR2(100)       NOT NULL,
  MEM_NO                            NUMBER(10)     NULL ,
   */
  
    /** �������� ��ȣ */
    private int surv_no;
    
    /** �������� ��¼���*/
    private int surv_seqno;
    
    /** �������� ���� */
    private String surv_title;
    
    /** �������� �н�����*/
    private String surv_passwd;
    
    /** �������� ���۳�¥ */
    private String surv_startdate;
    
    /** �������� ���ᳯ¥ */
    private String surv_enddate;
    
    /** �������� ��ϳ�¥ */
    private String surv_rdate;
    
    /** �������� ����ȸ���� */
    private int surv_cnt;
    
    /** �������� ���࿩�� */
    private String surv_continue;
    
    /** ȸ����ȣ */
    private int mem_no;
    
    public Surv_VO() {
      
    }

    public int getSurv_no() {
      return surv_no;
    }

    public void setSurv_no(int surv_no) {
      this.surv_no = surv_no;
    }

    public String getSurv_title() {
      return surv_title;
    }

    public void setSurv_title(String surv_title) {
      this.surv_title = surv_title;
    }

    public String getSurv_startdate() {
      return surv_startdate;
    }

    public void setSurv_startdate(String surv_startdate) {
      this.surv_startdate = surv_startdate;
    }

    public String getSurv_enddate() {
      return surv_enddate;
    }

    public void setSurv_enddate(String surv_enddate) {
      this.surv_enddate = surv_enddate;
    }

    public int getSurv_cnt() {
      return surv_cnt;
    }

    public void setSurv_cnt(int surv_cnt) {
      this.surv_cnt = surv_cnt;
    }

    public String getSurv_continue() {
      return surv_continue;
    }

    public void setSurv_continue(String surv_continue) {
      this.surv_continue = surv_continue;
    }

    public int getMem_no() {
      return mem_no;
    }

    public void setMem_no(int mem_no) {
      this.mem_no = mem_no;
    }

    public int getSurv_seqno() {
      return surv_seqno;
    }

    public void setSurv_seqno(int surv_seqno) {
      this.surv_seqno = surv_seqno;
    }

    public String getSurv_passwd() {
      return surv_passwd;
    }

    public void setSurv_passwd(String surv_passwd) {
      this.surv_passwd = surv_passwd;
    }

  public String getSurv_rdate() {
    return surv_rdate;
  }

  public void setSurv_rdate(String surv_rdate) {
    this.surv_rdate = surv_rdate;
  }
    
    
}
