package dev.mvc.inquire;

/*
    inquireno           NUMBER(10)     NOT NULL, -- ���� ��ȣ
    mem_no          NUMBER(10)     NOT NULL, -- ȸ�� ��ȣ
    inquire_title         VARCHAR2(100)  NOT NULL, -- ���� ����
    inquire_content   VARCHAR2(300)  NOT NULL, -- ���� ����
    inquire_rname     VARCHAR2(10)     NOT NULL, -- �����
    inquire_passwd    VARCHAR2(15)     NOT NULL, -- �н�����
    word                 VARCHAR2(300)   NULL, -- �˻���
    inquire_rdate        DATE                NOT NULL, -- �����
*/
public class InquireVO {
  /** ���� ��ȣ */
  private int inquireno;
  /** ȸ�� ��ȣ(FK) */
  private int mem_no;
  /** ���� ���� */
  private String inquire_title;
  /** ���� ���� */
  private String inquire_content;
  /** ����� */
  private String inquire_rname;
  /** �н����� */
  private String inquire_passwd;
  /** ����� */
  private String inquire_rdate;

  public int getInquireno() {
    return inquireno;
  }

  public void setInquireno(int inquireno) {
    this.inquireno = inquireno;
  }

  public int getmem_no() {
    return mem_no;
  }

  public void setmem_no(int mem_no) {
    this.mem_no = mem_no;
  }

  public String getInquire_title() {
    return inquire_title;
  }

  public void setInquire_title(String inquire_title) {
    this.inquire_title = inquire_title;
  }

  public String getInquire_content() {
    return inquire_content;
  }

  public void setInquire_content(String inquire_content) {
    this.inquire_content = inquire_content;
  }

  public String getInquire_rname() {
    return inquire_rname;
  }

  public void setInquire_rname(String inquire_rname) {
    this.inquire_rname = inquire_rname;
  }

  public String getInquire_passwd() {
    return inquire_passwd;
  }

  public void setInquire_passwd(String inquire_passwd) {
    this.inquire_passwd = inquire_passwd;
  }

  public String getInquire_rdate() {
    return inquire_rdate;
  }

  public void setInquire_rdate(String inquire_rdate) {
    this.inquire_rdate = inquire_rdate;
  }

}
