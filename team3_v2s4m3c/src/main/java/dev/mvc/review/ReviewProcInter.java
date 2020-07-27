package dev.mvc.review;

import java.util.HashMap;
import java.util.List;

public interface ReviewProcInter {
  
  /**
   * ���� ���
   * @param reviewVO
   * @return
   */
  public int create(ReviewVO reviewVO);
  

  /**
   * ���� ��ȸ
   * @param mem_ReviewVO
   * @return
   */
  public Mem_ReviewVO read_by_review_no (int review_no);
  
  
  /**
   * ���� ��� (��ü)
   * @return
   */
  public List<ReviewVO> list();
  
  
  /**
   * ���� ��� (��ǰ��)
   * @param at_no
   * @return
   */
  public List<ReviewVO> list_by_at_no(int at_no);

  
  /**
   * ���� ��� (ȸ����)
   * @param mem_no
   * @return
   */
  public List<Payment_ReviewVO> list_by_mem_no(HashMap<Object, Object> map);
  
  
  
  /**
   * ������ ��� ���ڿ� ����, Box ���� (�� DAO ȣ�� X ��)
   * @param listFile ��� ���ϸ� 
   * @param cateno ī�װ���ȣ
   * @param search_count �˻� ����
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @param word �˻���
   * @return
   */
  public String pagingBox (String listFile,  int search_count, int nowPage, String word);
  
  
  
  /**
   * ���� ��ȣ�� ��ȸ
   * @param payment_no
   * @return
   */
  public Mem_ReviewVO read_by_payment_no (int payment_no);
  
  
  /**
   * ���� ��ȣ�� ���� ���� ����
   * @param payment_no
   * @return
   */
  public int existReview (int payment_no);

  
  
  /**
   * ���� ���� (��ǰ��)
   * @param at_no
   * @return
   */
  public int count_by_at_no (int at_no);
  
  
  /**
   * ���� ���� (ȸ����)
   * @param mem_no
   * @return
   */
  public int count_by_mem_no (HashMap<Object, Object> map);

  
  /**
   * ���� ����
   * @param reviewVO
   * @return
   */
  public int update (ReviewVO reviewVO);
  
  
  /**
   * ���� ����
   * @param review_no
   * @return
   */
  public int delete(int review_no);
  
  
  /**
   * ������ ��ư ����¡ ���� 
   * <select id="list_by_at_no_join_add_view" resultType="mem_review_VO" parameterType="HashMap" >
   * @param map
   * @return
   */
  public List<Mem_ReviewVO> list_by_at_no_join_add_view(HashMap<String, Object> map);


}
