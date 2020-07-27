package dev.mvc.mem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.mem_wish.Mem_wishProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class MemCont {
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc") // �̸� ����
  private AdminProcInter adminProc;
  
  @Autowired
  @Qualifier("dev.mvc.mem.MemProc")
  private MemProcInter memProc;
  
  @Autowired
  @Qualifier("dev.mvc.mem_wish.Mem_wishProc")
  private Mem_wishProcInter mem_wishProc;
  

  /**
   * ��� ��
   */
  
  // http://localhost:9090/resort/mem/create.do
  @RequestMapping (value = "/mem/create.do", method = RequestMethod.GET )
  public ModelAndView create () {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/mem/create"); // webapp/mem/create.jsp
    return mav;
  }
  
  
  /**
   * ID �ߺ� üũ 
   */
  
  // http://localhost:9090/resort/mem/checkID.do?id=user1
  // JSON ��� �� �ѱ� ���� ���� (UTF-8) 
  @ResponseBody 
  @RequestMapping (value = "/mem/checkID.do", method = RequestMethod.GET , produces="text/plain;charset=UTF-8") 
  public String checkID (String mem_id) {
    int cnt = this.memProc.checkID(mem_id);
    
    JSONObject json= new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

  /**
   * �г��� �ߺ� üũ 
   */
  
  // http://localhost:9090/resort/mem/checkNick.do?id=user1
  // JSON ��� �� �ѱ� ���� ���� (UTF-8) 
  @ResponseBody 
  @RequestMapping (value = "/mem/checkNick.do", method = RequestMethod.GET , produces="text/plain;charset=UTF-8") 
  public String checkNick (String mem_nick) {
    int cnt = this.memProc.checkNick(mem_nick);
    
    JSONObject json= new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

  /**
   * �ڵ�����ȣ �ߺ� üũ 
   */
  
  // http://localhost:9090/resort/mem/checkNick.do?id=user1
  // JSON ��� �� �ѱ� ���� ���� (UTF-8) 
  @ResponseBody 
  @RequestMapping (value = "/mem/checkTel.do", method = RequestMethod.GET , produces="text/plain;charset=UTF-8") 
  public String checkTel (String mem_tel) {
    int cnt = this.memProc.checkTel(mem_tel);
    
    System.out.println("�ڵ��� ��ȣ �ߺ� Ȯ�� cnt: " + cnt);
    
    JSONObject json= new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

  /**
   * �ڵ�����ȣ ������ �ߺ� üũ 
   */
  
  // http://localhost:9090/resort/mem/checkNick.do?id=user1
  // JSON ��� �� �ѱ� ���� ���� (UTF-8) 
  @ResponseBody 
  @RequestMapping (value = "/mem/checkTelUpdate.do", method = RequestMethod.GET , produces="text/plain;charset=UTF-8") 
  public String checkTelUpdate (String mem_tel, HttpSession session) {

    JSONObject json= new JSONObject();
    int cnt = 0;
    
    MemVO memVO_old = this.memProc.read((int)session.getAttribute("mem_no")); // ȸ���� ��mem_no�� session���� ȣ�⢸
    // MemVO memVO_old = this.memProc.read(memVO.getMem_no()); // �����ڿ�

    //    System.out.println("mem_no: " + (int)session.getAttribute("mem_no"));
    //    System.out.println("mem_tel: " + mem_tel );
    //    System.out.println("mem_tel_old: " + memVO_old.getMem_tel() );
    
    if (memVO_old.getMem_tel().equals(mem_tel)) {
      cnt = 0;
    } else {
      cnt = this.memProc.checkTel(mem_tel);
    }
    
    System.out.println("Ȯ�� ���:" + cnt);
    
    json.put("cnt", cnt);
    
    return json.toString();
  }
  
  

  
  /**
   * ��� ó��
   */
  
  // http://localhost:9090/resort/mem/create.do
  @ResponseBody
  @RequestMapping (value = "/mem/create.do", method = RequestMethod.POST,  produces="text/plain;charset=UTF-8")
  public String create (HttpServletRequest request, MemVO memVO) {
    
    System.out.println("���2");
    // System.out.println("fileMF: " + memVO.getMem_pic_nameMF());
    
    /*============�ءءءء����� ���� �ڵ� ���ۡءءءء�============*/ 
    String mem_pic_name_up = ""; // Main �̹���
    String mem_pic_th = ""; // Preview �̹���
    long mem_pic_size = 0;

    String upDir = Tool.getRealPath (request, "/mem/storage"); // ���� ���

    // ���� ���� ���� ��� X, fnamesMF (���� ���) ��ü ����. (�ڹٴ� ���� ��ü�� ���� ����, spring�� ����)
    MultipartFile  MF = memVO.getMem_pic_nameMF();
    String fname = MF.getOriginalFilename(); // ���� ���ϸ�
    

    System.out.println("fname: " + fname);
    
    mem_pic_size =  MF.getSize(); // ���� ũ��
    System.out.println("mem_pic_size: " + mem_pic_size);
    
    if (mem_pic_size > 0) { // ���� ���� ���� Ȯ��
      
      mem_pic_name_up = Upload.saveFileSpring (MF, upDir); // ���� ��ο� ���� ����
      System.out.println("mem_pic_name_up1: " + mem_pic_name_up);
      
      if (Tool.isImage (mem_pic_name_up)) { // �̹��� ���� Ȯ�� 
        // �� mem_pic_th �̹��� ���� (������ ���� ũ�� (width 80, height 80)�� �̹��� ���)
        mem_pic_th = Tool.preview (upDir, mem_pic_name_up, 80, 80); 
    }
    /*============�ءءءء����� ���� �ڵ� ����ءءءء�============*/ 
    
    }
    memVO.setMem_pic_th(mem_pic_th);
    memVO.setMem_pic_name_up(mem_pic_name_up);
    // System.out.println("mem_pic_name_up2: " + mem_pic_name_up);
    memVO.setMem_pic_size(mem_pic_size);
    
    
    int cnt = this.memProc.create(memVO);
    
    // ---------------------------------------------------------------------------------------
    // cnt, mem_no return 
    // ---------------------------------------------------------------------------------------
    // Spring <-----> memVO <-----> MyBATIS
    // Spring�� MyBATIS�� MemVO�� �����ϰ� ����.
    // MyBATIS�� insert�� PK �÷��� mem_no������ ���� ������ PK�� �Ҵ���.
    int mem_no = memVO.getMem_no();  // MyBATIS ���ϵ� PK
    System.out.println("mem_no: " + mem_no);
    // ---------------------------------------------------------------------------------------
    
    JSONObject json= new JSONObject();
    json.put("mem_no", mem_no);
    
    return json.toString();
    }
    
    

  
  
  /**
   * ���
   */
  
   //http://localhost:9090/resort/mem/list.do
//  @RequestMapping (value = "/mem/list.do", method = RequestMethod.GET )
//  public ModelAndView list ( ) {
//    ModelAndView mav = new ModelAndView();
//    
//    List<MemVO> list = this.memProc.list();
//    mav.addObject("list", list);
//    
//    mav.setViewName("/mem/list"); // webapp/mem/list.jsp
//    return mav;
//  }
  
  

  /**
   * ��� (���º�)
   */
  
  // http://localhost:9090/team3/mem/list_select.do?mem_sts=
  @RequestMapping (value = "/mem/list_select.do", method = RequestMethod.GET )
  public ModelAndView list_select (int mem_sts) {
    ModelAndView mav = new ModelAndView();
    
    List<MemVO> list = this.memProc.list_select(mem_sts);
    mav.addObject("list", list);
    
    mav.setViewName("/mem/list"); // webapp/mem/list.jsp
    return mav;
  }
  
  
  /**
   * �˻� + ����¡ ���� http://localhost:9090/team3/mem/list.do
   * http://localhost:9090/team3/mem/
?word=������&nowPage=1
   * 
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  
  @RequestMapping(value = "/mem/list_search_paging.do", method = RequestMethod.GET)
  public ModelAndView list_search_paging
      (@RequestParam(value = "word", defaultValue = "") String word,
      @RequestParam(value = "nowPage", defaultValue = "1") int nowPage) {
    
    System.out.println("Controller ����");
    System.out.println("--> nowPage1: " + nowPage);

    ModelAndView mav = new ModelAndView();

    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("word", word); // #{word}
    map.put("nowPage", nowPage); // MyBatis (DB �÷�)�� �ƴ�, paging�� ���� rownum�� ã�Ƴ��� ���� �ʿ��� ����

    System.out.println("--> nowPage2: " + nowPage);
    
    // �˻� ���
    List<MemVO> list = this.memProc.list_search_paging(map);
    mav.addObject("list", list);

    // �˻��� ���ڵ� ����
    int search_count = this.memProc.search_count(map);
    mav.addObject("search_count", search_count);

    
    
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
    
    String paging = memProc.pagingBox("list_search_paging.do", search_count, nowPage, word);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);

    // mav.setViewName("/contents/list_by_cateno_search_paging"); // /contents/list_by_cateno_search_paging.jsp
    // mav.setViewName("/contents/list_by_cateno_search_paging_img_table1"); // /contents/list_by_cateno_search_paging.jsp
    // mav.setViewName("/contents/list_by_cateno_search_paging_img_table2"); // /contents/list_by_cateno_search_paging.jsp
    
    mav.setViewName("/mem/list_search_paging"); // /contents/list_by_cateno_search_paging.jsp
    return mav;
  }
  
  
  
  /**
   * ȸ�� ��� (�����ڸ� ���� ����)
   * @param session
   * @return
   */
  @RequestMapping(value="/mem/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      List<MemVO> list = memProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/mem/list"); // /webapp/mem/list.jsp

    } else {
      mav.setViewName("redirect:/mem/login_need.jsp"); // /webapp/mem/login_need.jsp
    }
    
    return mav;
  }



   
  
  /**
   * ��ȸ
   */
  
  // http://localhost:9090/team3/mem/read.do?mem_no=
  @RequestMapping (value = "/mem/read.do", method = RequestMethod.GET )
  public ModelAndView read (int mem_no) {
    ModelAndView mav = new ModelAndView(); 
    
    MemVO memVO = this.memProc.read(mem_no);
    mav.addObject("memVO", memVO);
    
    mav.setViewName("/mem/read"); // webapp/mem/read.jsp
    return mav;
  }
  
  
  /**
   * ������
   */
  
  // http://localhost:9090/team3/mem/update.do?mem_no=
  @RequestMapping (value = "/mem/update.do", method = RequestMethod.GET )
  public ModelAndView update (int mem_no) {
    ModelAndView mav = new ModelAndView(); 
    
    MemVO memVO = this.memProc.read(mem_no);
    mav.addObject("memVO", memVO);
    
    mav.setViewName("/mem/update"); // webapp/mem/read.jsp
    return mav;
  }
  
  
  // ������ ���� ����(����)

   
  @ResponseBody 
  @RequestMapping(value="/mem/update_pic.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
  public String update_pic (int mem_no , HttpServletRequest request) {
    
    System.out.println("controller has been recieved mem_no: " + mem_no);
    
    MemVO memVO = this.memProc.read(mem_no);
    
    // ��ũ ����
    String upDir = Tool.getRealPath(request, "/mem/storage"); 
    Tool.deleteFile(upDir, memVO.getMem_pic_name_up()); 
    Tool.deleteFile(upDir, memVO.getMem_pic_th()); 

    // DB null�� �ο�
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("mem_pic_name_up", null);
    hashMap.put("mem_pic_th", null);
    hashMap.put("mem_pic_size", null);
    hashMap.put("mem_no", mem_no);
    int profpic_delete = this.memProc.update_pic(hashMap);
    
    JSONObject json= new JSONObject();
    json.put("profpic_delete", profpic_delete);
    json.put("mem_no", memVO.getMem_no());
    
    return json.toString();
  }
    
  
  
  /**
   * ���� ó�� (�α��ε� ȸ���� ����)
   */
  
  // http://localhost:9090/team3/mem/update.do
  @ResponseBody 
  @RequestMapping(value="/mem/update.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
  // public String update (MemVO memVO, int profpic_delete, HttpServletRequest request, HttpSession session) {
  public String update (MemVO memVO, HttpServletRequest request, HttpSession session) {
    
    System.out.println("����ó�� ����");
    
    JSONObject json= new JSONObject();
    
    if (memProc.isMember(session)) {
      
      String mem_pic_name_up = ""; // ���ε� �̹���
      String mem_pic_th = ""; // ����� 
      long mem_pic_size = 0; // ���ε� �̹��� ũ��
      
      MemVO memVO_old = this.memProc.read((int)session.getAttribute("mem_no")); // ȸ���� ��mem_no�� session���� ȣ�⢸
      // MemVO memVO_old = this.memProc.read(memVO.getMem_no()); // �����ڿ�
      HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
      String upDir = Tool.getRealPath (request, "/mem/storage"); // ���� ���
      

      MultipartFile MF = memVO.getMem_pic_nameMF(); // ���� ���� ���� ��� X, fnamesMF (���� ���) ��ü ����. (�ڹٴ� ���� ��ü�� ���� ����, spring�� ����)
      
      // �̹��� ���ε� ���� �Ǻ�, ���� ó��
      try {
        mem_pic_size =  MF.getSize(); // ���ε� O
      } catch (NullPointerException e) {
        mem_pic_size = 0; // ���ε� X
      }

      if (mem_pic_size > 0) {
        System.out.println("�� ������ ������ ���ε�");
      } else if (mem_pic_size == 0) {
        System.out.println("�� ������ ������ ���ε� X");
      } else {
        System.out.println("����?");
      }
      
       
      if (mem_pic_size > 0) { // ���ε� O
        
        mem_pic_name_up = Upload.saveFileSpring (MF, upDir); // ���� ��ο� ���� ����
        
        if (Tool.isImage (mem_pic_name_up)) { // �̹��� ���� Ȯ�� 
          // �� mem_pic_th �̹��� ���� (������ ���� ũ�� (width 80, height 80)�� �̹��� ���)
          mem_pic_th = Tool.preview (upDir, mem_pic_name_up, 100, 100); 

        }
      }
      
      if (memVO.getMem_pw_new().equals("")) { // ��й�ȣ�� ���� �Է����� �ʾ��� ��� (.equals�� ����ؾ���, '==null'�� �� �Ұ�)
        hashMap.put("mem_pw", memVO.getMem_pw());
      } else {
        hashMap.put("mem_pw", memVO.getMem_pw_new());
      }
      
      if (memVO.getMem_tel().equals(memVO_old.getMem_tel())) {
        hashMap.put("mem_tel", memVO_old.getMem_tel());
      } else {
        if (this.memProc.checkTel(memVO.getMem_tel()) == 0 ) {
          hashMap.put("mem_tel", memVO.getMem_tel());
        } else {
          
        }
      }

      hashMap.put("mem_zip", memVO.getMem_zip());
      hashMap.put("mem_addr1", memVO.getMem_addr1());
      hashMap.put("mem_addr2", memVO.getMem_addr2());
      hashMap.put("mem_no", memVO.getMem_no());
      
      if (mem_pic_size == 0) {
        hashMap.put("mem_pic_name_up", memVO_old.getMem_pic_name_up());
        hashMap.put("mem_pic_th", memVO_old.getMem_pic_th());
        hashMap.put("mem_pic_size", memVO_old.getMem_pic_size());
        System.out.println("���� ������ �̸�: " + memVO_old.getMem_pic_name_up());
        
      } else {
        hashMap.put("mem_pic_name_up", mem_pic_name_up);
        hashMap.put("mem_pic_th", mem_pic_th);
        hashMap.put("mem_pic_size", mem_pic_size);
      }
      
      int cnt = this.memProc.update(hashMap);

      json.put("cnt", cnt);
      json.put("mem_no", memVO.getMem_no());
      
      
    } else {
      
    }
    

    // json.put(key, value)

    
    return json.toString();
    
  }

  

  
  /**
   * �н����� ���� ��
   * @param mem_no
   * @return
   */
  @RequestMapping(value="/mem/update_pw.do", method=RequestMethod.GET)
  public ModelAndView update_pw(int mem_no){
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/mem/update_pw");
    
    return mav;
  }
  
  

  /**
   * �н����� Ȯ��
   * @param mem_pw
   * @param request
   * @return
   */
 @ResponseBody 
 @RequestMapping(value="/mem/check_pw.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
 public String check_pw (String mem_pw, int mem_no, HttpServletRequest request) {
   
   System.out.println("mem_no: " + mem_no);
   System.out.println("mem_pw: " + mem_pw);
   
   HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
   hashMap.put("mem_no", mem_no);
   hashMap.put("mem_pw", mem_pw);
   
   int cnt = this.memProc.check_pw(hashMap);
   
   JSONObject json= new JSONObject();
   json.put("cnt", cnt);
   
   return json.toString();
 }
  
  
  /**
   * �н����� ���� ó��
   * @param mem_no ȸ�� ��ȣ
   * @param current_passwd ���� �н�����
   * @param new_passwd ���ο� �н�����
   * @return
   */
  @RequestMapping(value="/mem/update_pw.do", method=RequestMethod.POST)
  public ModelAndView update_pw ( int mem_no, String current_passwd, String new_passwd ) {
    ModelAndView mav = new ModelAndView();
    
    // ���� �н����� �˻�
    // HashMap: Getter, Setter ���� �Ͻ������� Key:Value ��Ҹ� ������ �� ����
    HashMap<Object, Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("mem_no", mem_no);
    hashMap.put("mem_pw", current_passwd);
    
    int cnt = memProc.check_pw(hashMap); // ���� �н����� ��ġ ����
    int update_cnt = 0; // ����� �н����� ��
    
    if (cnt == 1 )  { // ���� �н����尡 ��ġ�ϴ� ���
      hashMap = new HashMap<Object, Object>();
      
      hashMap.put("mem_pw", new_passwd);
      update_cnt = memProc.update_pw(hashMap); // �н����� ����
      mav.addObject ("update_cnt", update_cnt); // ����� ���ڵ� ���� ����
    }
    
    mav.addObject ("cnt", cnt);
    // mav.addObject ("url", "passwd_update_msg");
    
    // mav.setViewName("redirect:/mem/msg.do"); // �޽��� ó���� redirect
    mav.setViewName("redirect:/mem/list.jsp"); // �޽��� ó���� redirect
    
    return mav;
  }
  
  

  
  

  
  /**
   * ���� ó��
   * @param request
   * @param mem_no
   * @return
   */
  
  // http://localhost:9090/team3/mem/delete.do
  @ResponseBody 
  @RequestMapping(value="/mem/delete.do", method=RequestMethod.POST)
  public String delete_proc(HttpServletRequest request, int mem_no) {
    
    JSONObject json= new JSONObject();

    
    // ������ ���� ����
    MemVO memVO = this.memProc.read(mem_no);
    
    // ��ũ���� ������ ���� ����
    String upDir = Tool.getRealPath(request, "/mem/storage"); 
    Tool.deleteFile(upDir, memVO.getMem_pic_name_up()); 
    Tool.deleteFile(upDir, memVO.getMem_pic_th()); 
    
    // DBMS���� ����
    this.mem_wishProc.delete_by_mem_no(mem_no); // mem_wish ����
    // this.mem_hisProc.delete_by_mem_no(mem_no); // mem_his ����
    int cnt = this.memProc.delete(mem_no);
    
    json.put("cnt", cnt);
    
    return json.toString();

  }
  

  /**
   * �α��� �� (��Ű O)
   * @return
   */
  // http://localhost:9090/ojt/mem/login.do 
  @RequestMapping(value = "/mem/login.do", method = RequestMethod.GET)
  public ModelAndView login(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;

    String ck_id = ""; // id ���� ����
    String ck_id_save = ""; // id ���� ���θ� üũ
    String ck_passwd = ""; // passwd ���� ����
    String ck_passwd_save = ""; // passwd ���� ���θ� üũ

    if (cookies != null) {
      for (int i=0; i < cookies.length; i++){
        
        cookie = cookies[i]; // ��Ű ��ü ����
        
        if (cookie.getName().equals("ck_id")){
          ck_id = cookie.getValue(); 
        }else if(cookie.getName().equals("ck_id_save")){
          ck_id_save = cookie.getValue();  // Y, N
        }else if (cookie.getName().equals("ck_passwd")){
          ck_passwd = cookie.getValue();         // 1234
        }else if(cookie.getName().equals("ck_passwd_save")){
          ck_passwd_save = cookie.getValue();  // Y, N
        }
        
      }
    }
    
    mav.addObject("ck_id", ck_id);
    mav.addObject("ck_id_save", ck_id_save);
    mav.addObject("ck_passwd", ck_passwd);
    mav.addObject("ck_passwd_save", ck_passwd_save);
    
    mav.setViewName("/mem/login_ck_form");
    return mav;
  }
  
  
  /**
   * �α��� ó��  (��Ű O)
   * @param request  Cookie �б⿡ �ʿ�
   * @param response  Cookie ��뿡 �ʿ�
   * @param session  �α��� ���� �޸𸮿� ���
   * @param id  ȸ�� id
   * @param passwd  ȸ�� password
   * @param id_save  ȸ�� id ��Ű ���� ����
   * @param passwd_save ȸ�� mem_pw ��Ű ���� ����
   * @return
   */
  // http://localhost:9090/team3/mem/login.do 
  @ResponseBody
  @RequestMapping(value = "/mem/login.do", method = RequestMethod.POST)
  public String login_proc(HttpServletRequest request, HttpServletResponse response, HttpSession session,
                                                 String mem_id, String mem_pw,
                                                 @RequestParam(value="id_save", defaultValue="") String id_save,
                                                 @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
    
    
    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("mem_id", mem_id);
    map.put("mem_pw", mem_pw);
    
    
    System.out.println("�� Controller: ");
    System.out.println("mem_id: " + mem_id);
    System.out.println("mem_pw: " + mem_pw);
    
    int count = this.memProc.login(map);    
        
    if (count == 1) { // �α��� ����
      System.out.println(mem_id + " �α��� ����");
      
      MemVO memVO = memProc.readById(mem_id);
      session.setAttribute("mem_no", memVO.getMem_no());
      session.setAttribute("mem_id", mem_id);
      session.setAttribute("mem_name", memVO.getMem_name());
      session.setAttribute("mem_no", memVO.getMem_no());
      
      // -------------------------------------------------------------------
      // mem_id ���� ��� ����
      // -------------------------------------------------------------------
      if (id_save.equals("Y")) { // id�� ������ ���
        Cookie ck_id = new Cookie("ck_id", mem_id);
        ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, �ʴ���
        response.addCookie(ck_id);
        
      } else { // N, mem_id�� �������� �ʴ� ���
        Cookie ck_id = new Cookie("ck_id", "");
        ck_id.setMaxAge(0);
        response.addCookie(ck_id);
      }
      
      // mem_id�� �������� �����ϴ�  CheckBox üũ ����
      Cookie ck_id_save = new Cookie("ck_id_save", id_save);
      ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_id_save);
      // -------------------------------------------------------------------

      
      // -------------------------------------------------------------------
      // Password ���� ��� ����
      // -------------------------------------------------------------------
      if (passwd_save.equals("Y")) { // �н����� ������ ���
        Cookie ck_passwd = new Cookie("ck_passwd", mem_pw);
        ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_passwd);
      } else { // N, �н����带 �������� ���� ���
        Cookie ck_passwd = new Cookie("ck_passwd", "");
        ck_passwd.setMaxAge(0);
        response.addCookie(ck_passwd);
      }
      // mem_pw�� �������� �����ϴ�  CheckBox üũ ����
      Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
      ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_passwd_save);
      // -------------------------------------------------------------------
      

    }
    JSONObject json = new JSONObject();
    json.put("count", count);
    json.put("mem_id", mem_id);
    return json.toString();
  }
  
  
  /**
   * �α׾ƿ� ó��
   * @param session
   * @return
   */
  @RequestMapping(value="/mem/logout.do", method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // ��� session ���� ����
    
    mav.setViewName("redirect:/mem/logout_msg.jsp");
    
    return mav;
  }
  
  
  
  /**
   * ���յ� ī�װ� �׷캰 ī�װ� ��� (session ȣ��)
   * http://localhost:9090/resort/cate/list_index_left.do
   * @param request
   * @return
   */
 @RequestMapping(value="/mem/list_index_left.do", method=RequestMethod.GET)
 public ModelAndView list_index_left(HttpServletRequest request, HttpSession session){
   
   ModelAndView mav = new ModelAndView();
   MemVO memVO = this.memProc.read((int)session.getAttribute("mem_no"));
   
   mav.addObject("mem_no", (int)session.getAttribute("mem_no"));
   mav.addObject("mem_pic_th", memVO.getMem_pic_th());
   mav.addObject("mem_nick", memVO.getMem_nick());
   mav.setViewName("/mem/list_index_left"); // webapp/cate/list_index_left.jsp

   return mav;
 } 

  
  
  


}
