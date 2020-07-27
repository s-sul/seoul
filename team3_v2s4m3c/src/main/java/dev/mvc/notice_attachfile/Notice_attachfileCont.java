package dev.mvc.notice_attachfile;

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

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class Notice_attachfileCont {
  @Autowired
  @Qualifier("dev.mvc.notice_attachfile.Notice_attachfileProc")
  private Notice_attachfileProcInter notice_attachfileProc;

  public Notice_attachfileCont() {
    System.out.println("--> Notice_attachfileCont created.");
  }

  // http://localhost:9090/team3/notice_attachfile/create.do
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value = "/notice_attachfile/create.do", method = RequestMethod.GET)
  public ModelAndView create(int noticeno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/notice_attachfile/create"); // webapp/notice_attachfile/create.jsp

    return mav;
  }

  /**
   * ���� ���
   * @param request
   * @param notice_attachfileVO
   * @return
   */
  @RequestMapping(value = "/notice_attachfile/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, Notice_attachfileVO notice_attachfileVO) {

    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    int noticeno = notice_attachfileVO.getNoticeno(); // �θ�� ��ȣ    
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0; // ���� ������
    String thumb = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����

    String upDir = Tool.getRealPath(request, "/notice_attachfile/storage");
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = notice_attachfileVO.getFnamesMF();
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
        Notice_attachfileVO vo = new Notice_attachfileVO();
        vo.setNoticeno(noticeno);
        vo.setNotice_fname(fname);
        vo.setNotice_fupname(fupname);
        vo.setNotice_thumb(thumb);
        vo.setNotice_fsize(fsize);

        upload_count = upload_count + notice_attachfileProc.create(vo); // ���� 1�� ��� ���� dbms ����
        System.out.println("-->upload_count: " + upload_count);
      }
    }
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------

    // ra.addAttribute("upload_count", upload_count);
    // ra.addAttribute("noticeno", notice_attachfileVO.getNoticeno());

    mav.addObject("upload_count", upload_count);
    mav.addObject("noticeno", notice_attachfileVO.getNoticeno());

    // mav.setViewName("/notice_attachfile/create_msg"); // /notice_attachfile/create_msg.jsp
    mav.setViewName("redirect:/notice_attachfile/create_msg.jsp");
    return mav;
  }
  
  /**
   * ���
   * // http://localhost:9090/team3/notice_attachfile/list.do
   * @return
   */
  @RequestMapping(value = "/notice_attachfile/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<Notice_attachfileVO> list = notice_attachfileProc.list();
    mav.addObject("list", list);

    mav.setViewName("/notice_attachfile/list");

    return mav;
  }
  
  /**
   * ÷�� ���� 1�� ���� ó��
   * @return
   */
  @RequestMapping(value = "/notice_attachfile/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete_proc(HttpServletRequest request,
                                                int notice_attachfileno) {
    ModelAndView mav = new ModelAndView();

    // ������ ���� ������ �о��.
    Notice_attachfileVO notice_attachfileVO = notice_attachfileProc.read(notice_attachfileno);
    
    String upDir = Tool.getRealPath(request, "/notice_attachfile/storage"); // ���� ���
    Tool.deleteFile(upDir, notice_attachfileVO.getNotice_fname()); // Folder���� 1���� ���� ����
    Tool.deleteFile(upDir, notice_attachfileVO.getNotice_thumb()); // 1���� Thumb ���� ����
    
    // DBMS���� 1���� ���� ����
    notice_attachfileProc.delete(notice_attachfileno);
        
    List<Notice_attachfileVO> list = notice_attachfileProc.list();
    mav.addObject("list", list);
    
    mav.setViewName("redirect:/notice_attachfile/list.do"); 

    return mav;
  }
  
}
