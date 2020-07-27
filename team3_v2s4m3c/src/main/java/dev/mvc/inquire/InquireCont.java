package dev.mvc.inquire;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.inquire_attachfile.Inquire_attachfileProcInter;
import dev.mvc.inquire_attachfile.Inquire_attachfileVO;
import dev.mvc.mem.MemProcInter;
import dev.mvc.mem.MemVO;
import dev.mvc.notice.NoticeVO;

@Controller
public class InquireCont {
  @Autowired
  @Qualifier("dev.mvc.inquire.InquireProc")
  private InquireProcInter inquireProc;
  
  @Autowired
  @Qualifier("dev.mvc.inquire_attachfile.Inquire_attachfileProc")
  private Inquire_attachfileProcInter inquire_attachfileProc;
  
  @Autowired
  @Qualifier("dev.mvc.mem.MemProc")
  private MemProcInter memProc;
  
  // http://localhost:9090/team3/inquire/create.do
  /**
   * 1:1���� ��� ��
   * @return
   */
  @RequestMapping(value="/inquire/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/inquire/create"); // webapp/notice/create.jsp
    
    return mav;
  }

  // http://localhost:9090/team3/inquire/create.do
  /**
   * 1:1���� ��� ó��
   * @param inquireVO
   * @return
   */
   @RequestMapping(value="/inquire/create.do", method=RequestMethod.POST )
   public ModelAndView create(InquireVO inquireVO) {
     ModelAndView mav = new ModelAndView();
     
//     MemVO memVO =this.memProc.read(mem_no);
//     mav.addObject("memVO", memVO);
     
     int cnt = this.inquireProc.create(inquireVO);
     mav.addObject("cnt", cnt); // request�� ����
     
     mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter ����
     mav.setViewName("redirect:/inquire/msg.do");
     
     return mav;
   }
 
  // http://localhost:9090/team3/inquire/list.do
  /**
   * ���
   * @return
   */
//  @RequestMapping(value="/inquire/list.do", method=RequestMethod.GET )
//  public ModelAndView list() {
//    ModelAndView mav = new ModelAndView();
//    
//    List<InquireVO> list = this.inquireProc.list();
//    mav.addObject("list", list);
//    mav.setViewName("/inquire/list"); // webapp/admin/create.jsp
//    
//    return mav; // forward
//  }
   
  // http://localhost:9090/team3/inquire/read.do?inquireno=1
   /**
    * 1:1���� ��ȸ
    * @param inquireno
    * @return
    */
   @RequestMapping(value="/inquire/read.do", method=RequestMethod.GET )
   public ModelAndView read(int inquireno) {
     ModelAndView mav = new ModelAndView();
     
     InquireVO inquireVO = this.inquireProc.read(inquireno);
     mav.addObject("inquireVO", inquireVO);
     
     // ÷�� ���� ���
     List<Inquire_attachfileVO> inquire_attachfile_list = this.inquire_attachfileProc.list_by_inquireno(inquireno);
     mav.addObject("inquire_attachfile_list", inquire_attachfile_list); 
     
     mav.setViewName("/inquire/read"); // webapp/admin/read.jsp    
     return mav; // forward
   }
   
   /**
    * �� �ۼ��ڰ� ��ġ�ϴ��� Ȯ���Ͽ� ��ȸ
    * @param session
    * @param contentsno �۹�ȣ
    * @return
    */
