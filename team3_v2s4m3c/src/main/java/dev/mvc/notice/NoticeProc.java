package dev.mvc.notice;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;


@Component("dev.mvc.notice.NoticeProc")
public class NoticeProc implements NoticeProcInter {
  @Autowired
  private NoticeDAOInter noticeDAO;

  @Override
  public int create(NoticeVO noticeVO) {
    int cnt = 0;
    cnt = this.noticeDAO.create(noticeVO);
    return cnt;
  }

  @Override
  public List<NoticeVO> list() {
    List<NoticeVO> list = this.noticeDAO.list();
    return list;
  }

  @Override
  public NoticeVO read(int noticeno) {
    NoticeVO noticeVO = this.noticeDAO.read(noticeno);
    return noticeVO;
  }

  @Override
  public NoticeVO update(int noticeno) {
    NoticeVO noticeVO = this.noticeDAO.read(noticeno);
    return noticeVO;
  }
  
  @Override
  public int update(NoticeVO noticeVO) {
    int cnt = 0;
    cnt = this.noticeDAO.update(noticeVO);
    return cnt;
  }

  @Override
  public int passwd_check(HashMap hashMap) {
    int passwd_cnt = 0;
    passwd_cnt = this.noticeDAO.passwd_check(hashMap);
    return passwd_cnt;
  }

  @Override
  public int delete(int noticeno) {
    int cnt = 0;
    cnt = this.noticeDAO.delete(noticeno);
    return cnt;
  }

  @Override
  public List<NoticeVO> list_by_search(HashMap<String, Object> hashMap) {
    List<NoticeVO> list = noticeDAO.list_by_search(hashMap);
    return list;
  }

  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = noticeDAO.search_count(hashMap);
    return count;
  }

  @Override
  public List<NoticeVO> list_by_search_paging(HashMap<String, Object> map) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Notices.RECORD_PER_PAGE;
   
    // ���� rownum
    // 1 ������ = 0 + 1, 2 ������ = 10 + 1, 3 ������ = 20 + 1 
    int startNum = beginOfPage + 1; 
    //  ���� rownum
    // 1 ������ = 0 + 10, 2 ������ = 0 + 20, 3 ������ = 0 + 30
    int endNum = beginOfPage + Notices.RECORD_PER_PAGE;   
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<NoticeVO> list = this.noticeDAO.list_by_search_paging(map);
    
    // --------------------------------------------------------------
    // ����, ���� ���ڼ� ����
    // --------------------------------------------------------------
    String title = "";
    String content = "";
    for (NoticeVO noticeVO: list) {
      title = noticeVO.getNotice_title();
      if (title.length() >= 14) {
        title = Tool.textLength(title, 14);
        noticeVO.setNotice_title(title);
      }
      content = noticeVO.getNotice_content();
      if (content.length() >= 100) {
        content = Tool.textLength(content, 100);
        noticeVO.setNotice_content(content);
      }
    }
    // --------------------------------------------------------------    
    
    return list;
  }

  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param categrpno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  @Override
  public String pagingBox(String listFile, int search_count, int nowPage, String word) {
    int totalPage = (int)(Math.ceil((double)search_count/Notices.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Notices.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Notices.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Notices.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Notices.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
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
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������ 10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������ 20
    int _nowPage = (nowGrp-1) * Notices.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+_nowPage +"'>����</A></span>"); 
    } 
 
    // �߾��� ������ ���
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // ������ �������� �Ѿ�ٸ� ���� ��� ����
        break; 
      } 
  
      if (nowPage == i){ // �������� ������������ ���ٸ� CSS ����(������ ��)
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� �������� �̵��� �����ϵ��� ��ũ�� ����
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���������� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���������� 21
    _nowPage = (nowGrp * Notices.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }

  @Override
  public int notice_cnt(int noticeno) {
    int cnt = 0;
    cnt = this.noticeDAO.notice_cnt(noticeno);
    return cnt;
  }


  
}
