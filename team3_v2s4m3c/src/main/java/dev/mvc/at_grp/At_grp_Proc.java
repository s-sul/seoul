package dev.mvc.at_grp;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.at_grp.At_grp_Proc")
public class At_grp_Proc implements At_grp_ProcInter {

  @Autowired
  private At_grp_DAOInter at_grp_DAO;

  @Override
  public int create(At_grp_VO at_grp_VO) {
    int cnt = this.at_grp_DAO.create(at_grp_VO);
    return cnt;
  }
  

  @Override
  public int count() {
   int count = this.at_grp_DAO.count();
    return count;
  }

  

  @Override
  public List<At_grp_VO> list_by_at_grp_paging(HashMap<String, Object> map) {
    
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * At_grp.RECORD_PER_PAGE;
   
    // ���� rownum, 1 ������: 1, 2 ������: 11, 3 ������: 21 
    int startNum = beginOfPage + 1; 
    //  ���� rownum, 1 ������: 10, 2 ������: 20, 3 ������: 30
    int endNum = beginOfPage + At_grp.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<At_grp_VO> list = this.at_grp_DAO.list_by_at_grp_paging(map);   
    return list;
  
  }
  
  

  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param categrpno ī�װ���ȣ 
   * @param count  ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  @Override
  public String pagingBox(String listFile, int count,int nowPage){ 
    
    int totalPage = (int)(Math.ceil((double)count/At_grp.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/At_grp.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/At_grp.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * At_grp.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * At_grp.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
    
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); //#�±׸�
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); //.class��
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
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    // ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page)
    // nowGrp: 2 (11 ~ 20 page) 
    // nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������: 10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������: 20
    // ���� 15p����.. ����10���� �̵� �� ��� -> 10�׷� �������� �Ͽ� �̵�
    int _nowPage = (nowGrp-1) * At_grp.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      
      str.append("<span class='span_box_1'><A href='"+listFile+"&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    
    //�߾��� ������ ���(�� �������� �κ�)
    System.out.println("startPage" + startPage + "endPage" + endPage + "nowPage" + nowPage);
    for(int i=startPage; i<=endPage; i++){ 
      System.out.println("����Ȯ��----->" + startPage+"//" + endPage);
      if (i > totalPage){ //������ ������ �Ѿ ���, ������ ����� �����Ŵ ��totatlPage>=1
        break; 
      } 
  
      if (nowPage == i){ //�������� ������������ ���� ����� css
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� �������δ� �ٷ� �̵� �����ϵ��� ��ũ�� ���� �� ��
        str.append("<span class='span_box_1'><A href='"+listFile+"&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷���  ���� ������ :11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷���  ���� ������ : 21
    _nowPage = (nowGrp * At_grp.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
  
  
  @Override
  public List<At_grp_VO> list_seq_asc() {
    List<At_grp_VO> list_seq_asc = this.at_grp_DAO.list_seq_asc();
    return list_seq_asc;
  }

  @Override
  public int update_seqno_up(int at_grp_no) {
    int cnt = this.at_grp_DAO.update_seqno_up(at_grp_no);
    return cnt;
  }

  @Override
  public int update_seqno_down(int at_grp_no) {
    int cnt = this.at_grp_DAO.update_seqno_down(at_grp_no);
    return cnt;
  }

  @Override
  public At_grp_VO read(int at_grp_no) {
    At_grp_VO at_grp_VO = this.at_grp_DAO.read(at_grp_no);
    return at_grp_VO;
  }

  @Override
  public int update(At_grp_VO at_grp_VO) {
    int cnt = this.at_grp_DAO.update(at_grp_VO);
    return cnt;
  }

  @Override
  public int delete(int at_grp_no) {
    int cnt = this.at_grp_DAO.delete(at_grp_no);
    return cnt;
  }

  @Override
  public int update_visible(At_grp_VO at_grp_VO) {

    if (at_grp_VO.getAt_grp_visible().toUpperCase().equals("Y")) {
      at_grp_VO.setAt_grp_visible("N");
    } else {
      at_grp_VO.setAt_grp_visible("Y");
    }
    
    int cnt = this.at_grp_DAO.update_visible(at_grp_VO);
    return cnt;
  }


  @Override
  public List<At_grp_Cnt> at_grp_index() {
   List<At_grp_Cnt> at_grp_index =this.at_grp_DAO.at_grp_index();
    return at_grp_index;
  }


}
