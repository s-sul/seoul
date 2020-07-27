package dev.mvc.surv_item;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.surv.Surv_ProcInter;
import dev.mvc.surv.Surv_VO;

@Controller
public class Surv_Item_Cont {
 @Autowired
 @Qualifier("dev.mvc.surv.Surv_Proc")
 
 private Surv_ProcInter surv_Proc;
 @Autowired
 @Qualifier("dev.mvc.surv_item.Surv_Item_Proc")
  
  private Surv_Item_ProcInter surv_Item_Proc;
  
  public Surv_Item_Cont() {
    System.out.println("--> Surv_Item_Cont created");
  }
  
//http:localhost:9090/team3/surv_item/surv_item_create.do
  /**
   * �����׸� ��� ��
   * @return
   */
  @RequestMapping(value = "/surv_item/surv_item_create.do", method = RequestMethod.GET)
  public ModelAndView surv_item_create() {
    ModelAndView mav = new ModelAndView();
      mav.setViewName("/surv_item/surv_item_create");
    return mav;
  }
  
//http:localhost:9090/team3/surv_item/surv_item_create.do
  /**
   * �����׸� ��� ó��
   * @param surv_Item_VO
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/surv_item/surv_item_create.do", method = RequestMethod.POST)
    public String surv_item_create(Surv_Item_VO surv_Item_VO) {
     // ModelAndView mav = new ModelAndView();
      
      int cnt = this.surv_Item_Proc.surv_item_create(surv_Item_VO);
     // mav.addObject("cnt", cnt);
      
      JSONObject json = new JSONObject();
      json.put("cnt", cnt);
      // mav.setViewName("/surv_item/surv_item_create_msg");
      return json.toString(); 
  }
  
  
//http:localhost:9090/team3/surv_item/surv_item_list.do
  /**
   * �����׸� ��ü���
   * @return
   */
  @RequestMapping(value="/surv_item/surv_item_list.do", method = RequestMethod.GET)
    public ModelAndView surv_item_list() {
      ModelAndView mav = new ModelAndView();
        List<Surv_Item_VO> list = null;
        list = this.surv_Item_Proc.surv_item_list();
        mav.addObject("list", list);
//        
//        Surv_VO surv_VO = this.surv_Proc.surv_read();
//        mav.addObject("surv_VO",surv_VO);
//        
        mav.setViewName("/surv_item/surv_item_list");
      return mav;
  }
  
  /**
   * �����׸� ��ȸ
   * @param surv_item_no
   * @return
   */
  @RequestMapping(value="/surv_item/surv_item_read.do", method = RequestMethod.GET)
    public ModelAndView surv_item_read(int surv_item_no) {
      ModelAndView mav = new ModelAndView();
      
        Surv_Item_VO surv_Item_VO = this.surv_Item_Proc.surv_item_read(surv_item_no);
        mav.addObject("surv_Item_VO", surv_Item_VO);
        
        mav.setViewName("/surv_item/surv_item_read");
      return mav;
  }
  
  
  /**
   * ���� �׸� ���� ��
   * @param surv_item_no
   * @return
   */
  @RequestMapping(value="/surv_item/surv_item_update.do", method = RequestMethod.GET)
    public ModelAndView surv_item_update(int surv_item_no) {
    ModelAndView mav = new ModelAndView();
    
    Surv_Item_VO surv_Item_VO = this.surv_Item_Proc.surv_item_read(surv_item_no);
    mav.addObject("surv_Item_VO", surv_Item_VO);
    
    mav.setViewName("/surv_item/surv_item_update");
    return mav;
  }
  
  /**
   * ���� �׸� ���� ó��
   * @param surv_VO
   * @return
   */
  @RequestMapping(value="/surv_item/surv_item_update.do", method = RequestMethod.POST)
    public  ModelAndView surv_update(Surv_Item_VO surv_Item_VO) {
    ModelAndView mav = new ModelAndView();
    
    this.surv_Item_Proc.surv_item_update(surv_Item_VO);
    mav.setViewName("redirect:/surv_item/surv_item_list.do");
    return mav;
  }
  
  /**
   * �н����� üũ, JSON ���
   * @param surv_item_no
   * @param surv_item_passwd
   * @return
   */
  @ResponseBody // ����ϸ� ����� �ܼ����ڿ��� ��
  @RequestMapping(value="/surv_item/passwd.do" , method = RequestMethod.GET,
                        produces = "text/plain;charset-UTF-8") //json��½� text/plain�̶�� ��
  public String passwd(int surv_item_no, String surv_item_passwd) {
    
    HashMap<Object,Object> hashMap = new HashMap();
    hashMap.put("surv_item_no", surv_item_no);
    hashMap.put("surv_item_passwd", surv_item_passwd);
    
    int cnt = this.surv_Item_Proc.surv_item_passwd_check(hashMap);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  /**
   * �����׸� ���� ��
   * @param surv_item_no
   * @return
   */
  @RequestMapping(value="/surv_item/surv_item_delete.do", method = RequestMethod.GET)
    public  ModelAndView surv_item_delete(int surv_item_no) {
      ModelAndView mav = new ModelAndView();
      
      Surv_Item_VO surv_Item_VO = this.surv_Item_Proc.surv_item_read(surv_item_no);
      mav.addObject("surv_Item_VO", surv_Item_VO);
      
      mav.setViewName("/surv_item/surv_item_delete");
      return mav;
    }
  
  
  /**
   * �����׸� ���� ó��
   * @param surv_item_no
   * @param surv_item_passwd
   * @return
   */
  @RequestMapping(value="/surv_item/surv_item_delete.do", method = RequestMethod.POST)
    public ModelAndView surv_item_delete(int surv_item_no, String surv_item_passwd) {
    ModelAndView mav = new ModelAndView();
    this.surv_Item_Proc.surv_item_delete(surv_item_no);
    mav.setViewName("redirect:/surv_item/surv_item_list.do");
    return mav;
  }
  
  /**
   * surv table ���� Ŭ���� surv_item table�� ����
   * surv table + surv_item table
   * @param surv_no
   * @return
   */
//  @RequestMapping(value="/surv_item/surv_read_all.do", method=RequestMethod.GET)
//   public ModelAndView surv_itemCnt(int surv_item_no) {
//	  ModelAndView mav = new ModelAndView();
//	   Surv_Item_VO surv_Surv_Item_VO = this.surv_Item_Proc.surv_itemCnt(surv_item_no);
//	   mav.addObject("surv_Surv_Item_VO", surv_Surv_Item_VO);
//	   
//	   Surv_VO surv_VO = this.surv_Proc.surv_read(surv_item_no);
//	   mav.addObject("surv_VO", surv_VO);
//	   
//	   mav.setViewName("/surv_item/surv_read_all");
//	  return mav;
//  }
  
}
