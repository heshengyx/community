CREATE TABLE USER
(
    ID VARCHAR(50) NOT NULL,
    NAME VARCHAR(100),
    ACCOUNT VARCHAR(100),
    PASSWORD VARCHAR(100),
    STATUS CHAR(1),
    CREATE_TIME TIMESTAMP,
    UPDATE_TIME TIMESTAMP,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);

CREATE TABLE USER_ROLE
(
    USER_ID VARCHAR(50) NOT NULL,
	ROLE_ID VARCHAR(50) NOT NULL
);

CREATE TABLE ROLE
(
    ID VARCHAR(50) NOT NULL,
    NAME VARCHAR(100),
    STATUS CHAR(1),
    CREATE_TIME TIMESTAMP,
    UPDATE_TIME TIMESTAMP,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);

CREATE TABLE ROLE_PERMISSION
(
	ROLE_ID VARCHAR(50) NOT NULL,
	PERMISSION_ID VARCHAR(50) NOT NULL
);

CREATE TABLE PERMISSION
(
    ID VARCHAR(50) NOT NULL,
    PARENT_ID VARCHAR(50),
    NAME VARCHAR(100),
    URL VARCHAR(100),
    STATUS CHAR(1),
    CREATE_TIME TIMESTAMP,
    UPDATE_TIME TIMESTAMP,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);
INSERT INTO USER(ID, NAME, ACCOUNT, PASSWORD, STATUS) VALUES('e78fc614ce459cc167000', 'lock', 'lock', '123456', '1')
INSERT INTO USER(ID, NAME, ACCOUNT, PASSWORD, STATUS) VALUES('e78fc614ce459cc168000', 'jack', 'jack', '123456', '1')
INSERT INTO ROLE(ID, NAME, STATUS) VALUES('e78fc614ce459cc168001', 'manage', '1')
INSERT INTO PERMISSION(ID, NAME, URL, STATUS) VALUES('e78fc614ce459cc168002', 'manage:building', '/manage/building', '1')
INSERT INTO USER_ROLE(USER_ID, ROLE_ID) VALUES('e78fc614ce459cc168000', 'e78fc614ce459cc168001')
INSERT INTO ROLE_PERMISSION(ROLE_ID, PERMISSION_ID) VALUES('e78fc614ce459cc168001', 'e78fc614ce459cc168002')

CREATE TABLE BUILDING
(
    ID VARCHAR(50) NOT NULL,
    TOWN_ID VARCHAR(50),
    BUILDING_NAME VARCHAR(100),
    BUILDING_YEAR VARCHAR(100),
    BUILDING_FLOOR VARCHAR(100),
    STATUS CHAR(1),
    CREATE_TIME TIMESTAMP,
    UPDATE_TIME TIMESTAMP,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);
INSERT INTO BUILDING(ID, BUILDING_NAME, BUILDING_YEAR, BUILDING_FLOOR, STATUS) VALUES('c78fc614ce459cc168000', '���Ϲ㳡', '2001', '56', '1')

CREATE TABLE REGION
(
    ID VARCHAR(50) NOT NULL,
    PARENT_ID VARCHAR(50),
    NAME VARCHAR(100),
    CODE VARCHAR(100),
    LEVEL CHAR(1),
    STATUS CHAR(1),
    CREATE_TIME TIMESTAMP,
    UPDATE_TIME TIMESTAMP,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
)