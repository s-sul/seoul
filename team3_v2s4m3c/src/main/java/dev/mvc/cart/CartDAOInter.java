package dev.mvc.cart;

import java.util.HashMap;
import java.util.List;

public interface CartDAOInter {

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
  
}
