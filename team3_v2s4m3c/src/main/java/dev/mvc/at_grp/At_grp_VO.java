package dev.mvc.at_grp;

public class At_grp_VO {
 /* 
  at_grp_no                         NUMBER(10)     NOT NULL,
  at_grp_name                         VARCHAR2(50)     NOT NULL,
  at_grp_seqno                        NUMBER(7)    DEFAULT 0     NOT NULL
  
COMMENT ON TABLE at_grp is '��ǰ�׷�';
COMMENT ON COLUMN at_grp.at_grp_no is '��ǰ�׷��ȣ';
COMMENT ON COLUMN at_grp.at_grp_name is '��ǰ�׷��';
COMMENT ON COLUMN at_grp.at_grp_seqno is '��ǰ�׷���¼���';
 */
  
  //��ǰ�׷��ȣ
  private int at_grp_no;
  //��ǰ�׷��
  private String at_grp_name;
  //��ǰ�׷���¼���
  private int at_grp_seqno;
  //��ǰ�׷���¸��
  private String at_grp_visible;
  
  
  public int getAt_grp_no() {
    return at_grp_no;
  }
  public void setAt_grp_no(int at_grp_no) {
    this.at_grp_no = at_grp_no;
  }
  public String getAt_grp_name() {
    return at_grp_name;
  }
  public void setAt_grp_name(String at_grp_name) {
    this.at_grp_name = at_grp_name;
  }
  public int getAt_grp_seqno() {
    return at_grp_seqno;
  }
  public void setAt_grp_seqno(int at_grp_seqno) {
    this.at_grp_seqno = at_grp_seqno;
  }
  public String getAt_grp_visible() {
    return at_grp_visible;
  }
  public void setAt_grp_visible(String at_grp_visible) {
    this.at_grp_visible = at_grp_visible;
  }
  
  
}
