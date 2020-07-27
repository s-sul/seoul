/**********************************/
/* Table Name: 1��1���� ÷������ */
/**********************************/
DROP TABLE inquire_attachfile;
CREATE TABLE inquire_attachfile(
		inquire_attachfileno          		NUMBER(10)		 NOT NULL PRIMARY KEY, -- ÷������ ��ȣ
        inquireno                     		NUMBER(10)		 NULL, -- ���� ��ȣ
		inquire_fname                 		VARCHAR2(100)	 NOT NULL, -- ���� ���ϸ�
		inquire_fupname               		VARCHAR2(100)	 NOT NULL, -- ���ε� ���ϸ�
		inquire_thumb                 		VARCHAR2(100)	 NULL, -- Thumb ����
		inquire_fsize                 		NUMBER(10)		 NOT NULL, -- ���� ������
		inquire_rdate                 		DATE		             NOT NULL, -- �����
		FOREIGN KEY (inquireno) REFERENCES inquire (inquireno)
);

COMMENT ON TABLE inquire_attachfile is '1��1���� ÷������';
COMMENT ON COLUMN inquire_attachfile.inquire_attachfileno is '÷������ ��ȣ';
COMMENT ON COLUMN inquire_attachfile.inquireno is '���� ��ȣ';
COMMENT ON COLUMN inquire_attachfile.inquire_fname is '���� ���ϸ�';
COMMENT ON COLUMN inquire_attachfile.inquire_fupname is '���ε� ���ϸ�';
COMMENT ON COLUMN inquire_attachfile.inquire_thumb is 'Thumb ����';
COMMENT ON COLUMN inquire_attachfile.inquire_fsize is '���� ������';
COMMENT ON COLUMN inquire_attachfile.inquire_rdate is '�����';


DROP SEQUENCE inquire_attachfile_seq;
CREATE SEQUENCE inquire_attachfile_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
-- 1) ���
INSERT INTO inquire_attachfile(inquire_attachfileno, inquireno, inquire_fname, inquire_fupname, inquire_thumb, inquire_fsize, inquire_rdate)
VALUES(inquire_attachfile_seq.nextval, 1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO inquire_attachfile(inquire_attachfileno, inquireno, inquire_fname, inquire_fupname, inquire_thumb, inquire_fsize, inquire_rdate)
VALUES(notice_attachfile_seq.nextval, 1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO inquire_attachfile(inquire_attachfileno, inquireno, inquire_fname, inquire_fupname, inquire_thumb, inquire_fsize, inquire_rdate)
VALUES(notice_attachfile_seq.nextval,  1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);   

COMMIT;
             
-- 2) ���( inquireno ���� ���� ����, inquire_attachfileno ���� ��������)
SELECT inquire_attachfileno, inquireno, inquire_fname, inquire_fupname, inquire_thumb, inquire_fsize, inquire_rdate
FROM inquire_attachfile
ORDER BY inquireno DESC, inquire_attachfileno ASC;

INQUIRE_ATTACHFILENO  INQUIRENO INQUIRE_FNAME                                                                                        INQUIRE_FUPNAME                                                                                      INQUIRE_THUMB                                                                                        INQUIRE_FSIZE INQUIRE_RDATE      
------------------- ---------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ------------ -------------------
                  1          1 samyang.jpg                                                                                          samyang_1.jpg                                                                                        samyang_t.jpg                                                                                                1000 2020-07-08 03:29:23
                  2          1 samyang2.jpg                                                                                         samyang2_1.jpg                                                                                       samyang2_t.jpg                                                                                               2000 2020-07-08 03:29:23
                  3          1 samyang3.jpg                                                                                         samyang3_1.jpg                                                                                       samyang3_t.jpg                                                                                               3000 2020-07-08 03:29:23


SELECT inquire_attachfileno, inquire_fname, inquire_fupname, inquire_thumb
FROM inquire_attachfile
ORDER BY inquireno DESC, inquire_attachfileno ASC;           

-- 3) �ۺ� ���� ���(inquireno ���� ���� ����, inquire_attachfileno ���� ��������)
SELECT inquire_attachfileno, inquireno, inquire_fname, inquire_fupname, inquire_thumb, inquire_fsize, inquire_rdate
FROM inquire_attachfile
WHERE inquireno = 1
ORDER BY inquire_fname ASC;

INQUIRE_ATTACHFILENO  INQUIRENO INQUIRE_FNAME                                                                                        INQUIRE_FUPNAME                                                                                      INQUIRE_THUMB                                                                                        INQUIRE_FSIZE INQUIRE_RDATE      
-------------------- ---------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ------------- -------------------
                  1          1 samyang.jpg                                                                                          samyang_1.jpg                                                                                        samyang_t.jpg                                                                                                1000 2020-07-08 03:29:23
                  2          1 samyang2.jpg                                                                                         samyang2_1.jpg                                                                                       samyang2_t.jpg                                                                                               2000 2020-07-08 03:29:23
                  3          1 samyang3.jpg                                                                                         samyang3_1.jpg                                                                                       samyang3_t.jpg                                                                                               3000 2020-07-08 03:29:23



-- 4) �ϳ��� ���� ����
-- ��� ����
DELETE FROM inquire_attachfile;
COMMIT;

DELETE FROM inquire_attachfile
WHERE inquire_attachfileno = 23;


-- 5) FK inquireno �θ�Ű �� ��ȸ
SELECT inquire_attachfileno, inquireno, inquire_fname, inquire_fupname, inquire_thumb, inquire_fsize, inquire_rdate
FROM inquire_attachfile
WHERE inquireno=1;

INQUIRE_ATTACHFILENO  INQUIRENO INQUIRE_FNAME                                                                                        INQUIRE_FUPNAME                                                                                      INQUIRE_THUMB                                                                                        INQUIRE_FSIZE INQUIRE_RDATE      
-------------------- ---------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ------------- -------------------
            1          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            2          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            3          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0

-- �θ�Ű�� ���� ����
SELECT COUNT(*) as cnt
FROM inquire_attachfile
WHERE inquireno=1;

 CNT
 ---
   3             
             
-- 6) FK �θ� ���̺� ���ڵ� ����
-- ��� ����
DELETE FROM inquire_attachfile;
COMMIT;

DELETE FROM inquire_attachfile
WHERE inquireno=1;

COMMIT;

-- 7) ��ȸ
SELECT inquire_attachfileno, inquireno, inquire_fname, inquire_fupname, inquire_thumb, inquire_fsize, inquire_rdate
FROM inquire_attachfile
WHERE inquire_attachfileno=1;


  