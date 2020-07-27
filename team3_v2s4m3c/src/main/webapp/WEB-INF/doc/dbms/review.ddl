/**********************************/
/* Table Name: ���� */
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

COMMENT ON TABLE review is '���';
COMMENT ON COLUMN review.review_no is '��۹�ȣ';
COMMENT ON COLUMN review.at_no is '��������ȣ';
COMMENT ON COLUMN review.mem_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN review.payment_no is '���� ��ȣ';
COMMENT ON COLUMN review.review_word is '���� ����';
COMMENT ON COLUMN review.review_rate is '���� ��';

COMMENT ON COLUMN review.rdate is '�����';

DROP SEQUENCE review_seq;
CREATE SEQUENCE review_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����



-- 1) ���
INSERT INTO review(review_no, at_no, mem_no, payment_no, review_word, review_rate, rdate)
VALUES(review_seq.nextval, 4, 1, 5, '���1', 5,  sysdate);

INSERT INTO review(review_no, at_no, mem_no, payment_no, review_word, review_rate, rdate)
VALUES(review_seq.nextval, 4, 1, 6, '���1', 4,  sysdate);

INSERT INTO review(review_no, at_no, mem_no, payment_no, review_word, review_rate, rdate)
VALUES(review_seq.nextval, 4, 1, 7, '���1', 4,  sysdate);

COMMIT;
      


-- ��ü ���
SELECT review_no, at_no, mem_no, review_word, payment_no, review_word,  rdate
FROM review
ORDER BY review_no DESC;


-- ��ǰ�� ���
SELECT review_no, at_no, review_word, payment_no, review_word,  rdate
FROM review
WHERE at_no=4
ORDER BY review_no DESC;


--  ���� ���� (��ǰ��)
SELECT COUNT(*) as cnt
FROM review
WHERE at_no=1;


--  ���� ���� (ȸ����)
SELECT COUNT(*) as cnt
FROM review
WHERE mem_no=1;



-- ȸ���� ���
SELECT review_no, at_no, review_word, payment_no, review_word,  rdate
FROM review
WHERE mem_no=1
ORDER BY review_no DESC;


  SELECT review_no, at_no, payment_no, review_word, review_rate, rdate
  FROM review
  WHERE mem_no=1
  ORDER BY review_no DESC;


--  ���� ���� (��ǰ��)
SELECT review_no, at_no, review_word, payment_no, review_word,  rdate
FROM review
WHERE at_no=1
ORDER BY review_no DESC;



4) ����
-- �н����� �˻�
SELECT count(review_pw) as cnt
FROM review
WHERE review_no=1 AND review_pw='1234';

-- ����
DELETE
FROM review;
WHERE review_no=1;

COMMIT;


-- ��ȸ


SELECT mem_nick, review_no, at_no, m_mem_no, review_word, rdate
FROM (
            SELECT m.mem_nick, m.mem_no as m_mem_no,
                        r.review_no, r.at_no, r.review_word, r.review_rate, r.rdate, r.mem_no as r_mem_no
            FROM mem m,  review r
            WHERE (m.mem_no = r.mem_no) AND r.review_no=34

);


7) ȸ�� �г����� ���

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




 
8) ������ �н����� �˻�
SELECT COUNT(*) as cnt
FROM review
WHERE review_no=1 AND review_pw='1234';


9) ����
DELETE FROM review;
WHERE review_no=1;

10) ������ ��ư ����¡,  at_no �� ���

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

11) ��� �߰������� ��ȸ ����� �߰�

SELECT m.mem_nick,
           r.review_no, r.at_no, r.mem_no, r.review_word, r.rdate
FROM mem m,  review r
WHERE (m.mem_no = r.mem_no) AND review_no=28;


-- ȸ���� payment , at, review ���� ��� Ȯ��



-- ȸ���� ���� ����¡


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








