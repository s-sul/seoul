package dev.mvc.inquire;

import java.util.HashMap;
import java.util.List;

import dev.mvc.notice.NoticeVO;


public interface InquireDAOInter {
  /**
   * <xmp>
   * 1:1문의 등록 처리
   * <insert id="create" parameterType="InquireVO">
   * @param inquireVO
   * @return
   * </xmp>
   */
  public int create(InquireVO inquireVO);
   
  /**
   * <xmp>
   * 전체 목록
   * <select id="list" resultType="InquireVO">
   * @return
   * </xmp>
   */
  public List<InquireVO> list();
   
  /**
   * <xmp>
   * 1:1문의 조회
   * <select id="read" resultType="InquireVO" parameterType="int"> 
   * @param Inquireno
   * </xmp>
   * @return
   */
  public InquireVO read(int inquireno);
  
  /**
   * <xmp>
   * 1:1문의 수정 폼
   * <update id="update" parameterType="InquireVO">
   * @param inquireVO
   * @return
   * </xmp>
   */
  public InquireVO update(int inquireno);
  
  /**
   * <xmp>
   * 1:1문의 수정 처리
   * <update id="update" parameterType="InquireVO">
   * @param noticeVO
   * @return
   * </xmp>
   */
  public int update(InquireVO inquireVO);
  
  /**
   * <xmp>
   * 패스워드 검사
   * <select id="passwd_check" parameterType="HashMap" resultType="int">
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
  /**
   * <xmp>
   * 1:1문의 삭제
   * <delete id="delete" parameterType="int"> 
   * @param inquireno
   * @return
   * </xmp>
   */
  public int delete(int inquireno);
    
  /**
   * <xmp>
   * 1:1문의 검색 레코드 갯수
   * <select id="search_count" resultType="int" parameterType="HashMap">
   * @param hashMap
   * @return
   * </xmp>
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * <xmp>
   * 검색 + 페이징 목록
   * <select id="list_by_search_paging" resultType="InquireVO" parameterType="HashMap"> 
   * @param map
   * @return
   * </xmp>
   */
  public List<InquireVO> list_by_search_paging(HashMap<String, Object> map);
  
  
  /**
   * 회원별 문의 목록 
   * <select id="list_by_mem_no" resultType="InquireVO" parameterType="int">
   * @param mem_no
   * @return
   */
  public List<InquireVO> list_by_mem_no(int mem_no);
  
}
