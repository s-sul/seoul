/**********************************/
/* Table Name: 장바구니 */
/**********************************/
DROP TABLE cart CASCADE CONSTRAINTS; 
DROP TABLE cart;
CREATE TABLE cart(
      cart_no                             NUMBER(10)       NOT NULL       PRIMARY KEY,
      mem_no                              NUMBER(10)       NOT NULL,
      at_no                               NUMBER(10)       NOT NULL,
      cart_cnt                                 NUMBER(10)       NOT NULL,
      cart_payment                             NUMBER(10)       NOT NULL,        
      cart_date                           DATE       NOT NULL,
      at_name                         VARCHAR2(100) NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO),
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE cart is '장바구니';
COMMENT ON COLUMN cart.cart_no is '장바구니번호';
COMMENT ON COLUMN cart.mem_no is '회원번호';
COMMENT ON COLUMN cart.at_no is '상품번호';
COMMENT ON COLUMN cart.cart_cnt is '수량';
COMMENT ON COLUMN cart.cart_payment is '결제금액';
COMMENT ON COLUMN cart.cart_date is '담은시간';
COMMENT ON COLUMN cart.at_name is '상품명';


DROP SEQUENCE cart_seq;
CREATE SEQUENCE cart_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


-- 등록
INSERT INTO CART(cart_no, mem_no, at_no, cart_cnt, cart_payment,  cart_date, at_name)
VALUES(cart_seq.nextval, 1, 1, 4, 50000,  sysdate, '진진자라');


COMMIT;


--목록
SELECT cart_no, mem_no, at_no, cart_cnt, cart_payment,  cart_date, at_name
FROM cart
ORDER BY cart_no ASC;

--join list
-- 1) cart, mem ,at join
SELECT   c.cart_no as c_cart_no, c.cart_cnt as c_cart_cnt, c.cart_payment as c_cart_payment,  c.cart_date as c_cart_date,
                a.at_no  as  a_at_no, a.at_price as a_at_price,
                m.mem_no as m_mem_no, m.mem_id as m_mem_id
FROM   cart c,  at  a,  mem m
WHERE           c.cart_no = 1
              AND c.mem_no = m.mem_no
ORDER BY cart_no ASC;

--2) cart , at join

SELECT   c.cart_no as c_cart_no, c.cart_cnt as c_cart_cnt, c.cart_payment as c_cart_payment,  c.cart_date as c_cart_date, c.mem_no as c_mem_no,
                a.at_no  as  a_at_no, a.at_price as a_at_price, a.at_name as at_name
FROM   cart c,  at  a,  mem  m
WHERE           c.at_no = a.at_no
              AND c.mem_no = m.mem_no
              AND m.mem_no =1
ORDER BY cart_no ASC;


--2) cart , at join

SELECT    c.cart_no as cart_no, c.cart_cnt as cart_cnt, c.cart_payment as cart_payment,
                a.at_no  as  at_no, a.at_price as at_price, a.at_name as at_name
FROM   cart c,  at  a
WHERE           c.at_no = a.at_no
              AND c.cart_no=2
            
ORDER BY cart_no ASC;


SELECT   c.cart_no as c_cart_no, c.cart_cnt as c_cart_cnt, c.cart_payment as c_cart_payment,  c.cart_date as c_cart_date,
                a.at_no  as  a_at_no, a.at_price as a_at_price, a.at_name as at_name
FROM   cart c,  at  a,  mem  m
WHERE           c.at_no = a.at_no
              AND c.mem_no = m.mem_no
              AND m.mem_no =1
ORDER BY cart_no ASC;




--3) cart , mem
SELECT   c.cart_no as c_cart_no, c.cart_cnt as c_cart_cnt, c.cart_payment as c_cart_payment,  c.cart_date as c_cart_date,
                a.at_no  as  a_at_no, a.at_price as a_at_price
FROM   cart c,  at  a,  mem  m
WHERE           c.at_no = a.at_no
              AND c.mem_no = m.mem_no
              AND m.mem_no =1
