package dev.mvc.payment;

import java.util.ArrayList;
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

import dev.mvc.at.At_VO;
import dev.mvc.cart.At_Cart_VO;
import dev.mvc.cart.CartProcInter;
import dev.mvc.cart.CartVO;
import dev.mvc.mem.MemProcInter;
import dev.mvc.mem.MemVO;
import dev.mvc.at.At_ProcInter;


@Controller
public class PaymentCont {
  
  @Autowired
  @Qualifier("dev.mvc.mem.MemProc")
  private MemProcInter memProc;
  
  @Autowired
  @Qualifier("dev.mvc.at.At_Proc")
  private At_ProcInter at_Proc;
  
  @Autowired
  @Qualifier("dev.mvc.cart.CartProc")
  private CartProcInter cartProc;
  
  @Autowired
  @Qualifier("dev.mvc.payment.PaymentProc")
  private PaymentProcInter paymentProc;
  

  public PaymentCont() {
    System.out.println("--> PaymentCont dd");
  }
  
  
  
//개별결제 폼
  @RequestMapping(value="/payment/create.do", method=RequestMethod.GET )
  public ModelAndView create_form(HttpSession session, int cart_no) {
    ModelAndView mav = new ModelAndView();

    int mem_no = (Integer)session.getAttribute("mem_no");
    
    CartVO cartVO =this.cartProc.read(cart_no);
    mav.addObject("cartVO", cartVO);
    
    MemVO memVO =this.memProc.read(mem_no);
    mav.addObject("memVO", memVO); 
    
    At_VO atVO =this.at_Proc.read(cartVO.getAt_no());
    mav.addObject("atVO", atVO); 
    
    cartVO.setCart_payment(cartVO.getCart_cnt()*atVO.getAt_price());
    

    
    mav.setViewName("/payment/create"); 
    
    return mav; 
  }
  
  
  
  
//개별결제 처리
//@RequestMapping(value="/payment/create.do", method=RequestMethod.POST )
//public ModelAndView create(PaymentVO paymentVO) {
//  ModelAndView mav = new ModelAndView();
//  
//  CartVO cartVO =this.cartProc.read(paymentVO.getCart_no());
//  mav.addObject("cartVO", cartVO);
//  
//  MemVO memVO =this.memProc.read(paymentVO.getMem_no());
//  
//  System.out.println("mem_no" + paymentVO.getMem_no());
//  mav.addObject("memVO", memVO);
//  
//  At_VO atVO =this.at_Proc.read(paymentVO.getAt_no());
//  mav.addObject("atVO", atVO);
//  
//  
//  paymentVO.setCart_no(paymentVO.getCart_no());
//  paymentVO.setAt_no(paymentVO.getAt_no());
//  paymentVO.setCart_cnt(cartVO.getCart_cnt()); 
//  paymentVO.setAt_price(atVO.getAt_price());
//  paymentVO.setAt_name(atVO.getAt_name());
//  paymentVO.setPayment_way(paymentVO.getPayment_way());
//  paymentVO.setPayment_total(atVO.getAt_price()*cartVO.getCart_cnt());
// 
//  
////  int saved_pt = (int)(paymentVO.getPayment_total() * 0.1);  //적립금
////  paymentVO.setSaved_point(saved_pt);
//  
////  System.out.println("적립 " +saved_pt);
////  System.out.println("원래 " +memVO.getMem_pt());
////  
//  
//  
//  int cnt = this.paymentProc.create(paymentVO);
//  if (cnt>0) {
//    int delete_cnt = this.cartProc.delete(cartVO);
//    if(delete_cnt >0) {
//      System.out.println(paymentVO.getCart_no()+"번 주문완료");
//      mav.addObject("paymentVO", paymentVO);
//      mav.setViewName("redirect:/payment/list.do?mem_no=1"); 
//    }
//  }   //결제완
//  
//  
////  memVO.setMem_pt(saved_pt+memVO.getMem_pt());
////  this.memProc.update(memVO);
////  System.out.println("mem :"+ memVO.getMem_pt());
//  
//  return mav;
//  }
  
  
  @RequestMapping(value="/payment/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpSession session, int cart_no,PaymentVO paymentVO) {
    ModelAndView mav = new ModelAndView();
    
    int mem_no = (Integer)session.getAttribute("mem_no");
    
    CartVO cartVO =this.cartProc.read(cart_no);
    mav.addObject("cartVO", cartVO);
    
    MemVO memVO =this.memProc.read(mem_no);
    mav.addObject("memVO", memVO);
    
    At_VO atVO =this.at_Proc.read(cartVO.getAt_no());
    mav.addObject("atVO", atVO);
    
    
    paymentVO.setCart_no(cartVO.getCart_no());
    paymentVO.setAt_no(atVO.getAt_no());
    paymentVO.setCart_cnt(cartVO.getCart_cnt()); 
    paymentVO.setAt_price(atVO.getAt_price());
    paymentVO.setAt_name(atVO.getAt_name());
    paymentVO.setPayment_way(paymentVO.getPayment_way());
    paymentVO.setPayment_total(atVO.getAt_price()*cartVO.getCart_cnt());
   
    
  //  int saved_pt = (int)(paymentVO.getPayment_total() * 0.1);  //적립금
  //  paymentVO.setSaved_point(saved_pt);
    
  //  System.out.println("적립 " +saved_pt);
  //  System.out.println("원래 " +memVO.getMem_pt());
  //  
    
    
    int cnt = this.paymentProc.create(paymentVO);
    if (cnt>0) {
      int delete_cnt = this.cartProc.delete(cartVO);
      if(delete_cnt >0) {
        System.out.println(paymentVO.getCart_no()+"번 주문완료");
        mav.addObject("paymentVO", paymentVO);
        mav.setViewName("redirect:/payment/list.do?mem_no=1"); 
      }
    }   //결제완
    
    
  //  memVO.setMem_pt(saved_pt+memVO.getMem_pt());
  //  this.memProc.update(memVO);
  //  System.out.println("mem :"+ memVO.getMem_pt());
    
    return mav;
    }


/**
 * 선택결제 등록폼
 * @param checkOne
 * @return
 */
@RequestMapping(value="/payment/create_select.do", 
method=RequestMethod.GET )
public ModelAndView create_select_form(HttpSession session, int [] checkOne) {
  ModelAndView mav = new ModelAndView();
  
  int payment_total = 0;
  int mem_no = (Integer)session.getAttribute("mem_no");
  
  String cart_nos = "";
  
  ArrayList<At_Cart_VO> list = new ArrayList<At_Cart_VO>();
  
  for (int cart_no : checkOne) {
      //System.out.println("cart_no :"+cart_no);
      cart_nos = cart_nos + cart_no + "/";
      
      At_Cart_VO at_Cart_VO =this.cartProc.at_cart_read(cart_no);  
      list.add(at_Cart_VO);
      
      at_Cart_VO.setCart_payment(at_Cart_VO.getCart_cnt()*at_Cart_VO.getAt_price());  //개당
      
      payment_total = payment_total + (int)(at_Cart_VO.getCart_payment());
      mav.addObject("payment_total", payment_total);
    }
  
    MemVO memVO =this.memProc.read(mem_no); 
    mav.addObject("memVO", memVO);
    
    mav.addObject("list", list);
    cart_nos = cart_nos.substring(0, cart_nos.length() - 1);
   // System.out.println("cart_nos: " + cart_nos);
    mav.addObject("cart_nos", cart_nos); 
    
   // System.out.println("payment_total" + payment_total);  
    
    mav.setViewName("/payment/create2"); 
   return mav; 
}

/**
 * 선택 결제 처리
 * @param paymentVO
 * @return
 */

