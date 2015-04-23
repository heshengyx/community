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