package dev.mvc.inquire_attachfile;

import java.util.List;

public interface Inquire_attachfileProcInter {
  /**
   * <xmp>
   * 파일 등록
   * <insert id="create" parameterType="Inquire_attachfileVO">
   * @param inquire_attachfileVO
   * @return
   * </xmp>
   */
  public int create(Inquire_attachfileVO inquire_attachfileVO);
  
  /**
   * <xmp>
   * 전체 이미지 목록
   * <select id="list" resultType="Inquire_attachfileVO"> 
   * @return
   * </xmp>
   */
  public List<Inquire_attachfileVO> list();
  
  /**
   * <xmp>
   * 조회
   * <select id="read" resultType="Inquire_attachfileVO" parameterType="int">
   * @param inquire_attachfileno
   * @return
   * </xmp>
   */
  public Inquire_attachfileVO read(int inquire_attachfileno);
  
  /**
   * <xmp>
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param inquire_attachfileno
   * @return
   * </xmp>
   */
  public int delete(int inquire_attachfileno);
  
  /**
   * <xmp>
   * inquireno에 따른 파일 목록
   * <select id="list_by_inquireno" resultType="Inquire_attachfileVO" parameterType="int"> 
   * @param inquireno 1:1문의 번호
   * @return
   * </xmp>
   */
  public List<Inquire_attachfileVO> list_by_inquireno(int inquireno);
  
  
}
