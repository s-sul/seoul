DROP TABLE PAY_DETAIL CASCADE CONSTRAINTS;
DROP TABLE AT_IMG CASCADE CONSTRAINTS;
DROP TABLE MEM_LOG_HIS CASCADE CONSTRAINTS;
DROP TABLE AT_REV_FILE CASCADE CONSTRAINTS;
DROP TABLE NOTI_FILE CASCADE CONSTRAINTS;
DROP TABLE USE_POINT CASCADE CONSTRAINTS;
DROP TABLE PAY CASCADE CONSTRAINTS;
DROP TABLE REVIEWANS CASCADE CONSTRAINTS;
DROP TABLE AT_REV CASCADE CONSTRAINTS;
DROP TABLE MEM_WISHLIST CASCADE CONSTRAINTS;
DROP TABLE MEM CASCADE CONSTRAINTS;
DROP TABLE MEM_HIS CASCADE CONSTRAINTS;
DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE SAVE_POINT CASCADE CONSTRAINTS;
DROP TABLE Q CASCADE CONSTRAINTS;
DROP TABLE NOTI CASCADE CONSTRAINTS;
DROP TABLE SURV_RES CASCADE CONSTRAINTS;
DROP TABLE SURV_ITEM CASCADE CONSTRAINTS;
DROP TABLE SURV CASCADE CONSTRAINTS;
DROP TABLE DATES CASCADE CONSTRAINTS;
DROP TABLE AT CASCADE CONSTRAINTS;
DROP TABLE AT_GRP CASCADE CONSTRAINTS;

/**********************************/
/* Table Name: ��ǰ�׷� */
/**********************************/
CREATE TABLE AT_GRP(
		AT_GRP_NO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_GRP_NAME                   		VARCHAR2(50)		 NOT NULL,
		AT_GRP_SEQNO                  		NUMBER(7)		 NOT NULL,
		AT_GRP_VISIBLE                		CHAR(1)		 DEFAULT "Y"		 NOT NULL
);

COMMENT ON TABLE AT_GRP is '��ǰ�׷�';
COMMENT ON COLUMN AT_GRP.AT_GRP_NO is '��ǰ�׷��ȣ';
COMMENT ON COLUMN AT_GRP.AT_GRP_NAME is '��ǰ�׷��';
COMMENT ON COLUMN AT_GRP.AT_GRP_SEQNO is '��ǰ�׷���¼���';
COMMENT ON COLUMN AT_GRP.AT_GRP_VISIBLE is '��ǰ�׷���¸��';


/**********************************/
/* Table Name: ��ǰ */
/**********************************/
CREATE TABLE AT(
		AT_NO                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_GRP_NO                     		NUMBER(10)		 NOT NULL,
		AT_SEQNO                      		NUMBER(7)		 NOT NULL,
		AT_VISIBLE                    		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		AT_NAME                       		VARCHAR2(100)		 NOT NULL,
		AT_DETAIL                     		VARCHAR2(100)		 NOT NULL,
		AT_PRICE                      		NUMBER(10)		 NOT NULL,
		AT_CONTENT                    		CLOB		 NOT NULL,
		AT_CANCLE                     		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		AT_LOWEST                     		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		AT_HIT                        		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		AT_DUR                        		NUMBER(10)		 NOT NULL,
		AT_LANG                       		VARCHAR2(100)		 NOT NULL,
		AT_SNS                        		VARCHAR2(1000)		 NOT NULL,
		AT_MAP                        		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (AT_GRP_NO) REFERENCES AT_GRP (AT_GRP_NO)
);

