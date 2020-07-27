package dev.mvc.inquire_attachfile;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.notice_attachfile.Notice_attachfileVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class Inquire_attachfileCont {
  @Autowired
  @Qualifier("dev.mvc.inquire_attachfile.Inquire_attachfileProc")
  private Inquire_attachfileProcInter inquire_attachfileProc;

  public Inquire_attachfileCont() {
    System.out.println("--> Inquire_attachfileCont created.");
  }

  //http://localhost:9090/team3/inquire_attachfile/create.do
   /**
    * ��� ��
    * @return
    */
   @RequestMapping(value = "/inquire_attachfile/create.do", method = RequestMethod.GET)
   public ModelAndView create(int inquireno) {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/inquire_attachfile/create"); // webapp/notice_attachfile/create.jsp
  
     return mav;
   }
  
   /**
    * ���� ���
    * @param request
    * @param notice_attachfileVO
    * @return
    */
   @RequestMapping(value = "/inquire_attachfile/create.do", method = RequestMethod.POST)
   public ModelAndView create(HttpServletRequest request, Inquire_attachfileVO inquire_attachfileVO) {
  
     ModelAndView mav = new ModelAndView();
     // -----------------------------------------------------
     // ���� ���� �ڵ� ����
     // -----------------------------------------------------
     int inquireno = inquire_attachfileVO.getInquireno(); // �θ�� ��ȣ    
     String fname = ""; // ���� ���ϸ�
     String fupname = ""; // ���ε�� ���ϸ�
     long fsize = 0; // ���� ������
     String thumb = ""; // Preview �̹���
     int upload_count = 0; // ����ó���� ���ڵ� ����
  
     String upDir = Tool.getRealPath(request, "/inquire_attachfile/storage");
     // ���� ������ ����� fnamesMF ��ü�� ������.
     List<MultipartFile> fnamesMF = inquire_attachfileVO.getFnamesMF();
     int count = fnamesMF.size(); // ���� ���� ����
     if (count > 0) {
       for (MultipartFile multipartFile:fnamesMF) { // ���� ����
         fsize = multipartFile.getSize(); // ���� ũ��
         if (fsize > 0) { // ���� ũ�� üũ
           fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�
           fupname = Upload.saveFileSpring(multipartFile, upDir); // ���� ����
  
           if (Tool.isImage(fname)) { // �̹������� �˻�
             thumb = Tool.preview(upDir, fupname, 120, 80); // thumb �̹��� ����
           }
         }
         Inquire_attachfileVO vo = new Inquire_attachfileVO();
         vo.setInquireno(inquireno);
         vo.setInquire_fname(fname);
         vo.setInquire_fupname(fupname);
         vo.setInquire_thumb(thumb);
         vo.setInquire_fsize(fsize);
  
         upload_count = upload_count + inquire_attachfileProc.create(vo); // ���� 1�� ��� ���� dbms ����
         System.out.println("-->upload_count: " + upload_count);
       }
     }
     // -----------------------------------------------------
     // ���� ���� �ڵ� ����
     // -----------------------------------------------------
  
     // ra.addAttribute("upload_count", upload_count);
     // ra.addAttribute("inquireno", inquire_attachfileVO.getInquireno());
  
     mav.addObject("upload_count", upload_count);
     mav.addObject("inquireno", inquire_attachfileVO.getInquireno());
  
     // mav.setViewName("/inquire_attachfile/create_msg"); // /notice_attachfile/create_msg.jsp
     mav.setViewName("redirect:/inquire_attachfile/create_msg.jsp");
     return mav;
   }
   
   /**
    * ���
    * // http://localhost:9090/team3/inquire_attachfile/list.do
    * @return
    */
   @RequestMapping(value = "/inquire_attachfile/list.do", method = RequestMethod.GET)
   public ModelAndView list() {
     ModelAndView mav = new ModelAndView();

     List<Inquire_attachfileVO> list = inquire_attachfileProc.list();
     mav.addObject("list", list);

     mav.setViewName("/inquire_attachfile/list");

     return mav;
   }
   
   /**
    * ÷�� ���� 1�� ���� ó��
    * @return
    */
   @RequestMapping(value = "/inquire_attachfile/delete.do", 
                              method = RequestMethod.GET)
   public ModelAndView delete_proc(HttpServletRequest request,
                                                 int inquire_attachfileno) {
     ModelAndView mav = new ModelAndView();

     // ������ ���� ������ �о��.
     Inquire_attachfileVO inquire_attachfileVO = inquire_attachfileProc.read(inquire_attachfileno);
     
     String upDir = Tool.getRealPath(request, "/inquire_attachfile/storage"); // ���� ���
     Tool.deleteFile(upDir, inquire_attachfileVO.getInquire_fname()); // Folder���� 1���� ���� ����
     Tool.deleteFile(upDir, inquire_attachfileVO.getInquire_thumb()); // 1���� Thumb ���� ����
     
     // DBMS���� 1���� ���� ����
     inquire_attachfileProc.delete(inquire_attachfileno);
         
     List<Inquire_attachfileVO> list = inquire_attachfileProc.list();
     mav.addObject("list", list);
     
     mav.setViewName("redirect:/inquire_attachfile/list.do"); 

     return mav;
   }
   
  
}
