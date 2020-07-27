package dev.mvc.notice_attachfile;

import java.util.List;


public interface Notice_attachfileDAOInter {
  /**
   * ���� ���
   * <xmp>
   * <insert id="create" parameterType="Notice_attachfileVO">
   * @param notice_attachfileVO
   * @return 
   * </xmp>
   */
  public int create(Notice_attachfileVO notice_attachfileVO);  
  
  /**
   * <xmp>
   * ��ü �̹��� ���
   * <select id="list" resultType="Notice_attachfileVO"> 
   * @return
   * </xmp>
   */
  public List<Notice_attachfileVO> list();
  
  /**
   * <xmp>
   * ��ȸ
   * <select id="read" resultType="Notice_attachfileVO" parameterType="int">
   * @param notice_attachfileno
   * @return
   * </xmp>
   */
  public Notice_attachfileVO read(int notice_attachfileno);
  
  /**
   * <xmp>
   * ����
   * <delete id="delete" parameterType="int">
   * @param notice_attachfileno
   * @return
   * </xmp>
   */
  public int delete(int notice_attachfileno);
    
  /**
   * <xmp>
   * noticeno�� ���� ���� ���
   * <select id="list_by_noticeno" resultType="Notice_attachfileVO" parameterType="int">
   * @param noticeno ������ȣ
   * @return
   * </xmp>
   */
  public List<Notice_attachfileVO> list_by_noticeno(int noticeno);
}
