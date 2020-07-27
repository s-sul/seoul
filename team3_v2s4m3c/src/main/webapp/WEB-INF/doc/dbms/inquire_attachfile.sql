/**********************************/
/* Table Name: 1대1문의 첨부파일 */
/**********************************/
DROP TABLE inquire_attachfile;
CREATE TABLE inquire_attachfile(
		inquire_attachfileno          		NUMBER(10)		 NOT NULL PRIMARY KEY, -- 첨부파일 번호
        inquireno                     		NUMBER(10)		 NULL, -- 문의 번호
		inquire_fname                 		VARCHAR2(100)	 NOT NULL, -- 원본 파일명
		inquire_fupname               		VARCHAR2(100)	 NOT NULL, -- 업로드 파일명
		inquire_thumb                 		VARCHAR2(100)	 NULL, -- Thumb 파일
		inquire_fsize                 		NUMBER(10)		 NOT NULL, -- 파일 사이즈
		inquire_rdate                 		DATE		             NOT NULL, -- 등록일
		FOREIGN KEY (inquireno) REFERENCES inquire (inquireno)
);

COMMENT ON TABLE inquire_attachfile is '1대1문의 첨부파일';
COMMENT ON COLUMN inquire_attachfile.inquire_attachfileno is '첨부파일 번호';
COMMENT ON COLUMN inquire_attachfile.inquireno is '문의 번호';
COMMENT ON COLUMN inquire_attachfile.inquire_fname is '원본 파일명';
COMMENT ON COLUMN inquire_attachfile.inquire_fupname is '업로드 파일명';
COMMENT ON COLUMN inquire_attachfile.inquire_thumb is 'Thumb 파일';
COMMENT ON COLUMN inquire_attachfile.inquire_fsize is '파일 사이즈';
COMMENT ON COLUMN inquire_attachfile.inquire_rdate is '등록일';


DROP SEQUENCE inquire_attachfile_seq;
CREATE SEQUENCE inquire_attachfile_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
-- 1) 등록
INSERT INTO inquire_attachfile(inquire_attachfileno, inquireno, inquire_fname, inquire_fupname, inquire_thumb, inquire_fsize, inquire_rdate)
VALUES(inquire_attachfile_seq.nextval, 1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO inquire_attachfile(inquire_attachfileno, inquireno, inquire_fname, inquire_fupname, inquire_thumb, inquire_fsize, inquire_rdate)
VALUES(notice_attachfile_seq.nextval, 1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO inquire_attachfile(inquire_attachfileno, inquireno, inquire_fname, inquire_fupname, inquire_thumb, inquire_fsize, inquire_rdate)
VALUES(notice_attachfile_seq.nextval,  1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);   

COMMIT;
             
-- 2) 목록( inquireno 기준 내림 차순, inquire_attachfileno 기준 오르차순)
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

-- 3) 글별 파일 목록(inquireno 기준 내림 차순, inquire_attachfileno 기준 오르차순)
SELECT inquire_attachfileno, inquireno, inquire_fname, inquire_fupname, inquire_thumb, inquire_fsize, inquire_rdate
FROM inquire_attachfile
WHERE inquireno = 1
ORDER BY inquire_fname ASC;

INQUIRE_ATTACHFILENO  INQUIRENO INQUIRE_FNAME                                                                                        INQUIRE_FUPNAME                                                                                      INQUIRE_THUMB                                                                                        INQUIRE_FSIZE INQUIRE_RDATE      
-------------------- ---------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ------------- -------------------
                  1          1 samyang.jpg                                                                                          samyang_1.jpg                                                                                        samyang_t.jpg                                                                                                1000 2020-07-08 03:29:23
                  2          1 samyang2.jpg                                                                                         samyang2_1.jpg                                                                                       samyang2_t.jpg                                                                                               2000 2020-07-08 03:29:23
                  3          1 samyang3.jpg                                                                                         samyang3_1.jpg                                                                                       samyang3_t.jpg                                                                                               3000 2020-07-08 03:29:23



-- 4) 하나의 파일 삭제
-- 모두 삭제
DELETE FROM inquire_attachfile;
COMMIT;

DELETE FROM inquire_attachfile
WHERE inquire_attachfileno = 23;


-- 5) FK inquireno 부모키 별 조회
SELECT inquire_attachfileno, inquireno, inquire_fname, inquire_fupname, inquire_thumb, inquire_fsize, inquire_rdate
FROM inquire_attachfile
WHERE inquireno=1;

INQUIRE_ATTACHFILENO  INQUIRENO INQUIRE_FNAME                                                                                        INQUIRE_FUPNAME                                                                                      INQUIRE_THUMB                                                                                        INQUIRE_FSIZE INQUIRE_RDATE      
-------------------- ---------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------- ------------- -------------------
            1          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            2          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            3          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0

-- 부모키별 갯수 산출
SELECT COUNT(*) as cnt
FROM inquire_attachfile
WHERE inquireno=1;

 CNT
 ---
   3             
             
-- 6) FK 부모 테이블별 레코드 삭제
-- 모두 삭제
DELETE FROM inquire_attachfile;
COMMIT;

DELETE FROM inquire_attachfile
WHERE inquireno=1;

COMMIT;

-- 7) 조회
SELECT inquire_attachfileno, inquireno, inquire_fname, inquire_fupname, inquire_thumb, inquire_fsize, inquire_rdate
FROM inquire_attachfile
WHERE inquire_attachfileno=1;


  