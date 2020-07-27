package dev.mvc.cart;

import java.util.HashMap;
import java.util.List;

public interface CartProcInter {
	
	 /**
	  * 
	  * <insert id="create" parameterType="CartVO">
	  */
	public int create (CartVO cartVO);
	
  /**
   * 
   * <select id="at_cart_mem_list" parameterType="int" resultMap="At_Cart_VO_Map">
   */
 public List<At_Cart_VO> at_cart_mem_list(int mem_no);
 

 /**
  *<select id="at_cart_read" parameterType="int" resultType="At_Cart_VO">
  */
 public At_Cart_VO at_cart_read(int cart_no);
	
 /**
  * <select id ="read" resultType="At_Cart_Mem_VO" parameterType="int">
  */
 public CartVO read(int cart_no);
 
 /**
  * <delete id="delete" parameterType=""CartVO"">
  */
 public int delete(CartVO cartVO);
 
 /**
  * <update id="update" parameterType="CartVO">
  */
 public int update(CartVO cartVO);
 
 /**
  * <select id ="cart_sum" resultType="int" >
  */
 public int cart_sum(int mem_no);
 
 
 
 
 
 /**
  *  <select id="search_count" resultType="int" parameterType="HashMap">
  */
 public int search_count(HashMap<String, Object> hashMap);
 
 
 /**
  * <select id="at_cart_mem_list" parameterType="HashMap" resultMap="At_Cart_VO_Map">
  */
	public List<At_Cart_VO>  at_cart_mem_list(HashMap<String, Object> map);
 
 /**
  * 페이지 목록 문자열 생성, Box 형태
  * @param listFile 목록 파일명 
  * @param mem_no 카테고리번호
  * @param search_count 검색 갯수
  * @param nowPage 현재 페이지, nowPage는 1부터 시작
  * @param word 검색어
  * @return
  */
 public String pagingBox(int mem_no, int search_count, int nowPage);
 
 
 
 
 

	
}
