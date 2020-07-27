DROP TABLE notice_attachfile;
CREATE TABLE notice_attachfile(
        notice_attachfileno                 NUMBER(10)       NOT NULL    PRIMARY KEY,
        noticeno                            NUMBER(10)       NOT NULL,
        notice_fname                        VARCHAR2(100)        NOT NULL,
        notice_fupname                      VARCHAR2(100)        NOT NULL,
        notice_thumb                        VARCHAR2(100)        NULL ,
        notice_fsize                        NUMBER(10)       NOT NULL,
        notice_rdate                        DATE         NOT NULL,
        FOREIGN KEY (noticeno) REFERENCES notice (noticeno)
);

COMMENT ON TABLE NOTICE_ATTACHFILE is '�������� ÷������';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_ATTACHFILENO is '÷������ ��ȣ';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICENO is '���� ��ȣ';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_FNAME is '���� ���ϸ�';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_FUPNAME is '���ε� ���ϸ�';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_THUMB is 'Thumb ���ϸ�';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_FSIZE is '���� ������';
COMMENT ON COLUMN NOTICE_ATTACHFILE.NOTICE_RDATE is '�����';


DROP SEQUENCE notice_attachfile_seq;
CREATE SEQUENCE notice_attachfile_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
-- 1) ���
INSERT INTO notice_attachfile(notice_attachfileno, noticeno, notice_fname, notice_fupname, notice_thumb, notice_fsize, notice_rdate)
VALUES(notice_attachfile_seq.nextval, 1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO notice_attachfile(notice_attachfileno, noticeno, notice_fname, notice_fupname, notice_thumb, notice_fsize, notice_rdate)
VALUES(notice_attachfile_seq.nextval, 1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO notice_attachfile(notice_attachfileno, noticeno, notice_fname, notice_fupname, notice_thumb, notice_fsize, notice_rdate)
VALUES(notice_attachfile_seq.nextval,  1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);   

COMMIT;
             
-- 2) ���( contentsno ���� ���� ����, attachfileno ���� ��������)
SELECT notice_attachfileno, noticeno, notice_fname, notice_fupname, notice_thumb, notice_fsize, notice_rdate
FROM notice_attachfile
ORDER BY noticeno DESC, notice_attachfileno ASC;

NOTICE_ATTACHFILENO   NOTICENO NOTICE_FNAME                                                                                         NOTICE_FUPNAME                                                                                       NOTICE_THUMB                                                                                         NOTICE_FSIZE NOTICE_RDATE       
------------------- ---------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ------------ -------------------
                  1          1 samyang.jpg                                                                                          samyang_1.jpg                                                                                        samyang_t.jpg                                                                                                1000 2020-07-08 03:29:23
                  2          1 samyang2.jpg                                                                                         samyang2_1.jpg                                                                                       samyang2_t.jpg                                                                                               2000 2020-07-08 03:29:23
                  3          1 samyang3.jpg                                                                                         samyang3_1.jpg                                                                                       samyang3_t.jpg                                                                                               3000 2020-07-08 03:29:23


SELECT notice_attachfileno, notice_fname, notice_fupname, notice_thumb
FROM notice_attachfile
ORDER BY noticeno DESC, notice_attachfileno ASC;           

-- 3) �ۺ� ���� ���(contentsno ���� ���� ����, attachfileno ���� ��������)
SELECT notice_attachfileno, noticeno, notice_fname, notice_fupname, notice_thumb, notice_fsize, notice_rdate
FROM notice_attachfile
WHERE noticeno = 1
ORDER BY notice_fname ASC;

NOTICE_ATTACHFILENO   NOTICENO NOTICE_FNAME                                                                                         NOTICE_FUPNAME                                                                                       NOTICE_THUMB                                                                                         NOTICE_FSIZE NOTICE_RDATE       
------------------- ---------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ------------ -------------------
                  1          1 samyang.jpg                                                                                          samyang_1.jpg                                                                                        samyang_t.jpg                                                                                                1000 2020-07-08 03:29:23
                  2          1 samyang2.jpg                                                                                         samyang2_1.jpg                                                                                       samyang2_t.jpg                                                                                               2000 2020-07-08 03:29:23
                  3          1 samyang3.jpg                                                                                         samyang3_1.jpg                                                                                       samyang3_t.jpg                                                                                               3000 2020-07-08 03:29:23



-- 4) �ϳ��� ���� ����
-- ��� ����
DELETE FROM notice_attachfile;
COMMIT;

DELETE FROM notice_attachfile
WHERE notice_attachfileno = 1;


-- 5) FK contentsno �θ�Ű �� ��ȸ
SELECT notice_attachfileno, noticeno, notice_fname, notice_fupname, notice_thumb, notice_fsize, notice_rdate
FROM notice_attachfile
WHERE noticeno=1;

ATTACHFILENO CONTENTSNO FNAME        FUPNAME      THUMB          FSIZE  RDATE
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            2          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            3          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0

-- �θ�Ű�� ���� ����
SELECT COUNT(*) as cnt
FROM notice_attachfile
WHERE noticeno=1;

 CNT
 ---
   3             
             
-- 6) FK �θ� ���̺� ���ڵ� ����
-- ��� ����
DELETE FROM notice_attachfile;
COMMIT;

DELETE FROM notice_attachfile
WHERE noticeno=1;

COMMIT;

  
-- 7) Contents, Attachfile join
    SELECT c.title, 
               a.attachfileno, a.contentsno, a.fname, a.fupname, a.thumb, a.fsize, a.rdate
    FROM contents c, attachfile a
    WHERE c.contentsno = a.contentsno
    ORDER BY c.contentsno DESC,  a.attachfileno ASC;
   
 TITLE     ATTACHFILENO CONTENTSNO FNAME        FUPNAME        THUMB            FSIZE  RDATE
 --------- ------------ ---------- ------------ -------------- ---------------- ------ ---------------------
 ũ��������            4          2 winter14.jpg winter14.jpg   winter14_t.jpg   160966 2019-12-17 12:43:24.0
 ũ��������            5          2 winter15.jpg winter15.jpg   winter15_t.jpg   180887 2019-12-17 12:43:24.0
 ũ��������            6          2 winter16.jpg winter16.jpg   winter16_t.jpg    53359 2019-12-17 12:43:24.0
 �ܿ� ����              1          1 winter01.jpg winter01_0.jpg winter01_0_t.jpg 171853 2019-12-17 12:42:46.0
 �ܿ� ����              2          1 winter02.jpg winter02_0.jpg winter02_0_t.jpg 176114 2019-12-17 12:42:47.0
 �ܿ� ����              3          1 winter03.jpg winter03_0.jpg winter03_0_t.jpg 192743 2019-12-17 12:42:47.0

-- 8) ��ȸ
SELECT notice_attachfileno, noticeno, notice_fname, notice_fupname, notice_thumb, notice_fsize, notice_rdate
FROM notice_attachfile
WHERE notice_attachfileno=1;


