package dev.mvc.mem_wish;

public class Mem_wishVO {
  
  
  /*
    mem_wish_no                       NUMBER(10)     NOT NULL    PRIMARY KEY,
    at_no                             NUMBER(10)     NOT NULL,
    mem_no                            NUMBER(10)     NOT NULL,
    mem_wish_seqno                    NUMBER(10)     DEFAULT 1     NOT NULL,
    word                                    VARCHAR2(100)   NULL,
    FOREIGN KEY (mem_no) REFERENCES mem (mem_no),
    FOREIGN KEY (at_no) REFERENCES at (at_no)

    COMMENT ON TABLE mem_wish is 'ȸ�� ���ø���Ʈ';
    COMMENT ON COLUMN mem_wish.mem_wish_no is 'ȸ�� ���� ��ȣ';
    COMMENT ON COLUMN mem_wish.at_no is '��ǰ ��ȣ';
    COMMENT ON COLUMN mem_wish.mem_no is 'ȸ�� ��ȣ';
    COMMENT ON COLUMN mem_wish.mem_wish_seqno is 'ȸ�� ���� ��� ��ȣ';
    COMMENT ON COLUMN mem_wish.word is 'ȸ�� ���� �˻���';
   */
  
  
  private int mem_wish_no; /**ȸ�� ���� ��ȣ*/
  private int at_no; /**��ǰ ��ȣ*/
  private int mem_no; /**ȸ�� ��ȣ*/
  private int mem_wish_seqno; /**ȸ�� ���� ��� ��ȣ*/
  private String word; /**ȸ�� ���� �˻���*/
  
  
  
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
  public String getWord() {
    return word;
  }
  public void setWord(String word) {
    this.word = word;
  }
  
  
  
  

}
