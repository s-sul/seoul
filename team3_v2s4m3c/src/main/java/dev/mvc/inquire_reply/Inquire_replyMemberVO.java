package dev.mvc.inquire_reply;
public class Inquire_replyMemberVO {
  /** ���̵� */
  private String mem_id = "";
  
  /** ��� ��ȣ */
  private int inquire_replyno;
  /** ���� ���� ��ȣ */
  private int inquireno;
  /** ȸ�� ��ȣ */
  private int mem_no;
  /** ���� */
  private String reply_content;
  /** �н����� */
  private String reply_passwd;
  /** ����� */
  private String reply_rdate;

  public String getId() {
    return mem_id;
  }

  public void setId(String mem_id) {
    this.mem_id = mem_id;
  }

  public int getInquire_replyno() {
    return inquire_replyno;
  }

  public void setInquire_replyno(int inquire_replyno) {
    this.inquire_replyno = inquire_replyno;
  }

  public int getInquireno() {
    return inquireno;
  }

  public void setInquireno(int inquireno) {
    this.inquireno = inquireno;
  }

  public int getMem_no() {
    return mem_no;
  }

  public void setMem_no(int mem_no) {
    this.mem_no = mem_no;
  }

  public String getReply_content() {
    return reply_content;
  }

  public void setReply_content(String reply_content) {
    this.reply_content = reply_content;
  }

  public String getReply_passwd() {
    return reply_passwd;
  }

  public void setReply_passwd(String reply_passwd) {
    this.reply_passwd = reply_passwd;
  }

  public String getReply_rdate() {
    return reply_rdate;
  }

  public void setReply_rdate(String reply_rdate) {
    this.reply_rdate = reply_rdate;
  }
  
}