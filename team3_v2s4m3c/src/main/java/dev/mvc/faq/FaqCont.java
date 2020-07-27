package dev.mvc.faq;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FaqCont {
  @Autowired
  @Qualifier("dev.mvc.faq.FaqProc")
  private FaqProcInter faqProc = null;
  
  public FaqCont() {
    System.out.println("--> FaqCont created.");
  }
  
  // http://localhost:9090/team3/faq/create.do
  /**
   * FAQ ��� ��
   * @return
   */
  @RequestMapping(value="/faq/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/faq/create"); // webapp/faq/create.jsp
    
    return mav;       
    
  }
  
  // http://localhost:9090/team3/faq/create.do
  /**
   * ��� ó��
   * @param faqVO
   * @return
   */
  @RequestMapping(value="/faq/create.do", method=RequestMethod.POST )
  public ModelAndView create(FaqVO faqVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.faqProc.create(faqVO);
    mav.addObject("cnt", cnt); // request�� ����
    
    mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter ����
    mav.setViewName("redirect:/faq/msg.do");
    
    return mav;
  }       
  
  // http://localhost:9090/team3/faq/list.do
  /**
   * ��ü ���
   * @return
   */
//  @RequestMapping(value="/faq/list.do", method=RequestMethod.GET )
//  public ModelAndView list() {
//    ModelAndView mav = new ModelAndView();
//    
//    List<FaqVO> list = this.faqProc.list_seqno_desc();
//    mav.addObject("list", list);
//    mav.setViewName("/faq/list"); // webapp/faq/create.jsp
//    
//    return mav; // forward
//  }
  
  /**
   * ��� + �˻� ����
   * http://localhost:9090/team3/faq/list.do
   * http://localhost:9090/team3/faq/list.do?word=����
   * @param cateno
   * @param word
   * @return
   */   