// @RequestMapping(value="/inquire/read.do", method=RequestMethod.GET )
// public ModelAndView delete(HttpSession session, int inquireno) {
//   ModelAndView mav = new ModelAndView();
//   
//   int mem_no = (Integer)session.getAttribute("mem_no");
//   // int adminno = (Integer)session.getAttribute("adminno");
//   
//   // �� �ۼ��ڰ� ��ġ�ϴ��� Ȯ��
//   if (mem_no == inquireProc.read(inquireno).getmem_no()) {
//     InquireVO inquireVO = this.inquireProc.read(inquireno);
//     mav.addObject("inquireVO", inquireVO); // request.setAttribute("inquireVO", inquireVO);
//     
//     mav.setViewName("/inquire/read"); // webapp/contents/delete.jsp
//   } else {
//     // mav.setViewName("redirect:/member/mconfirm_fail_msg.jsp");
//   }
//     
//   return mav;
// }
 
  // http://localhost:9090/team3/notice/update.do?noticeno=1
  /**
   * ���� ��
   * @return
   */
  @RequestMapping(value="/inquire/update.do", method=RequestMethod.GET )
  public ModelAndView update(int inquireno) {
    ModelAndView mav = new ModelAndView();
    
    InquireVO inquireVO = this.inquireProc.update(inquireno);
    mav.addObject("inquireVO", inquireVO);    
    mav.setViewName("/inquire/update"); // webapp/inquire/update.jsp
    
    return mav;
  }
  
  // http://localhost:9090/team3/inquire/update.do?inquireno=1
  /**
   * ���� ó��
   * @param inquireVO
   * @return
   */
  @RequestMapping(value="/inquire/update.do", method=RequestMethod.POST )
  public ModelAndView update(InquireVO inquireVO) {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("inquireno", inquireVO.getInquireno());
    mav.addObject("inquire_title", inquireVO.getInquire_title());
    mav.addObject("inquire_content", inquireVO.getInquire_content());
    mav.addObject("inquire_rname", inquireVO.getInquire_rname());

    // System.out.println("--> inquireno: " + inquireVO.getInquireno());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("inquireno", inquireVO.getInquireno());
    hashMap.put("inquire_passwd", inquireVO.getInquire_passwd());
    
    
    int inquire_passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    inquire_passwd_cnt = this.inquireProc.passwd_check(hashMap);
    
    if (inquire_passwd_cnt == 1) { // �н����� ��ġ
      cnt = this.inquireProc.update(inquireVO);
    }

    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("inquire_passwd_cnt", inquire_passwd_cnt); // request�� ����
        
    if (inquire_passwd_cnt == 1 && cnt == 1) {
      mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter ����
      mav.setViewName("redirect:/inquire/msg.do");
    } else { 
      mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter ����
      mav.setViewName("redirect:/inquire/msg.do");
    }
    
    return mav;
  }
  
  // http://localhost:9090/team3/inquire/delete.do?inquireno=1
  /**
   * ���� ��
   * @return
   */
