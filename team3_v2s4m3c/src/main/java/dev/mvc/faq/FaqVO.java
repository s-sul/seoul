package dev.mvc.faq;

/*
    faqno               NUMBER(10)     NOT NULL, -- ���� ��ȣ
    faq_title             VARCHAR2(100)  NOT NULL, -- ���� ����
    faq_content         VARCHAR2(100)  NOT NULL, -- ���� ����
    faq_rname         VARCHAR2(10)     NOT NULL, -- �����
    faq_passwd        VARCHAR2(15)     NOT NULL, -- �н�����
    faq_seqno            NUMBER(10)    NOT NULL, -- ��� ����
    faq_division          VARCHAR2(10)    NOT NULL, -- ����
    word                  VARCHAR2(300)   NULL , -- �˻���
    faq_date              DATE                 NOT NULL -- �����
*/
public class FaqVO {
  /** ���� ��ȣ */
  private int faqno;
  /** ���� ���� */
  private String faq_title;
  /** ���� ���� */
  private String faq_content;
  /** ����� */
  private String faq_rname;
  /** �н����� */
  private String faq_passwd;
  /** ��� ���� */
  private String faq_seqno;
  /** ���� */
  private String faq_division;
  /** ����� */
  private String faq_date;

  public int getFaqno() {
    return faqno;
  }

  public void setFaqno(int faqno) {
    this.faqno = faqno;
  }

  public String getFaq_title() {
    return faq_title;
  }

  public void setFaq_title(String faq_title) {
    this.faq_title = faq_title;
  }

  public String getFaq_content() {
    return faq_content;
  }

  public void setFaq_content(String faq_content) {
    this.faq_content = faq_content;
  }

  public String getFaq_rname() {
    return faq_rname;
  }

  public void setFaq_rname(String faq_rname) {
    this.faq_rname = faq_rname;
  }

  public String getFaq_passwd() {
    return faq_passwd;
  }

  public void setFaq_passwd(String faq_passwd) {
    this.faq_passwd = faq_passwd;
  }

  public String getFaq_seqno() {
    return faq_seqno;
  }

  public void setFaq_seqno(String faq_seqno) {
    this.faq_seqno = faq_seqno;
  }

  public String getFaq_division() {
    return faq_division;
  }

  public void setFaq_division(String faq_division) {
    this.faq_division = faq_division;
  }

  public String getFaq_date() {
    return faq_date;
  }

  public void setFaq_date(String faq_date) {
    this.faq_date = faq_date;
  }

}
