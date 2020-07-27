package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;


public interface NoticeDAOInter {
  /**
   * ��� ó��
   * <insert id="create" parameterType="AdminVO">
   * @param noticeVO
   * @return
   */
  public int create(NoticeVO noticeVO);
  
  /**
   * ��ü ���
   * <select id="list" resultType="NoticeVO">
   * @return
   */
  public List<NoticeVO> list();

  /**
   * ��ȸ
   * <select id="read" resultType="NoticeVO" parameterType="int">
   * @param noticeno
   * @return
   */
  public NoticeVO read(int noticeno);
  
  /**
   * ���� ��
   * @param noticeno
   * @return
   */
  public NoticeVO update(int noticeno);
  
  /**
   * ���� ó��
   * <update id="update" parameterType="NoticeVO">
   * @param noticeVO
   * @return
   */
  public int update(NoticeVO noticeVO);
  
  /**
   * �н����� �˻�
   * <select id="passwd_check" parameterType="HashMap" resultType="int">
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
  /**
   * ����
   * <delete id="delete" parameterType="int"> 
   * @param noticeno
   * @return
   */
  public int delete(int noticeno);
  
  /**
   * �������� �˻� ���
   * <xmp>
   * <select id="list_by_search" resultType="NoticeVO" parameterType="HashMap">
   * </xmp>
   * @param hashMap
   * @return
   */
  public List<NoticeVO> list_by_search(HashMap<String, Object> hashMap);

  /**
   * �������� �˻� ���ڵ� ����
   * <xmp>
   * <select id="search_count" resultType="int" parameterType="HashMap">
   * </xmp>
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * <xmp>
   * �˻� + ����¡ ���
   * <select id="list_by_search_paging" resultType="NoticeVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<NoticeVO> list_by_search_paging(HashMap<String, Object> map);
  
  /**
   * ��ȸ��
   * <xmp>
   * <update id="notice_cnt" parameterType="int">
   * </xmp> 
   * @param noticeno ���� ��ȣ
   * @return
   */
  public int notice_cnt(int noticeno);
  
  
}
