package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

public interface ContentsDAOInter {
  /**
   * 등록 처리
   * @param contentsVO
   * @return
   */
  public int create(ContentsVO contentsVO);
  
  /**
   * 전체 목록 
   * @return
   */
  public List<ContentsVO> list_all();
  
  /**
   * 조회
   * @param contentsno
   * @return
   */
  public ContentsVO read(int contentsno);
  
  /**
   * 수정 처리
   * @param contentsVO
   * @return
   */
  public int update(ContentsVO contentsVO);
  
  /**
   * 패스워드 검사
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
  /**
   * 삭제
   * @param contentsno
   * @return
   */
  public int delete(int contentsno);
  
  /**
   <xmp>
     cateno별 목록
     <select id="list" resultType="ContentsVO" parameterType="int">
   </xmp>
   @return
   */
  public List<ContentsVO> list(int cateno);
  
  /**
   * <xmp>
   * 전체 게시글 갯수
   * <select id="total_count" resultType="int">
   * </xmp>
   * @return
   */
  public int total_count();
  
  /**
   * 회원별 글 목록
   * <xmp>
   * <select id="cate_contents_memberno_list" parameterType="int" resultMap="Cate_Contents_VO_Map">
   * </xmp>
   */
  public List<Cate_Contents_VO> cate_contents_memberno_list(int memberno);

  /**
   * 지도의 등록, 수정, 삭제
   * @param hashMap
   * @return
   */
  public int map(HashMap<Object, Object> hashMap);
  
  /**
   * <xmp>
   *   Youtube 등록, 수정, 삭제
       <update id="youtube" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int youtube(HashMap<Object, Object> hashMap);

  /**
   * <xmp>
   *   MP3 등록, 수정, 삭제
       <update id="mp3" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int mp3(HashMap<Object, Object> hashMap);

  /**
   * <xmp>
   *   MP4 등록, 수정, 삭제
       <update id="mp4" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int mp4(HashMap<Object, Object> hashMap);

  /**
   * 카테고리별 검색 목록
   * @param hashMap
   * @return
   */
  public List<ContentsVO> list_by_cateno_search(HashMap<String, Object> hashMap);

  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);

  /**
   * <xmp>
   * 검색 + 페이징 목록
   * <select id="list_by_cateno_search_paging" resultType="ContentsVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<ContentsVO> list_by_cateno_search_paging(HashMap<String, Object> map);

}







