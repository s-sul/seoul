DROP TABLE payment CASCADE CONSTRAINTS;

CREATE TABLE payment(
		payment_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		mem_no                        		NUMBER(10)		 NOT NULL,
		at_no                         		NUMBER(10)		 NOT NULL,
        cart_no                      		NUMBER(10)		 NOT NULL,
		payment_way                   		VARCHAR2(100)		 NOT NULL,
		payment_total                 		NUMBER(10)		 NOT NULL,
        payment_date                           DATE       NOT NULL,
        cart_cnt                                    		NUMBER(10)		 NOT NULL,
        at_price                      		NUMBER(10)		 NOT NULL,
        at_name                  		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO),
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
); 

COMMENT ON TABLE payment is '결제';
COMMENT ON COLUMN payment.payment_no is '결제번호';
COMMENT ON COLUMN payment.mem_no is '회원번호';
COMMENT ON COLUMN payment.at_no is '상품번호';
COMMENT ON COLUMN payment.cart_no is '카트번호';
COMMENT ON COLUMN payment.payment_way is '결제방법';
COMMENT ON COLUMN payment.payment_total is '결제금액';
COMMENT ON COLUMN payment.payment_date is '결제일';
COMMENT ON COLUMN payment.cart_cnt is '수량';
COMMENT ON COLUMN payment.at_price is '상품가격';
COMMENT ON COLUMN payment.at_name is '상품명';
 
 

DROP SEQUENCE payment_seq;
CREATE SEQUENCE payment_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지



 --등록 

INSERT INTO payment(payment_no, mem_no, at_no,cart_no, payment_way, payment_total, payment_date, cart_cnt, at_price, at_name)
VALUES(payment_seq.nextval, 1, 1, 1,'계좌이체', 50000,  sysdate, 1, 50000, '진진자라');

commit;

 

--목록

SELECT payment_no, mem_no, payment_way, payment_total, payment_date
FROM payment
WHERE mem_no=1
ORDER BY payment_no ASC;


--join  at ,payment

SELECT   p.payment_no as p_payment_no,  p.payment_way as p_payment_way, p.payment_total as p_payment_total,
                p.cart_cnt as p_cart_cnt,
                a.at_no  as  a_at_no, a.at_price as a_at_price, a.at_name as at_name
FROM   payment p,  at  a
WHERE   p.at_no = a.at_no AND p.mem_no=17
ORDER BY payment_no ASC;

--read
    SELECT payment_no, mem_no, at_no, payment_way, payment_total, payment_date, at_price, at_name
    FROM payment
    WHERE payment_no=2;
    
    
--read
    SELECT payment_no, mem_no, at_no, payment_way, payment_total, payment_date, at_price, at_name
    FROM payment
    WHERE mem_no=1;



DELETE FROM payment
WHERE payment_no = 1 AND mem_no=1;


commit;


     SELECT COUNT(*) as cnt
     FROM payment

