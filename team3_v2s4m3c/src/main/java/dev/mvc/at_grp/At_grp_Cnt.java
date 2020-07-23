package dev.mvc.at_grp;

public class At_grp_Cnt {
  
//  
//  select count(*) as cnt
//  from at
//  group by at_grp_no

  private int cnt;
  private int at_grp_no;
  private String at_grp_name;
  private String at_grp_visible;

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

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

  public String getAt_grp_visible() {
    return at_grp_visible;
  }

  public void setAt_grp_visible(String at_grp_visible) {
    this.at_grp_visible = at_grp_visible;
  }
  
  
  
}
