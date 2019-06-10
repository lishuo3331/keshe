/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018-08-28 15:40:49                          */
/*==============================================================*/


drop table if exists T_D0_FUND;

drop table if exists T_D0_LEADER;

drop table if exists T_D0_ORGANIZATION;

drop table if exists T_D0_ORGATTACHED;

drop table if exists T_D0_SECTION;

drop table if exists T_D0_STUFF;

/*==============================================================*/
/* Table: T_D0_FUND                                             */
/*==============================================================*/
create table T_D0_FUND
(
   id                   VARCHAR(50) not null comment 'id',
   orgId                VARCHAR(50),
   orgName              VARCHAR(120),
   orgNo                VARCHAR(15) comment '�������ڲ�����:��������9λ+3λ��ˮ',
   orgCode              VARCHAR(10) comment '��������',
   yearly               VARCHAR(4),
   preFund              decimal(6,2),
   businessFund         decimal(6,2),
   dutyFund             decimal(6,2),
   buildFund            decimal(6,2),
   primary key (id)
);

alter table T_D0_FUND comment '��������';

/*==============================================================*/
/* Table: T_D0_LEADER                                           */
/*==============================================================*/
create table T_D0_LEADER
(
   id                   VARCHAR(50) not null comment 'id',
   orgId                VARCHAR(50),
   orgName              VARCHAR(120),
   orgNo                VARCHAR(15) comment '�������ڲ�����:��������9λ+3λ��ˮ',
   orgCode              VARCHAR(10) comment '��������',
   formFillingMan       VARCHAR(30) comment '�����',
   linkTel              VARCHAR(15) comment '�����ϵ�绰',
   leaderName           VARCHAR(30) comment '�쵼����',
   gender               VARCHAR(2) comment '�Ա�',
   folk                 VARCHAR(10) comment '����',
   birthDate            TIMESTAMP NULL DEFAULT NULL  comment '��������',
   pol                  VARCHAR(1),
   edu                  VARCHAR(2),
   degree               VARCHAR(8),
   manageJob            VARCHAR(0) comment 'ְ��',
   title                VARCHAR(4) comment 'ְ��',
   memo                 VARCHAR(500),
   serDate              TIMESTAMP NULL DEFAULT NULL  ,
   leaveDate            TIMESTAMP NULL DEFAULT NULL ,
   yearly               VARCHAR(4),
   primary key (id)
);

alter table T_D0_LEADER comment '�쵼��¼';

/*==============================================================*/
/* Table: T_D0_ORGANIZATION                                     */
/*==============================================================*/
create table T_D0_ORGANIZATION
(
   id                   VARCHAR(50) not null comment 'id',
   orgNo                VARCHAR(12) comment '�������ڲ�����:��������9λ+3λ��ˮ',
   orgCode              VARCHAR(10) comment '��������',
   orgName              VARCHAR(120) comment '��������',
   exeType              VARCHAR(1) comment '1�������ල������2���������ţ�3��Э����λ',
   areaCode             VARCHAR(9),
   linkAdd              VARCHAR(100),
   listingDate          TIMESTAMP NULL DEFAULT NULL ,
   standaloneDate       TIMESTAMP NULL DEFAULT NULL ,
   areaType             VARCHAR(1) comment '���������',
   zbbdocDate           TIMESTAMP NULL DEFAULT NULL ,
   orgLevel             VARCHAR(1),
   orgPro               VARCHAR(1) comment '��������',
   ZIPCODE              VARCHAR(6),
   primary key (id)
);

alter table T_D0_ORGANIZATION comment '��֯������';

/*==============================================================*/
/* Table: T_D0_ORGATTACHED                                      */
/*==============================================================*/
create table T_D0_ORGATTACHED
(
   id                   VARCHAR(50) not null comment 'id',
   orgId                VARCHAR(50),
   orgName              VARCHAR(120),
   orgNo                VARCHAR(15) comment '�������ڲ�����:��������9λ+3λ��ˮ',
   orgCode              VARCHAR(10) comment '��������',
   onworkerNum          decimal(6,0),
   supervisorNum        decimal(6,0),
   zbbNum               decimal(3,0),
   ifPublicmanage       VARCHAR(1),
   retireNum            decimal(6,0),
   officeBuildarea      decimal(4,0),
   buildingOwnership    VARCHAR(1) comment '��������Ȩ',
   officeBuildingarea   decimal(4,0) comment '�칫�÷��ڽ����',
   businessDivCount     decimal(2,0),
   funDivCount          decimal(4,0),
   orgCount             decimal(4,0),
   equ3Count            decimal(5,0) comment '1��Ԫ��10��Ԫ��������豸̨��',
   equ2Count            decimal(5,0) comment '��10��Ԫ��������豸̨��',
   equ1Count            decimal(5,0) comment '��1��Ԫ��������豸̨��',
   busCount             decimal(4,0) comment '������',
   rapidtestvehicleCount decimal(4,0),
   motorCount           decimal(4,0),
   cameraCount          decimal(4,0),
   videoCount           decimal(4,0),
   copycatNum           decimal(4,0),
   computerNum          decimal(4,0),
   notepadNum           decimal(4,0),
   serverCount          decimal(4,0),
   pbxCount             decimal(4,0),
   faxCount             decimal(4,0),
   ohpCount             decimal(4,0),
   yearly               VARCHAR(4),
   VRCOUNT              decimal(4),
   primary key (id)
);

