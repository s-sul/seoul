package dev.mvc.review;

public class Payment_ReviewVO {
  
//      review_no                                NUMBER(10)         NOT NULL         PRIMARY KEY,
//      at_no                                      NUMBER(10)    NOT     NULL ,
//      mem_no                            NUMBER(10)         NOT NULL ,
//      payment_no                            NUMBER(10)         NOT NULL ,
//      review_word                               VARCHAR2(1000)         NOT NULL,
//      review_rate                                 NUMBER(1)               NOT NULL,

//      rdate                                  DATE NOT NULL,
//  FOREIGN KEY (at_no) REFERENCES at (at_no),
//  FOREIGN KEY (mem_no) REFERENCES mem (mem_no),
//  FOREIGN KEY (payment_no) REFERENCES payment (payment_no)
  
  private int p_payment_no;
  private int payment_total;             
  private int p_at_no;                          
  private int p_mem_no;                     
  private String at_name;
  
  private int r_payment_no; /**결제 번호*/
  private int review_no; /**댓글번호*/
  private int r_at_no; /**댓글번호*/
  private int r_mem_no; /**회원 번호*/
  private String review_word; /**리뷰 내용*/
  private int review_rate; /**리뷰 평가*/
  
  
  
  public int getP_payment_no() {
    return p_payment_no;
  }
  public void setP_payment_no(int p_payment_no) {
    this.p_payment_no = p_payment_no;
  }
  public int getPayment_total() {
    return payment_total;
  }
  public void setPayment_total(int payment_total) {
    this.payment_total = payment_total;
  }
  public int getP_at_no() {
    return p_at_no;
  }
  public void setP_at_no(int p_at_no) {
    this.p_at_no = p_at_no;
  }
  public int getP_mem_no() {
    return p_mem_no;
  }
  public void setP_mem_no(int p_mem_no) {
    this.p_mem_no = p_mem_no;
  }
  public String getAt_name() {
    return at_name;
  }
  public void setAt_name(String at_name) {
    this.at_name = at_name;
  }
  public int getR_payment_no() {
    return r_payment_no;
  }
  public void setR_payment_no(int r_payment_no) {
    this.r_payment_no = r_payment_no;
  }
  public int getReview_no() {
    return review_no;
  }
  public void setReview_no(int review_no) {
    this.review_no = review_no;
  }
  public int getR_at_no() {
    return r_at_no;
  }
  public void setR_at_no(int r_at_no) {
    this.r_at_no = r_at_no;
  }
  public int getR_mem_no() {
    return r_mem_no;
  }
  public void setR_mem_no(int r_mem_no) {
    this.r_mem_no = r_mem_no;
  }
  public String getReview_word() {
    return review_word;
  }
  public void setReview_word(String review_word) {
    this.review_word = review_word;
  }
  public int getReview_rate() {
    return review_rate;
  }
  public void setReview_rate(int review_rate) {
    this.review_rate = review_rate;
  }
  
  
}
