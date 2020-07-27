package dev.mvc.mem_his;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.mem_his.Mem_hisProc")
public class Mem_hisProc implements Mem_hisProcInter{
  
  @Autowired
  Mem_hisDAOInter mem_hisDAO;

  @Override
  // ���
  public int create(int mem_his_no) {
    int cnt = this.mem_hisDAO.create(mem_his_no);
    return cnt;
  }

  @Override
  // ���
  public List<Mem_hisVO> list() {
    List<Mem_hisVO> list = this.mem_hisDAO.list();
    return list;
  }

  @Override
  // ��ȸ
  public Mem_hisVO read(int mem_his_no) {
    Mem_hisVO mem_hisVO = this.mem_hisDAO.read(mem_his_no);
    return mem_hisVO;
  }

  @Override
  // ����
  public int update(Mem_hisVO mem_hisVO) {
    int cnt = this.mem_hisDAO.update(mem_hisVO);
    return cnt;
  }

  @Override
  // ����
  public int delete(int mem_his_no) {
    int cnt = this.mem_hisDAO.delete(mem_his_no);
    return cnt;
  }

  
}
