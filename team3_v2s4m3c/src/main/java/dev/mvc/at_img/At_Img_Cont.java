package dev.mvc.at_img;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.at.At_Dates_Img;
import dev.mvc.at.At_ProcInter;
import dev.mvc.at.At_VO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class At_Img_Cont {
  
  @Autowired
  @Qualifier("dev.mvc.at.At_Proc")
  private At_ProcInter at_Proc;

  @Autowired
  @Qualifier("dev.mvc.at_img.At_Img_Proc")
  private At_Img_ProcInter at_Img_Proc;

  
  /**
   * ÷������ ���� ��
   * 
   * @return
   */
  @RequestMapping(value = "/at_img/modify.do", method = RequestMethod.GET)
  public ModelAndView create(int at_no) {
    ModelAndView mav = new ModelAndView();
    At_VO at_VO = this.at_Proc.read(at_no);
    mav.addObject("at_VO", at_VO);
    mav.setViewName("/at_img/modify");
    return mav;
  }


  /**
   * ÷������ ����
   * 
   */


  @ResponseBody
  @RequestMapping(value = "/at_img/modify.do", method = RequestMethod.POST)
  public String create (HttpServletRequest request, At_Dates_Img at_Dates_Img) {
    
    int cnt =0; //���� Ȯ��
  
    // ���ϵ��
    String at_img_fname = ""; // ���� ���ϸ�
    String at_img_fupname = ""; // ���ε�� ���ϸ�
    String at_img_thumb = "";
    long at_img_size = 0;
    String upDir = Tool.getRealPath(request, "/at/storage");// ���� ���
    
    List<MultipartFile> fnamesMF = at_Dates_Img.getFnamesMF();

    System.out.println(upDir); 

    int count = fnamesMF.size();// ���� ���� ����
    System.out.println("���ϰ���:" + count);
    if (count > 0) {// �������� �ִ���
      for (MultipartFile multipartFile : fnamesMF) { // ���� ����
        at_img_size = multipartFile.getSize(); // ���� ũ��
        if (at_img_size > 0) { // ���� ũ�� üũ(���� ���� Ȯ��)
          at_img_fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�
          System.out.println("���� ���ϸ�: " + at_img_fname);
          at_img_fupname = Upload.saveFileSpring(multipartFile, upDir); // ���� ���� �� ���ε� �� ���ϸ� ����
          System.out.println("���ε� ���ϸ�: " + at_img_fupname);
          if (Tool.isImage(at_img_fname)) { // �̹������� �˻�
            at_img_thumb = Tool.preview(upDir, at_img_fupname, 120, 80); // thumb �̹��� ���� �� ���ϸ� ���� ��(width height ��)
            System.out.println("����� ���ϸ�: " + at_img_thumb);
          }
        }
        at_Dates_Img.setAt_img_fname(at_img_fname);
        at_Dates_Img.setAt_img_fupname(at_img_fupname);
        at_Dates_Img.setAt_img_thumb(at_img_thumb);
        at_Dates_Img.setAt_img_size(at_img_size);

       cnt= this.at_Img_Proc.modify(at_Dates_Img);
      }
    }
    // System.out.println("cnt: " + cnt);
    // mav.addObject("cnt", cnt);

    // ���ϵ��

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();

  }

  /**
   * ÷������ ����
   */
  
  
  @ResponseBody
  @RequestMapping(value = "/at_img/delete.do", method = RequestMethod.POST)
  public String delete(int at_no) {
    
    int cnt = this.at_Img_Proc.delete(at_no);
  
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();
  }

  
 
  

}
