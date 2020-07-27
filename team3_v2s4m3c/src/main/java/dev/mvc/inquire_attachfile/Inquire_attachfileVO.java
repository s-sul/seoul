package dev.mvc.inquire_attachfile;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
 
/*
  inquire_attachfileno              NUMBER(10)     NOT NULL PRIMARY KEY, -- ÷������ ��ȣ
  inquireno                         NUMBER(10)     NULL, -- ���� ��ȣ
  inquire_fname                     VARCHAR2(100)  NOT NULL, -- ���� ���ϸ�
  inquire_fupname                   VARCHAR2(100)  NOT NULL, -- ���ε� ���ϸ�
  inquire_thumb                     VARCHAR2(100)  NULL, -- Thumb ����
  inquire_fsize                     NUMBER(10)     NOT NULL, -- ���� ������
  inquire_rdate                     DATE                 NOT NULL, -- �����
*/
public class Inquire_attachfileVO {
  /** ÷������ ��ȣ */
  private int inquire_attachfileno;
  /** ���� ��ȣ(FK) */
  private int inquireno;
  /** ���� ���ϸ� */
  private String inquire_fname;
  /** ���ε�� ���ϸ� */
  private String inquire_fupname;
  /** Thumb �̹��� */
  private String inquire_thumb;
  /** ���� ũ�� */
  private long inquire_fsize;
  /** ����� */
  private String inquire_rdate;
  
  /** Form�� ������ MultipartFile�� ��ȯ�Ͽ� List�� ���� */
  private List<MultipartFile> fnamesMF;

  public int getInquire_attachfileno() {
    return inquire_attachfileno;
  }

  public void setInquire_attachfileno(int inquire_attachfileno) {
    this.inquire_attachfileno = inquire_attachfileno;
  }

  public int getInquireno() {
    return inquireno;
  }

  public void setInquireno(int inquireno) {
    this.inquireno = inquireno;
  }

  public String getInquire_fname() {
    return inquire_fname;
  }

  public void setInquire_fname(String inquire_fname) {
    this.inquire_fname = inquire_fname;
  }

  public String getInquire_fupname() {
    return inquire_fupname;
  }

  public void setInquire_fupname(String inquire_fupname) {
    this.inquire_fupname = inquire_fupname;
  }

  public String getInquire_thumb() {
    return inquire_thumb;
  }

  public void setInquire_thumb(String inquire_thumb) {
    this.inquire_thumb = inquire_thumb;
  }

  public long getInquire_fsize() {
    return inquire_fsize;
  }

  public void setInquire_fsize(long inquire_fsize) {
    this.inquire_fsize = inquire_fsize;
  }

  public String getInquire_rdate() {
    return inquire_rdate;
  }

  public void setInquire_rdate(String inquire_rdate) {
    this.inquire_rdate = inquire_rdate;
  }

  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }

  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }

  
  
}
