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
    * ������ ��� ���ڿ� ����, Box ����
    * @param listFile ��� ���ϸ� 
    * @param mem_no ī�װ���ȣ
    * @param search_count �˻� ����
    * @param nowPage ���� ������, nowPage�� 1���� ����
    * @param word �˻���
    * @return
    */
   public String pagingBox(int mem_no, int search_count, int nowPage);
   
}
