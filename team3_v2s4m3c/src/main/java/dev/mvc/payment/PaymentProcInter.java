package dev.mvc.payment;

import java.util.HashMap;
import java.util.List;

public interface PaymentProcInter {
  /**
   *  <insert id="create" parameterType="PaymentVO">
   */
   public int create(PaymentVO paymentVO);
   

   public List<PaymentVO> list(int mem_no);
   
/*
   public List<At_Payment_VO> at_payment_mem_list(int mem_no);
   
 */

   public PaymentVO read(int payment_no);

   public int delete(PaymentVO paymentVO);
   
   /**
    *  <select id="search_count" resultType="int" parameterType="HashMap">
    */
   public int search_count(HashMap<String, Object> hashMap);
   
   
   /**
    *        <select id="list" parameterType="HashMap" resultType="HashMap">
    */
   
   public List<PaymentVO> list(HashMap<String, Object> map);
   
   /**
    * 페이지 목록 문자열 생성, Box 형태
    * @param listFile 목록 파일명 
    * @param mem_no 카테고리번호
    * @param search_count 검색 갯수
    * @param nowPage 현재 페이지, nowPage는 1부터 시작
    * @param word 검색어
    * @return
    */
   public String pagingBox(int mem_no, int search_count, int nowPage);
   
}
