/**********************************/
/* Table Name: 리뷰 */
/**********************************/
DROP TABLE review CASCADE CONSTRAINTS;

CREATE TABLE review(
        review_no                                NUMBER(10)         NOT NULL         PRIMARY KEY,
        at_no                                      NUMBER(10)    NOT     NULL ,
        mem_no                            NUMBER(10)         NOT NULL ,
        payment_no                            NUMBER(10)         NOT NULL       UNIQUE,
        review_word                               VARCHAR2(1000)         NOT NULL,
        review_rate                                 NUMBER(1)               NOT NULL,
        rdate                                  DATE NOT NULL,
  FOREIGN KEY (at_no) REFERENCES at (at_no),
  FOREIGN KEY (mem_no) REFERENCES mem (mem_no),
  FOREIGN KEY (payment_no) REFERENCES payment (payment_no)
);

COMMENT ON TABLE review is '댓글';
COMMENT ON COLUMN review.review_no is '댓글번호';
COMMENT ON COLUMN review.at_no is '컨텐츠번호';
COMMENT ON COLUMN review.mem_no is '회원 번호';
COMMENT ON COLUMN review.payment_no is '결제 번호';
COMMENT ON COLUMN review.review_word is '리뷰 내용';
COMMENT ON COLUMN review.review_rate is '리뷰 평가';

COMMENT ON COLUMN review.rdate is '등록일';

DROP SEQUENCE review_seq;
CREATE SEQUENCE review_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지



-- 1) 등록
INSERT INTO review(review_no, at_no, mem_no, payment_no, review_word, review_rate, rdate)
VALUES(review_seq.nextval, 4, 1, 5, '댓글1', 5,  sysdate);

INSERT INTO review(review_no, at_no, mem_no, payment_no, review_word, review_rate, rdate)
VALUES(review_seq.nextval, 4, 1, 6, '댓글1', 4,  sysdate);

INSERT INTO review(review_no, at_no, mem_no, payment_no, review_word, review_rate, rdate)
VALUES(review_seq.nextval, 4, 1, 7, '댓글1', 4,  sysdate);

COMMIT;
      


-- 전체 목록
SELECT review_no, at_no, mem_no, review_word, payment_no, review_word,  rdate
FROM review
ORDER BY review_no DESC;


-- 상품별 목록
SELECT review_no, at_no, review_word, payment_no, review_word,  rdate
FROM review
WHERE at_no=4
ORDER BY review_no DESC;


--  리뷰 갯수 (상품별)
SELECT COUNT(*) as cnt
FROM review
WHERE at_no=1;


--  리뷰 갯수 (회원별)
SELECT COUNT(*) as cnt
FROM review
WHERE mem_no=1;



-- 회원별 목록
SELECT review_no, at_no, review_word, payment_no, review_word,  rdate
FROM review
WHERE mem_no=1
ORDER BY review_no DESC;


  SELECT review_no, at_no, payment_no, review_word, review_rate, rdate
  FROM review
  WHERE mem_no=1
  ORDER BY review_no DESC;


--  리뷰 갯수 (상품별)
SELECT review_no, at_no, review_word, payment_no, review_word,  rdate
FROM review
WHERE at_no=1
ORDER BY review_no DESC;



4) 삭제
-- 패스워드 검사
SELECT count(review_pw) as cnt
FROM review
WHERE review_no=1 AND review_pw='1234';

-- 삭제
DELETE
FROM review;
WHERE review_no=1;

COMMIT;


-- 조회


SELECT mem_nick, review_no, at_no, m_mem_no, review_word, rdate
FROM (
            SELECT m.mem_nick, m.mem_no as m_mem_no,
                        r.review_no, r.at_no, r.review_word, r.review_rate, r.rdate, r.mem_no as r_mem_no
            FROM mem m,  review r
            WHERE (m.mem_no = r.mem_no) AND r.review_no=34

);


7) 회원 닉네임의 출력

SELECT m.mem_nick,
           r.review_no, r.at_no, r.mem_no, r.review_word, r.rdate
FROM mem m,  review r
WHERE (m.mem_no = r.mem_no) AND r.at_no=12
ORDER BY r.review_no DESC;

SELECT m.mem_nick,
           r.review_no, r.at_no, r.mem_no, r.review_word, r.rdate
FROM mem m,  review r
WHERE (m.mem_no = r.mem_no) AND r.review_no=10
ORDER BY r.review_no DESC;




 
8) 삭제용 패스워드 검사
SELECT COUNT(*) as cnt
FROM review
WHERE review_no=1 AND review_pw='1234';


9) 삭제
DELETE FROM review;
WHERE review_no=1;

10) 더보기 버튼 페이징,  at_no 별 목록

SELECT mem_nick, 
            review_no, at_no, m_mem_no, review_word, review_rate, rdate, r
FROM (
        SELECT mem_nick, 
                    review_no, at_no, m_mem_no, review_word, review_rate, rdate, rownum as r
        FROM (
                SELECT m.mem_nick, m.mem_no as m_mem_no,
                            r.review_no, r.at_no, r.review_word, r.review_rate, r.rdate, r.mem_no as r_mem_no
                FROM mem m,  review r
                WHERE (m.mem_no = r.mem_no) AND r.at_no=12
                ORDER BY r.review_no DESC
        )
);
WHERE r >= 1 AND r <= 2;

11) 댓글 추가에따른 조회 기능의 추가

SELECT m.mem_nick,
           r.review_no, r.at_no, r.mem_no, r.review_word, r.rdate
FROM mem m,  review r
WHERE (m.mem_no = r.mem_no) AND review_no=28;


-- 회원별 payment , at, review 리뷰 목록 확인



-- 회원별 리뷰 페이징


SELECT  r_payment_no, review_no, r_at_no, r_mem_no, review_word, review_rate, payment_total, r
FROM (
            SELECT r_payment_no, review_no, r_at_no, r_mem_no, review_word, review_rate, payment_total, rownum as r
            FROM (
                        SELECT  p.payment_no as p_payment_no, p.payment_total, p.at_no as p_at_no, p.mem_no as p_mem_no, p.at_no,
                                    r.payment_no as r_payment_no, r.review_no, r.at_no as r_at_no, r.mem_no as r_mem_no, r.review_word,  r.review_rate               
                        FROM   payment p,  review r
                        WHERE p.payment_no = r.payment_no AND p.mem_no = r.mem_no AND r.mem_no = 1
                        )
)
WHERE r >= 1 AND r <= 10;


    SELECT  r_payment_no, review_no, r_at_no, r_mem_no, review_word, review_rate, at_name, r
    FROM (
                SELECT r_payment_no, review_no, r_at_no, r_mem_no, review_word, review_rate, at_name, rownum as r
                FROM (
                            SELECT  p.payment_no as p_payment_no, p.payment_total, p.at_no as p_at_no, p.mem_no as p_mem_no, p.at_name,
                                        r.payment_no as r_payment_no, r.review_no, r.at_no as r_at_no, r.mem_no as r_mem_no, r.review_word,  r.review_rate               
                            FROM   payment p,  review r
                            WHERE p.payment_no = r.payment_no AND p.mem_no = r.mem_no AND r.mem_no =1
                            )
    )
    WHERE r >= 1 AND r <= 10;


COMMIT;








