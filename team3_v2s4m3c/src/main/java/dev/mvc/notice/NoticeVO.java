package dev.mvc.notice;

/*
  noticeno              NUMBER(10)     NOT NULL, -- ���� ��ȣ
  notice_title           VARCHAR2(100)     NOT NULL, -- ���� ����
  notice_content      VARCHAR2(100)     NOT NULL, -- ���� ����
  notice_rname        VARCHAR2(10)    NOT NULL, -- �����
  notice_passwd       VARCHAR2(15)    NOT NULL, -- �н�����
  notice_cnt             NUMBER(7)     NOT NULL, -- ��ȸ��
  notice_division       VARCHAR2(10)    NOT NULL, -- ����
  notice_rdate          DATE               NOT NULL -- �����  
*/
public class NoticeVO {
  /** ���� ��ȣ */
  private int noticeno;
  /** ���� ���� */
  private String notice_title;
  /** ���� ���� */
  private String notice_content;
  /** ����� */
  private String notice_rname;
  /** �н����� */
  private String notice_passwd;
  /** ��ȸ�� */
  private int notice_cnt;
  /** ���� */
  private String notice_division;
  /** ����� */
  private String notice_rdate;

  public int getNoticeno() {
    return noticeno;
  }

  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
  }

  public String getNotice_title() {
    return notice_title;
  }

  public void setNotice_title(String notice_title) {
    this.notice_title = notice_title;
  }

  public String getNotice_content() {
    return notice_content;
  }

  public void setNotice_content(String notice_content) {
    this.notice_content = notice_content;
  }

  public String getNotice_rname() {
    return notice_rname;
  }

  public void setNotice_rname(String notice_rname) {
    this.notice_rname = notice_rname;
  }

  public String getNotice_passwd() {
    return notice_passwd;
  }

  public void setNotice_passwd(String notice_passwd) {
    this.notice_passwd = notice_passwd;
  }

  public int getNotice_cnt() {
    return notice_cnt;
  }

  public void setNotice_cnt(int notice_cnt) {
    this.notice_cnt = notice_cnt;
  }

  public String getNotice_division() {
    return notice_division;
  }

  public void setNotice_division(String notice_division) {
    this.notice_division = notice_division;
  }

  public String getNotice_rdate() {
    return notice_rdate;
  }

  public void setNotice_rdate(String notice_rdate) {
    this.notice_rdate = notice_rdate;
  }

}