ORDER BY cart_no ASC;

--
--SELECT  c.cart_no ,  c.mem_no ,  c.at_no , c.cnt , c.payment , c.cart_date,
--                    m.mem_no as m_mem_no,
--                    a.at_no as a_at_no
--FROM mem m , at a, cart c
--WHERE         m.mem_no = c.mem_no 
--            AND a.at_no = c.at_no
--ORDER BY c.cart_no ASC;
--
--
--SELECT  c.cart_no ,  c.mem_no ,  c.at_no , c.cnt , c.payment , c.cart_date,
--                    m.mem_no as m_mem_no,
--                    a.at_no as a_at_no
--FROM mem m , at a, cart c
--WHERE         m.mem_no = c.mem_no 
--            AND a.at_no = c.at_no 
--            AND c.mem_no =1
--ORDER BY c.cart_no ASC;


--조회
SELECT cart_no, mem_no, at_no, cart_cnt, cart_payment,  cart_date
FROM cart
WHERE cart_no=1;

--수정
UPDATE cart
SET  cart_cnt=3
WHERE cart_no=1 AND mem_no=1;

commit;

--삭제
DELETE FROM cart
WHERE cart_no = 29 AND mem_no=1;

commit;


SELECT NVL(sum(cart_payment),0) cart_sum
FROM cart 
WHERE mem_no=1



-- 검색 + 페이징

SELECT  c_cart_no, c_cart_cnt, c_cart_payment, c_cart_date, a_at_no, a_at_price, at_name, rownum as r
FROM (
            SELECT   c.cart_no as c_cart_no, c.cart_cnt as c_cart_cnt, c.cart_payment as c_cart_payment,  c.cart_date as c_cart_date,
                            a.at_no  as  a_at_no, a.at_price as a_at_price, a.at_name as at_name
            FROM cart c,  at  a,  mem  m
            WHERE           c.at_no = a.at_no
                          AND c.mem_no = m.mem_no
                          AND m.mem_no =1
            ORDER BY cart_no ASC
);

 

-- step 3, 1 page

SELECT c_cart_no, c_cart_cnt, c_cart_payment, c_cart_date, a_at_no, a_at_price, at_name, r
FROM (
           SELECT c_cart_no, c_cart_cnt, c_cart_payment, c_cart_date, a_at_no, a_at_price, at_name, rownum as r
           FROM (
                     SELECT c.cart_no as c_cart_no, c.cart_cnt as c_cart_cnt, c.cart_payment as c_cart_payment,  c.cart_date as c_cart_date,
                               a.at_no  as  a_at_no, a.at_price as a_at_price, a.at_name as at_name
                     FROM cart c,  at  a,  mem  m
                     WHERE c.at_no = a.at_no
                                AND c.mem_no = m.mem_no
                                AND m.mem_no =1
                     ORDER BY cart_no ASC
           )          
)
WHERE r >= 4 AND r <= 6;

 

-- step 3, 2 page

SELECT c_cart_no, c_cart_cnt, c_cart_payment, c_cart_date, a_at_no, a_at_price, at_name, r
FROM (
           SELECT c_cart_no, c_cart_cnt, c_cart_payment, c_cart_date, a_at_no, a_at_price, at_name, rownum as r
           FROM (
                     SELECT c.cart_no as c_cart_no, c.cart_cnt as c_cart_cnt, c.cart_payment as c_cart_payment,  c.cart_date as c_cart_date,
                               a.at_no  as  a_at_no, a.at_price as a_at_price, a.at_name as at_name
                     FROM cart c,  at  a,  mem  m
                     WHERE c.at_no = a.at_no
                                AND c.mem_no = m.mem_no
                                AND m.mem_no =1
                     ORDER BY cart_no ASC
           )          
)
WHERE r >= 11 AND r <= 20;


     SELECT COUNT(*) as cnt
     FROM cart
