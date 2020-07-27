-- ���̺� ����
DROP TABLE admin;
CREATE TABLE admin(
adminno             NUMBER(10)  NOT NULL  PRIMARY KEY, -- ������ ��ȣ
admin_id             VARCHAR2(100)  NOT NULL, -- ������ ���̵�
admin_passwd      VARCHAR2(100)  NOT NULL, -- ������ ��й�ȣ
admin_mname      VARCHAR(30)   NOT NULL, -- ����
admin_nickname   VARCHAR(30)   NOT NULL, -- ����
admin_email        VARCHAR2(100)  NOT NULL, -- ������ �̸���
admin_phone       VARCHAR(15)   NOT NULL, -- ������ ��ȭ��ȣ
admin_mdate       DATE             NOT NULL -- ������    
);

COMMENT ON TABLE admin is '������';
COMMENT ON COLUMN admin.adminno is '������ ��ȣ';
COMMENT ON COLUMN admin.admin_id is '������ ���̵�';
COMMENT ON COLUMN admin.admin_passwd is '������ ��й�ȣ';
COMMENT ON COLUMN admin.admin_mname is '����';
COMMENT ON COLUMN admin.admin_nickname is '����';
COMMENT ON COLUMN admin.admin_email is '������ �̸���';
COMMENT ON COLUMN admin.admin_phone is '������ ��ȭ��ȣ';
COMMENT ON COLUMN admin.admin_mdate is '������';


DROP SEQUENCE admin_seq;
CREATE SEQUENCE admin_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
 

1 ���
1) id �ߺ� Ȯ��
SELECT COUNT(admin_id) as cnt
FROM admin
WHERE admin_id='user1';
 
 cnt
 ---
   0   �� �ߺ� ���� ����.

2) ���   
-- �����ڿ� ����
INSERT INTO admin(adminno, admin_id, admin_passwd, admin_mname, admin_nickname, admin_email, admin_phone, admin_mdate)
VALUES (admin_seq.nextval, 'qnaadmin', '1234', 'QNA������', 'QNA', 'QA@gmail.com', '000-0000-0000', sysdate);

INSERT INTO admin(adminno, admin_id, admin_passwd, admin_mname, admin_nickname, admin_email, admin_phone, admin_mdate)
VALUES (admin_seq.nextval, 'crm', '1234', '��������', '��', 'crm@gmail.com', '000-0000-0001', sysdate);

INSERT INTO admin(adminno, admin_id, admin_passwd, admin_mname, admin_nickname, admin_email, admin_phone, admin_mdate)
VALUES (admin_seq.nextval, 'notice', '1234', '�������װ�����', '����', 'notice@gmail.com', '000-0000-0002', sysdate);

commit;

2. ���
-- �˻��� ���� �ʴ� ���, ��ü ��� ���
SELECT adminno, admin_id, admin_passwd, admin_mname, admin_nickname, admin_email, admin_phone, admin_mdate
FROM admin
ORDER BY adminno ASC;


3. ��ȸ
1) admin1 ������ ���� ����
SELECT adminno, admin_id, admin_passwd, admin_mname, admin_nickname, admin_email, admin_phone, admin_mdate
FROM admin
WHERE adminno = 4;

4. ����
UPDATE admin
SET admin_nickname='QA'
WHERE adminno=4;


5. �н����� ����
1) �н����� �˻�
SELECT COUNT(adminno) as cnt
FROM admin
WHERE adminno=4 AND admin_passwd='1234';


2) �н����� ����
UPDATE admin
SET admin_passwd='0000'
WHERE adminno=4;


6. ����
1) ��� ����
DELETE FROM admin;

2) Ư�� ������ ����
DELETE FROM admin
WHERE adminno=3;


7. �α���
SELECT COUNT(adminno) as cnt
FROM admin
WHERE admin_id='qnaadmin' AND admin_passwd='1234';

 cnt
 ---
   0