package dev.mvc.inquire_reply;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;

@Controller
public class Inquire_replyCont {
  @Autowired
  @Qualifier("dev.mvc.inquire_reply.Inquire_replyProc") // �̸� ����
  private Inquire_replyProcInter inquire_replyProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc") // �̸� ����
  private AdminProcInter adminProc;
  
  /**
   * 1:1���� ��� ��� ó��
   * @param Inquire_replyVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/inquire_reply/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create(Inquire_replyVO inquire_replyVO) {
    int count = inquire_replyProc.create(inquire_replyVO);
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
 
    return obj.toString(); // {"count":1}

  }
  
  /**
   * 1:1���� ��� ��ü ���, �����ڸ� ��ȸ ����
   * @param session
   * @return
   */
  @RequestMapping(value="/inquire_reply/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      List<Inquire_replyVO> list = inquire_replyProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/inquire_reply/list"); // /webapp/reply/list.jsp

    } else {
      mav.setViewName("redirect:/admin/login_need.jsp"); // /webapp/admin/login_need.jsp
    }
    
    return mav;
  }
  
    /**
    <xmp>
    http://localhost:9090/team3/inquire_reply/list_by_inquireno.do?inquireno=1
    ���� ���� ���: {"list":[]}
    ���� �ִ� ���
    {"list":[
             {"mem_no":1,"reply_rdate":"2019-12-18 16:46:43","reply_passwd":"123","inquire_replyno":1,"reply_content":"��� 1","inquireno":1}
             ,
             {"mem_no":1,"reply_rdate":"2019-12-18 16:46:39","reply_passwd":"123","inquire_replyno":2,"reply_content":"��� 2","inquireno":1}
             ,
             {"mem_no":1,"reply_rdate":"2019-12-18 16:46:35","reply_passwd":"123","inquire_replyno":3,"reply_content":"��� 3","inquireno":1}
             ] 
    }
    </xmp>  
    * @param inquireno
    * @return
    */
   @ResponseBody
   @RequestMapping(value = "/inquire_reply/list_by_inquireno.do",
                             method = RequestMethod.GET,
                             produces = "text/plain;charset=UTF-8")
   public String list_by_contentsno(int inquireno) {
     List<Inquire_replyVO> list = inquire_replyProc.list_by_inquireno(inquireno);
     
     JSONObject obj = new JSONObject();
     obj.put("list", list);
  
     return obj.toString(); 
  
   }
   
   /**
    * {"list":[
           {"mem_no":1,
         "reply_rdate":"2019-12-18 16:46:35",
       "reply_passwd":"123",
       "inquire_replyno":1,
       "id":"user1",
       "reply_content":"��� 1",
       "inquireno":1}
     ,
         {"mem_no":1,
        "reply_rdate":"2019-12-18 16:46:35",
        "reply_passwd":"123",
        "inquire_replyno":1,
        "id":"user1",
        "conreply_contenttent":"��� 1",
        "inquireno":1}
     ]
  }
    * http://localhost:9090/team3/inquire_reply/list_by_inquireno_join.do?contentsno=31
    * @param contentsno
    * @return
    */
   @ResponseBody
   @RequestMapping(value = "/inquire_reply/list_by_inquireno_join.do",
                               method = RequestMethod.GET,
                               produces = "text/plain;charset=UTF-8")
   public String list_by_contentsno_join(int inquireno) {
     // String msg="JSON ���";
     // return msg;
     
     List<Inquire_replyMemberVO> list = inquire_replyProc.list_by_inquireno_join(inquireno);
     
     JSONObject obj = new JSONObject();
     obj.put("list", list);
  
     return obj.toString();     
   }
   
   /**
    * http://localhost:9090/team3/inquire_reply/delete.do?inquire_replyno=1&reply_passwd=1234
    * {"delete_count":0,"count":0}
    * {"delete_count":1,"count":1}
    * @param replyno
    * @param passwd
    * @return
    */
   @ResponseBody
   @RequestMapping(value = "/inquire_reply/delete.do", 
                               method = RequestMethod.POST,
                               produces = "text/plain;charset=UTF-8")
   public String delete(int inquire_replyno, String reply_passwd) {
     Map<String, Object> map = new HashMap<String, Object>();
     map.put("inquire_replyno", inquire_replyno);
     map.put("reply_passwd", reply_passwd);
     
     int count = inquire_replyProc.checkPasswd(map); // �н����� ��ġ ����, 1: ��ġ, 0: ����ġ
     int delete_count = 0;                              // ������ ���
     if (count == 1) {
       delete_count = inquire_replyProc.delete(inquire_replyno); // ��� ����
     }
     
     JSONObject obj = new JSONObject();
     obj.put("count", count); // �н����� ��ġ ����, 1: ��ġ, 0: ����ġ
     obj.put("delete_count", delete_count); // ������ ���
     
     return obj.toString();
   }
 
}
