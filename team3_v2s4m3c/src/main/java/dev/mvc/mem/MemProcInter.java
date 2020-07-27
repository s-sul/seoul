package dev.mvc.mem;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpSession;


public interface MemProcInter {
  
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
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param cateno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */
  String pagingBox(String listFile, int search_count, int nowPage, String word);
  
  
  
  
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
   * �α���
   * @param map
   * @return
   */
  public int login (Map<Object, Object> map);
  
  
  
  /**
   * mem_id �̿� ȸ�� ���� ��ȸ
   * @param mem_id
   * @return MemVO
   */
  public MemVO readById (String mem_id);
  
  
  
  /**
   * �α��ε� ȸ�� �������� �˻�
   * @param session
   * @return true: ������
   */
  public boolean isMember(HttpSession session);   
  



}
