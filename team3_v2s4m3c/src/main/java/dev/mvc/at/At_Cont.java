package dev.mvc.at;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.at_grp.At_grp_ProcInter;
import dev.mvc.at_grp.At_grp_VO;

import dev.mvc.at.At_Dates_Img;
import dev.mvc.at_img.At_Img_ProcInter;

import dev.mvc.dates.Dates_Cnt;
import dev.mvc.dates.Dates_ProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class At_Cont {

  @Autowired
  @Qualifier("dev.mvc.at.At_Proc")
  private At_ProcInter at_Proc;

  @Autowired
  @Qualifier("dev.mvc.at_grp.At_grp_Proc")
  private At_grp_ProcInter at_grp_Proc;

  @Autowired
  @Qualifier("dev.mvc.dates.Dates_Proc")
  private Dates_ProcInter dates_Proc;

  @Autowired
  @Qualifier("dev.mvc.at_img.At_Img_Proc")
  private At_Img_ProcInter at_Img_Proc;

  /**
   * ��� + �˻� + ����¡ ���� http://localhost:9090/resort/contents/list.do
   * http://localhost:9090/resort/contents/list.do?cateno=17&word=������&nowPage=1
   * 
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/at/list.do", method = RequestMethod.GET)
  public ModelAndView at_img_list(@RequestParam(value = "at_grp_no", defaultValue = "1") int at_grp_no,
      @RequestParam(value = "at_name", defaultValue = "") String at_name,
      @RequestParam(value = "nowPage", defaultValue = "1") int nowPage) {

    ModelAndView mav = new ModelAndView();
    // /contents/list_by_cateno_search_paging.jsp

    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> map = new HashMap<String, Object>(); // proc���� ���� map ����(startnum, endnum+ ���� 3��)
    map.put("at_grp_no", at_grp_no);
    map.put("at_name", at_name);
    map.put("nowPage", nowPage);
    // map.put("dates_date", dates_date);

    // �˻� ���
    List<At_Img> at_img_list = at_Proc.at_img_list(map);
    mav.addObject("at_img_list", at_img_list);

    // �˻��� ���ڵ� ����
    int search_count = at_Proc.search_count(map);
    mav.addObject("search_count", search_count);

    At_grp_VO at_grp_VO = this.at_grp_Proc.read(at_grp_no);
    List<At_grp_VO> list = at_grp_Proc.list_by_at_grp_paging(map);
    mav.addObject("list", list);
    mav.addObject("at_grp_VO", at_grp_VO);

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

    String paging = at_Proc.pagingBox("list.do", at_grp_no, search_count, nowPage, at_name);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);

    mav.setViewName("/at/list");
    return mav;
  }

  /// ** ����Ʈ ����Ʈ
  // * @param at_grp_no
  // * @param at_name
  // * @param nowPage
  // * @return
  // */
  // @RequestMapping(value = "/at/list_main.do", method = RequestMethod.POST)
  // public ModelAndView list_main(
  // @RequestParam(value = "at_grp_no", defaultValue = "1") int at_grp_no,
  // @RequestParam(value = "at_name", defaultValue = "") String at_name,
  // @RequestParam(value = "nowPage", defaultValue = "1") int nowPage) {
  //
  // ModelAndView mav = new ModelAndView();
  // // /contents/list_by_cateno_search_paging.jsp
  //
  // // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
  // HashMap<String, Object> map = new HashMap<String, Object>(); // proc���� ���� map
  /// ����(startnum, endnum+ ���� 3��)
  // map.put("at_grp_no", at_grp_no);
  // map.put("at_name", at_name);
  // map.put("nowPage", nowPage);
  //
  // // �˻� ���
  // List<At_Img> at_img_list = at_Proc.at_img_list(map);
  // mav.addObject("at_img_list", at_img_list);
  //
  // // �˻��� ���ڵ� ����
  // int search_count = at_Proc.search_count(map);
  // mav.addObject("search_count", search_count);
  //
  // At_grp_VO at_grp_VO = this.at_grp_Proc.read(at_grp_no);
  // List<At_grp_VO> list = at_grp_Proc.list_by_at_grp_paging(map);
  // mav.addObject("list", list);
  // mav.addObject("at_grp_VO", at_grp_VO);
  //
  // /*
  // * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� ���� ������: 11 / 22 [����] 11 12 13 14 15 16 17
  // * 18 19 20 [����]
  // *
  // * @param listFile ��� ���ϸ�
  // *
  // * @param cateno ī�װ���ȣ
  // *
  // * @param search_count �˻�(��ü) ���ڵ��
  // *
  // * @param nowPage ���� ������
  // *
  // * @param word �˻���
  // *
  // * @return ����¡ ���� ���ڿ�
  // */
  //
  // String paging = at_Proc.pagingBox("list.do", at_grp_no, search_count,
  /// nowPage, at_name);
  // mav.addObject("paging", paging);
  // mav.addObject("nowPage", nowPage);
  //
  // mav.setViewName("/at/list");
  // return mav;
  // }
  //

  /**
   * ��ȸ
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/at/read.do", method = RequestMethod.GET)
  public ModelAndView read(int at_no) {
    ModelAndView mav = new ModelAndView();

    At_VO at_VO = this.at_Proc.read(at_no);
    mav.addObject("at_VO", at_VO);

    List<Dates_Cnt> list = this.dates_Proc.total_dates_cnt(at_no);
    List<At_Dates_Img> list_img = this.at_Img_Proc.read(at_no);

    // System.out.println(list.size());
    mav.addObject("list", list);
    mav.addObject("list_img", list_img);
    mav.setViewName("/at/read");

    return mav;
  }

  /**
   * ����
   * 
   */
  @ResponseBody
  @RequestMapping(value = "/at/book.do", method = RequestMethod.POST)
  public String book(int at_no, int book, String dates_date) {

    HashMap<Object, Object> map = new HashMap<Object, Object>(); // proc���� ���� map ����(startnum, endnum+ ���� 3��)
    map.put("at_no", at_no);
    map.put("dates_date", dates_date);

    int now_stock = this.dates_Proc.specific_dates_cnt(map);

    int no_book = 0; // ����Ұ� Ȯ�� ����
    int cnt = 0; // ���� Ȯ�� ����

    if (now_stock == 0 || now_stock < book) { // ����Ұ����� ���
      no_book = no_book + 1;

    } else { // ���� ������ ���
      for (int i = 1; i <= book; i++) {
        cnt = this.dates_Proc.delete(map); // ��� ����
      }
    }

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    json.put("no_book", no_book);
    return json.toString();
  }

  /**
   * ��� ��
   * 
   * @return
   */
  @RequestMapping(value = "/at/create.do", method = RequestMethod.GET)
  public ModelAndView create(int at_grp_no) {
    ModelAndView mav = new ModelAndView();

    At_grp_VO at_grp_VO = this.at_grp_Proc.read(at_grp_no);
    mav.addObject("at_grp_VO", at_grp_VO);
    mav.setViewName("/at/create");
    return mav;
  }

  /**
   * ���ó�� (at, dates)
   * 
   * @param at_dates
   * @param stock
   * @return
   */

  @ResponseBody
  @RequestMapping(value = "/at/create.do", method = RequestMethod.POST)
  public String create(At_Dates_Img at_Dates_Img, int stock, HttpServletRequest request) {

    this.at_Proc.create(at_Dates_Img);

    int cnt = 0;
    for (int i = 1; i <= stock; i++) {
      cnt = cnt + this.dates_Proc.create(at_Dates_Img);
    }

    // ���ϵ��
    String at_img_fname = ""; // ���� ���ϸ�
    String at_img_fupname = ""; // ���ε�� ���ϸ�
    String at_img_thumb = "";
    long at_img_size = 0;
    String upDir = Tool.getRealPath(request, "/at/storage");// ���� ���
    List<MultipartFile> fnamesMF = at_Dates_Img.getFnamesMF(); // �� ���� ������ ������� <input type="file">�� ������ŭ ����

    long count = fnamesMF.stream().filter(t -> t.getSize() > 0).count();
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

          at_Dates_Img.setAt_img_fname(at_img_fname);
          at_Dates_Img.setAt_img_fupname(at_img_fupname);
          at_Dates_Img.setAt_img_thumb(at_img_thumb);
          at_Dates_Img.setAt_img_size(at_img_size);

          this.at_Img_Proc.create(at_Dates_Img);
        }

      }
    }

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();

  }

  /**
   * ����ó��
   * 
   * @param
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/at/delete.do", method = RequestMethod.POST)
  public String delete(HttpServletRequest request, int at_no) {

    // ���� ����
    List<At_Dates_Img> list_img = this.at_Img_Proc.read(at_no);
    if (!list_img.isEmpty()) {

      while (list_img.size() == 0) {
        At_Dates_Img at_Dates_Img = this.at_Img_Proc.read_row(at_no);
        String upDir = Tool.getRealPath(request, "/at/storage");
        Tool.deleteFile(upDir, at_Dates_Img.getAt_img_fupname());
        Tool.deleteFile(upDir, at_Dates_Img.getAt_img_thumb());
      }
    }

    this.at_Img_Proc.delete(at_no); // ���ϻ���
    int cnt = this.at_Proc.delete(at_no); // ��ǰ����
    // System.out.println(cnt);
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    return json.toString();

  }

  /**
   * ������
   * 
   * @param at_grp_no
   *          ��� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value = "/at/update.do", method = RequestMethod.GET)
  public ModelAndView update(int at_no) {
    ModelAndView mav = new ModelAndView();

    At_VO at_VO = this.at_Proc.read(at_no);
    List<Dates_Cnt> list = this.dates_Proc.total_dates_cnt(at_no);
    Dates_Cnt dates_Cnt = this.dates_Proc.total_dates_cnt_for_update(at_no);
    mav.addObject("at_VO", at_VO);
    mav.addObject("list", list);
    mav.addObject("dates_Cnt", dates_Cnt);
    mav.setViewName("/at/update");

    return mav;
  }

  /**
   * ����ó��
   * 
   * @param
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/at/update.do", method = RequestMethod.POST)
  public String update(At_Dates_Img at_Dates_Img, int stock, HttpServletRequest request) {

    HashMap<Object, Object> map = new HashMap<Object, Object>(); // proc���� ���� map ����(startnum, endnum+ ���� 3��)
    map.put("at_no", at_Dates_Img.getAt_no());
    map.put("dates_date", at_Dates_Img.getDates_date());

    // �� ��� Ȯ��
    int now_stock = this.dates_Proc.specific_dates_cnt(map);

    if (now_stock == 0) { // �� ��� 0�� ���

      // ���ο� ��¥ ��� �ű� ��� --> �ű� ��ǰ����� �Ǵ°� �ƴ϶�, ���� ��ǰ ���̺��� �״��, at_no=1�� ���� dates_date
      // �Է� ������ŭ row ��ŭ ����

      for (int i = 1; i <= stock; i++) {
        this.dates_Proc.add(at_Dates_Img);
      }

    } else {

      int cha = stock - now_stock;

      // ���(dates���̺�)�� �߰�, ����
      if (cha > 0) {

        for (int i = 1; i <= cha; i++) {
          this.dates_Proc.add(at_Dates_Img); // ��� �߰�
        }
      } else if (cha < 0) {
        cha = -cha;

        for (int i = 1; i <= cha; i++) {
          this.dates_Proc.delete(map); // ��� ����
        }
      }
    }
    // ��ǰ �� ����

    int cnt = this.at_Proc.update(at_Dates_Img);

    // �̹��� ���� �� ���ε��

    // ���� ����
    this.at_Img_Proc.delete(at_Dates_Img.getAt_no());
    // ���ϵ��
    String at_img_fname = ""; // ���� ���ϸ�
    String at_img_fupname = ""; // ���ε�� ���ϸ�
    String at_img_thumb = "";
    long at_img_size = 0;
    String upDir = Tool.getRealPath(request, "/at/storage");// ���� ���
    List<MultipartFile> fnamesMF = at_Dates_Img.getFnamesMF(); // �� ���� ������ ������� <input type="file">�� ������ŭ ����

    long count = fnamesMF.stream().filter(t -> t.getSize() > 0).count();
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

          at_Dates_Img.setAt_img_fname(at_img_fname);
          at_Dates_Img.setAt_img_fupname(at_img_fupname);
          at_Dates_Img.setAt_img_thumb(at_img_thumb);
          at_Dates_Img.setAt_img_size(at_img_size);

        }

      }
      this.at_Img_Proc.modify(at_Dates_Img); // �̹��� �߰�
    }

    JSONObject json = new JSONObject();

    json.put("cnt", cnt);
    return json.toString();
  }

}
