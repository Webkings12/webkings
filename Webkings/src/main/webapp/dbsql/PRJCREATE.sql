/* ȸ�� */
CREATE TABLE MEMBER (
	M_NO NUMBER NOT NULL, /* ȸ����ȣ */
	M_TYPE CHAR(1) DEFAULT '1' NOT NULL, /* ȸ�����а� */
	M_EMAIL VARCHAR2(100) NOT NULL, /* �̸��� */
	M_NICK VARCHAR2(100) NOT NULL, /* �г��� */
	M_PWD VARCHAR2(100) NOT NULL, /* ��й�ȣ */
	M_REGDATE DATE DEFAULT sysdate NOT NULL, /* ȸ������� */
	M_CHGDATE DATE /* ȸ�������� */
);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			M_NO
		);

/* ���θ� */
CREATE TABLE SHOP (
	S_NO NUMBER NOT NULL, /* ���θ�������ȣ */
	S_DOMAIN VARCHAR2(200) NOT NULL, /* ���θ������� */
	S_MSYN CHAR(1) DEFAULT 'N' NOT NULL, /* ����ϻ���Ʈ���� */
	S_NAME VARCHAR2(200) NOT NULL, /* ���θ��� */
	S_BIMAGE VARCHAR2(200), /* ���θ�ū�̹��� */
	S_SIMAGE VARCHAR2(200), /* ���θ������̹��� */
	S_BINFO CLOB, /* ���θ�ū���� */
	S_SINFO CLOB, /* ���θ��������� */
	S_GENDER CHAR(1) NOT NULL, /* ���θ��������а� */
	S_AGE CHAR(1) NOT NULL, /* ���θ����ɴ뱸�а� */
	S_STYLE CHAR(2) DEFAULT '00' NOT NULL, /* ���θ���Ÿ�ϱ��а� */
	S_STAFF VARCHAR2(200) NOT NULL, /* ����ڸ� */
	S_DEP VARCHAR2(200), /* �μ��� */
	S_POSITION VARCHAR2(200), /* ���� */
	S_TEL VARCHAR2(200), /* �������ȭ��ȣ */
	S_PHONE VARCHAR2(200), /* ������޴��� */
	S_EMAIL VARCHAR2(200), /* ������̸��� */
	S_HIT NUMBER DEFAULT 0 NOT NULL, /* ��ȸ�� */
	S_ACCYN CHAR(1) DEFAULT 'N' NOT NULL, /* �����û���� */
	S_ACCDATE DATE, /* �����û�� */
	S_PAYYN CHAR(1) DEFAULT 'N' NOT NULL, /* ����Ȯ������ */
	S_REGDATE DATE DEFAULT SYSDATE NOT NULL, /* ���θ������ */
	S_CHGDATE DATE, /* ���θ������� */
	C_NO NUMBER NOT NULL /* ����ڵ�Ϲ�ȣ */
);

ALTER TABLE SHOP
	ADD
		CONSTRAINT PK_SHOP
		PRIMARY KEY (
			S_NO
		);

/* ���� */
CREATE TABLE QNA (
	Q_NO NUMBER NOT NULL, /* ���ǹ�ȣ */
	Q_TITLE VARCHAR2(200) NOT NULL, /* �������� */
	Q_CONTENT CLOB NOT NULL, /* ���ǳ��� */
	Q_EMAIL VARCHAR2(200) NOT NULL, /* �����̸��� */
	Q_TEL VARCHAR2(200) NOT NULL, /* ���ǿ���ó */
	Q_REGDATE DATE DEFAULT SYSDATE NOT NULL, /* ���ǵ���� */
	M_NO NUMBER NOT NULL /* ȸ����ȣ */
);

ALTER TABLE QNA
	ADD
		CONSTRAINT PK_QNA
		PRIMARY KEY (
			Q_NO
		);

