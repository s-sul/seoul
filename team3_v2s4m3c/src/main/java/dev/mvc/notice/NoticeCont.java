package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.inquire.Inquires;
import dev.mvc.notice_attachfile.Notice_attachfileProcInter;
import dev.mvc.notice_attachfile.Notice_attachfileVO;


@Controller
public class NoticeCont {
  @Autowired
  @Qualifier("dev.mvc.notice.NoticeProc")
  private NoticeProcInter noticeProc;
  
  @Autowired
  @Qualifier("dev.mvc.notice_attachfile.Notice_attachfileProc")
  private Notice_attachfileProcInter notice_attachfileProc;
  
  public NoticeCont() {
    System.out.println("--> NoticeCont created.");
  }
  
  // http://localhost:9090/team3/notice/create.do
 /**
  * ��� ��
  * @return
  */
 @RequestMapping(value="/notice/create.do", method=RequestMethod.GET )
 public ModelAndView create() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/notice/create"); // webapp/notice/create.jsp
   
   return mav;
 }
 
  // http://localhost:9090/team3/notice/create.do
 /**
  * ��� ó��
  * @param noticeVO
  * @return
  */
  @RequestMapping(value="/notice/create.do", method=RequestMethod.POST )
  public ModelAndView create(NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.noticeProc.create(noticeVO);
    mav.addObject("cnt", cnt); // request�� ����
    
    mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter ����
    mav.setViewName("redirect:/notice/msg.do");
    
    return mav;
  }
  
  // http://localhost:9090/team3/notice/list.do
  /**
   * ���
   * @return
   */
