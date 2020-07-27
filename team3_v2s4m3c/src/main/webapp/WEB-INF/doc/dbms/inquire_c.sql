/**********************************/
/* Table Name: 1대1문의 */
/**********************************/
DROP TABLE inquire;
CREATE TABLE inquire(
		inquireno          	NUMBER(10)		 NOT NULL PRIMARY KEY, -- 문의 번호
        mem_no             NUMBER(10)		 NOT NULL, -- 회원 번호
		inquire_title       	VARCHAR2(100)	 NOT NULL, -- 문의 제목
		inquire_content  	VARCHAR2(300)	 NOT NULL, -- 문의 내용
		inquire_rname   	VARCHAR2(10)		 NOT NULL, -- 등록자
		inquire_passwd 		VARCHAR2(15)		 NOT NULL, -- 패스워드
        word                 VARCHAR2(300)	 NULL, -- 검색어
		inquire_rdate        DATE		             NOT NULL, -- 등록일
        FOREIGN KEY (mem_no) REFERENCES mem (mem_no)
);

COMMENT ON TABLE inquire is '1대1문의';
COMMENT ON COLUMN inquire.inquireno is '문의 번호';
COMMENT ON COLUMN inquire.mem_no is '회원 번호';
COMMENT ON COLUMN inquire.inquire_title is '문의 제목';
COMMENT ON COLUMN inquire.inquire_content is '문의 내용';
COMMENT ON COLUMN inquire.inquire_rname is '등록자';
COMMENT ON COLUMN inquire.inquire_passwd is '패스워드';
COMMENT ON COLUMN inquire.word is '검색어';
COMMENT ON COLUMN inquire.inquire_rdate is '등록일';


DROP SEQUENCE inquire_seq;
CREATE SEQUENCE inquire_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


1) 문의 등록
INSERT INTO inquire(inquireno, mem_no, inquire_title, inquire_content, inquire_rname, inquire_passwd, inquire_rdate)
VALUES(inquire_seq.nextval, 1, '문의1', '문의사항1', '회원1', '1234', sysdate);

INSERT INTO inquire(inquireno, mem_no, inquire_title, inquire_content, inquire_rname, inquire_passwd, inquire_rdate)
VALUES(inquire_seq.nextval, 1, '문의2', '문의사항2', '회원1', '1234', sysdate);
            
INSERT INTO inquire(inquireno, mem_no, inquire_title, inquire_content, inquire_rname, inquire_passwd, inquire_rdate)
VALUES(inquire_seq.nextval, 1, '문의3', '문의사항3', '회원1', '1234', sysdate);

commit;

2) 전체목록
SELECT inquireno, mem_no, inquire_title, inquire_content, inquire_rname, inquire_passwd, inquire_rdate
FROM inquire 
ORDER BY inquireno DESC;


3) 1건 조회
SELECT inquireno, mem_no, inquire_title, inquire_content, inquire_rname, inquire_passwd, inquire_rdate
FROM inquire 
WHERE inquireno = 1;

4) 수정
UPDATE inquire 
SET inquire_title='문의11', inquire_content='문의11'
WHERE inquireno = 4;

COMMIT;

5) 패스워드 검사
SELECT COUNT(*) as inquire_passwd_cnt
FROM inquire
WHERE inquireno=1 AND inquire_passwd='1234';

SELECT inquireno, inquire_passwd
FROM inquire 
ORDER BY inquireno DESC;    

6) 삭제
DELETE FROM inquire
WHERE inquireno=4;

COMMIT;  


7) 페이징
SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate
FROM inquire
ORDER BY inquireno DESC;

-- step 1
SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate
FROM inquire
ORDER BY inquireno DESC;

-- step 2
SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate, rownum as r
FROM (
          SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate
          FROM inquire
          ORDER BY inquireno DESC
);

-- step 3, 1 page
SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate, r
FROM (
           SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate, rownum as r
           FROM (
                     SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate
                     FROM inquire
                     ORDER BY inquireno DESC
           )          
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate, r
FROM (
           SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate, rownum as r
           FROM (
                     SELECT inquireno, inquire_title, inquire_content, inquire_rname, inquire_rdate
                     FROM inquire
                     ORDER BY inquireno DESC
           )          
)
WHERE r >= 11 AND r <= 20;