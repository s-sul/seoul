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
   * 1:1문의 등록 폼
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
   * 1:1문의 등록 처리
   * @param inquireVO
   * @return
   */
   @RequestMapping(value="/inquire/create.do", method=RequestMethod.POST )
   public ModelAndView create(InquireVO inquireVO) {
     ModelAndView mav = new ModelAndView();
     
//     MemVO memVO =this.memProc.read(mem_no);
//     mav.addObject("memVO", memVO);
     
     int cnt = this.inquireProc.create(inquireVO);
     mav.addObject("cnt", cnt); // request에 저장
     
     mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter 적용
     mav.setViewName("redirect:/inquire/msg.do");
     
     return mav;
   }
 
  // http://localhost:9090/team3/inquire/list.do
  /**
   * 목록
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
    * 1:1문의 조회
    * @param inquireno
    * @return
    */
   @RequestMapping(value="/inquire/read.do", method=RequestMethod.GET )
   public ModelAndView read(int inquireno) {
     ModelAndView mav = new ModelAndView();
     
     InquireVO inquireVO = this.inquireProc.read(inquireno);
     mav.addObject("inquireVO", inquireVO);
     
     // 첨부 파일 목록
     List<Inquire_attachfileVO> inquire_attachfile_list = this.inquire_attachfileProc.list_by_inquireno(inquireno);
     mav.addObject("inquire_attachfile_list", inquire_attachfile_list); 
     
     mav.setViewName("/inquire/read"); // webapp/admin/read.jsp    
     return mav; // forward
   }
   
   /**
    * 글 작성자가 일치하는지 확인하여 조회
    * @param session
    * @param contentsno 글번호
    * @return
    */
// @RequestMapping(value="/inquire/read.do", method=RequestMethod.GET )
// public ModelAndView delete(HttpSession session, int inquireno) {
//   ModelAndView mav = new ModelAndView();
//   
//   int mem_no = (Integer)session.getAttribute("mem_no");
//   // int adminno = (Integer)session.getAttribute("adminno");
//   
//   // 글 작성자가 일치하는지 확인
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
   * 수정 폼
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
   * 수정 처리
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
    
    
    int inquire_passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 수정된 레코드 갯수 
    
    inquire_passwd_cnt = this.inquireProc.passwd_check(hashMap);
    
    if (inquire_passwd_cnt == 1) { // 패스워드 일치
      cnt = this.inquireProc.update(inquireVO);
    }

    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("inquire_passwd_cnt", inquire_passwd_cnt); // request에 저장
        
    if (inquire_passwd_cnt == 1 && cnt == 1) {
      mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter 적용
      mav.setViewName("redirect:/inquire/msg.do");
    } else { 
      mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter 적용
      mav.setViewName("redirect:/inquire/msg.do");
    }
    
    return mav;
  }
  
  // http://localhost:9090/team3/inquire/delete.do?inquireno=1
  /**
   * 삭제 폼
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
     * 글 작성자가 일치하는지 확인하여 삭제
     * @param session
     * @param inquireno 문의 번호
     * @return
     */
  @RequestMapping(value="/inquire/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(HttpSession session, int inquireno) {
    ModelAndView mav = new ModelAndView();
    
    int mem_no = (Integer)session.getAttribute("mem_no");
    
    // 글 작성자가 일치하는지 확인
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
   * 삭제 처리
   * @param InquireVO
   * @return
   */
  @RequestMapping(value="/inquire/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int inquireno, String inquire_passwd) {
    ModelAndView mav = new ModelAndView();
  
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("inquireno", inquireno);
    hashMap.put("inquire_passwd", inquire_passwd);
    
    int inquire_passwd_cnt = 0; // 패스워드 일치 레코드 갯수
    int cnt = 0;             // 삭제된 레코드 갯수 
    
    inquire_passwd_cnt = this.inquireProc.passwd_check(hashMap);
    
    InquireVO inquireVO = this.inquireProc.read(inquireno); 
    String inquire_title = inquireVO.getInquire_title(); // 제목
    mav.addObject("inquire_title", inquire_title);
    
    if (inquire_passwd_cnt == 1) { // 패스워드 일치
      cnt = this.inquireProc.delete(inquireno);
    }
  
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("inquire_passwd_cnt", inquire_passwd_cnt); // request에 저장
        
    if (inquire_passwd_cnt == 1 && cnt == 1) {
      mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter 적용
      mav.setViewName("redirect:/inquire/msg.do");
    } else { 
      mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter 적용
      mav.setViewName("redirect:/inquire/msg.do");
    }
    
    return mav;
  }

   /**
    * 메시지
    * @param url
    * @return
    */
   @RequestMapping(value="/inquire/msg.do", method=RequestMethod.GET)
   public ModelAndView msg(String url){
     ModelAndView mav = new ModelAndView();
     
     // 등록 처리 메시지: create_msg --> /inquire/create_msg.jsp
     // 수정 처리 메시지: update_msg --> /inquire/update_msg.jsp
     // 삭제 처리 메시지: delete_msg --> /inquire/delete_msg.jsp
     mav.setViewName("/inquire/" + url); // forward
     
     return mav; // forward
   }
   
   /**
    * 목록 + 검색 + 페이징 지원
    * http://localhost:9090/team3/inquire/list.do
    * http://localhost:9090/team3/inquire/list.do?inquireno=1&word=공지&nowPage=1
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
     
     // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
     HashMap<String, Object> map = new HashMap<String, Object>();
     map.put("word", word);     // #{word}
     map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
     
     // 검색 목록
     List<InquireVO> list = inquireProc.list_by_search_paging(map);
     mav.addObject("list", list);
     
     // 검색된 레코드 갯수
     int search_count = inquireProc.search_count(map);
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
     String paging = inquireProc.pagingBox("list.do", search_count, nowPage, word);
     mav.addObject("paging", paging);
   
     mav.addObject("nowPage", nowPage);

     // /inquire/list_by_search_paging.jsp
     mav.setViewName("/inquire/list_by_paging");   
     
     return mav;
   }    
   
   /**
    * 회원별 문의 목록
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
    * 결합된 카테고리 그룹별 카테고리 목록 (session 호출)
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
