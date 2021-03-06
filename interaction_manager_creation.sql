/************************************
* CREATE TABLES/CONSTRAINTS
************************************/
CREATE TABLE COMMON_LOOKUP(
     COMMON_LOOKUP_ID NUMBER NOT NULL PRIMARY KEY
    , COMMON_LOOKUP_TABLE VARCHAR2(30) NOT NULL
    , COMMON_LOOKUP_COLUMN VARCHAR2(30) NOT NULL
    , COMMON_LOOKUP_TYPE VARCHAR2(30)
    , COMMON_LOOKUP_CODE VARCHAR2(8)
    , COMMON_LOOKUP_MEANING VARCHAR2(255) 
    , CREATED_BY NUMBER NOT NULL
    , CREATION_DATE DATE  NOT NULL
    , LAST_UPDATED_BY NUMBER NOT NULL
    , LAST_UPDATED_DATE DATE NOT NULL
);

CREATE TABLE CONTACT(
     CONTACT_ID NUMBER NOT NULL PRIMARY KEY
    , FK_CONTACT_TYPE NUMBER NOT NULL
    , LAST_NAME VARCHAR2(40) NOT NULL
    , FIRST_NAME VARCHAR2(40) NOT NULL
    , PRIMARY_PHONE NUMBER NOT NULL
    , SECONDARY_PHONE NUMBER
    , ADDRESS VARCHAR(120)
    , EMAIL VARCHAR(60) NOT NULL
    , FK_DEFAULT_CONTACT_METHOD NUMBER NOT NULL
    , CREATED_BY NUMBER NOT NULL
    , CREATION_DATE DATE  NOT NULL
    , LAST_UPDATED_BY NUMBER NOT NULL
    , LAST_UPDATED_DATE DATE NOT NULL
);

ALTER TABLE CONTACT ADD CONSTRAINT fk1_contact
FOREIGN KEY (FK_CONTACT_TYPE) REFERENCES COMMON_LOOKUP(COMMON_LOOKUP_ID);

ALTER TABLE CONTACT ADD CONSTRAINT fk2_contact
FOREIGN KEY (FK_DEFAULT_CONTACT_METHOD) REFERENCES COMMON_LOOKUP(COMMON_LOOKUP_ID);

CREATE TABLE SYSTEM_USER(
     SYSTEM_USER_ID NUMBER NOT NULL PRIMARY KEY
    , SYSTEM_USER_NAME VARCHAR2(20) NOT NULL
    , FK_CONTACT_ID NUMBER NOT NULL
    , FK_SYSTEM_USER_TYPE NUMBER
    , CREATED_BY NUMBER NOT NULL
    , CREATION_DATE DATE NOT NULL
    , LAST_UPDATED_BY NUMBER NOT NULL
    , LAST_UPDATED_DATE DATE NOT NULL
);

ALTER TABLE SYSTEM_USER ADD CONSTRAINT fk1_system_user
FOREIGN KEY (FK_SYSTEM_USER_TYPE) REFERENCES COMMON_LOOKUP(COMMON_LOOKUP_ID);


CREATE TABLE PROJECT(
     PROJECT_ID NUMBER NOT NULL PRIMARY KEY
    , FK_CONTACT_ID NUMBER
    , FK_SYSTEM_USER_ID NUMBER
    , FK_SEVERITY NUMBER
    , DUE_DATE DATE
    , NEXT_RESPONSE_DUE DATE
    , CREATED_BY NUMBER
    , CREATION_DATE DATE
    , LAST_UPDATED_BY NUMBER
    , LAST_UPDATED_DATE DATE
);

ALTER TABLE PROJECT ADD CONSTRAINT fk1_project
FOREIGN KEY (FK_CONTACT_ID) REFERENCES CONTACT(CONTACT_ID);

ALTER TABLE PROJECT ADD CONSTRAINT fk2_project
FOREIGN KEY (FK_SYSTEM_USER_ID) REFERENCES SYSTEM_USER(SYSTEM_USER_ID);

ALTER TABLE PROJECT ADD CONSTRAINT fk3_project
FOREIGN KEY (FK_SEVERITY) REFERENCES COMMON_LOOKUP(COMMON_LOOKUP_ID);

CREATE TABLE INTERACTION(
     INTERACTION_ID NUMBER NOT NULL PRIMARY KEY
    , FK_SYSTEM_USER_ID NUMBER NOT NULL
    , FK_CONTACT_ID NUMBER NOT NULL
    , FK_INTERACTION_TYPE NUMBER NOT NULL
    , INTERACTION_SOURCE_OBJECT CLOB NOT NULL 
    , CREATED_BY NUMBER
    , CREATION_DATE DATE
    , LAST_UPDATED_BY NUMBER
    , LAST_UPDATED_DATE DATE
);

ALTER TABLE INTERACTION ADD CONSTRAINT fk1_interaction
FOREIGN KEY (FK_SYSTEM_USER_ID) REFERENCES SYSTEM_USER(SYSTEM_USER_ID);

ALTER TABLE INTERACTION ADD CONSTRAINT fk2_interaction
FOREIGN KEY (FK_CONTACT_ID) REFERENCES CONTACT(CONTACT_ID);

ALTER TABLE INTERACTION ADD CONSTRAINT fk3_interaction
FOREIGN KEY (FK_INTERACTION_TYPE) REFERENCES COMMON_LOOKUP(COMMON_LOOKUP_ID);

CREATE TABLE INTER_PRO_JUNC(
          INTER_PRO_JUNC_ID NUMBER NOT NULL PRIMARY KEY
        , FK_INTERACTION_ID NUMBER
        , FK_PROJECT_ID NUMBER
);

ALTER TABLE INTER_PRO_JUNC 
        ADD CONSTRAINT fk1_inter_pro_junc
        FOREIGN KEY (FK_INTERACTION_ID) REFERENCES INTERACTION(INTERACTION_ID) ON DELETE CASCADE;

ALTER TABLE INTER_PRO_JUNC 
        ADD CONSTRAINT fk2_inter_pro_junc
        FOREIGN KEY (FK_PROJECT_ID) REFERENCES PROJECT(PROJECT_ID) ON DELETE CASCADE;

CREATE TABLE MESSAGE(
     MESSAGE_ID NUMBER NOT NULL PRIMARY KEY
    , FK_INTERACTION_ID NUMBER
    , MESSAGE VARCHAR2(1000) NOT NULL
    , CREATED_BY NUMBER NOT NULL
    , CREATION_DATE DATE NOT NULL
    , LAST_UPDATED_BY NUMBER NOT NULL
    , LAST_UPDATED_DATE DATE NOT NULL
);

ALTER TABLE MESSAGE ADD CONSTRAINT fk1_message
FOREIGN KEY (FK_INTERACTION_ID) REFERENCES INTERACTION(INTERACTION_ID);




/************************************
* CREATE SEQUENCES
************************************/
CREATE SEQUENCE common_lookup_s1;
CREATE SEQUENCE contact_s1;
CREATE SEQUENCE system_user_s1;
CREATE SEQUENCE project_s1;
CREATE SEQUENCE interaction_s1;
CREATE SEQUENCE inter_pro_junc_s1;
CREATE SEQUENCE message_s1;