//  @RequestMapping(value="/notice/list.do", method=RequestMethod.GET )
//  public ModelAndView list() {
//    ModelAndView mav = new ModelAndView();
//    
//    List<NoticeVO> list = this.noticeProc.list();
//    mav.addObject("list", list);
//    mav.setViewName("/notice/list"); // webapp/admin/create.jsp
//    
//    return mav; // forward
//  }
  
  
  /**
   * ��� + �˻� ����
   * http://localhost:9090/team3/notice/list.do
   * http://localhost:9090/team3/notice/list.do?word=����
   * @param cateno
   * @param word
   * @return
   */
   /*
    @RequestMapping(value = "/notice/list.do", method = RequestMethod.GET) public
    ModelAndView list_by_search(
    @RequestParam(value="word", defaultValue="") String word ) {
    
    ModelAndView mav = new ModelAndView(); // /contents/list_by_cateno_search.jsp
   
    
    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> map = new HashMap<String, Object>();
    
    map.put("word", word); // #{word}
    
    // �˻� ���
    List<NoticeVO> list = noticeProc.list_by_search(map);
    mav.addObject("list", list);
    
    // �˻��� ���ڵ� ����
    int search_count = noticeProc.search_count(map);
    mav.addObject("search_count", search_count);   
    
    mav.setViewName("/notice/list_by_search");
    return mav;
    
    }
    */
   
  
  // http://localhost:9090/team3/notice/read.do?noticeno=1
  /**
   * �������� ��ȸ
   * @param noticeno
   * @return
   */
  @RequestMapping(value="/notice/read.do", method=RequestMethod.GET )
  public ModelAndView read(int noticeno) {
    ModelAndView mav = new ModelAndView();
    
    NoticeVO noticeVO = this.noticeProc.read(noticeno);
    mav.addObject("noticeVO", noticeVO);
 
    int cnt = this.noticeProc.notice_cnt(noticeno);
    
    // ÷�� ���� ���
    List<Notice_attachfileVO> notice_attachfile_list = this.notice_attachfileProc.list_by_noticeno(noticeno);
    mav.addObject("notice_attachfile_list", notice_attachfile_list); 
    
    mav.setViewName("/notice/read"); // webapp/admin/read.jsp    
    return mav; // forward
  }
  
  // http://localhost:9090/team3/notice/update.do?noticeno=1
  /**
   * ���� ��
   * @return
   */
  @RequestMapping(value="/notice/update.do", method=RequestMethod.GET )
  public ModelAndView update(int noticeno) {
    ModelAndView mav = new ModelAndView();
    
    NoticeVO noticeVO = this.noticeProc.update(noticeno);
    mav.addObject("noticeVO", noticeVO);    
    mav.setViewName("/notice/update"); // webapp/notice/update.jsp
    
    return mav;
  }
  
  // http://localhost:9090/team3/notice/update.do?noticeno=1
  /**
   * ���� ó��
   * @param noticeVO
   * @return
   */
  @RequestMapping(value="/notice/update.do", method=RequestMethod.POST )
  public ModelAndView update(NoticeVO noticeVO) {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("noticeno", noticeVO.getNoticeno());
    mav.addObject("notice_title", noticeVO.getNotice_title());
    mav.addObject("notice_content", noticeVO.getNotice_content());
    mav.addObject("notice_rname", noticeVO.getNotice_rname());
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("noticeno", noticeVO.getNoticeno());
    hashMap.put("notice_passwd", noticeVO.getNotice_passwd());
    
    int notice_passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
    int cnt = 0;             // ������ ���ڵ� ���� 
    
    notice_passwd_cnt = this.noticeProc.passwd_check(hashMap);
    
    if (notice_passwd_cnt == 1) { // �н����� ��ġ
      cnt = this.noticeProc.update(noticeVO);
    }

    mav.addObject("cnt", cnt); // request�� ����
    mav.addObject("notice_passwd_cnt", notice_passwd_cnt); // request�� ����
        
    if (notice_passwd_cnt == 1 && cnt == 1) {
      mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter ����
      mav.setViewName("redirect:/notice/msg.do");
    } else { 
      mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter ����
      mav.setViewName("redirect:/notice/msg.do");
    }
    
    return mav;
  }
  
  // http://localhost:9090/team3/notice/delete.do?noticeno=1
 /**
  * ���� ��
  * @return
  */
 @RequestMapping(value="/notice/delete.do", method=RequestMethod.GET )
 public ModelAndView delete(int noticeno) {
   ModelAndView mav = new ModelAndView();
   
   NoticeVO noticeVO = this.noticeProc.update(noticeno);
   mav.addObject("noticeVO", noticeVO);
   
   mav.setViewName("/notice/delete"); // webapp/notice/delete.jsp
   
   return mav;
 }
 
 // http://localhost:9090/team3/notice/delete.do?noticeno=1
 /**
  * ���� ó��
  * @param contentsVO
  * @return
  */
 @RequestMapping(value="/notice/delete.do", method=RequestMethod.POST )
 public ModelAndView delete(int noticeno, String notice_passwd) {
   ModelAndView mav = new ModelAndView();

   HashMap<String, Object> hashMap = new HashMap<String, Object>();
   hashMap.put("noticeno", noticeno);
   hashMap.put("notice_passwd", notice_passwd);
   
   int notice_passwd_cnt = 0; // �н����� ��ġ ���ڵ� ����
   int cnt = 0;             // ������ ���ڵ� ���� 
   
   notice_passwd_cnt = this.noticeProc.passwd_check(hashMap);
   
   NoticeVO noticeVO = this.noticeProc.read(noticeno); 
   String notice_title = noticeVO.getNotice_title(); // ����
   mav.addObject("notice_title", notice_title);
   
   if (notice_passwd_cnt == 1) { // �н����� ��ġ
     cnt = this.noticeProc.delete(noticeno);
   }

   mav.addObject("cnt", cnt); // request�� ����
   mav.addObject("notice_passwd_cnt", notice_passwd_cnt); // request�� ����
       
   if (notice_passwd_cnt == 1 && cnt == 1) {
     mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter ����
     mav.setViewName("redirect:/notice/msg.do");
   } else { 
     mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter ����
     mav.setViewName("redirect:/notice/msg.do");
   }
   
   return mav;
 }
 
  /**
   * �޽���
   * @param url
   * @return
   */
  @RequestMapping(value="/notice/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    // ��� ó�� �޽���: create_msg --> /notice/create_msg.jsp
    // ���� ó�� �޽���: update_msg --> /notice/update_msg.jsp
    // ���� ó�� �޽���: delete_msg --> /notice/delete_msg.jsp
    mav.setViewName("/notice/" + url); // forward
    
    return mav; // forward
  }
  
  /**
   * ��� + �˻� + ����¡ ����
   * http://localhost:9090/team3/notice/list.do
   * http://localhost:9090/team3/notice/list.do?noticeno=1&word=����&nowPage=1
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/notice/list.do", 
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
    List<NoticeVO> list = noticeProc.list_by_search_paging(map);
    mav.addObject("list", list);
    
    // �˻��� ���ڵ� ����
    int search_count = noticeProc.search_count(map);
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
    String paging = noticeProc.pagingBox("list.do", search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);

    // /contents/list_by_cateno_search_paging.jsp
    mav.setViewName("/notice/list_by_search_paging");   
    
    return mav;
  }    
  
}
