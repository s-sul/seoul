package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

public interface ContentsProcInter {
  /**
   * ��� ó��
   * 
   * @param contentsVO
   * @return
   */
  public int create(ContentsVO contentsVO);

  /**
   * ��ü ���
   * 
   * @return
   */
  public List<ContentsVO> list_all();

  /**
   * ��ȸ
   * 
   * @param contentsno
   * @return
   */
  public ContentsVO read(int contentsno);

  /**
   * ���� ��
   * 
   * @param contentsVO
   * @return
   */
  public ContentsVO update(int contentsno);

  /**
   * ���� ó��
   * 
   * @param contentsVO
   * @return
   */
  public int update(ContentsVO contentsVO);

  /**
   * �н����� �˻�
   * 
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);

  /**
   * ����
   * 
   * @param contentsno
   * @return
   */
  public int delete(int contentsno);

  /**
   * <xmp> cateno�� ���
   * <select id="list" resultType="ContentsVO" parameterType="int"> </xmp>
   * 
   * @return
   */
  public List<ContentsVO> list(int cateno);

  /**
   * <xmp> ��ü �Խñ� ���� <select id="total_count" resultType="int"> </xmp>
   * 
   * @return
   */
  public int total_count();

  /**
   * ȸ���� �� ��� <xmp>
   * <select id="cate_contents_memberno_list" parameterType="int" resultMap=
   * "Cate_Contents_VO_Map"> </xmp>
   */
  public List<Cate_Contents_VO> cate_contents_memberno_list(int memberno);

  /**
   * ������ ���, ����, ����
   * @param hashMap
   * @return
   */
  public int map(HashMap hashMap);

  /**
   * <xmp>
   *   Youtube ���, ����, ����
       <update id="youtube" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int youtube(HashMap<Object, Object> hashMap);

  /**
   * <xmp>
   *   MP3 ���, ����, ����
       <update id="mp3" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int mp3(HashMap<Object, Object> hashMap);
 
  /**
   * <xmp>
   *   MP4 ���, ����, ����
       <update id="mp4" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int mp4(HashMap<Object, Object> hashMap);
  
  /**
   * ī�װ����� �˻� ���
   * @param hashMap
   * @return
   */
  public List<ContentsVO> list_by_cateno_search(HashMap<String, Object> hashMap);

  /**
   * ī�װ����� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * <xmp>
   * �˻� + ����¡ ���
   * <select id="list_by_cateno_search_paging" resultType="ContentsVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<ContentsVO> list_by_cateno_search_paging(HashMap<String, Object> map);

  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param cateno ī�װ�����ȣ
   * @param search_count �˻� ����
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @param word �˻���
   * @return
   */
  public String pagingBox(String listFile, int cateno, int search_count, int nowPage, String word);
  
}