  @RequestMapping(value="/payment/create_select.do", method=RequestMethod.POST)
  public ModelAndView create_select(HttpSession session, PaymentVO paymentVO, String cart_nos) {
    ModelAndView mav = new ModelAndView();
    
    int mem_no = (Integer)session.getAttribute("mem_no");
//    System.out.println("cart_nos: " + cart_nos);
    int payment_total=0;
    String[] cart_no_str = cart_nos.split("/"); 
     
    
   for (String cart_no: cart_no_str) {
     int cart_no_int = Integer.parseInt(cart_no);
     CartVO cartVO =this.cartProc.read(cart_no_int); 
     System.out.println(cart_no_int);
     
    At_VO atVO=this.at_Proc.read(cartVO.getAt_no());
    MemVO memVO =this.memProc.read(mem_no);
   
   // PaymentVO paymentVO =new PaymentVO();
   
   paymentVO.setMem_no(mem_no); 
   paymentVO.setAt_no(atVO.getAt_no()); 
   paymentVO.setAt_name(atVO.getAt_name());
   paymentVO.setAt_price(atVO.getAt_price()); 
   
   paymentVO.setCart_cnt(cartVO.getCart_cnt()); 
   
   paymentVO.setPayment_way(paymentVO.getPayment_way()); 
   System.out.println(paymentVO.getPayment_way());
   
   
   cartVO.setCart_payment(cartVO.getCart_cnt()*atVO.getAt_price());
   
   
   payment_total = payment_total + (int)(cartVO.getCart_payment());
   paymentVO.setPayment_total(payment_total);
   System.out.println(paymentVO.getPayment_total());
   
   

     int delete_cnt = this.cartProc.delete(cartVO);
     if(delete_cnt>0) {
       System.out.println(cart_no_int+"번 주문완료");   
      }   

     
     } //for 문   
   int cnt = this.paymentProc.create(paymentVO);
   if(cnt>0) {
     mav.setViewName("redirect:/payment/list.do?mem_no=1"); 
   
   }
     
     
     
   return mav;
 }
     
  
  

//http://localhost:9090/team3/payment/list.do?mem_no=1
/**
 * 회원 별 결제 목록
 * @return
 */
  @RequestMapping(value = "/payment/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView at_cart_mem_list_paging(
		  HttpSession session, 
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    int mem_no = (Integer)session.getAttribute("mem_no");
    
    ModelAndView mav = new ModelAndView();
    
    MemVO memVO =this.memProc.read(mem_no);
    mav.addObject("memVO", memVO);
    
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("mem_no", mem_no); // #{cateno}
    map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
    
    // 검색 목록
    List<PaymentVO> list = this.paymentProc.list(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = paymentProc.search_count(map);
    mav.addObject("search_count", search_count);
  
    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     * 
     * @param listFile 목록 파일명 
     * @param cateno 카테고리번호 
     * @param search_count 검색(전체) 레코드수 
     * @param nowPage     현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */ 
    String paging = this.paymentProc.pagingBox(mem_no, search_count, nowPage);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);


    mav.setViewName("/payment/list");
    
    return mav;
  }    
 



/**
 * 조회
 * @param 
 * @return
 */
@RequestMapping(value="/payment/read.do", method=RequestMethod.GET )
public ModelAndView read(HttpSession session, int payment_no) {
  ModelAndView mav = new ModelAndView();
  
  
  int mem_no = (Integer)session.getAttribute("mem_no");
  
  PaymentVO paymentVO =this.paymentProc.read(payment_no);
  mav.addObject("paymentVO", paymentVO);
  
  MemVO memVO =this.memProc.read(mem_no);
  mav.addObject("memVO", memVO);
  
  
  mav.setViewName("/payment/read");
  
  return mav; 
}
  


/**
 * 삭제
 * @param payment_no
 * @return
 */

@ResponseBody
@RequestMapping(value="/payment/delete.do", method=RequestMethod.POST )
	public String delete(HttpSession session, int payment_no) {
	
	ModelAndView mav = new ModelAndView();
	
	   int mem_no = (Integer)session.getAttribute("mem_no");
	
	PaymentVO paymentVO =this.paymentProc.read(payment_no);
	MemVO memVO =this.memProc.read(mem_no);
	
	JSONObject json = new JSONObject();
	json.put("payment_no", payment_no);
	json.put("mem_no",mem_no);
	
	int cnt =this.paymentProc.delete(paymentVO);
	json.put("cnt", cnt);
	
	
	return json.toString();
	
}


//
//  @RequestMapping(value="/payment/delete.do", method=RequestMethod.POST )
//  public ModelAndView delete(PaymentVO paymentVO) {
//    ModelAndView mav = new ModelAndView();
//    
//    paymentVO =this.paymentProc.read(paymentVO.getPayment_no());
//    
//    
//    int cnt =this.paymentProc.delete(paymentVO);
//    mav.addObject("cnt", cnt);
//    
//    if (cnt == 1) {
//      mav.setViewName("redirect:/payment/list.do?mem_no=1");
//    } else { 
//      mav.setViewName("/payment/delete_msg");
//    }
//    
//    return mav;
//  }

  
}