//    @RequestMapping(value = "/faq/list.do", method = RequestMethod.GET) public
//    ModelAndView list_by_faq_search(
//    @RequestParam(value="word", defaultValue="") String word ) {
//    
//    ModelAndView mav = new ModelAndView(); // /contents/list_by_cateno_search.jsp
//   
//    
//    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
//    HashMap<String, Object> map = new HashMap<String, Object>();
//    
//    map.put("word", word); // #{word}
//    
//    // �˻� ���
//    List<FaqVO> list = faqProc.list_by_faq_search(map);
//    mav.addObject("list", list);
//    
//    // �˻��� ���ڵ� ����
//    int search_count = faqProc.faq_search_count(map);
//    mav.addObject("search_count", search_count);   
//    
//    mav.setViewName("/faq/list_by_faq_search");
//    return mav;
//    
//    }
  
 // http://localhost:9090/team3/faq/read.do?faqno=1
 /**
  * FAQ ��ȸ
  * @param faqno
  * @return
  */
 @RequestMapping(value="/faq/read.do", method=RequestMethod.GET )
 public ModelAndView read(int faqno) {
   ModelAndView mav = new ModelAndView();
   
   FaqVO faqVO = this.faqProc.read(faqno);
   mav.addObject("faqVO", faqVO);
   mav.setViewName("/faq/read"); // webapp/faq/read.jsp
   
   return mav; // forward
 }
 
  // http://localhost:9090/team3/faq/update.do?faqno=1
  /**
   * ���� ��
   * @return
   */
  @RequestMapping(value="/faq/update.do", method=RequestMethod.GET )
  public ModelAndView update(int faqno) {
    ModelAndView mav = new ModelAndView();
    
    FaqVO faqVO = this.faqProc.update(faqno);
    mav.addObject("faqVO", faqVO);    
    mav.setViewName("/faq/update"); // webapp/faq/update.jsp
    
    return mav;
  }
  
  // http://localhost:9090/team3/faq/update.do?faqno=1
  /**
   * ���� ó��
   * @param faqVO
   * @return
   */
  @RequestMapping(value="/faq/update.do", method=RequestMethod.POST )
  public ModelAndView update(FaqVO faqVO) {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("faqno", faqVO.getFaqno());
    mav.addObject("faq_title", faqVO.getFaq_title());
    mav.addObject("faq_content", faqVO.getFaq_content());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("faqno", faqVO.getFaqno());
    hashMap.put("faq_passwd", faqVO.getFaq_passwd());
    
    int faq_passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    faq_passwd_cnt = this.faqProc.passwd_check(hashMap);
    
    if (faq_passwd_cnt == 1) { // �н����� ��ġ
      cnt = this.faqProc.update(faqVO);
    }
  
    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("faq_passwd_cnt", faq_passwd_cnt); // request�� ����
        
    if (faq_passwd_cnt == 1 && cnt == 1) {
      mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter ����
      mav.setViewName("redirect:/faq/msg.do");
    } else { 
      mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter ����
      mav.setViewName("redirect:/faq/msg.do");
    }
    
    return mav;
  }

  // http://localhost:9090/team3/faq/delete.do?faqno=1
 /**
  * ���� ��
  * @return
  */
 @RequestMapping(value="/faq/delete.do", method=RequestMethod.GET )
 public ModelAndView delete(int faqno) {
   ModelAndView mav = new ModelAndView();
   
   FaqVO faqVO = this.faqProc.update(faqno);
   mav.addObject("faqVO", faqVO);
   
   mav.setViewName("/faq/delete"); // webapp/faq/delete.jsp
   
   return mav;
 }
 
 // http://localhost:9090/team3/faq/delete.do?faqno=1
 /**
  * ���� ó��
  * @param faqno FAQ ��ȣ
  * @param faq_passwd �н�����
  * @return
  */
 @RequestMapping(value="/faq/delete.do", method=RequestMethod.POST )
 public ModelAndView delete(int faqno, String faq_passwd) {
   ModelAndView mav = new ModelAndView();

   HashMap<String, Object> hashMap = new HashMap<String, Object>();
   hashMap.put("faqno", faqno);
   hashMap.put("faq_passwd", faq_passwd);
   
   int faq_passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
   int cnt = 0;             // ������ ���ڵ� ���� 
   
   faq_passwd_cnt = this.faqProc.passwd_check(hashMap);
   
   FaqVO faqVO = this.faqProc.read(faqno); 
   String faq_title = faqVO.getFaq_title(); // ����
   mav.addObject("faq_title", faq_title);
   
   if (faq_passwd_cnt == 1) { // �н����� ��ġ
     cnt = this.faqProc.delete(faqno);
   }

   mav.addObject("cnt", cnt); // request�� ����
   mav.addObject("faq_passwd_cnt", faq_passwd_cnt); // request�� ����
       
   if (faq_passwd_cnt == 1 && cnt == 1) {
     mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter ����
     mav.setViewName("redirect:/faq/msg.do");
   } else { 
     mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter ����
     mav.setViewName("redirect:/faq/msg.do");
   }
   
   return mav;
 }
 
  // http://localhost:9090/team3/faq/update_seqno_up.do?faqno=1
  // http://localhost:9090/team3/faq/update_seqno_up.do?faqno=1000
  /**
   * �켱���� ���� up 10 �� 1
   * @param faqno ��ȸ�� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value="/faq/update_seqno_up.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_seqno_up(int faqno) {
    ModelAndView mav = new ModelAndView();
    
    FaqVO faqVO = this.faqProc.read(faqno);
    mav.addObject("faqVO", faqVO);
    
    int cnt = this.faqProc.update_seqno_up(faqno);  // �켱 ���� ���� ó��
    mav.addObject("cnt", cnt);
    
    mav.setViewName("redirect:/faq/list.do");
    // mav.setViewName("/faq/update_seqno_up_msg");
    
    return mav;
  }  
  
  // http://localhost:9090/team3/faq/update_seqno_down.do?faqno=1
  // http://localhost:9090/team3/faq/update_seqno_down.do?faqno=1000
  /**
   * �켱���� ���� up 10 �� 1
   * @param faqno ��ȸ�� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value="/faq/update_seqno_down.do", 
                              method=RequestMethod.GET )
  public ModelAndView update_seqno_down(int faqno) {
    ModelAndView mav = new ModelAndView();
    
    FaqVO faqVO = this.faqProc.read(faqno);
    mav.addObject("faqVO", faqVO);
    
    int cnt = this.faqProc.update_seqno_down(faqno);
    mav.addObject("cnt", cnt);
    
    mav.setViewName("redirect:/faq/list.do");
    // mav.setViewName("/faq/update_seqno_down_msg");
    
    return mav;
  }  

  /**
   * �޽���
   * @param adminno
   * @return
   */
  @RequestMapping(value="/faq/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    // ��� ó�� �޽���: create_msg --> /faq/create_msg.jsp
    // ���� ó�� �޽���: update_msg --> /faq/update_msg.jsp
    // ���� ó�� �޽���: delete_msg --> /faq/delete_msg.jsp
    mav.setViewName("/faq/" + url); // forward
    
    return mav; // forward
  }
  
  /**
   * ��� + �˻� + ����¡ ����
   * http://localhost:9090/team3/faq/list.do
   * http://localhost:9090/team3/faq/list.do?cateno=1&word=������&nowPage=1
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/faq/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_search_paging(
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  // �������� ����� ���ڵ��� ������ �����ϱ����� ���     
    
    // �˻� ���
    List<FaqVO> list = faqProc.list_by_faq_search_paging(map);
    mav.addObject("list", list);
    
    // �˻��� ���ڵ� ����
    int search_count = faqProc.faq_search_count(map);
    mav.addObject("search_count", search_count);

    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
     * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
     * 
     * @param listFile ��� ���ϸ� 
     * @param cateno ī�װ���ȣ 
     * @param search_count �˻�(��ü) ���ڵ�� 
     * @param nowPage     ���� ������
     * @param word �˻���
     * @return ����¡ ���� ���ڿ�
     */ 
    String paging = faqProc.pagingBox("list.do", search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    // /contents/list_by_cateno_search_paging.jsp
    mav.setViewName("/faq/list_by_faq_search_paging");   
    
    return mav;
  }    
  
}
