/************************************
* DROP CONSTRAINTS
************************************/
ALTER TABLE contact DROP CONSTRAINT fk1_contact;
ALTER TABLE contact DROP CONSTRAINT fk2_contact;
ALTER TABLE system_user DROP CONSTRAINT fk1_system_user;
ALTER TABLE system_user DROP CONSTRAINT fk2_system_user;
ALTER TABLE project DROP CONSTRAINT fk1_project;
ALTER TABLE project DROP CONSTRAINT fk2_project;
ALTER TABLE project DROP CONSTRAINT fk3_project;
ALTER TABLE interaction DROP CONSTRAINT fk1_interaction;
ALTER TABLE interaction DROP CONSTRAINT fk2_interaction;
ALTER TABLE interaction DROP CONSTRAINT fk3_interaction;
ALTER TABLE inter_pro_junc DROP CONSTRAINT fk1_inter_pro_junc;
ALTER TABLE inter_pro_junc DROP CONSTRAINT fk2_inter_pro_junc;
ALTER TABLE message DROP CONSTRAINT fk1_message;

/************************************
* DROP TABLES
************************************/
DROP TABLE CONTACT;
DROP TABLE COMMON_LOOKUP;
DROP TABLE SYSTEM_USER;
DROP TABLE MESSAGE;
DROP TABLE INTERACTION;
DROP TABLE PROJECT;
DROP TABLE INTER_PRO_JUNC;

/************************************
* DROP SEQUENCES
************************************/
DROP SEQUENCE common_lookup_s1;
DROP SEQUENCE contact_s1;
DROP SEQUENCE system_user_s1;
DROP SEQUENCE project_s1;
DROP SEQUENCE interaction_s1;
DROP SEQUENCE inter_pro_junc_s1;
DROP SEQUENCE message_s1;