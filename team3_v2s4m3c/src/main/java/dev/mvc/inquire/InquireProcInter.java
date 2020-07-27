package dev.mvc.inquire;

import java.util.HashMap;
import java.util.List;

public interface InquireProcInter {
  /**
   * <xmp>
   * 1:1���� ��� ó��
   * <insert id="create" parameterType="InquireVO">
   * @param inquireVO
   * @return
   * </xmp>
   */
  public int create(InquireVO inquireVO);
  
  /**
   * <xmp>
   * ��ü ���
   * <select id="list" resultType="InquireVO">
   * @return
   * </xmp>
   */
  public List<InquireVO> list();
  
  /**
   * <xmp>
   * 1:1���� ��ȸ
   * <select id="read" resultType="InquireVO" parameterType="int"> 
   * @param Inquireno
   * </xmp>
   * @return
   */
  public InquireVO read(int inquireno);
  
  /**
   * <xmp>
   * 1:1���� ���� ��
   * <update id="update" parameterType="InquireVO">
   * @param inquireVO
   * @return
   * </xmp>
   */
  public InquireVO update(int inquireno);
  
  /**
   * <xmp>
   * 1:1���� ���� ó��
   * <update id="update" parameterType="InquireVO">
   * @param noticeVO
   * @return
   * </xmp>
   */
  public int update(InquireVO inquireVO);
  
  /**
   * <xmp>
   * �н����� �˻�
   * <select id="passwd_check" parameterType="HashMap" resultType="int">
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
  /**
   * <xmp>
   * 1:1���� ����
   * <delete id="delete" parameterType="int"> 
   * @param inquireno
   * @return
   * </xmp>
   */
  public int delete(int inquireno);
  
  /**
   * <xmp>
   * 1:1���� �˻� ���ڵ� ����
   * <select id="search_count" resultType="int" parameterType="HashMap">
   * @param hashMap
   * @return
   * </xmp>
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * <xmp>
   * �˻� + ����¡ ���
   * <select id="list_by_search_paging" resultType="InquireVO" parameterType="HashMap"> 
   * @param map
   * @return
   * </xmp>
   */
  public List<InquireVO> list_by_search_paging(HashMap<String, Object> map);
  
  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param inquireno 1:1���� ��ȣ
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @param word �˻���
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage, String word);
  
  /**
   * ȸ���� ���� ��� 
   * <select id="list_by_mem_no" resultType="InquireVO" parameterType="int">
   * @param mem_no
   * @return
   */
  public List<InquireVO> list_by_mem_no(int mem_no);
  
  
}