alter table T_D0_ORGATTACHED comment '����������Ϣ��';

/*==============================================================*/
/* Table: T_D0_SECTION                                          */
/*==============================================================*/
create table T_D0_SECTION
(
   id                   VARCHAR(50) not null comment 'id',
   orgId                VARCHAR(50),
   orgNo                VARCHAR(12) comment '�������ڲ�����:��������9λ+3λ��ˮ',
   divCode              VARCHAR(19),
   divNameCode          VARCHAR(2),
   divName              VARCHAR(120) comment 'CVP01004�������ƴ���',
   ifSub                VARCHAR(1) comment '0=�� 1=�� ',
   dutyTel              VARCHAR(15),
   fax                  VARCHAR(15),
   divRoomNo            VARCHAR(4),
   EXETYPE              VARCHAR(1),
   primary key (id)
);

alter table T_D0_SECTION comment '������Ϣ';

/*==============================================================*/
/* Table: T_D0_STUFF                                            */
/*==============================================================*/
create table T_D0_STUFF
(
   id                   VARCHAR(50) not null comment 'id',
   sectionId            VARCHAR(50),
   divCode              VARCHAR(19),
   orgId                VARCHAR(50),
   orgNo                VARCHAR(12) comment '�������ڲ�����:��������9λ+3λ��ˮ',
   repManName           VARCHAR(30),
   gender               VARCHAR(2),
   birthDate            TIMESTAMP NULL DEFAULT NULL ,
   folk                 VARCHAR(10),
   pol                  VARCHAR(1),
   mobile               VARCHAR(15),
   workTel              VARCHAR(15),
   email                VARCHAR(30),
   edu                  VARCHAR(2),
   graCollege           VARCHAR(120),
   choiceSpe            VARCHAR(100),
   spe                  VARCHAR(4),
   beforeSpe            VARCHAR(100),
   beginWorkDate        TIMESTAMP NULL DEFAULT NULL ,
   manageJob            VARCHAR(2),
   jobLevel             VARCHAR(2),
   title                VARCHAR(4),
   getInDate            TIMESTAMP NULL DEFAULT NULL ,
   perPro               VARCHAR(1),
   perType              VARCHAR(1),
   enfCardNo            VARCHAR(20),
   getCardDate          TIMESTAMP NULL DEFAULT NULL ,
   healthPerNo          VARCHAR(6),
   getQuaDate           TIMESTAMP NULL DEFAULT NULL ,
   healthCardNo         VARCHAR(10),
   cardDay              TIMESTAMP NULL DEFAULT NULL ,
   ifStaffPer           VARCHAR(1),
   perCode              VARCHAR(21),
   primary key (id)
);

alter table T_D0_STUFF comment '��Ա��Ϣ';

alter table T_D0_FUND add constraint FK_FUN_REF_ORG foreign key (orgId)
      references T_D0_ORGANIZATION (id) on delete restrict on update restrict;

alter table T_D0_LEADER add constraint FK_LEADER_REF_ORG foreign key (orgId)
      references T_D0_ORGANIZATION (id) on delete restrict on update restrict;

alter table T_D0_ORGATTACHED add constraint FK_ORGATTACHED_REF_ORG foreign key (orgId)
      references T_D0_ORGANIZATION (id) on delete restrict on update restrict;

alter table T_D0_SECTION add constraint FK_SEC_REF_ORG foreign key (orgId)
      references T_D0_ORGANIZATION (id) on delete restrict on update restrict;

alter table T_D0_STUFF add constraint FK_STU_REF_SEC foreign key (sectionId)
      references T_D0_SECTION (id) on delete restrict on update restrict;


set sql_mode = '';
set sql_mode = 'NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';