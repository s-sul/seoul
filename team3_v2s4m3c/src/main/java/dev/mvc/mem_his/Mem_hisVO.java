package dev.mvc.mem_his;

public class Mem_hisVO {
  /*
    mem_his_no                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    mem_his_seqno                     NUMBER(10)     NOT NULL,
    
    mem_no                            NUMBER(10)     NOT NULL,
    at_no                             NUMBER(10)     NOT NULL,
    payment_no                       NUMBER(10)    NOT NULL,

    FOREIGN KEY (mem_no) REFERENCES mem (mem_no),
    FOREIGN KEY (at_no) REFERENCES at (at_no),
    FOREIGN KEY (payment_no) REFERENCES payment (payment_no)
   * */

  private int mem_his_no; /**ȸ�� �̷� ��ȣ*/
  
  private int mem_no; /**ȸ�� ��ȣ*/
  private int at_no; /**��ǰ ��ȣ*/
  private int payment_no; /**������ȣ*/
  
  
  public int getMem_his_no() {
    return mem_his_no;
  }
  public void setMem_his_no(int mem_his_no) {
    this.mem_his_no = mem_his_no;
  }

  public int getMem_no() {
    return mem_no;
  }
  public void setMem_no(int mem_no) {
    this.mem_no = mem_no;
  }
  public int getAt_no() {
    return at_no;
  }
  public void setAt_no(int at_no) {
    this.at_no = at_no;
  }
  public int getPayment_no() {
    return payment_no;
  }
  public void setPayment_no(int payment_no) {
    this.payment_no = payment_no;
  }
  
  
}