//  @RequestMapping(value="/inquire/delete.do", method=RequestMethod.GET )
//  public ModelAndView delete(int inquireno) {
//    ModelAndView mav = new ModelAndView();
//    
//    InquireVO inquireVO = this.inquireProc.update(inquireno);
//    mav.addObject("inquireVO", inquireVO);
//    
//    mav.setViewName("/inquire/delete"); // webapp/inquire/delete.jsp
//    
//    return mav;
//  }
  
    /**
     * �� �ۼ��ڰ� ��ġ�ϴ��� Ȯ���Ͽ� ����
     * @param session
     * @param inquireno ���� ��ȣ
     * @return
     */
  @RequestMapping(value="/inquire/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(HttpSession session, int inquireno) {
    ModelAndView mav = new ModelAndView();
    
    int mem_no = (Integer)session.getAttribute("mem_no");
    
    // �� �ۼ��ڰ� ��ġ�ϴ��� Ȯ��
    if (mem_no == inquireProc.read(inquireno).getmem_no()) {
      InquireVO inquireVO = this.inquireProc.update(inquireno);
      mav.addObject("inquireVO", inquireVO); // request.setAttribute("inquireVO", inquireVO);
      
      mav.setViewName("/inquire/delete"); // webapp/inquire/delete.jsp
    } else {
      mav.setViewName("redirect:/mem/mconfirm_fail_msg.jsp");
    }
      
    return mav;
  }
  
  // http://localhost:9090/team3/inquire/delete.do?inquireno=1
  /**
   * ���� ó��
   * @param InquireVO
   * @return
   */
  @RequestMapping(value="/inquire/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int inquireno, String inquire_passwd) {
    ModelAndView mav = new ModelAndView();
  
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("inquireno", inquireno);
    hashMap.put("inquire_passwd", inquire_passwd);
    
    int inquire_passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    inquire_passwd_cnt = this.inquireProc.passwd_check(hashMap);
    
    InquireVO inquireVO = this.inquireProc.read(inquireno); 
    String inquire_title = inquireVO.getInquire_title(); // ����
    mav.addObject("inquire_title", inquire_title);
    
    if (inquire_passwd_cnt == 1) { // �н����� ��ġ
      cnt = this.inquireProc.delete(inquireno);
    }
  
    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("inquire_passwd_cnt", inquire_passwd_cnt); // request�� ����
        
    if (inquire_passwd_cnt == 1 && cnt == 1) {
      mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter ����
      mav.setViewName("redirect:/inquire/msg.do");
    } else { 
      mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter ����
      mav.setViewName("redirect:/inquire/msg.do");
    }
    
    return mav;
  }

   /**
    * �޽���
    * @param url
    * @return
    */
   @RequestMapping(value="/inquire/msg.do", method=RequestMethod.GET)
   public ModelAndView msg(String url){
     ModelAndView mav = new ModelAndView();
     
     // ��� ó�� �޽���: create_msg --> /inquire/create_msg.jsp
     // ���� ó�� �޽���: update_msg --> /inquire/update_msg.jsp
     // ���� ó�� �޽���: delete_msg --> /inquire/delete_msg.jsp
     mav.setViewName("/inquire/" + url); // forward
     
     return mav; // forward
   }
   
   /**
    * ��� + �˻� + ����¡ ����
    * http://localhost:9090/team3/inquire/list.do
    * http://localhost:9090/team3/inquire/list.do?inquireno=1&word=����&nowPage=1
    * @param inquireno
    * @param word
    * @param nowPage
    * @return
    */
   @RequestMapping(value = "/inquire/list.do", 
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
     List<InquireVO> list = inquireProc.list_by_search_paging(map);
     mav.addObject("list", list);
     
     // �˻��� ���ڵ� ����
     int search_count = inquireProc.search_count(map);
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
     String paging = inquireProc.pagingBox("list.do", search_count, nowPage, word);
     mav.addObject("paging", paging);
   
     mav.addObject("nowPage", nowPage);

     // /inquire/list_by_search_paging.jsp
     mav.setViewName("/inquire/list_by_paging");   
     
     return mav;
   }    
   
   /**
    * ȸ���� ���� ���
    * @return
    */
   // http://localhost:9090/team3/inquire/list_by_mem_no.do?mem_no=1
   @RequestMapping(value="/inquire/list_by_mem_no.do", method=RequestMethod.GET )
   public ModelAndView list_by_mem_no(HttpSession session) {
     ModelAndView mav = new ModelAndView();
     
     List<InquireVO> list = this.inquireProc.list_by_mem_no((int)session.getAttribute("mem_no"));
     mav.addObject("list", list);
     mav.setViewName("/inquire/list_by_mem_no"); // webapp/admin/create.jsp
     
     return mav; // forward
   }
   
   /**
    * ���յ� ī�װ� �׷캰 ī�װ� ��� (session ȣ��)
    * http://localhost:9090/resort/cate/list_index_left.do
    * @param request
    * @return
    */
  @RequestMapping(value="/inquire/list_index_left.do", method=RequestMethod.GET)
  public ModelAndView list_index_left(HttpServletRequest request, HttpSession session){
    
    ModelAndView mav = new ModelAndView();
    MemVO memVO = this.memProc.read((int)session.getAttribute("mem_no"));
    
    mav.addObject("mem_no", (int)session.getAttribute("mem_no"));
    mav.addObject("mem_pic_th", memVO.getMem_pic_th());
    mav.addObject("mem_nick", memVO.getMem_nick());
    mav.setViewName("./mem/list_index_left"); // webapp/cate/list_index_left.jsp

    return mav;
  } 

   
   
}
