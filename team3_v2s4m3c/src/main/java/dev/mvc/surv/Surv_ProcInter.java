package dev.mvc.surv;

import java.util.HashMap;
import java.util.List;

public interface Surv_ProcInter {
  /**
   * ���� ���
   * @param surv_VO
   * @return
   */
  public int surv_create(Surv_VO surv_VO);
  
  
  /**
   * �������
   * @return
   */
  public List<Surv_VO> surv_list();
  
  /**
   * ������ȸ
   * @param surv_no
   * @return
   */
  public Surv_VO surv_read(int surv_no);
  
  
  /**
   * ���� ���� ��
   * @param surv_no
   * @return
   */
  public Surv_VO surv_update(int surv_no);
  
  
  /**
   * ���� ����ó��
   * @param surv_VO
   * @return ó���� ���ڵ� ����
   */
  public int surv_update(Surv_VO surv_VO);
  
  /**
   * �������� ����,������ �н����� üũ
   * @param map
   * @return
   */
  public int surv_passwd_check(HashMap hashMap);
  
  /**
   * �������� ����
   * @param surv_no
   * @return
   */
  public int surv_delete(int surv_no);
}
