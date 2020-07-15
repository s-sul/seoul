package dev.mvc.at;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.at.At_Proc")
public class At_Proc implements At_ProcInter {

  @Autowired
  private At_DAOInter at_DAO;

  @Override
  public List<At_Img> at_img_list(HashMap map) {

    /*
     * ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ���� 1 ������: nowPage = 1, (1 - 1) * 10
     * --> 0 2 ������: nowPage = 2, (2 - 1) * 10 --> 10 3 ������: nowPage = 3, (3 - 1) *
     * 10 --> 20
     */
    int beginOfPage = ((Integer) map.get("nowPage") - 1) * At_Page.RECORD_PER_PAGE;

    // ���� rownum, 1 ������: 1, 2 ������: 11, 3 ������: 21
    int startNum = beginOfPage + 1;
    // ���� rownum, 1 ������: 10, 2 ������: 20, 3 ������: 30
    int endNum = beginOfPage + At_Page.RECORD_PER_PAGE;
    /*
     * 1 ������: WHERE r >= 1 AND r <= 10 2 ������: WHERE r >= 11 AND r <= 20 3 ������: WHERE
     * r >= 21 AND r <= 30
     */
    map.put("startNum", startNum);
    map.put("endNum", endNum);

    List<At_Img> list = at_DAO.at_img_list(map);
    return list;
  }
  

  @Override
  public int search_count(HashMap hashmap) {
    int count = at_DAO.search_count(hashmap);
    return count;
  }

  @Override
  public int total_count() {
    int count = at_DAO.total_count();
    return count;
  }

  @Override
  public String pagingBox(String listFile, int at_grp_no, int search_count, int nowPage, String at_name, String dates_date) {
    int totalPage = (int) (Math.ceil((double) search_count / At_Page.RECORD_PER_PAGE)); // ��ü ������
    int totalGrp = (int) (Math.ceil((double) totalPage / At_Page.PAGE_PER_BLOCK));// ��ü �׷�
    int nowGrp = (int) (Math.ceil((double) nowPage / At_Page.PAGE_PER_BLOCK)); // ���� �׷�
    int startPage = ((nowGrp - 1) * At_Page.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����
    int endPage = (nowGrp * At_Page.PAGE_PER_BLOCK); // Ư�� �׷��� ������ ��� ����

    StringBuffer str = new StringBuffer();

    str.append("<style type='text/css'>");
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); // #�±׸�
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}");
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
    str.append("  .span_box_1{"); // .class��
    str.append("    text-align: center;");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/");
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/");
    str.append("  }");
    str.append("  .span_box_2{");
    str.append("    text-align: center;");
    str.append("    background-color: #668db4;");
    str.append("    color: #FFFFFF;");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/");
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/");
    str.append("  }");
    str.append("</style>");
    str.append("<DIV id='paging'>");
    // str.append("���� ������: " + nowPage + " / " + totalPage + " ");

    // ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page)
    // nowGrp: 2 (11 ~ 20 page)
    // nowGrp: 3 (21 ~ 30 page)
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������: 10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������: 20
    // ���� 15p����.. ����10���� �̵� �� ��� -> 10�׷� �������� �Ͽ� �̵�
    int _nowPage = (nowGrp - 1) * At_Page.PAGE_PER_BLOCK;
    if (nowGrp >= 2) {
      str.append("<span class='span_box_1'><A href='" + listFile + "?&at_name=" + at_name + "&nowPage=" + _nowPage + "&dates_date=" + dates_date
          + "&at_grp_no=" + at_grp_no + "'>����</A></span>");
    }

    // �߾��� ������ ���(�� �������� �κ�)
    for (int i = startPage; i <= endPage; i++) {
      if (i > totalPage) { // ������ ������ �Ѿ ���, ������ ����� �����Ŵ ��totatlPage>=1
        break;
      }

      if (nowPage == i) { // �������� ������������ ���� ����� css
        str.append("<span class='span_box_2'>" + i + "</span>"); // ���� ������, ����
      } else {
        // ���� �������� �ƴ� �������δ� �ٷ� �̵� �����ϵ��� ��ũ�� ���� �� ��
        str.append("<span class='span_box_1'><A href='" + listFile + "?at_name=" + at_name + "&nowPage=" + "&dates_date=" + dates_date + i
            + "&at_grp_no=" + at_grp_no + "'>" + i + "</A></span>");
      }
    }

    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page), nowGrp: 2 (11 ~ 20 page), nowGrp: 3 (21 ~ 30 page)
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���� ������ :11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���� ������ : 21
    _nowPage = (nowGrp * At_Page.PAGE_PER_BLOCK) + 1;
    if (nowGrp < totalGrp) {
      str.append("<span class='span_box_1'><A href='" + listFile + "?&at_name=" + at_name + "&nowPage=" + _nowPage + "&dates_date=" + dates_date
          + "&at_grp_no=" + at_grp_no + "'>����</A></span>");
    }
    str.append("</DIV>");

    return str.toString();
  }

  @Override
  public At_VO read(int at_no) {
    At_VO at_VO = this.at_DAO.read(at_no);
    return at_VO;
  }

  @Override
  public int create(At_Dates_Img at_Dates_Img) {
    int cnt = this.at_DAO.create(at_Dates_Img);
    return cnt;
  }

  @Override
  public int delete(int at_no) {
    int cnt = this.at_DAO.delete(at_no);
    return cnt;
  }

  @Override
  public int update(At_Dates_Img at_Dates_Img) {
    int cnt = this.at_DAO.update(at_Dates_Img);
    return cnt;
  }

}
