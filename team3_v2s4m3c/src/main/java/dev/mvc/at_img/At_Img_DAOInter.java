package dev.mvc.at_img;

import java.util.List;

import dev.mvc.at.At_Dates_Img;

public interface At_Img_DAOInter {
  
  /**
   * �̹������
   */
  
  public int create(At_Dates_Img at_Dates_Img);
  
  /**
   * �̹������
   */
  
  public int modify(At_Dates_Img at_Dates_Img);
  
  
  /**
   * ��ǰ �̹��� ��ȸ
   */
  
  public List<At_Dates_Img> read (int at_no);
  
  /**
   * ��ǰ �̹��� ��ȸ 1��
   */
  
  public At_Dates_Img read_row (int at_no);
  
  
  /**
   * ��ǰ �̹��� ��ü ����
   * 
   */
  
  public int delete(int at_no);
  
}
