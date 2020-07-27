package dev.mvc.inquire_attachfile;

import java.util.List;

public interface Inquire_attachfileProcInter {
  /**
   * <xmp>
   * ���� ���
   * <insert id="create" parameterType="Inquire_attachfileVO">
   * @param inquire_attachfileVO
   * @return
   * </xmp>
   */
  public int create(Inquire_attachfileVO inquire_attachfileVO);
  
  /**
   * <xmp>
   * ��ü �̹��� ���
   * <select id="list" resultType="Inquire_attachfileVO"> 
   * @return
   * </xmp>
   */
  public List<Inquire_attachfileVO> list();
  
  /**
   * <xmp>
   * ��ȸ
   * <select id="read" resultType="Inquire_attachfileVO" parameterType="int">
   * @param inquire_attachfileno
   * @return
   * </xmp>
   */
  public Inquire_attachfileVO read(int inquire_attachfileno);
  
  /**
   * <xmp>
   * ����
   * <delete id="delete" parameterType="int">
   * @param inquire_attachfileno
   * @return
   * </xmp>
   */
  public int delete(int inquire_attachfileno);
  
  /**
   * <xmp>
   * inquireno�� ���� ���� ���
   * <select id="list_by_inquireno" resultType="Inquire_attachfileVO" parameterType="int"> 
   * @param inquireno 1:1���� ��ȣ
   * @return
   * </xmp>
   */
  public List<Inquire_attachfileVO> list_by_inquireno(int inquireno);
  
  
}
