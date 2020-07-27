package dev.mvc.mem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MemDAOInter {
  
  /**
   * ���̵� �ߺ� üũ
   * <select id="checkID" resultType="int" parameterType="String">
   * @param mem_id
   * @return
   */
  public int checkID (String mem_id);

  /**
   * �г��� �ߺ� üũ
   * <select id="checkNick" resultType="int" parameterType="String">
   * @param mem_nick
   * @return
   */
  public int checkNick (String mem_nick);

  /**
   * �ڵ��� ��ȣ �ߺ� üũ
   * <select id="checkTel" resultType="int" parameterType="String">
   * @param mem_tel
   * @return
   */
  public int checkTel (String mem_tel);
  
  /**
   * ��� 
   * <select id="create" parameterType="MemVO">
   * @param memVO
   * @return
   */
  public int create (MemVO memVO);
  
  /**
   * ������ ���� ��� (����)
   * <update id="update_pic" parameterType="HashMap">
   * @param hashMap
   * @return
   */
  public int update_pic (HashMap<Object, Object> hashMap);
  
  /**
   * ���
   * <select id="list" resultType="MemVO">
   * @return
   */
  public List <MemVO> list ();
  
  /**
   * ��� (���º�)
   * <select id="list_select" parameterType="int" resultType="MemVO">
   * @return
   */
  public List <MemVO> list_select (int mem_sts);

  
  
  /**
   * �˻� + ����¡ ���
   * <xmp> <select id="list_search_paging" parameterType="HashMap" resultType="MemVO"> </xmp>
   * @param map
   * @return
   */
  public List<MemVO> list_search_paging (HashMap<Object, Object> map);
  

  /**
   * ī�װ��� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<Object, Object> hashMap);
   
  
  
  /**
   * ��ȸ 
   * <select id="read" resultType="MemVO">
   * @param mem_no
   * @return
   */
  public MemVO read (int mem_no);
  
  /**
   * ����
   * <update id="update" parameterType="MemVO">
   * @param memVO
   * @return
   */
  public int update (HashMap<Object, Object> hashMap);
  
  /**
   * ����
   * <delete id="delete" parameterType="int">
   * @param mem_no
   * @return
   */
  public int delete (int mem_no);
  
  /**
   * �н����� �˻�
   * <select id="check_pw" parameterType="HashMap" resultType="int">
   * @param hashMap
   * @return
   */
  public int check_pw (HashMap<Object, Object> hashMap);

  /**
   * �н����� ����
   * <update id="update_pw" parameterType="HashMap">
   * @param hashMap
   * @return
   */
  public int update_pw (HashMap<Object, Object> hashMap);
  
  
  /**
   * ��ü ���ڵ� ���� Ȯ��
   * <xmp> <select id="total_count" resultType="int"> </xmp>
   * @return ��ü ���ڵ� ����
   */
  public int total_count ();
  
  
  
  
  
  
  /**
   * �α���
   * @param map
   * @return
   */
  public int login (Map<Object, Object> map);
  
  
  /**
   * mem_id �̿� ȸ�� ���� ��ȸ
   * @param mem_id
   * @return
   */
  public MemVO readById (String mem_id);
  
  
}
