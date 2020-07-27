package dev.mvc.mem_wish;

import java.util.HashMap;
import java.util.List;

public interface Mem_wishDAOInter {
  
  
  /**
   * <!-- ��� -->  
   * <insert id="create" parameterType="Mem_wishVO">
   * @param mem_wishVO
   * @return
   */
  public int create (Mem_wishVO mem_wishVO);

  
  /**
   * <!-- ��� --> 
   * <select id="list" parameterType="int" resultType="At_Mem_wishVO">
   * @return
   */
  public List <At_Mem_wishVO> list (int mem_no);
  
  
  /**
   * <!-- �˻� ��� + ����¡ -->
   * <select id="list_search_paging" resultType="At_Mem_wishVO" parameterType="HashMap">
   * @param map
   * @return
   */
  public List<At_Mem_wishVO> list_search_paging (HashMap<Object, Object> map);

  
  
  /**
   * �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<Object, Object> hashMap);
  
  
  /**
   * <!-- ��ȸ -->
   * <select id="read" parameterType="int" resultType="At_Mem_wishVO">
   * @param mem_wish_no
   * @return
   */
   public At_Mem_wishVO  read (int mem_wish_no);
  
   
  /**
   * <!-- ���� -->
   * <update id="update" parameterType="Mem_wishVO">
   * @param mem_wishVO
   * @return
   */
  public int update (Mem_wishVO mem_wishVO);

  
  /**
   * <!-- ���� -->
   * <delete id="delete">
   * @param mem_wish_no
   * @return
   */
  public int delete (int mem_wish_no);

  
  /**
   * <!-- ȸ���� ���� -->
   * <delete id="delete_by_mem_no" parameterType="int">
   * @param mem_no
   * @return
   */
  public int delete_by_mem_no (int mem_no);

}
