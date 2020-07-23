package dev.mvc.at_grp;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.at.At_ProcInter;

@Controller
public class At_grp_Cont {

  @Autowired
  @Qualifier("dev.mvc.at_grp.At_grp_Proc")
  private At_grp_ProcInter at_grp_Proc;
  
  @Autowired
  @Qualifier("dev.mvc.at.At_Proc")
  private At_ProcInter at_Proc;
  
  

  /**
   * �޽���
   * 
   * @param url
   *          �̵��� jsp �ּ�
   * @return
   */
  @RequestMapping(value = "/at_grp/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/at_grp/" + url);
    // ���ó�� : /at_grp/create_msg.jsp
    // ����ó�� : /at_grp/update_msg.jsp
    // ����ó�� : /at_grp/delete_msg.jsp

    return mav; // forward
  }

  /**
   * ��� ��
   * 
   * @return
   */
  @RequestMapping(value = "/at_grp/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("at_grp/create");
    return mav;
  }

  /**
   * ���ó��
   * 
   * @param
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/at_grp/create.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String create(At_grp_VO at_grp_VO) {

    int cnt = this.at_grp_Proc.create(at_grp_VO);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();

  }

  /**
   * ��� + �˻� + ����¡ ���� http://localhost:9090/resort/contents/list.do
   * http://localhost:9090/resort/contents/list.do?cateno=17&word=������&nowPage=1
   * 
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/at_grp/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_at_grp_paging(@RequestParam(value = "nowPage", defaultValue = "1") int nowPage) {

    ModelAndView mav = new ModelAndView();
    HashMap<String, Object> map = new HashMap<String, Object>(); // proc���� ���� map ����(startnum, endnum+ ���� 3��)

    map.put("nowPage", nowPage);
    int count = at_grp_Proc.count();
    mav.addObject("count", count);

    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� ���� ������: 11 / 22 [����] 11 12 13 14 15 16 17
     * 18 19 20 [����]
     * 
     * @param listFile ��� ���ϸ�
     * 
     * @param cateno ī�װ���ȣ
     * 
     * @param search_count �˻�(��ü) ���ڵ��
     * 
     * @param nowPage ���� ������
     * 
     * @param word �˻���
     * 
     * @return ����¡ ���� ���ڿ�
     */
    String paging = at_grp_Proc.pagingBox("list.do", count, nowPage);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);

    List<At_grp_VO> list = this.at_grp_Proc.list_by_at_grp_paging(map);

    mav.addObject("list", list);
    mav.setViewName("/at_grp/list");
    return mav;
  }

  /**
   * ��¸�� ����
   * 
   * @param
   * @return
   */
  @RequestMapping(value = "/at_grp/update_visible.do", method = RequestMethod.GET)
  public ModelAndView update_visible(At_grp_VO at_grp_VO) {
    ModelAndView mav = new ModelAndView();
    this.at_grp_Proc.update_visible(at_grp_VO);

    mav.setViewName("redirect:/at_grp/list.do"); // ���ο� list ���

    return mav;
  }

  /**
   * ��¼��� ���� (-1)
   * http://localhost:9090/team3/at_grp/update_seqno_up.do?at_grp_no=1
   * 
   * @param categrpno
   * @return
   */

  @RequestMapping(value = "/at_grp/update_seqno_up.do", method = RequestMethod.GET)
  public ModelAndView update_seqno_up(int at_grp_no) {
    ModelAndView mav = new ModelAndView();
    this.at_grp_Proc.update_seqno_up(at_grp_no);
    mav.setViewName("redirect:/at_grp/list.do");
    return mav;
  }

  /**
   * ��¼��� ����(+1)
   * http://localhost:9090/team3/at_grp/update_seqno_down.do?at_grp_no=1
   * 
   * @param categrpno
   * @return
   */

  @RequestMapping(value = "/at_grp/update_seqno_down.do", method = RequestMethod.GET)
  public ModelAndView update_seqno_down(int at_grp_no) {
    ModelAndView mav = new ModelAndView();
    this.at_grp_Proc.update_seqno_down(at_grp_no);
    mav.setViewName("redirect:/at_grp/list.do");
    return mav;
  }

  /**
   * ��ȸ + ���� Cont
   * 
   * @param at_grp_no
   *          ��� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value = "/at_grp/update.do", method = RequestMethod.GET)
  public ModelAndView update(int at_grp_no) {
    ModelAndView mav = new ModelAndView();

    At_grp_VO at_grp_VO = this.at_grp_Proc.read(at_grp_no);
    mav.addObject("at_grp_VO", at_grp_VO);

    List<At_grp_VO> list = this.at_grp_Proc.list_seq_asc();
    mav.addObject("list", list);
    mav.setViewName("/at_grp/update");

    return mav;
  }

  /**
   * ����ó��
   * 
   * @param
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/at_grp/update.do", method = RequestMethod.POST)
  public String update(At_grp_VO at_grp_VO) {

    int cnt = this.at_grp_Proc.update(at_grp_VO);
    JSONObject json = new JSONObject();

    json.put("cnt", cnt);
    return json.toString();

  }

  /*  *//**
         * ��ȸ + ����
         * 
         * @param at_grp_no
         *          ��� ī�װ� ��ȣ
         * @return
         *//*
            * @RequestMapping(value = "/at_grp/delete.do", method = RequestMethod.GET)
            * public ModelAndView delete(int at_grp_no) { ModelAndView mav = new
            * ModelAndView();
            * 
            * At_grp_VO at_grp_VO = this.at_grp_Proc.read(at_grp_no);
            * mav.addObject("at_grp_VO", at_grp_VO);
            * 
            * List<At_grp_VO> list = this.at_grp_Proc.list_seq_asc(); mav.addObject("list",
            * list); mav.setViewName("/at_grp/delete");
            * 
            * return mav; }
            */

  /**
   * ����ó��
   * 
   * @param
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/at_grp/delete.do", method = RequestMethod.POST)
  public String delete_proc(int at_grp_no) {

    int cnt = this.at_grp_Proc.delete(at_grp_no);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();

  }

  /**
   * �޴� ī�װ� ���
   * http://localhost:9090/team3/at_grp/at_grp.do
   * @param request
   * @return
   */
 @RequestMapping(value="/at_grp/at_grp.do", method=RequestMethod.GET)
 public ModelAndView at_grp(HttpServletRequest request){
  
   ModelAndView mav = new ModelAndView();
   List<At_grp_VO> list = at_grp_Proc.list_seq_asc();  
   mav.addObject("list", list);
   
   mav.setViewName("/at_grp/at_grp");
   
   return mav;
 } 

 
 
 
 /**
  * �ε��� ī�װ� ���
  * http://localhost:9090/team3/at_grp/at_grp.do
  * @param request
  * @return
  */
@RequestMapping(value="/at_grp/at_grp_index.do", method=RequestMethod.GET)
public ModelAndView at_grp_index(HttpServletRequest request){
 
  ModelAndView mav = new ModelAndView();
  List<At_grp_Cnt> at_grp_index = at_grp_Proc.at_grp_index(); 
  mav.addObject("at_grp_index", at_grp_index);
  mav.setViewName("/at_grp/at_grp_index");
  
  return mav;
} 

}
