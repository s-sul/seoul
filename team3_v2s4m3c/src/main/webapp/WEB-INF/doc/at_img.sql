DROP TABLE AT_IMG CASCADE CONSTRAINTS;
DROP SEQUENCE at_img_seq;

/**********************************/
/* Table Name: ��ǰ�̹��� */
/**********************************/
CREATE TABLE AT_IMG(
		AT_IMG_NO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		AT_IMG_FNAME                  		VARCHAR2(100)		 NOT NULL,
		AT_IMG_FUPNAME                		VARCHAR2(100)		 NOT NULL,
		AT_IMG_THUMB                  		VARCHAR2(100)		 NOT NULL,
		AT_IMG_SIZE                   		NUMBER(10)		 NOT NULL,
        AT_IMG_SEQNO                    NUMBER(7)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE AT_IMG is '��ǰ�̹���';
COMMENT ON COLUMN AT_IMG.AT_IMG_NO is '��ǰ�̹�����ȣ';
COMMENT ON COLUMN AT_IMG.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN AT_IMG.AT_IMG_FNAME is '��ǰ�̹��������̸�';
COMMENT ON COLUMN AT_IMG.AT_IMG_FUPNAME is '��ǰ�̹������ε��̸�';
COMMENT ON COLUMN AT_IMG.AT_IMG_THUMB is '��ǰ�̹��������';
COMMENT ON COLUMN AT_IMG.AT_IMG_SIZE is '��ǰ�̹���������';
COMMENT ON COLUMN AT_IMG.AT_IMG_SEQNO is '��ǰ�̹�������';

DROP SEQUENCE at_img_seq;
CREATE SEQUENCE at_img_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  commit;
  
SELECT *
from at_img
where at_no=1;

SELECT at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size
from at_img
ORDER BY at_no ASC, at_img_no ASC;


DELETE FROM at_img
WHERE at_img_no=1;


INSERT INTO COUNTRIES(
        COUNTRY_ID,
        COUNTRY_NAME,
        REGION_ID) 
    VALUES(
        'CB',
        'CODING BUB',
        (SELECT NVL(MAX(REGION_ID)+1,0) FROM COUNTRIES));

-- insert ���� ���� ��ŭ �ݺ�
insert into at_img(at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size, at_img_seqno)
values(at_img_seq.nextval, 1, 'aaa', 'ù��°�̹���', 'ccc', '0', (select count(*) from at_img where at_no=1));

  
SELECT *
from at_img
commit;


insert into at_img(at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size,at_img_seqno)
values(at_img_seq.nextval, 1, 'aaa', '�ι�°', 'ccc', '0', ((select count (*) as cnt from at_img)+1);

insert into at_img(at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size,at_img_seqno)
values(at_img_seq.nextval, 1, 'aaa', '����°', 'ccc', '0', (select count (*) as cnt from at_img)+1);


insert into at_img(at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size,at_img_seqno)
values(at_img_seq.nextval, 2, 'aaa', 'ù��°', 'ccc', '0',(select count (*) as cnt from at_img));


insert into at_img(at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size,at_img_seqno)
values(at_img_seq.nextval, 2, 'aaa', '�ι�°', 'ccc', '0', (select count (*) as cnt from at_img));

insert into at_img(at_img_no, at_no, at_img_fname, at_img_fupname, at_img_thumb, at_img_size,at_img_seqno)
values(at_img_seq.nextval, 3, 'aaa', 'ù��°', 'ccc', '0',  (select count (*) as cnt from at_img));

rollback;







