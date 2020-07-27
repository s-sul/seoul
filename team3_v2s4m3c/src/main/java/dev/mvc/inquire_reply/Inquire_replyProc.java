package dev.mvc.inquire_reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.inquire_reply.Inquire_replyProc")
public class Inquire_replyProc implements Inquire_replyProcInter {
  @Autowired
  private Inquire_replyDAOInter inquire_replyDAO;

  @Override
  public int create(Inquire_replyVO inquire_replyVO) {
    int count = inquire_replyDAO.create(inquire_replyVO);
    return count;
  }

  @Override
  public List<Inquire_replyVO> list() {
    List<Inquire_replyVO> list = inquire_replyDAO.list();
    return list;
  }

  @Override
  public List<Inquire_replyVO> list_by_inquireno(int inquireno) {
    List<Inquire_replyVO> list = inquire_replyDAO.list_by_inquireno(inquireno);
    String content = "";
    
    // 특수 문자 변경
    for (Inquire_replyVO inquire_replyVO:list) {
      content = inquire_replyVO.getReply_content();
      content = Tool.convertChar(content);
      inquire_replyVO.setReply_content(content);
    }
    return list;
  }

  @Override
  public List<Inquire_replyMemberVO> list_by_inquireno_join(int inquireno) {
    List<Inquire_replyMemberVO> list = inquire_replyDAO.list_by_inquireno_join(inquireno);
    String content = "";
    
    // 특수 문자 변경
    for (Inquire_replyMemberVO inquire_replyMemberVO:list) {
      content = inquire_replyMemberVO.getReply_content();
      content = Tool.convertChar(content);
      inquire_replyMemberVO.setReply_content(content);
    }
    return list;
  }

  @Override
  public int checkPasswd(Map<String, Object> map) {
    int count = inquire_replyDAO.checkPasswd(map);
    return count;
  }

  @Override
  public int delete(int inquire_replyno) {
    int count = inquire_replyDAO.delete(inquire_replyno);
    return count;
  } 
  
   
}