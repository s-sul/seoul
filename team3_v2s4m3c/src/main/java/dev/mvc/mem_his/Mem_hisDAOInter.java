package dev.mvc.mem_his;

import java.util.List;

public interface Mem_hisDAOInter {
  
  
  /**
   * <!-- ��� -->
   * <insert id="create" parameterType="Mem_hisVO">
   * @param mem_his_no
   * @return
   */
  public int create (int mem_his_no);

  
  /**
   * <!--���-->
   * <select id="list" resultType="Mem_hisVO">
   * @return
   */
  public List<Mem_hisVO> list ();
  
  
  /**
   * <!-- ��ȸ-->
   * <select id="read" parameterType="int">
   * @param mem_his_no
   * @return
   */
  public Mem_hisVO read (int mem_his_no);
  

  /**
   * <!-- ����-->
   * <update id="update" parameterType="Mem_hisVO">
   * @param mem_hisVO
   * @return
   */
  public int update (Mem_hisVO mem_hisVO);

  
  /**
   * <!-- ����-->
   * <delete id="delete" parameterType="int">
   * @param mem_his_no
   * @return
   */
  public int delete (int mem_his_no);
  
  



}
