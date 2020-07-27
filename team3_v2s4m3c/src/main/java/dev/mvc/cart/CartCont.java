package dev.mvc.cart;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.mem.MemProcInter;
import dev.mvc.mem.MemVO;
import dev.mvc.at.At_ProcInter;
import dev.mvc.at.At_VO;



@Controller
public class CartCont {
  @Autowired
  @Qualifier("dev.mvc.cart.CartProc")
  private CartProcInter cartProc;
  
  @Autowired
  @Qualifier("dev.mvc.mem.MemProc")
  private MemProcInter memProc;
  
  @Autowired
  @Qualifier("dev.mvc.at.At_Proc")
  private At_ProcInter at_Proc;
  
  public CartCont() {
    System.out.println("--> CartCont created");
  }
  
  // http://localhost:9090/team3/cart/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/cart/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/cart/create"); 
    
    return mav; 
  }
  
  // http://localhost:9090/team3/cart/create.do
 /**
  * 등록처리
  * @param cartVO
  * @return
  */
 @ResponseBody
 @RequestMapping(value="/cart/create.do", method=RequestMethod.POST )
 public String create(HttpSession session, CartVO cartVO) {
   System.out.println("Cart create.do 진입");
   
   int cnt = this.cartProc.create(cartVO); 
   
   JSONObject json = new JSONObject();
   json.put("cnt", cnt);
   
   return json.toString();
 }
  //@RequestBody : 웹에서 넘어오는 데이터를 string 형태로 가져옴
//@ResponseBody : 컨트롤러에서 viewName을 return하는게 아니라 요청한 페이지로 return 데이터 자체를 넘김

 // http://localhost:9090/team3/cart/at_cart_mem_list.do

  
 @RequestMapping(value="/cart/at_cart_mem_list.do", method=RequestMethod.GET )
 public ModelAndView at_cart_mem_list(HttpSession session) {
   ModelAndView mav = new ModelAndView();

   int mem_no = (Integer)session.getAttribute("mem_no");
   
   MemVO memVO = this.memProc.read(mem_no); 
   
   List<At_Cart_VO> list = this.cartProc.at_cart_mem_list(mem_no);
   mav.addObject("memVO", memVO);  
   mav.addObject("list", list);  
   

   
   mav.setViewName("/cart/at_cart_mem_list"); 

   
   return mav;
   
 }
 
  
  
  
 //==============================================================
 // http://localhost:9090/team3/cart/read_delete.do
 /**
  * 조회 + 삭제폼
  * @param cateno 삭제할 카테고리 번호
  * @return
  */
 @RequestMapping(value="/cart/read_delete.do", method=RequestMethod.GET )
 public ModelAndView read_delete(int cart_no) {
   // request.setAttribute("cateno", int cateno) 작동 안됨.
   
   ModelAndView mav = new ModelAndView();
   
   CartVO cartVO = this.cartProc.read(cart_no);
   mav.addObject("cartVO", cartVO);  // request 객체에 저장
   
   List<At_Cart_VO> list = this.cartProc.at_cart_mem_list(cartVO.getMem_no());
   mav.addObject("list", list);  
   
   MemVO memVO=this.memProc.read(cartVO.getMem_no());
   mav.addObject("memVO", memVO);
   
   mav.setViewName("/cart/read_delete"); // webapp/cate/read_delete.jsp
   return mav; // forward
 }
 
 // http://localhost:9090/team3/cart/delete.do
 /**
  * 삭제 처리
  * @param cartVO
  * @return
  */
 /*
 @RequestMapping(value="/cart/delete.do", method=RequestMethod.POST )
 public ModelAndView delete(CartVO cartVO) {
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.cartProc.delete(cartVO);
   mav.addObject("cnt", cnt); // request에 저장
   
   if (cnt == 1) {
     mav.setViewName("/cart/delete_msg"); // spring 재호출
   } else { 
     mav.setViewName("/cart/delete_msg"); // webapp/cate/delete_msg.jsp
   }
   
   return mav;
 }
 */
 @ResponseBody
 @RequestMapping(value="/cart/delete.do", method=RequestMethod.POST )
 public String delete(HttpSession session, int cart_no) {
   
	 int mem_no = (Integer)session.getAttribute("mem_no");
	 
   CartVO cartVO = this.cartProc.read(cart_no);
   MemVO memVO=this.memProc.read(mem_no);
    
   cartVO.setCart_no(cart_no); 
   JSONObject json = new JSONObject();
   json.put("cart_no", cart_no);
   json.put("mem_no", cartVO.getMem_no());
   
   int cnt = this.cartProc.delete(cartVO);  //cnt1
   json.put("cnt", cnt);
   
   
   return json.toString();
 }
 
 
 
 
 @ResponseBody
 @RequestMapping(value="/cart/delete_select.do", method=RequestMethod.POST )
 public String delete_select(
		 HttpSession session,
     @RequestParam(value = "Arr[]") int [] chArr ) {
   
   int cart_no = 0;
	 int mem_no = (Integer)session.getAttribute("mem_no");
   
   CartVO cartVO;
   JSONObject json = new JSONObject();
   int cnt = 0;

   for(int i=0; i<= chArr.length-1; i++) { 
     cart_no =chArr[i];
     
   cartVO = this.cartProc.read(cart_no);
   MemVO memVO=this.memProc.read(mem_no);
    
   cartVO.setCart_no(cart_no); 
   cnt = this.cartProc.delete(cartVO);  //cnt1
     
   json.put("mem_no", cartVO.getMem_no());
     
   }
   
     
     json.put("cnt", cnt);
     
     
     return json.toString();
  }
   
 
   
   
 

 
 // http://localhost:9090/team3/cart/read_update.do
 /**
  * 조회 + 수정폼
  * @param cateno 삭제할 카테고리 번호
  * @return
  */
 @RequestMapping(value="/cart/read_update.do", method=RequestMethod.GET )
 public ModelAndView read_update(int cart_no) {
   // request.setAttribute("cateno", int cateno) 작동 안됨.
   
   ModelAndView mav = new ModelAndView();
   
   CartVO cartVO = this.cartProc.read(cart_no);
   mav.addObject("cartVO", cartVO);  // request 객체에 저장
   
   List<At_Cart_VO> list = this.cartProc.at_cart_mem_list(cartVO.getMem_no());
   mav.addObject("list", list);  
   
   MemVO memVO=this.memProc.read(cartVO.getMem_no());
   mav.addObject("memVO", memVO);
   
   mav.setViewName("/cart/read_update"); // webapp/cate/read_delete.jsp
   return mav; // forward
 }
 
