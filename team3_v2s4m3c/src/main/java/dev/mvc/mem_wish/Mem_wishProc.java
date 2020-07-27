package dev.mvc.mem_wish;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.mem_wish.Mem_wishProc")
public class Mem_wishProc implements Mem_wishProcInter {
  
  @Autowired
  private Mem_wishDAOInter mem_wishDAO;

  @Override
  // ���
  public int create(Mem_wishVO mem_wishVO) {
    int cnt = this.mem_wishDAO.create(mem_wishVO);
    return cnt;
  }

  
  @Override
  // ���
  public List<At_Mem_wishVO> list(int mem_no) {
    List<At_Mem_wishVO> list = this.mem_wishDAO.list(mem_no);
    return list;
  }
  
  
  @Override
  // �˻� ��� + ����¡
  public List<At_Mem_wishVO> list_search_paging(HashMap<Object, Object> map) {
    
    System.out.println("Mem_wish Proc ����");
    
    int mem_no = (Integer)map.get("mem_no");
    String word = (String)map.get("word");
    
    System.out.println("mem_no: " + mem_no);
    System.out.println("word: " + word);

    int nowPage = 0;
    try {
      nowPage = (Integer)map.get("nowPage");
    } catch (NullPointerException e){
      nowPage = 1;
    }
    
    System.out.println("Proc nowPage: " + nowPage);  
    
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    
    // int beginOfPage = ((Integer)map.get("nowPage") - 1) * Mem_wish.RECORD_PER_PAGE;
    int beginOfPage = (nowPage - 1) * Mem_wish.RECORD_PER_PAGE;
   
    // ���� rownum
    // 1 ������: 0 +1
    // 2 ������: 10 + 1  
    // 3 ������: 20 + 1 
    int startNum = beginOfPage + 1; 
    
    //  ���� rownum
    // 1 ������: 00 + 10 = 10  
    // 2 ������: 10 + 10 = 20 
    // 3 ������: 20 + 10 = 30
    int endNum = beginOfPage + Mem_wish.RECORD_PER_PAGE;   
    
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    
    System.out.println("Proc: startNum: " + startNum);
    System.out.println("Proc: endNum: " + endNum);
    System.out.println("Proc: word: " + map.get("word"));
    System.out.println("Proc: mem_no: " + map.get("mem_no"));
    
    List<At_Mem_wishVO> list = this.mem_wishDAO.list_search_paging(map);
    return list;
  }
  

  
  /** 
   * ������ ��� ���ڿ� ����, Box ���� (�� DAO ȣ�� X ��)
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  
  @Override
  public String pagingBox (String listFile, int mem_no, int search_count, int nowPage, String word) {
    
    int totalPage = (int)(Math.ceil ((double) search_count/Mem_wish.RECORD_PER_PAGE));  // ��ü ������  
    int totalGrp = (int)(Math.ceil ((double)totalPage/Mem_wish.PAGE_PER_BLOCK));              // ��ü �׷� 
    int nowGrp = (int)(Math.ceil ((double)nowPage/Mem_wish.PAGE_PER_BLOCK));               // ���� �׷� 
    int startPage = ((nowGrp - 1) * Mem_wish.PAGE_PER_BLOCK) + 1;                                   // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Mem_wish.PAGE_PER_BLOCK);                                                 // Ư�� �׷��� ������ ��� ����   
     
    StringBuffer str = new StringBuffer(); 
     
    // ��'id=paging'�� �±�
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
    // str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    
    // �� ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  
    // nowGrp: 2 (11 ~ 20 page)
    // nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������ (10)
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������ (20)
    
    int _nowPage = (nowGrp-1) * Mem_wish.PAGE_PER_BLOCK;  
    
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"&mem_no="+mem_no+"'>����</A></span>"); 
    } 
 
    
    // ���߾ӿ� ��ġ�� ������ ���
    for(int i=startPage; i<=endPage; i++){ 
      
      if (i > totalPage){ // ������ �������� �Ѿ�� ����
        break; 
      } 
  
      if (nowPage == i){ // �������� ���� �������� ���� ��� CSS ����, ��ũ X
        str.append("<span class='span_box_2'>"+i+"</span>"); 
      }else{
        // ���� �������� �ƴ� ������, ��ũ O
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+i+"&mem_no="+mem_no+"'>"+i+"</A></span>");   
      } 
      
    } 
 
    
    // �� 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���� ������ 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���� ������ 21
    _nowPage = (nowGrp * Mem_wish.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"&mem_no="+mem_no+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 

  
  
  @Override
  // �˻� ���ڵ� ����
  public int search_count(HashMap<Object, Object> hashMap) {
    int count = mem_wishDAO.search_count(hashMap);
    return count;
  }
  
  

  @Override
  // ��ȸ
  public At_Mem_wishVO read(int mem_wish_no) {
    At_Mem_wishVO at_Mem_wishVO = this.mem_wishDAO.read(mem_wish_no);
    return at_Mem_wishVO;
  }

  @Override
  // ����
  public int update(Mem_wishVO mem_wishVO) {
    int cnt = this.mem_wishDAO.update(mem_wishVO);
    return cnt;
  }

  @Override
  // ����
  public int delete(int mem_wish_no) {
    int cnt = this.mem_wishDAO.delete(mem_wish_no);
    return cnt;
  }

  @Override
  // ȸ���� ����
  public int delete_by_mem_no(int mem_no) {
    int cnt = this.mem_wishDAO.delete_by_mem_no(mem_no);
    return cnt;
  }



}
