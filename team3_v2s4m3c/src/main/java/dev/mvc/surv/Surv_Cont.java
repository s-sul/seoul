package dev.mvc.surv;

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

@Controller
public class Surv_Cont {
  @Autowired
  @Qualifier("dev.mvc.surv.Surv_Proc")
  
  private Surv_ProcInter surv_Proc;
  
  public Surv_Cont() {
    System.out.println("--> Surv_Cont created"); //��Ʈ�ѷ��� ���������� ����������� Ȯ��
  }
  
// http:localhost:9090/team3/surv/surv_create.do
  /**
   * ������� ��
   * @return
   */
  @RequestMapping(value = "/surv/surv_create.do", method = RequestMethod.GET)
  public ModelAndView surv_create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/surv/surv_create");
    
    return mav;
  }
 
//http:localhost:9090/team3/surv/surv_create.do
  /**
   * ���� ���ó��
   * @param surv_VO
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/surv/surv_create.do", method = RequestMethod.POST)
  public String surv_create(Surv_VO surv_VO) {
    //ModelAndView mav = new ModelAndView();
    
    int cnt = this.surv_Proc.surv_create(surv_VO);
   // mav.addObject("cnt",cnt);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("surv_VO", surv_VO);
    
    return json.toString(); 
    
    // mav.setViewName("/surv/surv_create_msg");
   // return mav;
  }
  
//http:localhost:9090/team3/surv/surv_list.do
  /**
   * ���� ��ü���
   * @return
   */
  @RequestMapping(value="/surv/surv_list.do", method = RequestMethod.GET)
  public ModelAndView surv_list() {
    ModelAndView mav = new ModelAndView();
    
    List<Surv_VO> surv_list = this.surv_Proc.surv_list();
    mav.addObject("surv_list", surv_list);
    
    mav.setViewName("/surv/surv_list");
    return mav;
  }
  
//http:localhost:9090/team3/surv/surv_read.do
  /**
   * ���� ��ȸ
   * @param surv_no
   * @return
   */
  @RequestMapping(value="/surv/surv_read.do", method = RequestMethod.GET)
  public ModelAndView surv_read(int surv_no) {
    ModelAndView mav = new ModelAndView();
    
    Surv_VO surv_VO = this.surv_Proc.surv_read(surv_no);
    mav.addObject("surv_VO", surv_VO);
    
    mav.setViewName("/surv/surv_read");
    
    return mav;
  }
  
  
//http:localhost:9090/team3/surv/surv_update.do
  /**
   * ���� ������
   * @param surv_no
   * @return
   */
  @RequestMapping(value="/surv/surv_update.do", method = RequestMethod.GET)
    public ModelAndView surv_update(int surv_no) {
    ModelAndView mav = new ModelAndView();
    
    Surv_VO surv_VO = this.surv_Proc.surv_update(surv_no);
    mav.addObject("surv_VO", surv_VO);
    mav.setViewName("/surv/surv_update");
    return mav;
  }
 
  
//http:localhost:9090/team3/surv/surv_update.do
  /**
   * ���� ����ó��
   * @param surv_VO
   * @return
   */
  @RequestMapping(value="/surv/surv_update.do", method = RequestMethod.POST)
    public  ModelAndView surv_update(Surv_VO surv_VO) {
    ModelAndView mav = new ModelAndView();

//      HashMap<String,Object>hashMap = new HashMap();
//      hashMap.put("surv_no",surv_VO.getSurv_no());
//      hashMap.put("surv_passwd",surv_VO.getSurv_passwd());
//      
//      int passwd_cnt = 0;
//      int cnt = 0;
//      
//      passwd_cnt = this.surv_Proc.surv_passwd_check(hashMap);
//      
//      if (passwd_cnt==1) {
//        cnt = this.surv_Proc.surv_update(surv_VO);
//      }
//      
//      mav.addObject("cnt",cnt);
//      mav.addObject("passwd_cnt", passwd_cnt);
//      
//      if(passwd_cnt == 1 && cnt == 1) {
//      mav.setViewName("redirect:/surv/surv_update_msg.jsp");
//      } else {
        this.surv_Proc.surv_update(surv_VO);
        mav.setViewName("redirect:/surv/surv_list.do");
 //     }
    return mav;
  }
  
 //localhost:9090/team3/surv/passwd.do?surv_no=27&surv_passwd=1234
  /**
   * �н����� üũ, JSON ���
   * @return
   */
   @ResponseBody // ����ϸ� ����� �ܼ����ڿ��� ��
   @RequestMapping(value="/surv/passwd.do" , method = RequestMethod.GET,
                         produces = "text/plain;charset-UTF-8") //json��½� text/plain�̶�� ��
   public String passwd(int surv_no, String surv_passwd) { //int surv_no, String surv_passwd ���޹޾Ƽ�
     
     HashMap<Object,Object> hashMap = new HashMap<Object,Object>();
     hashMap.put("surv_no", surv_no);
     hashMap.put("surv_passwd", surv_passwd); // ���� �н����带 üũ
     
     int cnt = this.surv_Proc.surv_passwd_check(hashMap);
     
     
     JSONObject json = new JSONObject();
     json.put("cnt", cnt);
     
     return json.toString(); 
     
   }
   
   
//http:localhost:9090/team3/surv/surv_delete.do
  /**
   * ���� ���� ��
   * @param surv_no
   * @return
   */
  @RequestMapping(value="/surv/surv_delete.do", method = RequestMethod.GET)
    public  ModelAndView surv_delete(int surv_no) {
    ModelAndView mav = new ModelAndView();
      Surv_VO surv_VO = this.surv_Proc.surv_read(surv_no);
      
      mav.addObject("surv_VO", surv_VO);
      
      mav.setViewName("/surv/surv_delete");
    return mav;
  }
  
//http:localhost:9090/team3/surv/surv_delete.do
  /**
   * ���� ���� ó��
   * @param surv_no
   * @return
   */
  @RequestMapping(value="/surv/surv_delete.do", method = RequestMethod.POST)
    public ModelAndView surv_delete(int surv_no, String surv_passwd) {
    ModelAndView mav = new ModelAndView();
//    HashMap<String,Object> hashMap = new HashMap<String,Object>();
//    hashMap.put("surv_no",surv_no);
//    hashMap.put("surv_passwd",surv_passwd);
//    
//    int passwd_cnt = 0;
//    int cnt = 0;
//    
//    String title = this.surv_Proc.surv_read(surv_no).getSurv_title();
//    passwd_cnt = this.surv_Proc.surv_passwd_check(hashMap);
//    
//    
//    if (passwd_cnt==1) {
//      cnt = this.surv_Proc.surv_delete(surv_no);
//    }
//    
//    mav.addObject("title", title);
//    mav.addObject("cnt",cnt);
//    mav.addObject("passwd_cnt", passwd_cnt);
//    
//    if(passwd_cnt == 1 && cnt == 1) {
//      mav.setViewName("/surv/surv_delete_msg");
//    } else {
      this.surv_Proc.surv_delete(surv_no);
      mav.setViewName("redirect:/surv/surv_list.do");
//    }
  
  return mav;
  }
  
  
}
