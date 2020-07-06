package dev.mvc.dates;
import java.util.HashMap;
import java.util.List;

import dev.mvc.at.At_Dates_Img;

public interface Dates_DAOInter {
  
  
  /**
   * ��� ��¥�� ��� ���� 
   * @param at_no
   * @return
   */
  
  public List<Dates_Cnt> total_dates_cnt(int at_no);
  
  public Dates_Cnt total_dates_cnt_for_update(int at_no);
  
  /**
   * Ư�� ��¥�� ��� ���� 
   */
  public int specific_dates_cnt(HashMap hashmap);
  
  /**
   * �����
   * @param 
   * @return
   */
  public int create(At_Dates_Img at_Dates_Img);
  
  /**
   * ����߰�
   * @param 
   * @return
   */
  public int add(At_Dates_Img at_Dates_Img);
  
  
  /**
   * ������
   * @param 
   * @return
   */
  public int update(At_Dates_Img at_Dates_Img);
  
  /**��� ����
   * 
   * @param 
   * @return
   */
  public int delete(HashMap hasmap);
  
}
