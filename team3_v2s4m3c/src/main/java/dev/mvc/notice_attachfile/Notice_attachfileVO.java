package dev.mvc.notice_attachfile;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/*
  notice_attachfileno               NUMBER(10)     NOT NULL  PRIMARY KEY, -- ÷������ ��ȣ
  noticeno                          NUMBER(10)     NULL, -- ���� ��ȣ
  notice_fname                      VARCHAR2(100)  NOT NULL, -- ���� ���ϸ�
  notice_fupname                    VARCHAR2(100)  NOT NULL, -- ���ε� ���ϸ�
  notice_thumb                      VARCHAR2(100)  NULL, -- Thumb ���ϸ�
  notice_fsize                      NUMBER(10)     NOT NULL, -- ���� ������
  notice_rdate                      DATE                NOT NULL, -- �����
*/

public class Notice_attachfileVO {

  /** ÷�� ���� ��ȣ */
  private int notice_attachfileno;
  /** ���� ��ȣ(FK) */
  private int noticeno;
  /** ���� ���ϸ� */
  private String notice_fname;
  /** ���ε�� ���ϸ� */
  private String notice_fupname;
  /** Thumb �̹��� */
  private String notice_thumb;
  /** ���� ũ�� */
  private long notice_fsize;
  /** ����� */
  private String notice_rdate;

  /** Form�� ������ MultipartFile�� ��ȯ�Ͽ� List�� ���� */
  private List<MultipartFile> fnamesMF;

  public int getNotice_attachfileno() {
    return notice_attachfileno;
  }

  public void setNotice_attachfileno(int notice_attachfileno) {
    this.notice_attachfileno = notice_attachfileno;
  }

  public int getNoticeno() {
    return noticeno;
  }

  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
  }

  public String getNotice_fname() {
    return notice_fname;
  }

  public void setNotice_fname(String notice_fname) {
    this.notice_fname = notice_fname;
  }

  public String getNotice_fupname() {
    return notice_fupname;
  }

  public void setNotice_fupname(String notice_fupname) {
    this.notice_fupname = notice_fupname;
  }

  public String getNotice_thumb() {
    return notice_thumb;
  }

  public void setNotice_thumb(String notice_thumb) {
    this.notice_thumb = notice_thumb;
  }

  public long getNotice_fsize() {
    return notice_fsize;
  }

  public void setNotice_fsize(long notice_fsize) {
    this.notice_fsize = notice_fsize;
  }

  public String getNotice_rdate() {
    return notice_rdate;
  }

  public void setNotice_rdate(String notice_rdate) {
    this.notice_rdate = notice_rdate;
  }

  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }

  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }

}
