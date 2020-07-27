package dev.mvc.surv_item;

import java.util.HashMap;
import java.util.List;

public interface Surv_Item_DAOInter {
  
  /**
   * �����׸���
   * @param surv_Item_VO
   * @return
   */
  public int surv_item_create(Surv_Item_VO surv_Item_VO);
  
  
  /**
   * �����׸� ��ü���
   * @return
   */
  public List<Surv_Item_VO> surv_item_list();
  
  /**
   * �����׸� ��ȸ
   * @return
   */
  public Surv_Item_VO surv_item_read(int surv_item_no);
  
  
  /**
   * �����׸� ����ó��
   * @param surv_Item_VO
   * @return ó���� ���ڵ� ����
   */
  public int surv_item_update(Surv_Item_VO surv_Item_VO);
  
  
  /**
   * �����׸� ����,������ �н����� üũ
   * @param hashMap
   * @return
   */
  public int surv_item_passwd_check(HashMap hashMap);
  
  /**
   * �����׸� ����
   * @param surv_item_no
   * @return
   */
  public int surv_item_delete(int surv_item_no);
  
  /**
   * surv_itemCnt ����
   * @param surv_item_no
   * @return
   */
  public int surv_itemCnt(int surv_item_no);
}
