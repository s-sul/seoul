package dev.mvc.review;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.review.ReviewProc")
public class ReviewProc implements ReviewProcInter{
  
  @Autowired
  private ReviewDAOInter reviewDAO;

  @Override
  // ���� ���
  public int create(ReviewVO reviewVO) {
    int cnt = this.reviewDAO.create(reviewVO);
    return cnt;
  }

  @Override
  // ���� ��ȸ
  public Mem_ReviewVO read_by_review_no(int review_no) {
    Mem_ReviewVO mem_ReviewVO = this.reviewDAO.read_by_review_no(review_no);
    return mem_ReviewVO;
  }

  @Override
  // ���� ��� (��ü)
  public List<ReviewVO> list() {
    List<ReviewVO> list = this.reviewDAO.list();
    return list;
  }

  @Override
  // ���� ��� (��ǰ��)
  public List<ReviewVO> list_by_at_no(int at_no) {
    List<ReviewVO> list = this.reviewDAO.list_by_at_no(at_no);
    return list;
  }


  @Override
  // ���� ���� (��ǰ��)
  public int count_by_at_no(int at_no) {
    int count = this.reviewDAO.count_by_at_no(at_no);
    return count;
  }

  @Override
  // ���� ���� (ȸ����)
  public int count_by_mem_no (HashMap<Object, Object> map) {
    int count = this.reviewDAO.count_by_mem_no(map);
    return count;
  }
  

  @Override
  // ���� ��ȣ�� ��ȸ
  public Mem_ReviewVO read_by_payment_no(int payment_no) {
    Mem_ReviewVO mem_ReviewVO = this.reviewDAO.read_by_payment_no(payment_no);
    return mem_ReviewVO;
  }

  
  @Override
  // ���� ��ȣ�� ���� ���� ����
  public int existReview(int payment_no) {
    int cnt = this.reviewDAO.existReview(payment_no);
    return cnt;
  }
  

  @Override
  // ���� ����
  public int update(ReviewVO reviewVO) {
    int cnt = this.reviewDAO.update(reviewVO);
    return cnt;
  }

  
  @Override
  // ���� ����
  public int delete(int review_no) {
    int cnt = this.reviewDAO.delete(review_no);
    return cnt;
  }

  
  @Override
  // ������ ��ư ����¡ ���� 
  public List<Mem_ReviewVO> list_by_at_no_join_add_view(HashMap<String, Object> map) {
    
    int record_per_page = 2; // ���������� 2��
    
    // replyPage�� 1���� ����
    int beginOfPage = ((Integer)map.get("reviewPage") - 1) * record_per_page; // ���������� 2��

    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + record_per_page;  // ���������� 2��
    /*
    1 ������: WHERE r >= 1 AND r <= 2
    2 ������: WHERE r >= 3 AND r <= 4
    3 ������: WHERE r >= 5 AND r <= 6
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<Mem_ReviewVO> list = reviewDAO.list_by_at_no_join_add_view(map);
    
    String review_word = "";
    
    // Ư�� ���� ����
    for (Mem_ReviewVO mem_ReviewVO:list) {
      review_word = mem_ReviewVO.getReview_word();
      review_word = Tool.convertChar(review_word);
      mem_ReviewVO.setReview_word(review_word);
    }
    return list;
  }
  
  

  @Override
  // ���� ��� (ȸ����)
  public List<Payment_ReviewVO> list_by_mem_no (HashMap<Object, Object> map) {
    
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Review.RECORD_PER_PAGE;
   
    // ���� rownum
    // 1 ������: 0 +1
    // 2 ������: 10 + 1  
    // 3 ������: 20 + 1 
    int startNum = beginOfPage + 1; 
    
    //  ���� rownum
    // 1 ������: 0 + 10  
    // 2 ������: 0 + 20 
    // 3 ������: 0 + 30
    int endNum = beginOfPage + Review.RECORD_PER_PAGE;   
    
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<Payment_ReviewVO> list = reviewDAO.list_by_mem_no(map);
    return list;
  }
    
  
  
  //Paging Box
   /** 
    * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
    * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
    *
    * @param listFile ��� ���ϸ� 
    * @param cateno ī�װ���ȣ 
    * @param search_count �˻�(��ü) ���ڵ�� 
    * @param nowPage     ���� ������
    * @param word �˻���
    * @return ����¡ ���� ���ڿ�
    */ 
   @Override
   public String pagingBox (String listFile, int search_count, int nowPage, String word) {
     
     int totalPage = (int)(Math.ceil ((double) search_count/Review.RECORD_PER_PAGE));  // ��ü ������  
     int totalGrp = (int)(Math.ceil ((double)totalPage/Review.PAGE_PER_BLOCK));              // ��ü �׷� 
     int nowGrp = (int)(Math.ceil ((double)nowPage/Review.PAGE_PER_BLOCK));               // ���� �׷� 
     int startPage = ((nowGrp - 1) * Review.PAGE_PER_BLOCK) + 1;                                   // Ư�� �׷��� ������ ��� ����  
     int endPage = (nowGrp * Review.PAGE_PER_BLOCK);                                                 // Ư�� �׷��� ������ ��� ����   
      
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
     
     int _nowPage = (nowGrp-1) * Review.PAGE_PER_BLOCK;  
     
     if (nowGrp >= 2){ 
       str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"'>����</A></span>"); 
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
         str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+i+"'>"+i+"</A></span>");   
       } 
       
     } 
  
     
     // �� 10�� ���� �������� �̵�
     // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
     // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���� ������ 11
     // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���� ������ 21
     _nowPage = (nowGrp * Review.PAGE_PER_BLOCK)+1;  
     if (nowGrp < totalGrp){ 
       str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"'>����</A></span>"); 
     } 
     str.append("</DIV>"); 
      
     return str.toString(); 
   }

  


}
