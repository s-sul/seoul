package dev.mvc.cart;
/*
 SELECT   c.cart_no as c_cart_no, c.cart_cnt as c_cart_cnt, c.cart_payment as c_cart_payment, 
                  c.cart_date as c_cart_date,
                a.at_no  as  a_at_no, a.at_price as a_at_price
 */
public class At_Cart_VO {

  private int at_no;
  private int at_price;
  private String at_name;
  
  private int cart_no;
  private int cart_cnt;
  private int cart_payment;
  private String cart_date;
  private int mem_no;
  
  
  
  
  
  
  public int getMem_no() {
    return mem_no;
  }
  public void setMem_no(int mem_no) {
    this.mem_no = mem_no;
  }
  public String getAt_name() {
    return at_name;
  }
  public void setAt_name(String at_name) {
    this.at_name = at_name;
  }
  public int getAt_no() {
    return at_no;
  }
  public void setAt_no(int at_no) {
    this.at_no = at_no;
  }
  public int getAt_price() {
    return at_price;
  }
  public void setAt_price(int at_price) {
    this.at_price = at_price;
  }
  public int getCart_no() {
    return cart_no;
  }
  public void setCart_no(int cart_no) {
    this.cart_no = cart_no;
  }
  public int getCart_cnt() {
    return cart_cnt;
  }
  public void setCart_cnt(int cart_cnt) {
    this.cart_cnt = cart_cnt;
  }
  public int getCart_payment() {
    return cart_payment;
  }
  public void setCart_payment(int cart_payment) {
    this.cart_payment = cart_payment;
  }
  public String getCart_date() {
    return cart_date;
  }
  public void setCart_date(String cart_date) {
    this.cart_date = cart_date;
  }

  
  
}
