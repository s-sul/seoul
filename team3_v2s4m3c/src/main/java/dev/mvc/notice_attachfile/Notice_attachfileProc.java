package dev.mvc.notice_attachfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("dev.mvc.notice_attachfile.Notice_attachfileProc")
public class Notice_attachfileProc implements Notice_attachfileProcInter {
  @Autowired // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private Notice_attachfileDAOInter notice_attachfileDAO;

  public Notice_attachfileProc() {
    System.out.println("--> Notice_attachfileProc created.");
  }

  @Override
  public int create(Notice_attachfileVO notice_attachfileVO) {
    int cnt = 0;
    cnt = this.notice_attachfileDAO.create(notice_attachfileVO);
    return cnt;
  }

  @Override
  public List<Notice_attachfileVO> list() {
    List<Notice_attachfileVO> list = null;
    list= this.notice_attachfileDAO.list();
    return list;
  }

  @Override
  public Notice_attachfileVO read(int notice_attachfileno) {
    Notice_attachfileVO notice_attachfileVO =  null;
    notice_attachfileVO = this.notice_attachfileDAO.read(notice_attachfileno);    
    return notice_attachfileVO;
  }

  @Override
  public int delete(int notice_attachfileno) {
    int cnt = 0;
    cnt = this.notice_attachfileDAO.delete(notice_attachfileno);
    return cnt;
  }

  @Override
  public List<Notice_attachfileVO> list_by_noticeno(int noticeno) {
    List<Notice_attachfileVO> list = this.notice_attachfileDAO.list_by_noticeno(noticeno);
    return list;
  }
}
