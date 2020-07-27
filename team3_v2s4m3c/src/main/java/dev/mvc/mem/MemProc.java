package dev.mvc.mem;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.mem.MemProc")
public class MemProc implements MemProcInter{
  
  @Autowired
  private MemDAOInter memDAO;

  @Override
  // ���̵� �ߺ� üũ
  public int checkID(String mem_id) {
    int cnt = this.memDAO.checkID(mem_id);
    return cnt;
  }
  
  @Override
  // �г��� �ߺ� üũ
  public int checkNick(String mem_nick) {
    int cnt = this.memDAO.checkNick(mem_nick);
    return cnt;
  }
  
  @Override
  // �ڵ��� ��ȣ �ߺ� üũ
  public int checkTel(String mem_tel) {
    int cnt = this.memDAO.checkTel(mem_tel);
    return cnt;
  }

  @Override
  // ���
  public int create(MemVO memVO) {
    int cnt = this.memDAO.create(memVO);
    return cnt;
  }
  
  @Override
  // ������ ���� ��� (����)
  public int update_pic(HashMap<Object, Object> hashMap) {
    int cnt = this.memDAO.update_pic(hashMap);
    return cnt;
  }

  @Override
  // ���
  public List<MemVO> list() {
    List<MemVO> list = this.memDAO.list();
    return list;
  }

  
  @Override
  // ��� (���º�)
  public List<MemVO> list_select(int mem_sts) {
    List<MemVO> list = this.memDAO.list_select(mem_sts);
    return list;
  }

  
  @Override
  // ��ȸ
  public MemVO read(int mem_no) {
    MemVO memVO = this.memDAO.read(mem_no);
    return memVO;
  }

  @Override
  // ����
  public int update(HashMap<Object, Object> hashMap) {
    int cnt = this.memDAO.update(hashMap);
    return cnt;
  }

  @Override
  // ����
  public int delete(int mem_no) {
    int cnt = this.memDAO.delete(mem_no);
    return cnt;
  }

  @Override
  // �н����� �˻�
  public int check_pw(HashMap<Object, Object> hashMap) {
    int cnt = this.memDAO.check_pw(hashMap);
    return cnt;
  }

  @Override
  // �н����� ����
  public int update_pw(HashMap<Object, Object> hashMap) {
    int cnt = this.memDAO.update_pw(hashMap);
    return cnt;
  }

  
  
  @Override
  // �˻� + ����¡ ���
  public List<MemVO> list_search_paging(HashMap<Object, Object> map) {
    
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Mem.RECORD_PER_PAGE;
   
    // ���� rownum
    // 1 ������: 0 +1
    // 2 ������: 10 + 1  
    // 3 ������: 20 + 1 
    int startNum = beginOfPage + 1; 
    
    //  ���� rownum
    // 1 ������: 0 + 10  
    // 2 ������: 0 + 20 
    // 3 ������: 0 + 30
    int endNum = beginOfPage + Mem.RECORD_PER_PAGE;   
    
    /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
   
    List<MemVO> list = memDAO.list_search_paging(map);
    
    // --------------------------------------------------------------
    // ����, ���� ���ڼ� ����
    // --------------------------------------------------------------
//    String title = "";
//    String content = "";
//    for (MemVO memVO: list) {
//      title = memVO.getTitle();
//      if (title.length() >= 14) {
//        title = Tool.textLength(title, 14);
//        memVO.setTitle(title);
//      }
//      content = memVO.getContent();
//      if (content.length() >= 100) {
//        content = Tool.textLength(content, 100);
//        memVO.setContent(content);
//      }
//    }
    // --------------------------------------------------------------   
    
    return list;
  }

  
  // Paging Box
  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param cateno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  @Override
  public String pagingBox (String listFile, int search_count, int nowPage, String word) {
    
    int totalPage = (int)(Math.ceil ((double) search_count/Mem.RECORD_PER_PAGE));  // ��ü ������  
    int totalGrp = (int)(Math.ceil ((double)totalPage/Mem.PAGE_PER_BLOCK));              // ��ü �׷� 
    int nowGrp = (int)(Math.ceil ((double)nowPage/Mem.PAGE_PER_BLOCK));               // ���� �׷� 
    int startPage = ((nowGrp - 1) * Mem.PAGE_PER_BLOCK) + 1;                                   // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Mem.PAGE_PER_BLOCK);                                                 // Ư�� �׷��� ������ ��� ����   
     
    StringBuffer str = new StringBuffer(); 
     
    // ��'id=paging'�� �±�
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
    // str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 
 
    
    // �� ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  
    // nowGrp: 2 (11 ~ 20 page)
    // nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� ������ ������ (10)
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� ������ ������ (20)
    
    int _nowPage = (nowGrp-1) * Mem.PAGE_PER_BLOCK;  
    
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+">����</A></span>"); 
    } 
 
    
    // ���߾ӿ� ��ġ�� ������ ���
    for(int i=startPage; i<=endPage; i++){ 
      
      if (i > totalPage){ // ������ �������� �Ѿ�� ����
        break; 
      } 
  
      if (nowPage == i){ // �������� ���� �������� ���� ��� CSS ����, ��ũ X
        str.append("<span class='span_box_2'>"+i+"</span>"); 
      }else{
        // ���� �������� �ƴ� ������, ��ũ O
        str.append("<span class='span_box_1'><A href='"+listFile+"?word="+word+"&nowPage="+i+"'>"+i+"</A></span>");   
      } 
      
    } 
 
    
    // �� 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� ���� ������ 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� ���� ������ 21
    _nowPage = (nowGrp * Mem.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?&word="+word+"&nowPage="+_nowPage+">����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
 

  
  
  
  
  // ī�װ��� �˻� ���ڵ� ����
  @Override
  public int search_count(HashMap<Object, Object> hashMap) {
    int count = memDAO.search_count(hashMap);
    return count;
  }

  
  @Override
  // �α���
  public int login(Map<Object, Object> map) {
    int cnt = this.memDAO.login(map);
    return cnt;
  }

  
  @Override
  // mem_id �̿� ȸ�� ���� ��ȸ
  public MemVO readById(String mem_id) {
    MemVO memVO = this.memDAO.readById(mem_id);
    return memVO;
  }
  
  
  @Override
  // �α��ε� ȸ�� �������� �˻�
  public boolean isMember(HttpSession session){
    boolean sw = false; // �⺻ ����: �α��� X
    String mem_id = (String)session.getAttribute("mem_id");
    
    if (mem_id != null){
      sw = true; // �α��� �� ���
    }
    return sw; 
  }







}
