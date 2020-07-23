package dev.mvc.at_grp;

import java.util.HashMap;
import java.util.List;

public interface At_grp_ProcInter {

  /**
   * ī�װ� �׷� ���� <xmp> <insert id="create" parameterType="At_grp_VO"> </xmp>
   * 
   * @return ������ ī�װ� �׷� ��(���ڵ� ��)
   */
  public int create(At_grp_VO at_grp_VO);
  
  
  /**
   * ����Ʈ ��
   *  <select id="count" resultType="int">
   * @return
   */
 public int count();
 
  
  
  /**
   * ����¡
   * <select id="list_by_at_grp_paging" resultType="at_grp_VO" parameterType="HashMap">
   * @return
   */
  public List<At_grp_VO> list_by_at_grp_paging(HashMap<String, Object> map);

  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param categrpno ī�װ���ȣ
   * @param search_count �˻� ����
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @param word �˻���
   * @return
   */
  public String pagingBox(String listFile, int nowPage, int count);

  
  
  /**
   * ī�װ� �׷� ����Ʈ(��¼���(seqno) ��������) <xmp>
   * <select id="list_seq_asc" resultType="At_grp_VO"> </xmp>
   * 
   * @return
   */
  public List<At_grp_VO> list_seq_asc();
  
  /**
   * ��� ��� ����<xmp><update id="update_visible" parameterType="At_grp_VO"></xmp>
   * @param at_grp_VO
   * @return
   */
  public int update_visible(At_grp_VO at_grp_VO);

  /**
   * ��� ���� ���� <xmp> <update id="update_seqno_up" parameterType="int"> </xmp>
   * 
   * @return ó���� ���ڵ� ����
   */

  public int update_seqno_up(int at_grp_no);

  /**
   * ��� ���� ���� <xmp> <update id="update_seqno_down" parameterType="int"> </xmp>
   * 
   * @return ó���� ���ڵ� ����
   */
  public int update_seqno_down(int at_grp_no);
  
  
  /**
   * ������ ���� ��ȸ<xmp><select id="read" resultType="At_grp_VO" parameterType="int"></xmp>
   * @param at_grp_no
   * @return
   */
  public At_grp_VO read(int at_grp_no);
  
  /**
   * ī�װ� �׷� ���� <xmp> <update id="update" parameterType="At_grp_VO"></xmp>
   * 
   * @param ct_grp_VO
   * @return
   */
  public int update(At_grp_VO at_grp_VO);
  
  /**
   * ī�װ� �׷� ����
   * <xmp>delete id="delete" parameterType="int"></xmp>
   * @param at_grp_no
   * @return
   */
  public int delete(int at_grp_no);
  
  
  /**
   * �ε��� 
   */
  
  public List<At_grp_Cnt> at_grp_index();
  
}
