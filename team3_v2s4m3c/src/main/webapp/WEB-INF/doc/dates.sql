DROP TABLE DATES CASCADE CONSTRAINTS;
DROP SEQUENCE dates_seq;

/**********************************/
/* Table Name: ��ǰ����¥ */
/**********************************/
CREATE TABLE DATES(
		DATES_NO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		DATES_DATE                    		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO) ON DELETE CASCADE
);

COMMENT ON TABLE DATES is '��ǰ����¥';
COMMENT ON COLUMN DATES.DATES_NO is '��ǰ����¥��ȣ';
COMMENT ON COLUMN DATES.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN DATES.DATES_DATE is '��ǰ����¥';





DROP SEQUENCE dates_seq;
CREATE SEQUENCE dates_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  commit;
select * from dates
select at_no from dates where dates_date='2020-09-05' group by at_no
---------------------------------------------------------------

-- 1)Create

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '1', '2020-07-01');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '1', '2020-07-01');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '1', '2020-07-01');


INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '1', '2020-07-02');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '1', '2020-07-02');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '2', '2020-07-02');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '2', '2020-07-02');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '2', '2020-07-02');

INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, '3', '2020-07-02');

-- ���� insert
INSERT INTO dates(dates_no, at_no, dates_date)
VALUES (dates_seq.nextval, at_seq.currval, '2020-09-02');

-- ���� delete
DELETE FROM dates
WHERE at_no=1 and dates_date='2020-06-03' and ROWNUM=1;

rollback;
---------------------------------------------------------

DELETE FROM dates
WHERE rn =
SELECT at_no,dates_date, rn FROM(
                    SELECT at_no, dates_date, rownum as rn
                    FROM dates
                    WHERE at_no= 1 and  dates_date='2020-07-01'
                 )WHERE rn =1


------------------------------------
SELECT at_no,dates_date, rn
FROM (
        SELECT at_no,dates_date, rn FROM(
                    SELECT at_no, dates_date, rownum as rn
                    FROM dates
                    WHERE at_no= 1 and  dates_date='2020-07-01'
                 )WHERE rn =1
     )
WHERE rn=1;
COMMIT;

-- 2)List

SELECT dates_no, at_no, dates_date
FROM dates
ORDER BY dates_no ASC; 


-- left outer join 
SELECT a.at_grp_no, a.at_no,b.at_no,a.at_name, b.dates_date, b.dates_no
FROM at a, dates b
WHERE a.at_no = b.at_no(+)
ORDER BY a.at_no ASC, b.dates_date ASC;



-- �ڻ�ǰ���������� �� ��� ���� ��� (list ����)
SELECT dates_date, COUNT(*) as cnt
FROM dates
WHERE at_no=1
GROUP BY dates_date
ORDER BY dates_date ASC;

-- Ư����¥ ��� ���� ��� (int ���� , null�� ��� 0����--group by �����ϸ� 0 ������ ��)

SELECT COUNT(*) as cnt
FROM dates
WHERE at_no=1  and dates_date='2020-09-01'
ORDER BY dates_date ASC;

--3)update
UPDATE dates
SET dates_date='2018-09-01'
WHERE at_no = 1;


