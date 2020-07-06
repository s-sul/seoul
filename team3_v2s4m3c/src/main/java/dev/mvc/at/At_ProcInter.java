package dev.mvc.at;

import java.util.HashMap;
import java.util.List;

public interface At_ProcInter {
  
  
  /** ����¡+�˻� ����Ʈ
   * 
   * @param hashmap
   * @return
   */
    public List<At_Img> at_img_list(HashMap hashmap);
    
    
    /**
     * ����Ʈ ����Ʈ
     * @param hashmap
     * @return
     */
    public List<At_Img> list_main(HashMap hashmap);
    
    
    /** �˻� ���ڵ� ��
     *   <select id="search_count" resultType="int" parameterType="HashMap">
     * @param hashmap
     * @return
     */
    public int search_count(HashMap hashmap);
    
    
    /**
     * ��ü ���ڵ� �� 
     * <select id="total_count" resultType="int">
     * @return
     */
    public int total_count();
    
    
   /**
    * ����¡ �ڽ�
    * @param listFile
    * @param at_grp
    * @param search_count
    * @param nowPage
    * @param at_name
    * @return
    */
    public String pagingBox(String listFile, int at_grp_no, int search_count, int nowPage, String at_name);


    
    /**
     * ��ȸ
     * <select id="read" resultType="At_VO" parameterType="int">
     * @param at_no
     * @return
     */
    public At_VO read(int at_no);

    /**
     * ��ǰ���(At, Dates)
     * @param at_VO
     * @return
     */
    public int create(At_Dates_Img at_Dates_Img);
    
    /**
     * ��ǰ����
     * @param at_no
     * @return
     */
    public int delete(int at_no);
    
    /**
     * ��ǰ����
     * @param at_VO
     * @return
     */
    public int update(At_Dates_Img at_Dates_Img);


}
