package dev.mvc.mem_his;

import dev.mvc.payment.PaymentVO;

public class At_Mem_hisVO {
  
  // At ��ǰ
  private int at_no; /**��ǰ*/
  private int at_grp_no; /**��ǰ��ȣ*/
  private String at_name; /**��ǰ��*/
  
  // Payment ����
  private PaymentVO paymentVO;
  
  // Mem_wish ȸ�� ���� ����
  private Mem_hisVO mem_hisVO; /**ȸ�� ���ø���Ʈ*/

  public int getAt_no() {
    return at_no;
  }

  public void setAt_no(int at_no) {
    this.at_no = at_no;
  }

  public int getAt_grp_no() {
    return at_grp_no;
  }

  public void setAt_grp_no(int at_grp_no) {
    this.at_grp_no = at_grp_no;
  }

  public String getAt_name() {
    return at_name;
  }

  public void setAt_name(String at_name) {
    this.at_name = at_name;
  }

  public PaymentVO getPaymentVO() {
    return paymentVO;
  }

  public void setPaymentVO(PaymentVO paymentVO) {
    this.paymentVO = paymentVO;
  }

  public Mem_hisVO getMem_hisVO() {
    return mem_hisVO;
  }

  public void setMem_hisVO(Mem_hisVO mem_hisVO) {
    this.mem_hisVO = mem_hisVO;
  }
  
  
  

  
  

}
