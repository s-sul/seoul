package dev.mvc.mem_wish;

public class At_Mem_wishVO {
  
  
  // At ��ǰ ���̺�
  private int a_at_no; /**��ǰ*/
  private String at_name; /**��ǰ��*/
  private int at_price; /**��ǰ����*/
  private String at_visible; /**��ǰ��¸��*/
  private String at_detail; /**��ǰ ������*/

  
  
  // Mem_wish ȸ�� ���ø���Ʈ ���̺�
  
  private int mem_wish_no; /**ȸ�� ���� ��ȣ*/
  private int at_no; /**��ǰ ��ȣ*/
  private int mem_no; /**ȸ�� ��ȣ*/
  private int mem_wish_seqno; /**ȸ�� ���� ��� ��ȣ*/
  private String word; /**ȸ�� ���� �˻���*/

  
  
  public int getA_at_no() {
    return a_at_no;
  }
  public String getWord() {
    return word;
  }
  public void setWord(String word) {
    this.word = word;
  }
  public void setA_at_no(int a_at_no) {
    this.a_at_no = a_at_no;
  }
  public String getAt_name() {
    return at_name;
  }
  public void setAt_name(String at_name) {
    this.at_name = at_name;
  }
  public int getAt_price() {
    return at_price;
  }
  public void setAt_price(int at_price) {
    this.at_price = at_price;
  }
  public String getAt_visible() {
    return at_visible;
  }
  public void setAt_visible(String at_visible) {
    this.at_visible = at_visible;
  }
  public int getMem_wish_no() {
    return mem_wish_no;
  }
  public void setMem_wish_no(int mem_wish_no) {
    this.mem_wish_no = mem_wish_no;
  }
  public int getAt_no() {
    return at_no;
  }
  public void setAt_no(int at_no) {
    this.at_no = at_no;
  }
  public int getMem_no() {
    return mem_no;
  }
  public void setMem_no(int mem_no) {
    this.mem_no = mem_no;
  }
  public int getMem_wish_seqno() {
    return mem_wish_seqno;
  }
  public void setMem_wish_seqno(int mem_wish_seqno) {
    this.mem_wish_seqno = mem_wish_seqno;
  }
  public String getAt_detail() {
    return at_detail;
  }
  public void setAt_detail(String at_detail) {
    this.at_detail = at_detail;
  }
  
  
  
  





  
  
}
