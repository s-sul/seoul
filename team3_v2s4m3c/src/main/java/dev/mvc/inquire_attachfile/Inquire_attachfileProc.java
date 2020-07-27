package dev.mvc.inquire_attachfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.notice_attachfile.Notice_attachfileVO;

@Component("dev.mvc.inquire_attachfile.Inquire_attachfileProc")
public class Inquire_attachfileProc implements Inquire_attachfileProcInter {
  @Autowired // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private Inquire_attachfileDAOInter inquire_attachfileDAO;

  public Inquire_attachfileProc() {
    System.out.println("--> Inquire_attachfileProc created.");
  }

  @Override
  public int create(Inquire_attachfileVO inquire_attachfileVO) {
    int cnt = 0;
    cnt = this.inquire_attachfileDAO.create(inquire_attachfileVO);
    return cnt;
  }

  @Override
  public List<Inquire_attachfileVO> list() {
    List<Inquire_attachfileVO> list = null;
    list= this.inquire_attachfileDAO.list();
    return list;
  }

  @Override
  public Inquire_attachfileVO read(int inquire_attachfileno) {
    Inquire_attachfileVO inquire_attachfileVO =  null;
    inquire_attachfileVO = this.inquire_attachfileDAO.read(inquire_attachfileno);    
    return inquire_attachfileVO;
  }

  @Override
  public int delete(int inquire_attachfileno) {
    int cnt = 0;
    cnt = this.inquire_attachfileDAO.delete(inquire_attachfileno);
    return cnt;
  }

  @Override
  public List<Inquire_attachfileVO> list_by_inquireno(int inquireno) {
    List<Inquire_attachfileVO> list = this.inquire_attachfileDAO.list_by_inquireno(inquireno);
    return list;
  }

}
