package dev.mvc.notice_attachfile;

import java.util.List;


public interface Notice_attachfileDAOInter {
  /**
   * 파일 등록
   * <xmp>
   * <insert id="create" parameterType="Notice_attachfileVO">
   * @param notice_attachfileVO
   * @return 
   * </xmp>
   */
  public int create(Notice_attachfileVO notice_attachfileVO);  
  
  /**
   * <xmp>
   * 전체 이미지 목록
   * <select id="list" resultType="Notice_attachfileVO"> 
   * @return
   * </xmp>
   */
  public List<Notice_attachfileVO> list();
  
  /**
   * <xmp>
   * 조회
   * <select id="read" resultType="Notice_attachfileVO" parameterType="int">
   * @param notice_attachfileno
   * @return
   * </xmp>
   */
  public Notice_attachfileVO read(int notice_attachfileno);
  
  /**
   * <xmp>
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param notice_attachfileno
   * @return
   * </xmp>
   */
  public int delete(int notice_attachfileno);
    
  /**
   * <xmp>
   * noticeno에 따른 파일 목록
   * <select id="list_by_noticeno" resultType="Notice_attachfileVO" parameterType="int">
   * @param noticeno 공지번호
   * @return
   * </xmp>
   */
  public List<Notice_attachfileVO> list_by_noticeno(int noticeno);
}
