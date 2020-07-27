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
  // 리뷰 등록
  public int create(ReviewVO reviewVO) {
    int cnt = this.reviewDAO.create(reviewVO);
    return cnt;
  }

  @Override
  // 리뷰 조회
  public Mem_ReviewVO read_by_review_no(int review_no) {
    Mem_ReviewVO mem_ReviewVO = this.reviewDAO.read_by_review_no(review_no);
    return mem_ReviewVO;
  }

  @Override
  // 리뷰 목록 (전체)
  public List<ReviewVO> list() {
    List<ReviewVO> list = this.reviewDAO.list();
    return list;
  }

  @Override
  // 리뷰 목록 (상품별)
  public List<ReviewVO> list_by_at_no(int at_no) {
    List<ReviewVO> list = this.reviewDAO.list_by_at_no(at_no);
    return list;
  }


  @Override
  // 리뷰 갯수 (상품별)
  public int count_by_at_no(int at_no) {
    int count = this.reviewDAO.count_by_at_no(at_no);
    return count;
  }

  @Override
  // 리뷰 갯수 (회원별)
  public int count_by_mem_no (HashMap<Object, Object> map) {
    int count = this.reviewDAO.count_by_mem_no(map);
    return count;
  }
  

  @Override
  // 결제 번호별 조회
  public Mem_ReviewVO read_by_payment_no(int payment_no) {
    Mem_ReviewVO mem_ReviewVO = this.reviewDAO.read_by_payment_no(payment_no);
    return mem_ReviewVO;
  }

  
  @Override
  // 결제 번호별 리뷰 존재 여부
  public int existReview(int payment_no) {
    int cnt = this.reviewDAO.existReview(payment_no);
    return cnt;
  }
  

  @Override
  // 리뷰 수정
  public int update(ReviewVO reviewVO) {
    int cnt = this.reviewDAO.update(reviewVO);
    return cnt;
  }

  
  @Override
  // 리뷰 삭제
  public int delete(int review_no) {
    int cnt = this.reviewDAO.delete(review_no);
    return cnt;
  }

  
  @Override
  // 더보기 버튼 페이징 구현 
  public List<Mem_ReviewVO> list_by_at_no_join_add_view(HashMap<String, Object> map) {
    
    int record_per_page = 2; // 한페이지당 2건
    
    // replyPage는 1부터 시작
    int beginOfPage = ((Integer)map.get("reviewPage") - 1) * record_per_page; // 한페이지당 2건

    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + record_per_page;  // 한페이지당 2건
    /*
    1 페이지: WHERE r >= 1 AND r <= 2
    2 페이지: WHERE r >= 3 AND r <= 4
    3 페이지: WHERE r >= 5 AND r <= 6
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<Mem_ReviewVO> list = reviewDAO.list_by_at_no_join_add_view(map);
    
    String review_word = "";
    
    // 특수 문자 변경
    for (Mem_ReviewVO mem_ReviewVO:list) {
      review_word = mem_ReviewVO.getReview_word();
      review_word = Tool.convertChar(review_word);
      mem_ReviewVO.setReview_word(review_word);
    }
    return list;
  }
  
  

  @Override
  // 리뷰 목록 (회원별)
  public List<Payment_ReviewVO> list_by_mem_no (HashMap<Object, Object> map) {
    
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지: nowPage = 1, (1 - 1) * 10 --> 0 
    2 페이지: nowPage = 2, (2 - 1) * 10 --> 10
    3 페이지: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Review.RECORD_PER_PAGE;
   
    // 시작 rownum
    // 1 페이지: 0 +1
    // 2 페이지: 10 + 1  
    // 3 페이지: 20 + 1 
    int startNum = beginOfPage + 1; 
    
    //  종료 rownum
    // 1 페이지: 0 + 10  
    // 2 페이지: 0 + 20 
    // 3 페이지: 0 + 30
    int endNum = beginOfPage + Review.RECORD_PER_PAGE;   
    
    /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<Payment_ReviewVO> list = reviewDAO.list_by_mem_no(map);
    return list;
  }
    
  
  
  //Paging Box
   /** 
    * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
    * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
    *
    * @param listFile 목록 파일명 
    * @param cateno 카테고리번호 
    * @param search_count 검색(전체) 레코드수 
    * @param nowPage     현재 페이지
    * @param word 검색어
    * @return 페이징 생성 문자열
    */ 
   @Override
   public String pagingBox (String listFile, int search_count, int nowPage, String word) {
     
     int totalPage = (int)(Math.ceil ((double) search_count/Review.RECORD_PER_PAGE));  // 전체 페이지  
     int totalGrp = (int)(Math.ceil ((double)totalPage/Review.PAGE_PER_BLOCK));              // 전체 그룹 
     int nowGrp = (int)(Math.ceil ((double)nowPage/Review.PAGE_PER_BLOCK));               // 현재 그룹 
     int startPage = ((nowGrp - 1) * Review.PAGE_PER_BLOCK) + 1;                                   // 특정 그룹의 페이지 목록 시작  
     int endPage = (nowGrp * Review.PAGE_PER_BLOCK);                                                 // 특정 그룹의 페이지 목록 종료   
      
     StringBuffer str = new StringBuffer(); 
      
     // ↓'id=paging'인 태그
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
     str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
     str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
     str.append("  }"); 
     str.append("  .span_box_2{"); 
     str.append("    text-align: center;");    
     str.append("    background-color: #668db4;"); 
     str.append("    color: #FFFFFF;"); 
     str.append("    font-size: 1em;"); 
     str.append("    border: 1px;"); 
     str.append("    border-style: solid;"); 
     str.append("    border-color: #cccccc;"); 
     str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
     str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
     str.append("  }"); 
     str.append("</style>"); 
     str.append("<DIV id='paging'>"); 
     // str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
  
     
     // ▶ 이전 10개 페이지로 이동
     // nowGrp: 1 (1 ~ 10 page),  
     // nowGrp: 2 (11 ~ 20 page)
     // nowGrp: 3 (21 ~ 30 page) 
     // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지 (10)
     // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 (20)
     
     int _nowPage = (nowGrp-1) * Review.PAGE_PER_BLOCK;  
     
     if (nowGrp >= 2){ 
       str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"'>이전</A></span>"); 
     } 
  
     
     // ▶중앙에 위치할 페이지 목록
     for(int i=startPage; i<=endPage; i++){ 
       
       if (i > totalPage){ // 마지막 페이지를 넘어가면 종료
         break; 
       } 
   
       if (nowPage == i){ // 페이지가 현재 페이지와 같은 경우 CSS 강조, 링크 X
         str.append("<span class='span_box_2'>"+i+"</span>"); 
       }else{
         // 현재 페이지가 아닌 페이지, 링크 O
         str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+i+"'>"+i+"</A></span>");   
       } 
       
     } 
  
     
     // ▶ 10개 다음 페이지로 이동
     // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
     // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작 페이지 11
     // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작 페이지 21
     _nowPage = (nowGrp * Review.PAGE_PER_BLOCK)+1;  
     if (nowGrp < totalGrp){ 
       str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+"'>다음</A></span>"); 
     } 
     str.append("</DIV>"); 
      
     return str.toString(); 
   }

  


}