COMMENT ON TABLE AT is '��ǰ';
COMMENT ON COLUMN AT.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN AT.AT_GRP_NO is '��ǰ�׷��ȣ';
COMMENT ON COLUMN AT.AT_SEQNO is '��ǰ��¼���';
COMMENT ON COLUMN AT.AT_VISIBLE is '��ǰ��¸��';
COMMENT ON COLUMN AT.AT_NAME is '��ǰ��';
COMMENT ON COLUMN AT.AT_DETAIL is '��ǰ���';
COMMENT ON COLUMN AT.AT_PRICE is '��ǰ����';
COMMENT ON COLUMN AT.AT_CONTENT is '��ǰ����';
COMMENT ON COLUMN AT.AT_CANCLE is '��ǰ��Ұ��ɿ���';
COMMENT ON COLUMN AT.AT_LOWEST is '��ǰ���������忩��';
COMMENT ON COLUMN AT.AT_HIT is '��ǰ��ȸ��';
COMMENT ON COLUMN AT.AT_DUR is '��ǰ�ҿ�ð�';
COMMENT ON COLUMN AT.AT_LANG is '��ǰ�������';
COMMENT ON COLUMN AT.AT_SNS is '��ǰ�Ҽ�';
COMMENT ON COLUMN AT.AT_MAP is '��ǰ����';