/* �����Խ��� */
CREATE TABLE FREEBOARD (
	B_NO NUMBER NOT NULL, /* �۹�ȣ */
	B_TITLE VARCHAR2(200) NOT NULL, /* ������ */
	B_CONTENT CLOB NOT NULL, /* �۳��� */
	B_FILENAME VARCHAR2(200), /* ���ε����ϸ� */
	B_FILESIZE NUMBER, /* ����ũ�� */
	B_ORIGINALFILENAME VARCHAR2(200), /* ���ϸ� */
	B_REGDATE DATE DEFAULT SYSDATE NOT NULL, /* �۵���� */
	B_CHGDATE DATE, /* �ۼ����� */
	M_NO NUMBER NOT NULL /* ȸ����ȣ */
);

ALTER TABLE FREEBOARD
	ADD
		CONSTRAINT PK_FREEBOARD
		PRIMARY KEY (
			B_NO
		);

/* ���� */
CREATE TABLE PAYMENT (
	P_NO NUMBER NOT NULL, /* �����Ϲ�ȣ */
	P_YEAR VARCHAR2(4) NOT NULL, /* �����⵵ */
	P_MONTH VARCHAR2(2) NOT NULL, /* ������ */
	P_DAY VARCHAR2(8) NOT NULL, /* ��������� */
	P_REGDATE DATE NOT NULL, /* �������� */
	P_EXTDATE DATE NOT NULL, /* �������� */
	S_NO NUMBER NOT NULL /* ���θ�������ȣ */
);

ALTER TABLE PAYMENT
	ADD
		CONSTRAINT PK_PAYMENT
		PRIMARY KEY (
			P_NO,
			P_YEAR,
			P_MONTH
		);

/* ��� */
CREATE TABLE REPLY (
	R_NO NUMBER NOT NULL, /* ��۹�ȣ */
	R_NO_GROUP NUMBER NOT NULL, /* ��۹�ȣ���а� */
	R_GBN NUMBER NOT NULL, /* ��۱��а� */
	R_CONTENT CLOB NOT NULL, /* ��۳��� */
	R_REGDATE DATE DEFAULT SYSDATE NOT NULL, /* ��۵���� */
	R_CHGDATE DATE, /* ��ۼ����� */
	B_NO NUMBER NOT NULL /* �۹�ȣ */
);

ALTER TABLE REPLY
	ADD
		CONSTRAINT PK_REPLY
		PRIMARY KEY (
			R_NO
		);

/* ����� */
CREATE TABLE CHIEF (
	C_NO NUMBER NOT NULL, /* ����ڵ�Ϲ�ȣ */
	C_NUMBER VARCHAR2(100) NOT NULL, /* ����ڹ�ȣ */
	C_EMAIL VARCHAR2(100), /* ������̸��� */
	C_PWD VARCHAR2(100), /* ����ں�й�ȣ */
	C_NAME VARCHAR2(100), /* ����ڸ� */
	C_CNAME VARCHAR2(200), /* ������ */
	C_ADD VARCHAR2(200), /* ������ּ� */
	C_REGDATE DATE DEFAULT SYSDATE NOT NULL, /* ����ڵ���� */
	C_CHGDATE DATE /* ����ڼ����� */
);

ALTER TABLE CHIEF
	ADD
		CONSTRAINT PK_CHIEF
		PRIMARY KEY (
			C_NO
		);

ALTER TABLE SHOP
	ADD
		CONSTRAINT FK_CHIEF_TO_SHOP
		FOREIGN KEY (
			C_NO
		)
		REFERENCES CHIEF (
			C_NO
		);

ALTER TABLE QNA
	ADD
		CONSTRAINT FK_MEMBER_TO_QNA
		FOREIGN KEY (
			M_NO
		)
		REFERENCES MEMBER (
			M_NO
		);

ALTER TABLE FREEBOARD
	ADD
		CONSTRAINT FK_MEMBER_TO_FREEBOARD
		FOREIGN KEY (
			M_NO
		)
		REFERENCES MEMBER (
			M_NO
		);

ALTER TABLE PAYMENT
	ADD
		CONSTRAINT FK_SHOP_TO_PAYMENT
		FOREIGN KEY (
			S_NO
		)
		REFERENCES SHOP (
			S_NO
		);

ALTER TABLE REPLY
	ADD
		CONSTRAINT FK_FREEBOARD_TO_REPLY
		FOREIGN KEY (
			B_NO
		)
		REFERENCES FREEBOARD (
			B_NO
		);