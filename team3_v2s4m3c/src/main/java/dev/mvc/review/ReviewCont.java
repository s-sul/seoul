package dev.mvc.review;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


@Controller
public class ReviewCont {
  
  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc")
  private ReviewProcInter reviewProc;
  
  @Autowired
  @Qualifier("dev.mvc.mem.MemProc")
  private MemProcInter memProc;
  
  /**
   * ���� ��� ó��
   * @param replyVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create(ReviewVO reviewVO) {
    
    int count = reviewProc.create(reviewVO);  // Call By Reference
    int review_no = reviewVO.getReview_no();  // Call By Reference������ PK ���� ����
    
    JSONObject json = new JSONObject();
    json.put("count",count);
    json.put("review_no",review_no); // ��ϵ� ���� PK ����
    
    System.out.println("count: " + count);
    System.out.println("review_no: " + review_no);
    
    json.put("count", count); // Ű�� ���� ������ �ڵ����� ������.
    json.put("review_no", review_no); // Ű�� ���� ������ �ڵ����� ������.
    return json.toString();     
  }
  
  
  
  /**
   * ���� ��ȸ ()
   * @param session
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/review/read.do", method=RequestMethod.POST)
  public String read(HttpSession session, int review_no) {
    
    Mem_ReviewVO mem_ReviewVO = this.reviewProc.read_by_review_no(review_no);
    
    System.out.println("m_mem_no: " + mem_ReviewVO.getM_mem_no() ) ;
    System.out.println("review_rate: " + mem_ReviewVO.getReview_rate() ) ;
    
    // Ű�� ���� ������ �ڵ����� �����ϱ����Ͽ� ��ü�� 1���̳� ArrayList�� ������.
    ArrayList<Mem_ReviewVO> list = new ArrayList<Mem_ReviewVO>();
    list.add(mem_ReviewVO);
    
    JSONObject json = new JSONObject();
    json.put("mem_ReviewVO", list); // Ű�� ���� ������ �ڵ����� ������.
    return json.toString();     
  }
  
  
  
  /**
   * ���� ��� (ȸ����)
   * @param session
   * @return
   */
  @RequestMapping(value="/review/list_by_mem_no.do", method=RequestMethod.GET)
  public ModelAndView list_by_mem_no
        (HttpSession session,
        @RequestParam(value = "word", defaultValue = "") String word,
        @RequestParam(value = "nowPage", defaultValue = "1") int nowPage) {
    
    System.out.println("--> nowPage: " + nowPage);
    ModelAndView mav = new ModelAndView();
    
    if (memProc.isMember(session)) {
      
      // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
      HashMap<Object, Object> map = new HashMap<Object, Object>();
      map.put("mem_no", (int)session.getAttribute("mem_no")); // #{mem_no}
      map.put("nowPage", nowPage); // MyBatis (DB �÷�)�� �ƴ�, paging�� ���� rownum�� ã�Ƴ��� ���� �ʿ��� ����
      
      // �˻� ���
      List<Payment_ReviewVO> list = reviewProc.list_by_mem_no(map);
      mav.addObject("list", list);
      
      // �˻��� ���ڵ� ����
      int search_count = reviewProc.count_by_mem_no(map);
      mav.addObject("search_count", search_count);
      
      System.out.println("Review Controller list_by_mem_no:: " + list);
      mav.setViewName("/review/list_by_mem_no"); // /webapp/review/list_by_mem_no.jsp
      
      String paging = reviewProc.pagingBox("list.do",  search_count, nowPage, word);
      mav.addObject("paging", paging);
      mav.addObject("nowPage", nowPage);
      
    } else {
      mav.setViewName("redirect:../mem/login_need.jsp"); // /webapp/mem/login_need.jsp
    }
    
    return mav;
  }
  
  
  
  /**
   * ���� ��� (��ǰ��)
   * @param session
   * @return
   */
  @RequestMapping(value="/review/list_by_at_no.do", method=RequestMethod.GET)
  public ModelAndView list_by_at_no(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (memProc.isMember(session)) {
//      List<Payment_ReviewVO> list = reviewProc.list_by_mem_no((int)session.getAttribute("mem_no"));
//      
//      mav.addObject("list", list);
//      mav.setViewName("/review/list_by_at_no"); // /webapp/reply/list.jsp
      
    } else {
      mav.setViewName("redirect:/mem/login_need.jsp"); // /webapp/admin/login_need.jsp
    }
    
    return mav;
  }
  
  
  /**
   * ������ȣ�� ���� ���� ����
   * @param session
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/review/existReview.do", method=RequestMethod.GET)
  public String existReview (int payment_no) {
    
    int cnt = this.reviewProc.existReview(payment_no);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt); 
    return json.toString();  
  }
  
  
  /**
   * ������ ��ư ����¡ ��� (���� ���̺�)
   * http://localhost:9090/ojt/reply/list_by_at_no_add_view.do?contentsno=1&replyPage=1
   * @param at_no (����� �޸���) �θ� ������ ��ȣ
   * @param reviewPage ��� ������
   * @return
   */
   
    @ResponseBody
    @RequestMapping(value = "/review/list_by_at_no_join_add_view.do",
                             method = RequestMethod.GET,
                             produces = "text/plain;charset=UTF-8")
    public String list_by_at_no_join_add_view (int at_no, int reviewPage) {
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("at_no", at_no); 
      map.put("reviewPage", reviewPage); 
      
      List<Mem_ReviewVO> list =  reviewProc.list_by_at_no_join_add_view(map);
      
      JSONObject obj = new JSONObject();
      obj.put("list", list);
      
      System.out.println("list_by_at_no_join_add_view: " + list);
      
      return obj.toString(); 
    }
    
    
    
    /**
     * ���� ���� ó��
     * @param review_no
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/review/update.do",
                              method = RequestMethod.POST,
                              produces = "text/plain;charset=UTF-8")
    public String update (HttpSession session, ReviewVO reviewVO, String mem_pw) {
      
      HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
      hashMap.put("mem_pw", mem_pw);
      hashMap.put("mem_no", session.getAttribute("mem_no")); 
      
      int pw_cnt = 0;
      int update_cnt = 0;
      
      pw_cnt = this.memProc.check_pw(hashMap); // �н����� �˻�
      if (pw_cnt == 1) {
        update_cnt = reviewProc.update(reviewVO);
      }
      
      JSONObject json = new JSONObject();
      json.put("pw_cnt", pw_cnt);
      json.put("update_cnt", update_cnt);
      
      System.out.println("pw_cnt: " + pw_cnt + "update_cnt" + update_cnt );
      
      return json.toString(); 
    }
    
    
    
    /**
     * ���� ���� ó��
     * @param review_no
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/review/delete.do",
    method = RequestMethod.POST,
    produces = "text/plain;charset=UTF-8")
    public String delete (HttpSession session, int review_no, String mem_pw) {
      
      System.out.println("���� ���� ó�� ����");
      
      HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
      hashMap.put("mem_pw", mem_pw);
      hashMap.put("mem_no", session.getAttribute("mem_no")); 
      
      int pw_cnt = 0;
      int delete_cnt = 0;
      
      pw_cnt = this.memProc.check_pw(hashMap); // �н����� �˻�
      if (pw_cnt == 1) {
        delete_cnt = reviewProc.delete(review_no); // ��� ����
      }
      
      JSONObject json = new JSONObject();
      json.put("pw_cnt", pw_cnt);
      json.put("delete_cnt", delete_cnt);
      
      System.out.println("pw_cnt: " + pw_cnt + "delete_cnt" + delete_cnt );
      
      return json.toString(); 
    }
      
  

}
