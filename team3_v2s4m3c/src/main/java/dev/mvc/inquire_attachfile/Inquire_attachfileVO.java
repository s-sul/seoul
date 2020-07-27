package dev.mvc.inquire_attachfile;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
 
/*
  inquire_attachfileno              NUMBER(10)     NOT NULL PRIMARY KEY, -- 첨부파일 번호
  inquireno                         NUMBER(10)     NULL, -- 문의 번호
  inquire_fname                     VARCHAR2(100)  NOT NULL, -- 원본 파일명
  inquire_fupname                   VARCHAR2(100)  NOT NULL, -- 업로드 파일명
  inquire_thumb                     VARCHAR2(100)  NULL, -- Thumb 파일
  inquire_fsize                     NUMBER(10)     NOT NULL, -- 파일 사이즈
  inquire_rdate                     DATE                 NOT NULL, -- 등록일
*/
public class Inquire_attachfileVO {
  /** 첨부파일 번호 */
  private int inquire_attachfileno;
  /** 문의 번호(FK) */
  private int inquireno;
  /** 원본 파일명 */
  private String inquire_fname;
  /** 업로드된 파일명 */
  private String inquire_fupname;
  /** Thumb 이미지 */
  private String inquire_thumb;
  /** 파일 크기 */
  private long inquire_fsize;
  /** 등록일 */
  private String inquire_rdate;
  
  /** Form의 파일을 MultipartFile로 변환하여 List에 저장 */
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