//http://localhost:9090/team3/cart/update.do
/**
* 수정 처리
* @param cartVO
* @return
*/
 /*
@RequestMapping(value="/cart/update.do", method=RequestMethod.POST )
public ModelAndView update(CartVO cartVO) {
 ModelAndView mav = new ModelAndView();
 
 int cnt = this.cartProc.update(cartVO);
 mav.addObject("cnt", cnt); // request에 저장
 
 if (cnt == 1) {
   mav.setViewName("/cart/update_msg"); // spring 재호출
 } else { 
   mav.setViewName("/cart/update_msg"); // webapp/cate/delete_msg.jsp
 }
 
 return mav;
}
*/
 
 @ResponseBody
 @RequestMapping(value="/cart/update.do", method=RequestMethod.POST )
 public String update(HttpSession session, int cart_no, int cart_cnt) {
   
	 int mem_no = (Integer)session.getAttribute("mem_no");
	   
	 
   CartVO cartVO = this.cartProc.read(cart_no);
   MemVO memVO=this.memProc.read(mem_no);
  
   cartVO.setCart_cnt(cart_cnt);
   int cnt = this.cartProc.update(cartVO);  //cnt1
   
   JSONObject json = new JSONObject();
   
   json.put("cart_no", cart_no);
   json.put("mem_no", cartVO.getMem_no());
   json.put("cnt", cnt);
   
   return json.toString();
 }

 /*
 cart_sum 흙흙
 @ResponseBody
 @RequestMapping(value="/cart/cart_sum.do", method=RequestMethod.POST )
 public String cart_sum(@RequestParam(value = "sArr[]") int [] schArr ) {
  ModelAndView mav = new ModelAndView();
  
  int cart_no = 0;
  int cart_cnt =0;
  int at_price =0;
  
  CartVO cartVO;
  AtVO atVO;
  
  JSONObject json = new JSONObject();
  int cart_sum = 0;

  for(int i=0; i<= schArr.length-1; i++) { 
    cart_no =schArr[i];
    
  cartVO = this.cartProc.read(cart_no);
  atVO =this.atProc.read(cartVO.getAt_no());
  MemVO memVO=this.memProc.read(cartVO.getMem_no());

  
  cartVO.setCart_no(cart_no);
   cartVO.getCart_cnt();
   atVO.getAt_price();

   json.put("mem_no", cartVO.getMem_no());
  System.out.println("cnt : "+cart_cnt);
  System.out.println("price : "+at_price);
  cart_sum = this.cartProc.cart_sum(cartVO.getMem_no());

  }
  

  json.put("cart_sum", cart_sum);
    

  
  return json.toString();
  
  
 }
 
 */
 

 
 
 
 
}