/**********************************/
/* Table Name: ��ǰ����¥ */
/**********************************/
CREATE TABLE DATES(
		DATES_NO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		DATES_DATE                    		VARCHAR2(100)		 NOT NULL,
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE DATES is '��ǰ����¥';
COMMENT ON COLUMN DATES.DATES_NO is '��ǰ����¥��ȣ';
COMMENT ON COLUMN DATES.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN DATES.DATES_DATE is '��ǰ����¥';


/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE SURV(
		SURV_NO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		SURV_TITLE                    		VARCHAR2(300)		 NOT NULL,
		SURV_STARTDATE                		VARCHAR2(20)		 NOT NULL,
		SURV_ENDDATE                  		VARCHAR2(20)		 NOT NULL,
		SURV_CNT                      		NUMBER(10)		 NOT NULL,
		SURV_CONTINUE                 		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE SURV is '��������';
COMMENT ON COLUMN SURV.SURV_NO is '���������ȣ';
COMMENT ON COLUMN SURV.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN SURV.SURV_TITLE is '������������';
COMMENT ON COLUMN SURV.SURV_STARTDATE is '����������۳�¥';
COMMENT ON COLUMN SURV.SURV_ENDDATE is '�����������ᳯ¥';
COMMENT ON COLUMN SURV.SURV_CNT is '�������������ο�';
COMMENT ON COLUMN SURV.SURV_CONTINUE is '�����������࿩��';


/**********************************/
/* Table Name: �����׸� */
/**********************************/
CREATE TABLE SURV_ITEM(
		SURV_ITEM_NO                  		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		SURV_NO                       		NUMBER(10)		 NOT NULL,
		SUR_ITEM                      		VARCHAR2(300)		 NOT NULL,
		SUR_ITEM_CNT                  		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE SURV_ITEM is '�����׸�';
COMMENT ON COLUMN SURV_ITEM.SURV_ITEM_NO is '�����׸��ȣ';
COMMENT ON COLUMN SURV_ITEM.SURV_NO is '���������ȣ';
COMMENT ON COLUMN SURV_ITEM.SUR_ITEM is '�����׸�';
COMMENT ON COLUMN SURV_ITEM.SUR_ITEM_CNT is '�����׸����ο�';


/**********************************/
/* Table Name: ������� */
/**********************************/
CREATE TABLE SURV_RES(
		SURV_RES_NO                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		SURV_ITEM_NO                  		NUMBER(10)		 NOT NULL,
		SURV_DATE                     		DATE		 NOT NULL,
		SURV_RES                      		INTEGER(10)		 NOT NULL
);

COMMENT ON TABLE SURV_RES is '�������';
COMMENT ON COLUMN SURV_RES.SURV_RES_NO is '���������ȣ';
COMMENT ON COLUMN SURV_RES.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN SURV_RES.SURV_ITEM_NO is '�����׸��ȣ';
COMMENT ON COLUMN SURV_RES.SURV_DATE is '���������¥';
COMMENT ON COLUMN SURV_RES.SURV_RES is '�������';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE NOTI(
		NOTI_NO                       		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		NOTI_TITLE                    		VARCHAR2(100)		 NOT NULL,
		NOTI_CONTENT                  		CLOB(4000)		 NOT NULL,
		NOTI_RNAME                    		VARCHAR2(20)		 NOT NULL,
		NOTI_PASSWD                   		VARCHAR2(20)		 NOT NULL,
		NOTI_RDATE                    		DATE		 NOT NULL
);

COMMENT ON TABLE NOTI is '����';
COMMENT ON COLUMN NOTI.NOTI_NO is '������ȣ';
COMMENT ON COLUMN NOTI.MEM_NO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN NOTI.NOTI_TITLE is '��������';
COMMENT ON COLUMN NOTI.NOTI_CONTENT is '��������';
COMMENT ON COLUMN NOTI.NOTI_RNAME is '���������';
COMMENT ON COLUMN NOTI.NOTI_PASSWD is '���������ȣ';
COMMENT ON COLUMN NOTI.NOTI_RDATE is '���������';


/**********************************/
/* Table Name: ���ǻ��� */
/**********************************/
CREATE TABLE Q(
		CENTERNO                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NULL 
);

COMMENT ON TABLE Q is '���ǻ���';
COMMENT ON COLUMN Q.CENTERNO is '������';
COMMENT ON COLUMN Q.MEM_NO is 'ȸ�� ��ȣ';


/**********************************/
/* Table Name: ����Ʈ�������� */
/**********************************/
CREATE TABLE SAVE_POINT(
		SAVE_POINT_NO                 		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		PAY_DETAIL_NO                 		INTEGER(10)		 NOT NULL
);

COMMENT ON TABLE SAVE_POINT is '����Ʈ��������';
COMMENT ON COLUMN SAVE_POINT.SAVE_POINT_NO is '����Ʈ����������ȣ';
COMMENT ON COLUMN SAVE_POINT.PAY_DETAIL_NO is '�������γ�����ȣ';


/**********************************/
/* Table Name: ��ٱ��� */
/**********************************/
CREATE TABLE CART(
		CART_NO                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE CART is '��ٱ���';
COMMENT ON COLUMN CART.CART_NO is '��ٱ��Ϲ�ȣ';
COMMENT ON COLUMN CART.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN CART.MEM_NO is 'ȸ����ȣ';


/**********************************/
/* Table Name: ȸ�������̷� */
/**********************************/
CREATE TABLE MEM_HIS(
		MEM_HIS_NO                    		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		PAY_NO                        		NUMBER(10)		 NULL 
);

COMMENT ON TABLE MEM_HIS is 'ȸ�������̷�';
COMMENT ON COLUMN MEM_HIS.MEM_HIS_NO is 'ȸ�������̷¹�ȣ';
COMMENT ON COLUMN MEM_HIS.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN MEM_HIS.PAY_NO is '����������ȣ';


/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE MEM(
		MEM_NO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_ID                        		VARCHAR2(60)		 NOT NULL,
		MEM_PW                        		VARCHAR2(60)		 NOT NULL,
		MEM_NAME                      		VARCHAR2(20)		 NOT NULL,
		MEM_ADRESS                    		VARCHAR2(400)		 NOT NULL,
		MEM_ZIPCODE                   		NUMBER(10)		 NOT NULL,
		MEM_PHONE                     		NUMBER(20)		 NOT NULL,
		MEM_POINT                     		NUMBER(10)		 NOT NULL,
		MEM_RDATE                     		DATE		 NOT NULL,
		POINT                         		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE MEM is 'ȸ��';
COMMENT ON COLUMN MEM.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN MEM.MEM_ID is 'ȸ�����̵�';
COMMENT ON COLUMN MEM.MEM_PW is 'ȸ����й�ȣ';
COMMENT ON COLUMN MEM.MEM_NAME is 'ȸ����';
COMMENT ON COLUMN MEM.MEM_ADRESS is 'ȸ���ּ�';
COMMENT ON COLUMN MEM.MEM_ZIPCODE is 'ȸ�������ȣ';
COMMENT ON COLUMN MEM.MEM_PHONE is 'ȸ����ȭ��ȣ';
COMMENT ON COLUMN MEM.MEM_POINT is 'ȸ������Ʈ';
COMMENT ON COLUMN MEM.MEM_RDATE is 'ȸ��������';
COMMENT ON COLUMN MEM.POINT is '����Ʈ';


/**********************************/
/* Table Name: ȸ�����ø���Ʈ */
/**********************************/
CREATE TABLE MEM_WISHLIST(
		MEM_NO                        		NUMBER(10)		 NULL ,
		AT_NO                         		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE MEM_WISHLIST is 'ȸ�����ø���Ʈ';
COMMENT ON COLUMN MEM_WISHLIST.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN MEM_WISHLIST.AT_NO is '��ǰ��ȣ';


/**********************************/
/* Table Name: ��ǰ���� */
/**********************************/
CREATE TABLE AT_REV(
		AT_REV_NO                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_NO                         		NUMBER(10)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		AT_REV_TITLE                  		VARCHAR2(300)		 NOT NULL,
		AT_REV_CONTENT                		VARCHAR2(600)		 NOT NULL,
		AT_REV_IMAGE                  		VARCHAR2(100)		 NOT NULL,
		AT_REV_HIT                    		NUMBER(10)		 NOT NULL,
		AT_REV_CNT                    		NUMBER(10)		 NOT NULL,
		AT_REV_GRADE                  		NUMBER(10)		 NOT NULL,
		AT_REV_TOT_GRADE              		NUMBER(10)		 NOT NULL,
		AT_REV_GOOD_CNT               		NUMBER(10)		 NOT NULL,
		AT_REV_VISIBLE                		CHAR(1)		 NOT NULL,
		AT_REV_DATE                   		DATE		 NOT NULL
);

COMMENT ON TABLE AT_REV is '��ǰ����';
COMMENT ON COLUMN AT_REV.AT_REV_NO is '��ǰ�����ȣ';
COMMENT ON COLUMN AT_REV.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN AT_REV.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN AT_REV.AT_REV_TITLE is '��ǰ��������';
COMMENT ON COLUMN AT_REV.AT_REV_CONTENT is '��ǰ���䳻��';
COMMENT ON COLUMN AT_REV.AT_REV_IMAGE is '��ǰ�����̹�������';
COMMENT ON COLUMN AT_REV.AT_REV_HIT is '��ǰ������ȸ��';
COMMENT ON COLUMN AT_REV.AT_REV_CNT is '��ǰ���䰳��';
COMMENT ON COLUMN AT_REV.AT_REV_GRADE is '��ǰ��������';
COMMENT ON COLUMN AT_REV.AT_REV_TOT_GRADE is '��ǰ����������';
COMMENT ON COLUMN AT_REV.AT_REV_GOOD_CNT is '��ǰ������õ��';
COMMENT ON COLUMN AT_REV.AT_REV_VISIBLE is '��ǰ������¸��';
COMMENT ON COLUMN AT_REV.AT_REV_DATE is '��ǰ��������';


/**********************************/
/* Table Name: ��ǰ������ */
/**********************************/
CREATE TABLE REVIEWANS(
		REVIEWANSNO                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NULL ,
		AT_REV_NO                     		NUMBER(10)		 NULL ,
		REVIEWANSTITLE                		VARCHAR2(200)		 NOT NULL,
		REVIEWANSCONTENT              		VARCHAR2(500)		 NOT NULL,
		REVIEWANSRDATE                		DATE		 NOT NULL,
		REVIEWANSCNT                  		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE REVIEWANS is '��ǰ������';
COMMENT ON COLUMN REVIEWANS.REVIEWANSNO is '��ǰ�����۹�ȣ';
COMMENT ON COLUMN REVIEWANS.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN REVIEWANS.AT_REV_NO is '��ǰ�����ȣ';
COMMENT ON COLUMN REVIEWANS.REVIEWANSTITLE is '��ǰ����������';
COMMENT ON COLUMN REVIEWANS.REVIEWANSCONTENT is '��ǰ�����۳���';
COMMENT ON COLUMN REVIEWANS.REVIEWANSRDATE is '��ǰ����亯����';
COMMENT ON COLUMN REVIEWANS.REVIEWANSCNT is '��ǰ����亯��ȸ��';


/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE PAY(
		PAY_NO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL,
		AT_NO                         		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE PAY is '��������';
COMMENT ON COLUMN PAY.PAY_NO is '����������ȣ';
COMMENT ON COLUMN PAY.MEM_NO is 'ȸ����ȣ';
COMMENT ON COLUMN PAY.AT_NO is '��ǰ��ȣ';


/**********************************/
/* Table Name: ����Ʈ��볻�� */
/**********************************/
CREATE TABLE USE_POINT(
		USE_POINT_NO                  		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		PAY_NO                        		NUMBER(10)		 NULL 
);

COMMENT ON TABLE USE_POINT is '����Ʈ��볻��';
COMMENT ON COLUMN USE_POINT.USE_POINT_NO is '����Ʈ��볻����ȣ';
COMMENT ON COLUMN USE_POINT.PAY_NO is '����������ȣ';


/**********************************/
/* Table Name: ����÷������ */
/**********************************/
CREATE TABLE NOTI_FILE(
		NOTI_FILE_NO                  		NUMBER(7)		 NOT NULL		 PRIMARY KEY,
		NOTI_NO                       		NUMBER(7)		 NULL 
);

COMMENT ON TABLE NOTI_FILE is '����÷������';
COMMENT ON COLUMN NOTI_FILE.NOTI_FILE_NO is '����÷�����Ϲ�ȣ';
COMMENT ON COLUMN NOTI_FILE.NOTI_NO is '������ȣ';


/**********************************/
/* Table Name: ��ǰ����÷������ */
/**********************************/
CREATE TABLE AT_REV_FILE(
		AT_REV_FILE_NO                		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		AT_REV_NO                     		NUMBER(10)		 NULL 
);

COMMENT ON TABLE AT_REV_FILE is '��ǰ����÷������';
COMMENT ON COLUMN AT_REV_FILE.AT_REV_FILE_NO is '��ǰ����÷�����Ϲ�ȣ';
COMMENT ON COLUMN AT_REV_FILE.AT_REV_NO is '��ǰ�����ȣ';


/**********************************/
/* Table Name: ȸ���α��γ��� */
/**********************************/
CREATE TABLE MEM_LOG_HIS(
		MEM_LOG_HIS_NO                		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_NO                        		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE MEM_LOG_HIS is 'ȸ���α��γ���';
COMMENT ON COLUMN MEM_LOG_HIS.MEM_LOG_HIS_NO is 'ȸ���α��γ�����ȣ';
COMMENT ON COLUMN MEM_LOG_HIS.MEM_NO is 'ȸ����ȣ';


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
  FOREIGN KEY (AT_NO) REFERENCES AT (AT_NO)
);

COMMENT ON TABLE AT_IMG is '��ǰ�̹���';
COMMENT ON COLUMN AT_IMG.AT_IMG_NO is '��ǰ�̹�����ȣ';
COMMENT ON COLUMN AT_IMG.AT_NO is '��ǰ��ȣ';
COMMENT ON COLUMN AT_IMG.AT_IMG_FNAME is '��ǰ�̹��������̸�';
COMMENT ON COLUMN AT_IMG.AT_IMG_FUPNAME is '��ǰ�̹������ε��̸�';
COMMENT ON COLUMN AT_IMG.AT_IMG_THUMB is '��ǰ�̹��������';
COMMENT ON COLUMN AT_IMG.AT_IMG_SIZE is '��ǰ�̹���������';


/**********************************/
/* Table Name: �������γ��� */
/**********************************/
CREATE TABLE PAY_DETAIL(
		PAY_DETAIL_NO                 		INTEGER(10)		 NOT NULL		 PRIMARY KEY,
		PAY_NO                        		NUMBER(10)		 NULL 
);

COMMENT ON TABLE PAY_DETAIL is '�������γ���';
COMMENT ON COLUMN PAY_DETAIL.PAY_DETAIL_NO is '�������γ�����ȣ';
COMMENT ON COLUMN PAY_DETAIL.PAY_NO is '����������ȣ';


