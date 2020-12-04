-- Create table
create table LDCODE
(
  codetype   VARCHAR2(50) not null,
  code       VARCHAR2(32) not null,
  codename   VARCHAR2(250),
  codealias  VARCHAR2(120),
  comcode    VARCHAR2(30),
  othersign  VARCHAR2(10),
  status     VARCHAR2(1),
  comname    VARCHAR2(100),
  comadress  VARCHAR2(200),
  codedesc   VARCHAR2(100),
  uselevel   VARCHAR2(8),
  orderid    NUMBER(4),
  operator   VARCHAR2(25) not null,
  makedate   DATE not null,
  maketime   VARCHAR2(8) not null,
  modifydate DATE not null,
  modifytime VARCHAR2(8) not null
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column LDCODE.codetype
  is '��������';
comment on column LDCODE.code
  is '����';
comment on column LDCODE.codename
  is '��������';
comment on column LDCODE.codealias
  is '�������';
comment on column LDCODE.comcode
  is '��������';
comment on column LDCODE.othersign
  is '������־';
comment on column LDCODE.status
  is '״̬λ
0Ϊ��Ч��1Ϊ��Ч';
comment on column LDCODE.comname
  is '��˾����';
comment on column LDCODE.comadress
  is '��˾��ַ';
comment on column LDCODE.codedesc
  is '����˵��';
comment on column LDCODE.uselevel
  is 'ʹ�ü���';
comment on column LDCODE.orderid
  is '�����';
comment on column LDCODE.operator
  is '������';
comment on column LDCODE.makedate
  is '�������';
comment on column LDCODE.maketime
  is '���ʱ��';
comment on column LDCODE.modifydate
  is '����޸�����';
comment on column LDCODE.modifytime
  is '����޸�ʱ��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table LDCODE
  add constraint PK_TBL_LDCODE primary key (CODETYPE, CODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LAAGENT
(
  tsalecode         VARCHAR2(10) not null,
  tsalegroup        VARCHAR2(12),
  telcom            VARCHAR2(10),
  password          VARCHAR2(40),
  branchtype        VARCHAR2(2),
  tsalekind         VARCHAR2(6),
  name              VARCHAR2(120),
  sex               VARCHAR2(1),
  birthday          DATE,
  age               NUMBER,
  nativeplace       VARCHAR2(3),
  nationality       VARCHAR2(3),
  marriage          VARCHAR2(1),
  homeaddresscode   VARCHAR2(10),
  homeaddress       VARCHAR2(80),
  postaladdress     VARCHAR2(80),
  zipcode           VARCHAR2(6),
  rgtaddress        VARCHAR2(20),
  phone             VARCHAR2(18),
  mobile            VARCHAR2(50),
  email             VARCHAR2(50),
  marriagedate      DATE,
  idnotype          VARCHAR2(2),
  idno              VARCHAR2(20),
  source            VARCHAR2(100),
  bloodtype         VARCHAR2(2),
  polityvisage      VARCHAR2(4),
  degree            VARCHAR2(1),
  graduateschool    VARCHAR2(40),
  speciality        VARCHAR2(40),
  posttitle         VARCHAR2(2),
  foreignlevel      VARCHAR2(2),
  workage           NUMBER,
  oldcom            VARCHAR2(40),
  oldoccupation     VARCHAR2(20),
  headship          VARCHAR2(30),
  business          VARCHAR2(20),
  emergentlink      VARCHAR2(10),
  emergentphone     VARCHAR2(20),
  salequaf          VARCHAR2(1),
  smokeflag         VARCHAR2(1),
  quafno            VARCHAR2(50),
  quafstartdate     DATE,
  quafenddate       DATE,
  retaincontno      VARCHAR2(20),
  retainstartdate   DATE,
  retainenddate     DATE,
  trainperiods      VARCHAR2(8),
  trainpassflag     VARCHAR2(1),
  traindate         DATE,
  receiptno         VARCHAR2(30),
  assumoney         NUMBER(12,2),
  tsalestate        VARCHAR2(2),
  employdate        DATE,
  indueformdate     DATE,
  cautionerbirthday DATE,
  outworkdate       DATE,
  approver          VARCHAR2(10),
  approvedate       DATE,
  remark            VARCHAR2(80),
  recommendagent    VARCHAR2(10),
  qualipassflag     VARCHAR2(1),
  archievecode      VARCHAR2(20),
  bankcode          VARCHAR2(20),
  bankaccno         VARCHAR2(25),
  creditgrade       VARCHAR2(1),
  accnocrdate       DATE,
  togaeflag         VARCHAR2(1),
  operator          VARCHAR2(80),
  makedate          DATE,
  maketime          VARCHAR2(8),
  modifydate        DATE,
  modifytime        VARCHAR2(8),
  managecom         VARCHAR2(10),
  entryno           VARCHAR2(20),
  bp                VARCHAR2(20),
  devno1            VARCHAR2(30),
  devno2            VARCHAR2(30),
  agentkind         VARCHAR2(6),
  devgrade          VARCHAR2(2),
  insideflag        VARCHAR2(1),
  noworkflag        VARCHAR2(1),
  recommendno       VARCHAR2(20),
  cautionername     VARCHAR2(20),
  cautionerid       VARCHAR2(20),
  branchcode        VARCHAR2(12),
  channelname       VARCHAR2(100),
  branchtype2       VARCHAR2(2),
  joindate          DATE,
  cautionersex      VARCHAR2(2),
  agentstate        VARCHAR2(2),
  fulltimeflag      VARCHAR2(1)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LAAGENT.tsalecode
  is 'Ա������';
comment on column TBL_LAAGENT.telcom
  is '���ۻ�������';
comment on column TBL_LAAGENT.password
  is '����';
comment on column TBL_LAAGENT.branchtype
  is 'Ա������';
comment on column TBL_LAAGENT.tsalekind
  is '��ɫ���';
comment on column TBL_LAAGENT.name
  is '����';
comment on column TBL_LAAGENT.sex
  is '�Ա�';
comment on column TBL_LAAGENT.birthday
  is '��������';
comment on column TBL_LAAGENT.age
  is 'Ա������';
comment on column TBL_LAAGENT.nativeplace
  is '����';
comment on column TBL_LAAGENT.nationality
  is '����';
comment on column TBL_LAAGENT.marriage
  is '����״��';
comment on column TBL_LAAGENT.homeaddresscode
  is '��ͥ��ַ����';
comment on column TBL_LAAGENT.homeaddress
  is '��ͥ��ַ';
comment on column TBL_LAAGENT.postaladdress
  is 'ͨѶ��ַ';
comment on column TBL_LAAGENT.zipcode
  is '��������';
comment on column TBL_LAAGENT.rgtaddress
  is '�������ڵ�';
comment on column TBL_LAAGENT.phone
  is '�绰';
comment on column TBL_LAAGENT.mobile
  is '�ֻ�';
comment on column TBL_LAAGENT.email
  is 'e_mail';
comment on column TBL_LAAGENT.marriagedate
  is '�������';
comment on column TBL_LAAGENT.idnotype
  is '֤����������';
comment on column TBL_LAAGENT.idno
  is '֤������';
comment on column TBL_LAAGENT.source
  is '��Դ��';
comment on column TBL_LAAGENT.bloodtype
  is 'Ѫ��';
comment on column TBL_LAAGENT.polityvisage
  is '������ò';
comment on column TBL_LAAGENT.degree
  is 'ѧ��';
comment on column TBL_LAAGENT.graduateschool
  is '��ҵԺУ';
comment on column TBL_LAAGENT.speciality
  is 'רҵ';
comment on column TBL_LAAGENT.posttitle
  is 'ְ��';
comment on column TBL_LAAGENT.foreignlevel
  is '����ˮƽ';
comment on column TBL_LAAGENT.workage
  is '��ҵ����';
comment on column TBL_LAAGENT.oldcom
  is 'ԭ������λ';
comment on column TBL_LAAGENT.oldoccupation
  is 'ԭְҵ';
comment on column TBL_LAAGENT.headship
  is '����ְ�����ƣ�';
comment on column TBL_LAAGENT.business
  is '����/��ҵ';
comment on column TBL_LAAGENT.emergentlink
  is '������ϵ��';
comment on column TBL_LAAGENT.emergentphone
  is '������ϵ�˵绰';
comment on column TBL_LAAGENT.salequaf
  is '�����ʸ�';
comment on column TBL_LAAGENT.smokeflag
  is '�����ʸ���
Ϊ�ջ�Ϊ''0''��ʾ�������ʸ�Ϊ��1����ʾ�������ʸ�';
comment on column TBL_LAAGENT.quafno
  is 'Ա���ʸ�֤����';
comment on column TBL_LAAGENT.quafstartdate
  is '֤�鿪ʼ����';
comment on column TBL_LAAGENT.quafenddate
  is '֤���������';
comment on column TBL_LAAGENT.retaincontno
  is 'Ƹ�ú�ͬ����';
comment on column TBL_LAAGENT.retainstartdate
  is '�Ͷ���ͬ��ʼ����';
comment on column TBL_LAAGENT.retainenddate
  is '�Ͷ���ͬ��������';
comment on column TBL_LAAGENT.trainperiods
  is '��ѵ����';
comment on column TBL_LAAGENT.trainpassflag
  is '��ѵͨ�����
0-ͨ��
1-δͨ��';
comment on column TBL_LAAGENT.traindate
  is '��ѵ����';
comment on column TBL_LAAGENT.receiptno
  is '��֤���վݺ�';
comment on column TBL_LAAGENT.assumoney
  is '��֤��';
comment on column TBL_LAAGENT.tsalestate
  is '������״̬
"01����ְ��
02��������Ա��
03��׼��ְ,
04-��ְ"
';
comment on column TBL_LAAGENT.employdate
  is '¼������';
comment on column TBL_LAAGENT.indueformdate
  is 'ת������';
comment on column TBL_LAAGENT.cautionerbirthday
  is '׼��ְ����';
comment on column TBL_LAAGENT.outworkdate
  is '��˾����';
comment on column TBL_LAAGENT.approver
  is '����Ա';
comment on column TBL_LAAGENT.approvedate
  is '�����������ڣ��������ڣ�';
comment on column TBL_LAAGENT.remark
  is '��ע';
comment on column TBL_LAAGENT.recommendagent
  is '�Ƽ�Ա��';
comment on column TBL_LAAGENT.qualipassflag
  is '������־λ
0 or null-����δ����
1-�������롣';
comment on column TBL_LAAGENT.archievecode
  is '��������';
comment on column TBL_LAAGENT.bankcode
  is '���б���';
comment on column TBL_LAAGENT.bankaccno
  is '�����ʻ�';
comment on column TBL_LAAGENT.creditgrade
  is '���õȼ�';
comment on column TBL_LAAGENT.accnocrdate
  is '�ʻ���������';
comment on column TBL_LAAGENT.togaeflag
  is '˾���Ƿ���ȡ��־
Y-����ȡ
N-δ��ȡ';
comment on column TBL_LAAGENT.operator
  is '����Ա����';
comment on column TBL_LAAGENT.makedate
  is '�������';
comment on column TBL_LAAGENT.maketime
  is '���ʱ��';
comment on column TBL_LAAGENT.modifydate
  is '���һ���޸�����';
comment on column TBL_LAAGENT.modifytime
  is '���һ���޸�ʱ��';
-- Create/Recreate indexes 
create index IDX_AGENT_COMANDTSALECODE on TBL_LAAGENT (TELCOM, TSALECODE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_AGENT_TSALEGROUP on TBL_LAAGENT (TSALEGROUP)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LAAGENT
  add constraint PK_TBL_LAAGENT primary key (TSALECODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LAAGENTGRADE
(
  gradecode       VARCHAR2(6) not null,
  gradeid         NUMBER not null,
  gradename       VARCHAR2(50) not null,
  branchtype      VARCHAR2(2) not null,
  gradeproperty1  VARCHAR2(2),
  gradeproperty2  VARCHAR2(2),
  gradeproperty3  VARCHAR2(2),
  gradeproperty4  VARCHAR2(2),
  gradeproperty5  VARCHAR2(1),
  gradeproperty6  VARCHAR2(1),
  gradeproperty7  VARCHAR2(1),
  gradeproperty8  VARCHAR2(1),
  gradeproperty9  VARCHAR2(1),
  gradeproperty10 VARCHAR2(2),
  noti            VARCHAR2(100),
  branchtype2     VARCHAR2(2)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LAAGENTGRADE.gradecode
  is '�������';
comment on column TBL_LAAGENTGRADE.gradeid
  is '����ID
0��1��2...(����ְ�������Ĵ����˼���';
comment on column TBL_LAAGENTGRADE.gradename
  is 'ְ������';
comment on column TBL_LAAGENTGRADE.branchtype
  is '�Ŷ�����';
comment on column TBL_LAAGENTGRADE.gradeproperty1
  is '��������1';
comment on column TBL_LAAGENTGRADE.gradeproperty2
  is '��������2';
comment on column TBL_LAAGENTGRADE.gradeproperty3
  is '��������3';
comment on column TBL_LAAGENTGRADE.gradeproperty4
  is '��������4';
comment on column TBL_LAAGENTGRADE.gradeproperty5
  is '��������5';
comment on column TBL_LAAGENTGRADE.gradeproperty6
  is '��������6';
comment on column TBL_LAAGENTGRADE.gradeproperty7
  is '��������7';
comment on column TBL_LAAGENTGRADE.gradeproperty8
  is '��������8';
comment on column TBL_LAAGENTGRADE.gradeproperty9
  is '��������9';
comment on column TBL_LAAGENTGRADE.gradeproperty10
  is '��������10';
comment on column TBL_LAAGENTGRADE.noti
  is '��ע';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LAAGENTGRADE
  add constraint PK_LAAGENTGRADE primary key (GRADECODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LABRANCHGROUP
(
  tsalegroup         VARCHAR2(12) not null,
  telcom             VARCHAR2(10),
  name               VARCHAR2(120),
  upbranch           VARCHAR2(12),
  branchattr         VARCHAR2(70),
  branchseries       VARCHAR2(200),
  branchtype         VARCHAR2(2) not null,
  branchlevel        VARCHAR2(2),
  branchmanager      VARCHAR2(10),
  branchaddresscode  VARCHAR2(12),
  branchaddress      VARCHAR2(120),
  branchphone        VARCHAR2(18),
  branchfax          VARCHAR2(18),
  branchzipcode      VARCHAR2(6),
  founddate          DATE,
  enddate            DATE,
  endflag            VARCHAR2(1),
  branchmanagername  VARCHAR2(120),
  branchjobtype      VARCHAR2(1),
  brancharea         VARCHAR2(1),
  astartdate         DATE,
  operator           VARCHAR2(80),
  makedate           DATE,
  maketime           VARCHAR2(8),
  modifydate         DATE,
  modifytime         VARCHAR2(8),
  attribute1         VARCHAR2(12),
  upbranchattr       VARCHAR2(2),
  fieldflag          VARCHAR2(1),
  state              VARCHAR2(10),
  branchtype2        VARCHAR2(2),
  noti               VARCHAR2(100),
  branchgrade        VARCHAR2(10),
  proxycomtype       VARCHAR2(2),
  licensenumber      VARCHAR2(40),
  getlicensedate     DATE,
  endlicensedate     DATE,
  contractdate       DATE,
  terminationdate    DATE,
  saleseligibility   VARCHAR2(1),
  bankcode           VARCHAR2(20),
  qthomologousdepart VARCHAR2(20),
  qthomologousaera   VARCHAR2(20),
  tsaleflag          VARCHAR2(10)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LABRANCHGROUP.tsalegroup
  is '�Ŷӱ���';
comment on column TBL_LABRANCHGROUP.telcom
  is '���ۻ�������';
comment on column TBL_LABRANCHGROUP.name
  is '�Ŷ�����';
comment on column TBL_LABRANCHGROUP.upbranch
  is '�ϼ��Ŷӱ���';
comment on column TBL_LABRANCHGROUP.branchattr
  is '�Ŷ��ⲿ����';
comment on column TBL_LABRANCHGROUP.branchseries
  is '�Ŷ����б���';
comment on column TBL_LABRANCHGROUP.branchtype
  is '�Ŷ�����';
comment on column TBL_LABRANCHGROUP.branchlevel
  is '�ŶӼ���';
comment on column TBL_LABRANCHGROUP.branchmanager
  is '�Ŷӹ�����';
comment on column TBL_LABRANCHGROUP.branchaddresscode
  is '�Ŷӵ�ַ���';
comment on column TBL_LABRANCHGROUP.branchaddress
  is '�Ŷӵ�ַ';
comment on column TBL_LABRANCHGROUP.branchphone
  is '�Ŷӵ绰';
comment on column TBL_LABRANCHGROUP.branchfax
  is '�ŶӴ���';
comment on column TBL_LABRANCHGROUP.branchzipcode
  is '�Ŷ��ʱ�';
comment on column TBL_LABRANCHGROUP.founddate
  is '��������';
comment on column TBL_LABRANCHGROUP.enddate
  is 'ͣҵ����';
comment on column TBL_LABRANCHGROUP.endflag
  is 'ͣҵ��־';
comment on column TBL_LABRANCHGROUP.branchmanagername
  is '�Ŷӹ���������';
comment on column TBL_LABRANCHGROUP.branchjobtype
  is '�Ŷӹ������ͣ�0-���ڣ�1-����';
comment on column TBL_LABRANCHGROUP.brancharea
  is '�Ƿ������俪�أ�0-�أ�1-��
';
comment on column TBL_LABRANCHGROUP.astartdate
  is '��������';
comment on column TBL_LABRANCHGROUP.operator
  is '����Ա';
comment on column TBL_LABRANCHGROUP.makedate
  is '�������';
comment on column TBL_LABRANCHGROUP.maketime
  is '���ʱ��';
comment on column TBL_LABRANCHGROUP.modifydate
  is '���һ���޸�����';
comment on column TBL_LABRANCHGROUP.modifytime
  is '���һ���޸�ʱ��';
comment on column TBL_LABRANCHGROUP.attribute1
  is '�ϼ�ֱϽ������';
comment on column TBL_LABRANCHGROUP.upbranchattr
  is 'UMAֱϽ�����ԣ�1-ֱϽ��0-��ֱϽ';
comment on column TBL_LABRANCHGROUP.qthomologousdepart
  is '�ʼ��Ӧ��';
comment on column TBL_LABRANCHGROUP.qthomologousaera
  is '�ʼ��Ӧ��';
comment on column TBL_LABRANCHGROUP.tsaleflag
  is '�Ƿ�����ְ��Ա 1-�� 0-û��';
-- Create/Recreate indexes 
create index IDX_GROUP_BRANCHATTR on TBL_LABRANCHGROUP (BRANCHATTR)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LABRANCHGROUP_MNG_SERIES on TBL_LABRANCHGROUP (BRANCHSERIES)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LABRANCHGROUP_TSALEGROUP on TBL_LABRANCHGROUP (TSALEGROUP)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LABRANCHGROUP_TYPE_EL_COM on TBL_LABRANCHGROUP (BRANCHTYPE, BRANCHLEVEL, TELCOM)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index INDEX_LEVEL on TBL_LABRANCHGROUP (BRANCHATTR, BRANCHLEVEL)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LABRANCHGROUP
  add constraint PK_TBL_LABRANCHGROUP primary key (TSALEGROUP, BRANCHTYPE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LABRANCHLEVEL
(
  branchlevelcode      VARCHAR2(6) not null,
  branchlevelname      VARCHAR2(50),
  branchleveltype      VARCHAR2(1),
  branchlevelid        INTEGER,
  branchtype           VARCHAR2(2) not null,
  branchproperty       VARCHAR2(1),
  agentkind            VARCHAR2(6),
  subjectproperty      VARCHAR2(1),
  branchlevelproperty1 VARCHAR2(2),
  branchlevelproperty2 VARCHAR2(2),
  branchlevelproperty3 VARCHAR2(2),
  branchlevelproperty4 VARCHAR2(2),
  branchlevelproperty5 VARCHAR2(2),
  noti                 VARCHAR2(200),
  branchtype2          VARCHAR2(2) not null
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_LABRANCHLEVEL
  is '7/18
���������ӿڵĿ�����Ҫ�¹��';
-- Add comments to the columns 
comment on column TBL_LABRANCHLEVEL.branchlevelcode
  is '81-������
82-������
83-��������
84-��������
';
comment on column TBL_LABRANCHLEVEL.branchleveltype
  is '0��Ĭ�ϡ�';
comment on column TBL_LABRANCHLEVEL.branchlevelid
  is '��ְ������2���൱�ڻ���������ڲ����� 1,2,3....��';
comment on column TBL_LABRANCHLEVEL.branchtype
  is 'չҵ����(1-����Ӫ����2-���գ�3�����б��գ�4���շ�Ա��5��ֱ����6���������ڣ�9������)
';
comment on column TBL_LABRANCHLEVEL.branchproperty
  is '�����ţ��绰����������';
comment on column TBL_LABRANCHLEVEL.agentkind
  is '������Ӧ����';
comment on column TBL_LABRANCHLEVEL.subjectproperty
  is 'ֱϽ����';
comment on column TBL_LABRANCHLEVEL.branchlevelproperty1
  is '������ʵ���Ƿ�����Ա';
comment on column TBL_LABRANCHLEVEL.branchlevelproperty2
  is 'չҵ�������볤�ȶ���';
comment on column TBL_LABRANCHLEVEL.branchtype2
  is '01-ֱ��
02-�н�
03-��������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LABRANCHLEVEL
  add constraint PK_TBL_LABRANCHLEVEL primary key (BRANCHLEVELCODE, BRANCHTYPE, BRANCHTYPE2)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LATELCOM
(
  comcode     VARCHAR2(10) not null,
  outcomcode  VARCHAR2(10),
  name        VARCHAR2(60),
  shortname   VARCHAR2(60),
  address     VARCHAR2(80),
  zipcode     VARCHAR2(6),
  phone       VARCHAR2(18),
  fax         VARCHAR2(18),
  email       VARCHAR2(60),
  webaddress  VARCHAR2(100),
  satrapname  VARCHAR2(20),
  insureid    VARCHAR2(12),
  comnature   VARCHAR2(1),
  comgrade    VARCHAR2(2),
  comareatype VARCHAR2(2),
  upcomcode   VARCHAR2(10),
  comtype     VARCHAR2(2)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LATELCOM.comgrade
  is '01-�ܹ�˾
02-�ֹ�˾
03-����֧��˾
04-֧��˾(Ӫ������)
';
comment on column TBL_LATELCOM.comareatype
  is '1:һ�����
2���������';
comment on column TBL_LATELCOM.comtype
  is '01-����
02-��ϴ
03-�ʼ�
04-����';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LATELCOM
  add constraint PK_TBL_LATELCOM primary key (COMCODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LATREE
(
  tsalecode        VARCHAR2(10) not null,
  telcom           VARCHAR2(10),
  tsalegroup       VARCHAR2(12),
  tsalegrade       VARCHAR2(6),
  tsaleseries      VARCHAR2(2),
  tsalelastseries  VARCHAR2(2),
  tsalelastgrade   VARCHAR2(6),
  introagency      VARCHAR2(10),
  upagent          VARCHAR2(10),
  oldstartdate     DATE,
  oldenddate       DATE,
  startdate        DATE,
  astartdate       DATE,
  assesstype       VARCHAR2(1),
  state            VARCHAR2(10),
  branchattr       VARCHAR2(12),
  branchtype       VARCHAR2(2),
  initgrade        VARCHAR2(6),
  tsaleline        VARCHAR2(2),
  insideflag       VARCHAR2(2),
  connmanagerstate VARCHAR2(1),
  connsuccdate     DATE,
  tsalegradersn    VARCHAR2(1),
  operator         VARCHAR2(80),
  makedate         DATE,
  maketime         VARCHAR2(8),
  modifydate       DATE,
  modifytime       VARCHAR2(8),
  othupagent       VARCHAR2(10),
  introbreakflag   VARCHAR2(1),
  introcommstart   DATE,
  introcommend     DATE,
  edumanager       VARCHAR2(10),
  rearbreakflag    VARCHAR2(1),
  rearcommstart    DATE,
  rearcommend      DATE,
  ascriptseries    VARCHAR2(200),
  branchcode       VARCHAR2(12),
  agentkind        VARCHAR2(6),
  isconnman        VARCHAR2(2),
  agentline        VARCHAR2(2),
  speciflag        VARCHAR2(2),
  branchtype2      VARCHAR2(2),
  vipproperty      VARCHAR2(5),
  cmagentgrade     VARCHAR2(3),
  cmagentlastgrade VARCHAR2(3),
  cmupagent        VARCHAR2(10),
  cmoldstartdate   DATE,
  cmoldenddate     DATE,
  cmstartdate      DATE,
  cmastartdate     DATE,
  cmassesstype     VARCHAR2(1),
  cmstate          VARCHAR2(2),
  cminitgrade      VARCHAR2(3)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LATREE.tsalecode
  is 'Ա������';
comment on column TBL_LATREE.telcom
  is '���ۻ�������';
comment on column TBL_LATREE.tsalegrade
  is 'Ա������';
comment on column TBL_LATREE.tsaleseries
  is 'Ա��ϵ��';
comment on column TBL_LATREE.tsalelastseries
  is 'Ա���ϴ�ϵ��';
comment on column TBL_LATREE.tsalelastgrade
  is 'Ա���ϴμ���';
comment on column TBL_LATREE.introagency
  is '��ԱԱ������';
comment on column TBL_LATREE.upagent
  is '�ϼ�����';
comment on column TBL_LATREE.oldstartdate
  is 'ǰְ����Ƹ����';
comment on column TBL_LATREE.oldenddate
  is 'ǰְ����Ƹ����';
comment on column TBL_LATREE.startdate
  is '��ְ����Ƹ����';
comment on column TBL_LATREE.astartdate
  is '���˿�ʼ����';
comment on column TBL_LATREE.assesstype
  is '��������';
comment on column TBL_LATREE.state
  is '������״̬
��ְ��0��׼��ְ-3����ְ-4';
comment on column TBL_LATREE.branchattr
  is '�Ŷ��ⲿ����';
comment on column TBL_LATREE.branchtype
  is 'Ա������';
comment on column TBL_LATREE.initgrade
  is '��˾ְ��';
comment on column TBL_LATREE.tsaleline
  is '�����˷�չ·��';
comment on column TBL_LATREE.insideflag
  is '�����ڱ��';
comment on column TBL_LATREE.connmanagerstate
  is '�ν���Ա״̬��־
';
comment on column TBL_LATREE.connsuccdate
  is '�����������';
comment on column TBL_LATREE.tsalegradersn
  is '��ǰְ����Ƹԭ��
��¼ҵ��Ա��ǰְ������Ƹԭ�򣬰�����˾��Ƹְ�����������˽�������ְ������Ϊ�ֹ�������������ְ��
0-��˾��Ƹְ��
1-���˽��ְ��
2-������Ԥְ��';
comment on column TBL_LATREE.operator
  is '����Ա����';
comment on column TBL_LATREE.makedate
  is '�������';
comment on column TBL_LATREE.maketime
  is '���ʱ��';
comment on column TBL_LATREE.modifydate
  is '���һ���޸�����';
comment on column TBL_LATREE.modifytime
  is '���һ���޸�ʱ��';
-- Create/Recreate indexes 
create index IDX_TBL_LATREE_TSALEGROUP on TBL_LATREE (TSALEGROUP, TSALEGRADE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LATREE
  add constraint PK_TBL_LATREE primary key (TSALECODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LCADDRESS
(
  custno         VARCHAR2(60) not null,
  addressno      NUMBER not null,
  province       VARCHAR2(20),
  city           VARCHAR2(20),
  county         VARCHAR2(200),
  postaladdress  VARCHAR2(200),
  zipcode        VARCHAR2(6),
  phone          VARCHAR2(18),
  fax            VARCHAR2(20),
  homeaddress    VARCHAR2(200),
  homezipcode    VARCHAR2(6),
  homephone      VARCHAR2(18),
  homefax        VARCHAR2(20),
  grpname        VARCHAR2(60),
  companyaddress VARCHAR2(80),
  companyzipcode VARCHAR2(6),
  companyphone   VARCHAR2(18),
  companyfax     VARCHAR2(20),
  payaddress     VARCHAR2(200),
  payzipcode     VARCHAR2(6),
  payphone       VARCHAR2(50),
  mobile         VARCHAR2(15),
  email          VARCHAR2(60),
  posted         VARCHAR2(1),
  updatetime     DATE,
  operator       VARCHAR2(25) not null,
  makedate       DATE not null,
  maketime       VARCHAR2(8) not null,
  modifydate     DATE not null,
  modifytime     VARCHAR2(8) not null,
  hprovince      VARCHAR2(20),
  hcity          VARCHAR2(20),
  hcounty        VARCHAR2(200),
  wprovince      VARCHAR2(20),
  wcity          VARCHAR2(20),
  wcounty        VARCHAR2(200),
  mprovince      VARCHAR2(20),
  mcity          VARCHAR2(20),
  mcounty        VARCHAR2(200)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_LCADDRESS
  is '7/19
1  ׷��  ��ַ�š���ͥ�ʱࡢ��ͥ���桢��λ�ʱࡢ
    ��λ���桢�շѵ�ַ�շ��ʱࡢ�շѵ绰��
    ����Ա��������ڡ����ʱ�䡢����޸����ڡ�����޸�ʱ��
2  ��/��  ���ȱ��40 ->200
3  �ֶ�λ�õ���(����������)
4  �������
5  ɾ��  ���ơ��Ա𡢳������ڡ�֤�����͡�֤������
';
-- Add comments to the columns 
comment on column TBL_LCADDRESS.custno
  is '�ͻ����';
comment on column TBL_LCADDRESS.addressno
  is '��ַ��';
comment on column TBL_LCADDRESS.province
  is 'ʡ';
comment on column TBL_LCADDRESS.city
  is '��';
comment on column TBL_LCADDRESS.county
  is '��/��';
comment on column TBL_LCADDRESS.postaladdress
  is 'ͨѶ��ַ';
comment on column TBL_LCADDRESS.zipcode
  is '��ϵ�ʱ�';
comment on column TBL_LCADDRESS.phone
  is 'ͨѶ�绰';
comment on column TBL_LCADDRESS.fax
  is 'ͨѶ����';
comment on column TBL_LCADDRESS.homeaddress
  is '��ͥ��ַ';
comment on column TBL_LCADDRESS.homezipcode
  is '��ͥ�ʱ�';
comment on column TBL_LCADDRESS.homephone
  is '��ͥ�绰';
comment on column TBL_LCADDRESS.homefax
  is '��ͥ����';
comment on column TBL_LCADDRESS.grpname
  is '��λ����';
comment on column TBL_LCADDRESS.companyaddress
  is '��λ��ַ';
comment on column TBL_LCADDRESS.companyzipcode
  is '��λ�ʱ�';
comment on column TBL_LCADDRESS.companyphone
  is '��λ�绰';
comment on column TBL_LCADDRESS.companyfax
  is '��λ����';
comment on column TBL_LCADDRESS.payaddress
  is '�շѵ�ַ';
comment on column TBL_LCADDRESS.payzipcode
  is '�շ��ʱ�';
comment on column TBL_LCADDRESS.payphone
  is '�շѵ绰';
comment on column TBL_LCADDRESS.mobile
  is '�ֻ�';
comment on column TBL_LCADDRESS.email
  is 'e_mail';
comment on column TBL_LCADDRESS.posted
  is '���ݴ����־';
comment on column TBL_LCADDRESS.updatetime
  is '����ʱ��';
comment on column TBL_LCADDRESS.operator
  is '����Ա';
comment on column TBL_LCADDRESS.makedate
  is '�������';
comment on column TBL_LCADDRESS.maketime
  is '���ʱ��';
comment on column TBL_LCADDRESS.modifydate
  is '����޸�����';
comment on column TBL_LCADDRESS.modifytime
  is '����޸�ʱ��';
comment on column TBL_LCADDRESS.hprovince
  is 'ʡ';
comment on column TBL_LCADDRESS.hcity
  is '��';
comment on column TBL_LCADDRESS.hcounty
  is '��/��';
comment on column TBL_LCADDRESS.wprovince
  is 'ʡ';
comment on column TBL_LCADDRESS.wcity
  is '��';
comment on column TBL_LCADDRESS.wcounty
  is '��/��';
comment on column TBL_LCADDRESS.mprovince
  is 'ʡ';
comment on column TBL_LCADDRESS.mcity
  is '��';
comment on column TBL_LCADDRESS.mcounty
  is '��/��';
-- Create/Recreate indexes 
create index IDX_TBL_LCADDRESS_COMPANYPHONE on TBL_LCADDRESS (COMPANYPHONE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LCADDRESS_FAX on TBL_LCADDRESS (FAX)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LCADDRESS_HOMEPHONE on TBL_LCADDRESS (HOMEPHONE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LCADDRESS_MOBILE on TBL_LCADDRESS (MOBILE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LCADDRESS_PAYPHONE on TBL_LCADDRESS (PAYPHONE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LCADDRESS_PHONE on TBL_LCADDRESS (PHONE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LCADDRESS
  add constraint PK_ADDRESS_CUSTNO primary key (CUSTNO, ADDRESSNO)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LCAPPNT
(
  contno            VARCHAR2(20) not null,
  customerno        VARCHAR2(24) not null,
  appntname         VARCHAR2(120),
  appntsex          VARCHAR2(10),
  appntbirthday     DATE,
  idtype            VARCHAR2(10),
  idno              VARCHAR2(20),
  marriage          VARCHAR2(1),
  degree            VARCHAR2(6),
  nativeplace       VARCHAR2(3),
  age               NUMBER,
  rgtaddress        VARCHAR2(80),
  nationality       VARCHAR2(3),
  worktype          VARCHAR2(40),
  occupationtype    VARCHAR2(10),
  occupationcode    VARCHAR2(10),
  occupationname    VARCHAR2(120),
  pluralitytype     VARCHAR2(40),
  pluralitycode     VARCHAR2(10),
  pluralityname     VARCHAR2(120),
  highestworktype   VARCHAR2(40),
  license           VARCHAR2(1),
  licensetype       VARCHAR2(4),
  posted            VARCHAR2(1),
  updatetime        DATE,
  relationtoinsured VARCHAR2(2),
  callback          VARCHAR2(20),
  email             VARCHAR2(60),
  operator          VARCHAR2(25) not null,
  makedate          DATE not null,
  maketime          VARCHAR2(8) not null,
  modifydate        DATE not null,
  modifytime        VARCHAR2(8) not null,
  addressno         VARCHAR2(2),
  cervaliddate      DATE,
  secworktype       VARCHAR2(100),
  iscustomer        VARCHAR2(1),
  highcode          VARCHAR2(10),
  highworktype      VARCHAR2(100),
  datecode          VARCHAR2(1)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LCAPPNT.contno
  is '��ͬ����';
comment on column TBL_LCAPPNT.customerno
  is 'Ͷ���˿ͻ���';
comment on column TBL_LCAPPNT.appntname
  is 'Ͷ��������';
comment on column TBL_LCAPPNT.appntsex
  is 'Ͷ�����Ա�';
comment on column TBL_LCAPPNT.appntbirthday
  is 'Ͷ���˳�������';
comment on column TBL_LCAPPNT.idtype
  is 'Ͷ����֤������';
comment on column TBL_LCAPPNT.idno
  is 'Ͷ����֤������';
comment on column TBL_LCAPPNT.marriage
  is '����״��';
comment on column TBL_LCAPPNT.degree
  is 'ѧ��';
comment on column TBL_LCAPPNT.nativeplace
  is '����';
comment on column TBL_LCAPPNT.age
  is '����';
comment on column TBL_LCAPPNT.rgtaddress
  is '�������ڵ�';
comment on column TBL_LCAPPNT.nationality
  is '����';
comment on column TBL_LCAPPNT.worktype
  is 'ְҵ������) -��ҵ';
comment on column TBL_LCAPPNT.occupationtype
  is 'ְҵ��� --ְҵ�ȼ�';
comment on column TBL_LCAPPNT.occupationcode
  is 'ְҵ����';
comment on column TBL_LCAPPNT.occupationname
  is 'ְҵ����  -ְҵ';
comment on column TBL_LCAPPNT.pluralitytype
  is '��ְְҵ�ȼ�';
comment on column TBL_LCAPPNT.pluralitycode
  is '��ְְҵ����';
comment on column TBL_LCAPPNT.pluralityname
  is '��ְְҵ����';
comment on column TBL_LCAPPNT.highestworktype
  is '���ְҵ�ȼ�';
comment on column TBL_LCAPPNT.license
  is '����';
comment on column TBL_LCAPPNT.licensetype
  is '��������';
comment on column TBL_LCAPPNT.posted
  is '���ݴ����־';
comment on column TBL_LCAPPNT.updatetime
  is '����ʱ��';
comment on column TBL_LCAPPNT.relationtoinsured
  is '�뱻���˹�ϵ';
comment on column TBL_LCAPPNT.callback
  is '�طõ绰';
comment on column TBL_LCAPPNT.email
  is '��������';
comment on column TBL_LCAPPNT.operator
  is '����Ա';
comment on column TBL_LCAPPNT.makedate
  is '�������';
comment on column TBL_LCAPPNT.maketime
  is '���ʱ��';
comment on column TBL_LCAPPNT.modifydate
  is '����޸�����';
comment on column TBL_LCAPPNT.modifytime
  is '����޸�ʱ��';
comment on column TBL_LCAPPNT.iscustomer
  is '����-0 ��-1';
comment on column TBL_LCAPPNT.highcode
  is '���ְҵ����';
comment on column TBL_LCAPPNT.highworktype
  is '���ְҵ(����)';
comment on column TBL_LCAPPNT.datecode
  is '1-��Ч��
2-����';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LCAPPNT
  add constraint PK_APPNT_CONTNO primary key (CONTNO)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LCBNF
(
  contno            VARCHAR2(20) not null,
  polno             VARCHAR2(20) not null,
  bnftype           VARCHAR2(1) not null,
  customerno        VARCHAR2(24) not null,
  bnfgrade          VARCHAR2(1) not null,
  bnfno             NUMBER(2) not null,
  relationtoinsured VARCHAR2(2),
  name              VARCHAR2(120),
  sex               VARCHAR2(1),
  birthday          DATE,
  idtype            VARCHAR2(1),
  idno              VARCHAR2(20),
  bnflot            NUMBER(10,4),
  posted            VARCHAR2(1),
  age               NUMBER(3),
  operator          VARCHAR2(25) not null,
  makedate          DATE not null,
  maketime          VARCHAR2(8) not null,
  modifydate        DATE not null,
  modifytime        VARCHAR2(8) not null,
  updatetime        DATE,
  sybl              NUMBER(3),
  nativeplace       VARCHAR2(3),
  datecode          VARCHAR2(1),
  worktype          VARCHAR2(40),
  occupationcode    VARCHAR2(10),
  occupationname    VARCHAR2(120),
  syorder           VARCHAR2(1),
  cervaliddate      DATE,
  mphone            VARCHAR2(18)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LCBNF.contno
  is '��ͬ����';
comment on column TBL_LCBNF.polno
  is '�������ֺ���';
comment on column TBL_LCBNF.bnftype
  is '���������';
comment on column TBL_LCBNF.customerno
  is '�����˿ͻ���';
comment on column TBL_LCBNF.bnfgrade
  is '�����˼���';
comment on column TBL_LCBNF.bnfno
  is '���������';
comment on column TBL_LCBNF.relationtoinsured
  is '�뱻���˹�ϵ';
comment on column TBL_LCBNF.name
  is '�ͻ�����';
comment on column TBL_LCBNF.sex
  is '�ͻ��Ա�';
comment on column TBL_LCBNF.birthday
  is '�ͻ���������';
comment on column TBL_LCBNF.idtype
  is '֤������';
comment on column TBL_LCBNF.idno
  is '֤������';
comment on column TBL_LCBNF.bnflot
  is '����ݶ�';
comment on column TBL_LCBNF.posted
  is '���ݴ����־';
comment on column TBL_LCBNF.age
  is '����';
comment on column TBL_LCBNF.operator
  is '����Ա';
comment on column TBL_LCBNF.makedate
  is '�������';
comment on column TBL_LCBNF.maketime
  is '���ʱ��';
comment on column TBL_LCBNF.modifydate
  is '����޸�����';
comment on column TBL_LCBNF.modifytime
  is '����޸�ʱ��';
comment on column TBL_LCBNF.updatetime
  is '����ʱ��';
comment on column TBL_LCBNF.sybl
  is '��������ռ�������';
comment on column TBL_LCBNF.nativeplace
  is '��������';
comment on column TBL_LCBNF.datecode
  is '֤����Ч�ڴ���';
comment on column TBL_LCBNF.worktype
  is '��ҵ����';
comment on column TBL_LCBNF.occupationcode
  is 'ְҵ����';
comment on column TBL_LCBNF.occupationname
  is 'ְҵ����';
comment on column TBL_LCBNF.syorder
  is '����˳�����';
comment on column TBL_LCBNF.cervaliddate
  is '֤����Ч��';
comment on column TBL_LCBNF.mphone
  is '��������ϵ�绰';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LCBNF
  add constraint PK_BNF primary key (CONTNO, POLNO, BNFTYPE, BNFNO, CUSTOMERNO, BNFGRADE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LCCONT
(
  contno           VARCHAR2(20) not null,
  prtno            VARCHAR2(20) not null,
  custseqno        VARCHAR2(60) not null,
  custno           VARCHAR2(60) not null,
  polapplydate     DATE,
  cvalidate        DATE,
  tsalecode        VARCHAR2(10) not null,
  tsalename        VARCHAR2(60),
  agentcom         VARCHAR2(20),
  agentgroup       VARCHAR2(12),
  agentrelatoappnt VARCHAR2(2),
  managecom        VARCHAR2(10) not null,
  salechnl         VARCHAR2(2),
  getpoldate       DATE,
  getpoltime       VARCHAR2(8),
  customgetpoldate DATE,
  paylocation      VARCHAR2(1),
  bankcode         VARCHAR2(20),
  bankaccno        VARCHAR2(40),
  accname          VARCHAR2(60),
  newpaymode       VARCHAR2(4),
  newbankcode      VARCHAR2(20),
  newbankaccno     VARCHAR2(40),
  newaccname       VARCHAR2(60),
  agentbankcode    VARCHAR2(6),
  bankagent        VARCHAR2(20),
  prem             NUMBER(16,2),
  yearprem         NUMBER(16,2),
  extpaymode       VARCHAR2(1),
  sendtime         DATE,
  accepttime       DATE,
  mnchktime        DATE,
  printtime        DATE,
  tobanktime       DATE,
  insuretime       DATE,
  canceltime       DATE,
  reefftime        DATE,
  checkstate       VARCHAR2(1),
  sendstate        VARCHAR2(20),
  polstate         VARCHAR2(3),
  salecom          VARCHAR2(10),
  username         VARCHAR2(50),
  userid           VARCHAR2(25) not null,
  posted           VARCHAR2(1),
  updatetime       DATE,
  remark           VARCHAR2(1600),
  state            VARCHAR2(1),
  reprtflag        VARCHAR2(1),
  payintv          NUMBER(2),
  tobanktimes      NUMBER(2),
  yeartotalprem    NUMBER(16,2),
  groupid          VARCHAR2(20),
  campname         VARCHAR2(60),
  telcom           VARCHAR2(10),
  courier          VARCHAR2(120),
  signatory        VARCHAR2(120),
  operator         VARCHAR2(25) not null,
  makedate         DATE not null,
  maketime         VARCHAR2(8) not null,
  modifydate       DATE not null,
  modifytime       VARCHAR2(8) not null,
  epressmode       VARCHAR2(1),
  sustype          VARCHAR2(2),
  conttype         VARCHAR2(2),
  qastate          VARCHAR2(2),
  kcode            VARCHAR2(20),
  trancstate       VARCHAR2(2),
  contplancode     VARCHAR2(20),
  fistprem         NUMBER(16,2),
  otheramnt        NUMBER(16,2),
  areacode         VARCHAR2(2),
  isfan            VARCHAR2(1),
  firstconttype    VARCHAR2(1),
  isright          VARCHAR2(1),
  bonstype         VARCHAR2(1),
  sourcecustno     VARCHAR2(60),
  printtype        VARCHAR2(4),
  printfalg        VARCHAR2(4),
  printresult      VARCHAR2(200),
  dprintdate       DATE,
  dunicode         VARCHAR2(100)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LCCONT.contno
  is '��ͬ����--������';
comment on column TBL_LCCONT.prtno
  is 'ӡˢ����--Ͷ������';
comment on column TBL_LCCONT.custseqno
  is '�����';
comment on column TBL_LCCONT.custno
  is '�ͻ����';
comment on column TBL_LCCONT.polapplydate
  is 'Ͷ������������';
comment on column TBL_LCCONT.cvalidate
  is '������Ч����';
comment on column TBL_LCCONT.tsalecode
  is '�����˱���';
comment on column TBL_LCCONT.tsalename
  is '����������';
comment on column TBL_LCCONT.agentcom
  is '�������';
comment on column TBL_LCCONT.agentgroup
  is '���������';
comment on column TBL_LCCONT.agentrelatoappnt
  is '��ҵ��Ա��Ͷ���˵Ĺ�ϵ';
comment on column TBL_LCCONT.managecom
  is '�������';
comment on column TBL_LCCONT.salechnl
  is '��������';
comment on column TBL_LCCONT.getpoldate
  is '�����ʹ�����';
comment on column TBL_LCCONT.getpoltime
  is '�����ʹ�ʱ��';
comment on column TBL_LCCONT.customgetpoldate
  is '������ִ�ͻ�ǩ������';
comment on column TBL_LCCONT.paylocation
  is '����λ��';
comment on column TBL_LCCONT.bankcode
  is '�������б���';
comment on column TBL_LCCONT.bankaccno
  is '���������ʺ�';
comment on column TBL_LCCONT.accname
  is '���������ʻ���';
comment on column TBL_LCCONT.newpaymode
  is '���ڽ��ѷ�ʽ';
comment on column TBL_LCCONT.newbankcode
  is '�������б���';
comment on column TBL_LCCONT.newbankaccno
  is '���������ʺ�';
comment on column TBL_LCCONT.newaccname
  is '���������ʻ���';
comment on column TBL_LCCONT.agentbankcode
  is '�������д���';
comment on column TBL_LCCONT.bankagent
  is '����Ա';
comment on column TBL_LCCONT.prem
  is '����';
comment on column TBL_LCCONT.yearprem
  is '�껯����';
comment on column TBL_LCCONT.extpaymode
  is '���ڽɷѷ�ʽ';
comment on column TBL_LCCONT.sendtime
  is '�ύʱ��';
comment on column TBL_LCCONT.accepttime
  is '�˱�����ʱ��';
comment on column TBL_LCCONT.mnchktime
  is '�˹��˱�ʱ��';
comment on column TBL_LCCONT.printtime
  is '��ӡʱ��';
comment on column TBL_LCCONT.tobanktime
  is '����ʱ��';
comment on column TBL_LCCONT.insuretime
  is '�б�����';
comment on column TBL_LCCONT.canceltime
  is '��������';
comment on column TBL_LCCONT.reefftime
  is '��Ч����';
comment on column TBL_LCCONT.checkstate
  is '�Ժ�״̬';
comment on column TBL_LCCONT.sendstate
  is '���״̬';
comment on column TBL_LCCONT.polstate
  is '����״̬
01	�ݴ�
02	������
03	������
04	��ӡ��
05	�����
06	��ǩ��
07	ת����
08	ת��ʧ��
09	��ǩ��
10	�ѳб�
11	����ʧЧ
12	������ֹ
13	����ȡ��';
comment on column TBL_LCCONT.salecom
  is '���ۻ���';
comment on column TBL_LCCONT.username
  is '����Ա����';
comment on column TBL_LCCONT.userid
  is '����Ա����';
comment on column TBL_LCCONT.posted
  is '���ݴ����־';
comment on column TBL_LCCONT.updatetime
  is '����ʱ��';
comment on column TBL_LCCONT.remark
  is '��ע';
comment on column TBL_LCCONT.state
  is '״̬';
comment on column TBL_LCCONT.reprtflag
  is 'REPRTFLAG';
comment on column TBL_LCCONT.payintv
  is '�ɷ�Ƶ��';
comment on column TBL_LCCONT.tobanktimes
  is 'ת�˴���';
comment on column TBL_LCCONT.yeartotalprem
  is '��ɱ���';
comment on column TBL_LCCONT.groupid
  is '���';
comment on column TBL_LCCONT.campname
  is 'ר������';
comment on column TBL_LCCONT.telcom
  is '��������';
comment on column TBL_LCCONT.courier
  is '���Ա';
comment on column TBL_LCCONT.signatory
  is 'ǩ����';
comment on column TBL_LCCONT.operator
  is '����Ա';
comment on column TBL_LCCONT.makedate
  is '�������';
comment on column TBL_LCCONT.maketime
  is '���ʱ��';
comment on column TBL_LCCONT.modifydate
  is '����޸�����';
comment on column TBL_LCCONT.modifytime
  is '����޸�ʱ��';
comment on column TBL_LCCONT.epressmode
  is '��ݷ�ʽ
1  TSR��ȡ
2  �������
';
comment on column TBL_LCCONT.sustype
  is '�װ�-01���ӱ�-02���ص�-03';
comment on column TBL_LCCONT.conttype
  is '������ʽ
1-���ӱ���
2-���ӱ�����ֽ�ʱ���
3-ֽ�ʱ���';
comment on column TBL_LCCONT.qastate
  is '�ʼ�״̬
1-���ʼ�
2-�ϸ�
3-��¼��
4-ͣ��';
comment on column TBL_LCCONT.fistprem
  is '���ڱ���';
comment on column TBL_LCCONT.otheramnt
  is '����������˾�ۼƱ���';
comment on column TBL_LCCONT.areacode
  is '�������';
comment on column TBL_LCCONT.isfan
  is '�Ƿ�ϴǮ  1 ��    0 ��';
comment on column TBL_LCCONT.firstconttype
  is '�״α�����ʽ';
comment on column TBL_LCCONT.isright
  is '�±������ʹ��
0 ���ϸ�
1 �ϸ�';
comment on column TBL_LCCONT.sourcecustno
  is 'Դ�ͻ���';
comment on column TBL_LCCONT.printtype
  is '��ӡ����';
comment on column TBL_LCCONT.printfalg
  is '��ӡ�����ʾ';
comment on column TBL_LCCONT.printresult
  is '��ӡ���';
comment on column TBL_LCCONT.dprintdate
  is '���ӱ�����ӡ����';
comment on column TBL_LCCONT.dunicode
  is '���ӱ�����ӡΨһ��ˮ��';
-- Create/Recreate indexes 
create index IDX_LCCONT_ACCEPTTIME on TBL_LCCONT (ACCEPTTIME)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LCCONT_AGENTGROUP_BDCX on TBL_LCCONT (AGENTGROUP)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LCCONT_CANCELTIME on TBL_LCCONT (CANCELTIME)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LCCONT_CUSTOMGETPOLDATE on TBL_LCCONT (CUSTOMGETPOLDATE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LCCONT_CUSTSEQNO on TBL_LCCONT (CUSTSEQNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LCCONT_INSURETIME on TBL_LCCONT (INSURETIME)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LCCONT_MANAGECOM on TBL_LCCONT (MANAGECOM)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LCCONT_MAN_TIME on TBL_LCCONT (MANAGECOM, INSURETIME)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LCCONT_DATE_NO on TBL_LCCONT (CUSTOMGETPOLDATE, CUSTSEQNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LCCONT_TIME_NO on TBL_LCCONT (ACCEPTTIME, CUSTSEQNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LCCONT_USERID on TBL_LCCONT (USERID)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LCCONT
  add constraint PK_LCCONT primary key (CONTNO)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LCCONTTRACK
(
  contno          VARCHAR2(20) not null,
  serialno        NUMBER not null,
  contstate       VARCHAR2(8),
  operator        VARCHAR2(25) not null,
  makedate        DATE not null,
  maketime        VARCHAR2(8) not null,
  modifydate      DATE not null,
  modifytime      VARCHAR2(8) not null,
  startdate       DATE,
  enddate         DATE,
  contstatereason VARCHAR2(4)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LCCONTTRACK.contno
  is '������';
comment on column TBL_LCCONTTRACK.serialno
  is 'ÿ�β�����1';
comment on column TBL_LCCONTTRACK.contstate
  is '����״̬';
comment on column TBL_LCCONTTRACK.operator
  is '����Ա';
comment on column TBL_LCCONTTRACK.makedate
  is '�������';
comment on column TBL_LCCONTTRACK.maketime
  is '���ʱ��';
comment on column TBL_LCCONTTRACK.modifydate
  is '����޸�����';
comment on column TBL_LCCONTTRACK.modifytime
  is '����޸�ʱ��';
comment on column TBL_LCCONTTRACK.contstatereason
  is '����״̬����
01	�ݴ�
02	�Ժ�δͨ��
03	������
04	TL�����Ժ˺�
05	�Ժ�ͨ����
06	��ӡ���
07	�ͻ�ǩ�ճɹ�
08	ǩ�ճɹ������л�����
09	ת��ʧ��
10	ǩ���ɹ�
11	��Ч�ɹ�
12	����ʧЧ
13	�˱�
14	����
15	Э���˱�
16	ʧЧ��ֹ
17	������ֹ
18	����
19	��Ϣ����
20	ȡ������
';
-- Create/Recreate indexes 
create index IDX_LCCONTTRACK_CON_NO on TBL_LCCONTTRACK (CONTSTATEREASON, CONTNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LCCONTTRACK
  add constraint PK_TBL_LTCONTTRACK primary key (CONTNO, SERIALNO)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LCFREESENDINFO
(
  custno         VARCHAR2(60) not null,
  contno         VARCHAR2(20) not null,
  prtno          VARCHAR2(20),
  productname    VARCHAR2(80),
  productcode    VARCHAR2(10),
  sendtime       DATE,
  efftime        DATE,
  exptime        DATE,
  custname       VARCHAR2(30),
  sex            VARCHAR2(1),
  birth          VARCHAR2(10),
  idno           VARCHAR2(20),
  city           VARCHAR2(50),
  district       VARCHAR2(50),
  address        VARCHAR2(200),
  zipcode        VARCHAR2(6),
  phone          VARCHAR2(50),
  worktype       VARCHAR2(80),
  occupationname VARCHAR2(120),
  occupationcode VARCHAR2(10),
  occupationtype VARCHAR2(10),
  active         VARCHAR2(1),
  activetime     DATE,
  remark         VARCHAR2(1000),
  updatetime     DATE,
  giftserial     NUMBER(4) not null,
  hcity          VARCHAR2(50),
  hdistrict      VARCHAR2(50),
  haddress       VARCHAR2(200),
  pmaturity      VARCHAR2(6),
  sendtext       VARCHAR2(200),
  activetext     VARCHAR2(200),
  activeuserid   VARCHAR2(25),
  insuretime     DATE,
  idtype         VARCHAR2(1),
  havecar        VARCHAR2(1),
  fixedphone     VARCHAR2(20),
  senduserid     VARCHAR2(25),
  email          VARCHAR2(50),
  plflag         VARCHAR2(1),
  syneflag       VARCHAR2(1),
  sendflag       VARCHAR2(2),
  sendflagname   VARCHAR2(10),
  groupid        VARCHAR2(20),
  activesource   VARCHAR2(1),
  issendarea     VARCHAR2(1),
  managecom      VARCHAR2(20),
  state          VARCHAR2(1),
  sourcecustno   VARCHAR2(60),
  cleanno        VARCHAR2(20)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LCFREESENDINFO.custno
  is '�����';
comment on column TBL_LCFREESENDINFO.contno
  is '��ͬ����';
comment on column TBL_LCFREESENDINFO.prtno
  is 'ӡˢ����';
comment on column TBL_LCFREESENDINFO.productname
  is '��Ѳ�Ʒ����';
comment on column TBL_LCFREESENDINFO.productcode
  is '��Ѳ�Ʒ����';
comment on column TBL_LCFREESENDINFO.sendtime
  is '����ʱ��';
comment on column TBL_LCFREESENDINFO.efftime
  is '��Чʱ��';
comment on column TBL_LCFREESENDINFO.exptime
  is '��Ч�ڽ�ֹʱ��';
comment on column TBL_LCFREESENDINFO.custname
  is '�ͻ�����';
comment on column TBL_LCFREESENDINFO.sex
  is '�Ա�';
comment on column TBL_LCFREESENDINFO.birth
  is '����';
comment on column TBL_LCFREESENDINFO.idno
  is '֤������';
comment on column TBL_LCFREESENDINFO.city
  is '��ϵ����';
comment on column TBL_LCFREESENDINFO.district
  is '��ϵ����';
comment on column TBL_LCFREESENDINFO.address
  is '��ϵ��ַ';
comment on column TBL_LCFREESENDINFO.zipcode
  is '��ϵ�ʱ�';
comment on column TBL_LCFREESENDINFO.phone
  is '��ϵ�绰';
comment on column TBL_LCFREESENDINFO.worktype
  is '��ҵ';
comment on column TBL_LCFREESENDINFO.occupationname
  is 'ְҵ';
comment on column TBL_LCFREESENDINFO.occupationcode
  is 'ְҵ����';
comment on column TBL_LCFREESENDINFO.occupationtype
  is 'ְҵ�ȼ�';
comment on column TBL_LCFREESENDINFO.active
  is '1 Ϊ���� 2 ���� 0������';
comment on column TBL_LCFREESENDINFO.remark
  is '��ע';
comment on column TBL_LCFREESENDINFO.updatetime
  is '����ʱ��';
comment on column TBL_LCFREESENDINFO.giftserial
  is '��Ʒ���';
comment on column TBL_LCFREESENDINFO.hcity
  is '��ͥ����';
comment on column TBL_LCFREESENDINFO.hdistrict
  is '��ͥ����';
comment on column TBL_LCFREESENDINFO.haddress
  is '��ͥ��ַ';
comment on column TBL_LCFREESENDINFO.pmaturity
  is '���յ�����';
comment on column TBL_LCFREESENDINFO.insuretime
  is 'Ͷ��ʱ��';
comment on column TBL_LCFREESENDINFO.idtype
  is '֤������';
comment on column TBL_LCFREESENDINFO.state
  is '�Ƿ�����ϴת����';
comment on column TBL_LCFREESENDINFO.sourcecustno
  is 'Դ�ͻ���';
comment on column TBL_LCFREESENDINFO.cleanno
  is '��ϴ��ˮ��';
-- Create/Recreate indexes 
create index IDX_LCFREESENDINFO_CONTNO on TBL_LCFREESENDINFO (CONTNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LCFREESENDINFO_PHONE on TBL_LCFREESENDINFO (PHONE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LCFREESENDINFO_SENDTIME on TBL_LCFREESENDINFO (SENDTIME, SENDUSERID)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LCFREESENDINFO_DANO on TBL_LCFREESENDINFO (SENDTIME, CUSTNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LCFREESENDINFO_ID on TBL_LCFREESENDINFO (SENDUSERID)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LCFREESENDINFO_SEND on TBL_LCFREESENDINFO (SENDTIME)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LCFREESENDINFO_SOURCE on TBL_LCFREESENDINFO (SOURCECUSTNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LCFREESENDINFO_TIME on TBL_LCFREESENDINFO (SENDTIME, CONTNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LCFREESENDINFO
  add constraint PK_FREEPRODUCT_CUST primary key (CUSTNO, GIFTSERIAL)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LCINSURED
(
  contno                VARCHAR2(20) not null,
  customerno            VARCHAR2(24) not null,
  name                  VARCHAR2(120),
  sex                   VARCHAR2(23),
  birthday              DATE,
  idtype                VARCHAR2(3),
  idno                  VARCHAR2(20),
  marriage              VARCHAR2(4),
  degree                VARCHAR2(6),
  nativeplace           VARCHAR2(3),
  rgtaddress            VARCHAR2(80),
  nationality           VARCHAR2(3),
  worktype              VARCHAR2(40),
  occupationtype        VARCHAR2(10),
  occupationcode        VARCHAR2(10),
  occupationname        VARCHAR2(120),
  pluralitytype         VARCHAR2(40),
  highestworktype       VARCHAR2(40),
  pluralityname         VARCHAR2(120),
  pluralitycode         VARCHAR2(10),
  license               VARCHAR2(1),
  licensetype           VARCHAR2(4),
  sequenceno            VARCHAR2(20),
  relationtomaininsured VARCHAR2(2),
  relationtoappnt       VARCHAR2(2),
  insuredno             VARCHAR2(2),
  posted                VARCHAR2(1),
  email                 VARCHAR2(60),
  updatetime            DATE,
  age                   VARCHAR2(4),
  callback              VARCHAR2(36),
  operator              VARCHAR2(80) not null,
  makedate              DATE not null,
  maketime              VARCHAR2(8) not null,
  modifydate            DATE not null,
  modifytime            VARCHAR2(8) not null,
  addressno             VARCHAR2(2),
  cervaliddate          DATE,
  secworktype           VARCHAR2(100),
  iscustomer            VARCHAR2(1),
  highcode              VARCHAR2(10),
  highworktype          VARCHAR2(100),
  datecode              VARCHAR2(1),
  height                VARCHAR2(10),
  weight                VARCHAR2(10)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LCINSURED.contno
  is '��ͬ����';
comment on column TBL_LCINSURED.customerno
  is '�����˿ͻ���';
comment on column TBL_LCINSURED.name
  is '����������';
comment on column TBL_LCINSURED.sex
  is '�������Ա�';
comment on column TBL_LCINSURED.birthday
  is '�����˳�������';
comment on column TBL_LCINSURED.idtype
  is '������֤������';
comment on column TBL_LCINSURED.idno
  is '������֤������';
comment on column TBL_LCINSURED.marriage
  is '����״��';
comment on column TBL_LCINSURED.degree
  is 'ѧ��';
comment on column TBL_LCINSURED.nativeplace
  is '����';
comment on column TBL_LCINSURED.rgtaddress
  is '�������ڵ�';
comment on column TBL_LCINSURED.nationality
  is '����';
comment on column TBL_LCINSURED.worktype
  is 'ְҵ������)';
comment on column TBL_LCINSURED.occupationtype
  is 'ְҵ���';
comment on column TBL_LCINSURED.occupationcode
  is 'ְҵ����';
comment on column TBL_LCINSURED.occupationname
  is 'ְҵ����';
comment on column TBL_LCINSURED.pluralitytype
  is '��ְְҵ�ȼ�';
comment on column TBL_LCINSURED.highestworktype
  is '���ְҵ�ȼ�';
comment on column TBL_LCINSURED.pluralityname
  is '��ְְҵ����';
comment on column TBL_LCINSURED.pluralitycode
  is '��ְְҵ����';
comment on column TBL_LCINSURED.license
  is '����';
comment on column TBL_LCINSURED.licensetype
  is '��������';
comment on column TBL_LCINSURED.sequenceno
  is '�ͻ��ڲ�����';
comment on column TBL_LCINSURED.relationtomaininsured
  is '���������˹�ϵ';
comment on column TBL_LCINSURED.relationtoappnt
  is '��Ͷ���˹�ϵ';
comment on column TBL_LCINSURED.insuredno
  is '�����˴���';
comment on column TBL_LCINSURED.posted
  is '���ݴ����־';
comment on column TBL_LCINSURED.email
  is '��������';
comment on column TBL_LCINSURED.updatetime
  is '����ʱ��';
comment on column TBL_LCINSURED.age
  is '����';
comment on column TBL_LCINSURED.callback
  is '�طõ绰';
comment on column TBL_LCINSURED.operator
  is '����Ա';
comment on column TBL_LCINSURED.makedate
  is '�������';
comment on column TBL_LCINSURED.maketime
  is '���ʱ��';
comment on column TBL_LCINSURED.modifydate
  is '����޸�����';
comment on column TBL_LCINSURED.modifytime
  is '����޸�ʱ��';
comment on column TBL_LCINSURED.iscustomer
  is '����-0 ��-1';
comment on column TBL_LCINSURED.highcode
  is '���ְҵ����';
comment on column TBL_LCINSURED.highworktype
  is '���ְҵ(����)';
comment on column TBL_LCINSURED.datecode
  is '1-��Ч��
2-����';
comment on column TBL_LCINSURED.height
  is '���';
comment on column TBL_LCINSURED.weight
  is '����';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LCINSURED
  add constraint PK_LCINSURED primary key (CONTNO, CUSTOMERNO)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LCPOL
(
  polno          VARCHAR2(20) not null,
  contno         VARCHAR2(20) not null,
  riskcode       VARCHAR2(10) not null,
  mainriskcode   VARCHAR2(10) not null,
  amnt           NUMBER(16,2),
  prem           NUMBER(16,2),
  mult           NUMBER(20,5),
  rnewflag       NUMBER(2),
  insuyearflag   VARCHAR2(1),
  payendyearflag VARCHAR2(1),
  getbankcode    VARCHAR2(10),
  getbankaccno   VARCHAR2(40),
  getaccname     VARCHAR2(60),
  autopayflag    VARCHAR2(1),
  bonusgetmode   VARCHAR2(1),
  subflag        VARCHAR2(1),
  customerno     VARCHAR2(24) not null,
  posted         VARCHAR2(1),
  updatetime     DATE,
  payintv        NUMBER(2),
  payyears       NUMBER(3),
  insuyear       NUMBER(4),
  payendyear     NUMBER(3),
  addprem        NUMBER(18,2),
  addpremintv    NUMBER(2),
  riskversion    VARCHAR2(10),
  cvalidate      DATE,
  operator       VARCHAR2(80) not null,
  makedate       DATE not null,
  maketime       VARCHAR2(8) not null,
  modifydate     DATE not null,
  modifytime     VARCHAR2(8) not null,
  PLANCODE varchar(10),  
  DUTYCODE varchar(10),  
  PLANMARK1 varchar(20),
  PLANMARK2 varchar(20),
  PLANMARK3 varchar(20)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LCPOL.polno
  is '�������ֺ���';
comment on column TBL_LCPOL.contno
  is '��ͬ����';
comment on column TBL_LCPOL.riskcode
  is '���ֱ���';
comment on column TBL_LCPOL.mainriskcode
  is '�����ִ���';
comment on column TBL_LCPOL.amnt
  is '��������';
comment on column TBL_LCPOL.prem
  is '����';
comment on column TBL_LCPOL.mult
  is '����';
comment on column TBL_LCPOL.rnewflag
  is '������־';
comment on column TBL_LCPOL.insuyearflag
  is '�����������ڱ�־';
comment on column TBL_LCPOL.payendyearflag
  is '�ս��������ڱ�־';
comment on column TBL_LCPOL.getbankcode
  is '��ȡ���б���';
comment on column TBL_LCPOL.getbankaccno
  is '��ȡ�����˻�';
comment on column TBL_LCPOL.getaccname
  is '��ȡ���л���';
comment on column TBL_LCPOL.autopayflag
  is '�Զ��潻��־';
comment on column TBL_LCPOL.bonusgetmode
  is '��������ȡ��ʽ';
comment on column TBL_LCPOL.subflag
  is '������־';
comment on column TBL_LCPOL.customerno
  is '�����˿ͻ���';
comment on column TBL_LCPOL.posted
  is '���ݴ����־';
comment on column TBL_LCPOL.updatetime
  is '����ʱ��';
comment on column TBL_LCPOL.payintv
  is '���Ѽ��';
comment on column TBL_LCPOL.payyears
  is '��������';
comment on column TBL_LCPOL.insuyear
  is '������������';
comment on column TBL_LCPOL.payendyear
  is '�ս���������';
comment on column TBL_LCPOL.addprem
  is '׷�ӱ���';
comment on column TBL_LCPOL.addpremintv
  is '׷�ӱ���Ƶ��';
comment on column TBL_LCPOL.riskversion
  is '���ְ汾';
comment on column TBL_LCPOL.cvalidate
  is '��Ч��';
comment on column TBL_LCPOL.operator
  is '����Ա';
comment on column TBL_LCPOL.makedate
  is '�������';
comment on column TBL_LCPOL.maketime
  is '���ʱ��';
comment on column TBL_LCPOL.modifydate
  is '����޸�����';
comment on column TBL_LCPOL.modifytime
  is '����޸�ʱ��';
-- Create/Recreate indexes 
create index IDX_CON_MAINRISKCODE on TBL_LCPOL (CONTNO, MAINRISKCODE, MULT, RISKCODE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LCPOL
  add constraint PK_LCPOL primary key (POLNO)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LDADDRESS
(
  placetype   VARCHAR2(2) not null,
  placecode   VARCHAR2(20) not null,
  placename   VARCHAR2(100),
  upplacename VARCHAR2(20),
  jc          VARCHAR2(25),
  placestate  VARCHAR2(10)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LDADDRESS.placetype
  is '��������
01-ʡ
02-��
03-��/��';
comment on column TBL_LDADDRESS.placecode
  is '�������';
comment on column TBL_LDADDRESS.placename
  is '��������';
comment on column TBL_LDADDRESS.upplacename
  is '�ϼ��������';
comment on column TBL_LDADDRESS.jc
  is '����ĸ';
comment on column TBL_LDADDRESS.placestate
  is '��ַ״ 1-��Ч 0-��Ч';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LDADDRESS
  add constraint PK_LDADDRESS primary key (PLACETYPE, PLACECODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LDBANK
(
  bankcode     VARCHAR2(20) not null,
  bankname     VARCHAR2(200) not null,
  comcode      VARCHAR2(10) not null,
  chiefbank    VARCHAR2(100),
  standbyflag1 VARCHAR2(20),
  zbankcode    VARCHAR2(20)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LDBANK.bankcode
  is '���б���';
comment on column TBL_LDBANK.bankname
  is '��������';
comment on column TBL_LDBANK.comcode
  is '��������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LDBANK
  add constraint PK_TBL_LDBANK primary key (BANKCODE, COMCODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LDCITY
(
  citycode     VARCHAR2(6) not null,
  cityname     VARCHAR2(50) not null,
  provincecode VARCHAR2(10) not null,
  cityorder    VARCHAR2(2) not null,
  validflag    VARCHAR2(1) default '1' not null,
  operator     VARCHAR2(25) not null,
  makedate     DATE not null,
  maketime     VARCHAR2(8) not null,
  modifydate   DATE not null,
  modifytime   VARCHAR2(8) not null,
  comcode      VARCHAR2(10)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_LDCITY
  is '7/18
�¹�';
-- Add comments to the columns 
comment on column TBL_LDCITY.citycode
  is '�м�����';
comment on column TBL_LDCITY.cityname
  is '��������';
comment on column TBL_LDCITY.provincecode
  is 'ʡ����';
comment on column TBL_LDCITY.cityorder
  is '��ʾ˳��';
comment on column TBL_LDCITY.validflag
  is '״̬λ
0Ϊ��Ч��1Ϊ��Ч';
comment on column TBL_LDCITY.operator
  is '������';
comment on column TBL_LDCITY.makedate
  is '�������';
comment on column TBL_LDCITY.maketime
  is '���ʱ��';
comment on column TBL_LDCITY.modifydate
  is '����޸�����';
comment on column TBL_LDCITY.modifytime
  is '����޸�ʱ��';
comment on column TBL_LDCITY.comcode
  is '�������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LDCITY
  add constraint PK_TBL_LDCITY primary key (CITYCODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LDCOM
(
  comcode            VARCHAR2(10) not null,
  outcomcode         VARCHAR2(10),
  comname            VARCHAR2(100),
  shortname          VARCHAR2(60),
  address            VARCHAR2(80),
  zipcode            VARCHAR2(6),
  phone              VARCHAR2(18),
  fax                VARCHAR2(18),
  email              VARCHAR2(60),
  webaddress         VARCHAR2(100),
  satrapname         VARCHAR2(20),
  insumonitorcode    VARCHAR2(10),
  insureid           VARCHAR2(12),
  signid             VARCHAR2(6),
  regionalismcode    VARCHAR2(6),
  comnature          VARCHAR2(1),
  validcode          VARCHAR2(2),
  sign               VARCHAR2(10),
  comcitysize        VARCHAR2(1),
  servicename        VARCHAR2(120),
  serviceno          VARCHAR2(60),
  servicephone       VARCHAR2(18),
  servicepostaddress VARCHAR2(120),
  comgrade           VARCHAR2(2),
  comareatype        VARCHAR2(2),
  upcomcode          VARCHAR2(10),
  isdirunder         VARCHAR2(1)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LDCOM.comcitysize
  is '���ֶ���ʱ���ڴ洢�շ�Ա�����Ļ�����������
1-һ�����
2-�������
3-�������
4-�������';
comment on column TBL_LDCOM.servicename
  is '01-֧��˾(Ӫ������)
02-����֧��˾
03-�ֹ�˾
04-�ܹ�˾';
comment on column TBL_LDCOM.serviceno
  is '01-֧��˾(Ӫ������)
02-����֧��˾
03-�ֹ�˾
04-�ܹ�˾';
comment on column TBL_LDCOM.servicephone
  is '01-֧��˾(Ӫ������)
02-����֧��˾
03-�ֹ�˾
04-�ܹ�˾';
comment on column TBL_LDCOM.servicepostaddress
  is '01-֧��˾(Ӫ������)
02-����֧��˾
03-�ֹ�˾
04-�ܹ�˾';
comment on column TBL_LDCOM.comgrade
  is '01-�ܹ�˾
02-�ֹ�˾
03-����֧��˾
04-֧��˾(Ӫ������)
';
comment on column TBL_LDCOM.comareatype
  is '1:һ�����
2���������';
comment on column TBL_LDCOM.isdirunder
  is '1:ֱ����֧
2����ֱ����֧���磺Ӫ�����񲿣�';
-- Create/Recreate indexes 
create index IDX_LDCOM_COMCODE_OUT on TBL_LDCOM (COMCODE, OUTCOMCODE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LDCOM
  add constraint PK_TBL_LDCOM primary key (COMCODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LDPLAN
(
  contplancode VARCHAR2(20) not null,
  contplanname VARCHAR2(120),
  plantype     VARCHAR2(1) not null,
  planrule     VARCHAR2(100),
  plansql      VARCHAR2(500),
  remark       VARCHAR2(2000),
  operator     VARCHAR2(80),
  makedate     DATE,
  maketime     VARCHAR2(8),
  modifydate   DATE,
  modifytime   VARCHAR2(8),
  peoples3     INTEGER,
  remark2      VARCHAR2(2000),
  managecom    VARCHAR2(10),
  salechnl     VARCHAR2(2),
  startdate    DATE,
  enddate      DATE,
  state        VARCHAR2(1),
  ifelc        VARCHAR2(1)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_LDPLAN
  is '�����ײͼƻ���';
-- Add comments to the columns 
comment on column TBL_LDPLAN.contplancode
  is '���ռƻ�����    00-Ĭ��ֵ';
comment on column TBL_LDPLAN.contplanname
  is '���ռƻ�����';
comment on column TBL_LDPLAN.plantype
  is '�ƻ����:
0-�̶��ƻ���
1-�ǹ̶��ƻ�
3-����Ĭ��ֵ
4-�ײͼƻ�';
comment on column TBL_LDPLAN.planrule
  is '�ƻ�����';
comment on column TBL_LDPLAN.plansql
  is '�ƻ�����sql';
comment on column TBL_LDPLAN.remark
  is '��������';
comment on column TBL_LDPLAN.operator
  is '����Ա';
comment on column TBL_LDPLAN.makedate
  is '�������';
comment on column TBL_LDPLAN.maketime
  is '���ʱ��';
comment on column TBL_LDPLAN.modifydate
  is '���һ���޸�����';
comment on column TBL_LDPLAN.modifytime
  is '���һ���޸�ʱ��';
comment on column TBL_LDPLAN.peoples3
  is '��Ͷ������';
comment on column TBL_LDPLAN.remark2
  is '��������';
comment on column TBL_LDPLAN.managecom
  is '�������';
comment on column TBL_LDPLAN.salechnl
  is '��������:
1-����Ӫ��,2-����ֱ��,3-���д���
';
comment on column TBL_LDPLAN.startdate
  is '��������';
comment on column TBL_LDPLAN.enddate
  is '����ֹ��';
comment on column TBL_LDPLAN.state
  is '״̬:
���Դ洢��Ʒ�������״̬

0-�����У���Ʒ��ϱ���ʱָ����
1-�����
2-�����
3-������
4-������

5-��˲�ͨ��
7-������ͨ��

9-���';
comment on column TBL_LDPLAN.ifelc
  is '�Ƿ��������ӱ��� 0 �� 1 ��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LDPLAN
  add constraint PK_TBL_LDPLAN primary key (CONTPLANCODE, PLANTYPE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LDPLANRISK
(
  mainriskcode    VARCHAR2(10) not null,
  mainriskversion VARCHAR2(8),
  riskcode        VARCHAR2(10) not null,
  riskversion     VARCHAR2(8),
  contplancode    VARCHAR2(20) not null,
  contplanname    VARCHAR2(120),
  remark          VARCHAR2(2000),
  operator        VARCHAR2(80),
  makedate        DATE,
  maketime        VARCHAR2(8),
  modifydate      DATE,
  modifytime      VARCHAR2(8),
  plantype        VARCHAR2(1) not null
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_LDPLANRISK
  is '���ֱ����ײͼƻ���';
-- Add comments to the columns 
comment on column TBL_LDPLANRISK.mainriskcode
  is '�������ֱ���';
comment on column TBL_LDPLANRISK.mainriskversion
  is '�������ְ汾';
comment on column TBL_LDPLANRISK.riskcode
  is '���ֱ���';
comment on column TBL_LDPLANRISK.riskversion
  is '���ְ汾';
comment on column TBL_LDPLANRISK.contplancode
  is '���ռƻ�����:
00-Ĭ��ֵ';
comment on column TBL_LDPLANRISK.contplanname
  is '���ռƻ�����';
comment on column TBL_LDPLANRISK.remark
  is '��������';
comment on column TBL_LDPLANRISK.operator
  is '����Ա';
comment on column TBL_LDPLANRISK.makedate
  is '�������';
comment on column TBL_LDPLANRISK.maketime
  is '���ʱ��';
comment on column TBL_LDPLANRISK.modifydate
  is '���һ���޸�����';
comment on column TBL_LDPLANRISK.modifytime
  is '���һ���޸�ʱ��';
comment on column TBL_LDPLANRISK.plantype
  is '�ƻ����
0-�̶��ƻ���
1-�ǹ̶��ƻ�
3-����Ĭ��ֵ
4-�ײͼƻ�';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LDPLANRISK
  add constraint PK_TBL_LDPLANRISK primary key (MAINRISKCODE, RISKCODE, CONTPLANCODE, PLANTYPE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LDPROVINCE
(
  provincecode  VARCHAR2(10) not null,
  provincename  VARCHAR2(50) not null,
  provinceorder VARCHAR2(2) not null,
  validflag     VARCHAR2(1) default '1' not null,
  operator      VARCHAR2(25) not null,
  makedate      DATE not null,
  maketime      VARCHAR2(8) not null,
  modifydate    DATE not null,
  modifytime    VARCHAR2(8) not null
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_LDPROVINCE
  is '7/18
�¹�';
-- Add comments to the columns 
comment on column TBL_LDPROVINCE.provincecode
  is 'ʡ����';
comment on column TBL_LDPROVINCE.provincename
  is 'ʡ����';
comment on column TBL_LDPROVINCE.provinceorder
  is '��ʾ˳��';
comment on column TBL_LDPROVINCE.validflag
  is '״̬λ
0Ϊ��Ч��1Ϊ��Ч';
comment on column TBL_LDPROVINCE.operator
  is '������';
comment on column TBL_LDPROVINCE.makedate
  is '�������';
comment on column TBL_LDPROVINCE.maketime
  is '���ʱ��';
comment on column TBL_LDPROVINCE.modifydate
  is '����޸�����';
comment on column TBL_LDPROVINCE.modifytime
  is '����޸�ʱ��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LDPROVINCE
  add constraint PK_TBL_LDPROVINCE primary key (PROVINCECODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LDTERMCODE
(
  termcode   VARCHAR2(12) not null,
  ptermcode  VARCHAR2(12),
  clevel     VARCHAR2(1),
  codevelue  VARCHAR2(50) not null,
  enabled    VARCHAR2(1),
  userlevel  VARCHAR2(8),
  orderid    NUMBER(4),
  status     VARCHAR2(1),
  operator   VARCHAR2(25) not null,
  makedate   DATE not null,
  maketime   VARCHAR2(8) not null,
  modifydate DATE not null,
  modifytime VARCHAR2(8) not null,
  termtype   VARCHAR2(2) not null
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LDTERMCODE.ptermcode
  is '�������';
comment on column TBL_LDTERMCODE.clevel
  is '�������������㼶��1
��ʼֵΪ 1';
comment on column TBL_LDTERMCODE.enabled
  is '�Ƿ���ʾ';
comment on column TBL_LDTERMCODE.userlevel
  is '�û�����';
comment on column TBL_LDTERMCODE.orderid
  is '�����';
comment on column TBL_LDTERMCODE.status
  is '״̬λ
0Ϊ��Ч��1Ϊ��Ч';
comment on column TBL_LDTERMCODE.operator
  is '������';
comment on column TBL_LDTERMCODE.makedate
  is '�������';
comment on column TBL_LDTERMCODE.maketime
  is '���ʱ��';
comment on column TBL_LDTERMCODE.modifydate
  is '����޸�����';
comment on column TBL_LDTERMCODE.modifytime
  is '����޸�ʱ��';
comment on column TBL_LDTERMCODE.termtype
  is '����������
0�����۽�����
1����ϴ������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LDTERMCODE
  add constraint PK_TBL_LDTERMCODE primary key (TERMCODE, TERMTYPE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LDUSER
(
  usercode          VARCHAR2(25) not null,
  username          VARCHAR2(120),
  managecom         VARCHAR2(20),
  comcode           VARCHAR2(20),
  password          VARCHAR2(48),
  userdescription   VARCHAR2(50),
  userstate         VARCHAR2(1),
  superpopedomflag  VARCHAR2(1),
  validstartdate    DATE,
  validenddate      DATE,
  phone             VARCHAR2(20),
  extphone          VARCHAR2(20),
  position          VARCHAR2(20),
  email             VARCHAR2(120),
  defmaxnum         NUMBER(4),
  spemaxnum         NUMBER(4),
  operator          VARCHAR2(25),
  makedate          DATE,
  maketime          VARCHAR2(8),
  modifydate        DATE,
  modifytime        VARCHAR2(8),
  insideflag        VARCHAR2(2),
  lastchangepwddate DATE default sysdate,
  amcode            VARCHAR2(25)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_LDUSER
  is '7/13  MANAGECOM  �������   ׷��
          MENUGRPCODE �˵��������  ׷�� ->ɾ��';
-- Add comments to the columns 
comment on column TBL_LDUSER.usercode
  is '�û�����';
comment on column TBL_LDUSER.username
  is '�û�����';
comment on column TBL_LDUSER.managecom
  is '�������';
comment on column TBL_LDUSER.comcode
  is '��������';
comment on column TBL_LDUSER.password
  is '����';
comment on column TBL_LDUSER.userdescription
  is '�û�����';
comment on column TBL_LDUSER.userstate
  is '�û�״̬';
comment on column TBL_LDUSER.superpopedomflag
  is '����Ȩ�ޱ�־';
comment on column TBL_LDUSER.validstartdate
  is '��Ч��ʼ����';
comment on column TBL_LDUSER.validenddate
  is '��Ч��������';
comment on column TBL_LDUSER.phone
  is '�绰';
comment on column TBL_LDUSER.extphone
  is '�ֻ���';
comment on column TBL_LDUSER.position
  is '��ַ';
comment on column TBL_LDUSER.email
  is 'e-mail';
comment on column TBL_LDUSER.defmaxnum
  is '�����ȡ����';
comment on column TBL_LDUSER.spemaxnum
  is '����ȡ����';
comment on column TBL_LDUSER.operator
  is '����Ա����';
comment on column TBL_LDUSER.makedate
  is '�������';
comment on column TBL_LDUSER.maketime
  is '���ʱ��';
comment on column TBL_LDUSER.modifydate
  is '���һ���޸�����';
comment on column TBL_LDUSER.modifytime
  is '���һ���޸�ʱ��';
comment on column TBL_LDUSER.insideflag
  is '�����ڱ��';
comment on column TBL_LDUSER.amcode
  is '�����ı���';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LDUSER
  add constraint PK_LDUSER primary key (USERCODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LMCAMPAIGN
(
  campcode     VARCHAR2(50) not null,
  campname     VARCHAR2(120) not null,
  camptype     VARCHAR2(8),
  campaigntalk VARCHAR2(4000),
  campaignsrit VARCHAR2(200),
  callarea     VARCHAR2(8),
  comcode      VARCHAR2(10),
  teamtype     VARCHAR2(2),
  dataprovince VARCHAR2(10),
  datacity     VARCHAR2(10),
  status       VARCHAR2(1),
  partnercode  VARCHAR2(20),
  startdate    DATE,
  enddate      DATE,
  addname      VARCHAR2(25),
  addtime      DATE,
  editname     VARCHAR2(25),
  edittime     DATE,
  orderid      NUMBER(4),
  fdatatype    VARCHAR2(1),
  operator     VARCHAR2(25) not null,
  makedate     DATE not null,
  maketime     VARCHAR2(8) not null,
  modifydate   DATE not null,
  modifytime   VARCHAR2(8) not null,
  infotype     VARCHAR2(10),
  gettype      VARCHAR2(20),
  recheck      VARCHAR2(1),
  priority     NUMBER(4),
  nameprice    NUMBER(20),
  pmodulus     NUMBER(16,2),
  hmodulus     NUMBER(16,2),
  partnertearm VARCHAR2(20),
  purpose      VARCHAR2(2),
  usemonth     VARCHAR2(6)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_LMCAMPAIGN
  is '��ͬ�ڼȴ�����ġ�CAMPAIGN��
7/15
1 �������򡢵������ġ�ר������ʡ��ר���������� --��׷��';
-- Add comments to the columns 
comment on column TBL_LMCAMPAIGN.campcode
  is 'ר������';
comment on column TBL_LMCAMPAIGN.campname
  is 'ר������';
comment on column TBL_LMCAMPAIGN.camptype
  is 'ר�����ͣ�01-ͨ���͡�02-��Ŀ�͡�03-����ͣ�';
comment on column TBL_LMCAMPAIGN.campaigntalk
  is 'ר������';
comment on column TBL_LMCAMPAIGN.campaignsrit
  is 'ר������';
comment on column TBL_LMCAMPAIGN.callarea
  is '��������';
comment on column TBL_LMCAMPAIGN.comcode
  is '������������';
comment on column TBL_LMCAMPAIGN.teamtype
  is '�Ŷ�����: ��ƴ����дָ��, �����Ŷ�ΪXS, ��ϴ�Ŷ�ΪQX';
comment on column TBL_LMCAMPAIGN.dataprovince
  is 'ר������ʡ';
comment on column TBL_LMCAMPAIGN.datacity
  is 'ר����������';
comment on column TBL_LMCAMPAIGN.status
  is 'ר��״̬
0:��Ч
1:��Ч';
comment on column TBL_LMCAMPAIGN.partnercode
  is '�����������';
comment on column TBL_LMCAMPAIGN.startdate
  is '��ʼ����';
comment on column TBL_LMCAMPAIGN.enddate
  is '��������';
comment on column TBL_LMCAMPAIGN.addname
  is '������';
comment on column TBL_LMCAMPAIGN.addtime
  is '����ʱ��';
comment on column TBL_LMCAMPAIGN.editname
  is '�༭��';
comment on column TBL_LMCAMPAIGN.edittime
  is '�༭ʱ��';
comment on column TBL_LMCAMPAIGN.orderid
  is '�����';
comment on column TBL_LMCAMPAIGN.fdatatype
  is '�Ƿ��Խ�';
comment on column TBL_LMCAMPAIGN.operator
  is '������';
comment on column TBL_LMCAMPAIGN.makedate
  is '�������';
comment on column TBL_LMCAMPAIGN.maketime
  is '���ʱ��';
comment on column TBL_LMCAMPAIGN.modifydate
  is '����޸�����';
comment on column TBL_LMCAMPAIGN.modifytime
  is '����޸�ʱ��';
comment on column TBL_LMCAMPAIGN.infotype
  is '��������';
comment on column TBL_LMCAMPAIGN.gettype
  is '��������(�������������Ӧ�ſ�)';
comment on column TBL_LMCAMPAIGN.recheck
  is '�Ƿ����
0-��
1-��';
comment on column TBL_LMCAMPAIGN.purpose
  is 'ר����; 0-�Խ��Ŷ� 1-����Ŷ�';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LMCAMPAIGN
  add constraint PK_TBL_LMCAMPAIGN primary key (CAMPCODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LMDATAREL
(
  calllistno VARCHAR2(200) not null,
  inputnum   VARCHAR2(250) not null,
  campcode   VARCHAR2(50),
  status     VARCHAR2(1),
  operator   VARCHAR2(25) not null,
  makedate   DATE not null,
  maketime   VARCHAR2(8) not null,
  modifydate DATE not null,
  modifytime VARCHAR2(8) not null
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_LMDATAREL
  is '����ר�������뵼�����ε����ݹ���';
-- Add comments to the columns 
comment on column TBL_LMDATAREL.calllistno
  is 'ר�����κ�';
comment on column TBL_LMDATAREL.inputnum
  is '�������κ� ��ʽ����Ҫ�����ṩ��������';
comment on column TBL_LMDATAREL.campcode
  is 'ר������';
comment on column TBL_LMDATAREL.status
  is '״̬λ
0Ϊ��Ч��1Ϊ��Ч';
comment on column TBL_LMDATAREL.operator
  is '������';
comment on column TBL_LMDATAREL.makedate
  is '�������';
comment on column TBL_LMDATAREL.maketime
  is '���ʱ��';
comment on column TBL_LMDATAREL.modifydate
  is '����޸�����';
comment on column TBL_LMDATAREL.modifytime
  is '����޸�ʱ��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LMDATAREL
  add constraint PK_TBL_LMDATAREL primary key (CALLLISTNO, INPUTNUM)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LMRISKAPP
(
  riskcode       VARCHAR2(30) not null,
  riskver        VARCHAR2(8),
  riskname       VARCHAR2(120),
  kindcode       VARCHAR2(3),
  risktype       VARCHAR2(1),
  riskperiod     VARCHAR2(1),
  risktypedetail VARCHAR2(3),
  subriskflag    VARCHAR2(1),
  insuperiodflag VARCHAR2(1),
  minappntage    INTEGER,
  maxappntage    INTEGER,
  maxinsuredage  INTEGER,
  mininsuredage  INTEGER,
  insuredflag    VARCHAR2(1),
  calcode        VARCHAR2(4000),
  ratetable      VARCHAR2(100),
  vpu            NUMBER(12,2),
  amntflag       VARCHAR2(2),
  calmode        VARCHAR2(2),
  risktype3      VARCHAR2(1),
  risktype7      VARCHAR2(1),
  state          VARCHAR2(1)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LMRISKAPP.kindcode
  is '��Ϊ�ķ���
DX-����
DB-ȷ��������
DC-ȷ���ɷ���';
comment on column TBL_LMRISKAPP.risktype
  is 'L--����(Life)��
A--������(Accident)��
H--������(Health)
';
comment on column TBL_LMRISKAPP.riskperiod
  is 'L--����(Long)��M--һ������(Middle)��S--��������(Short)';
comment on column TBL_LMRISKAPP.risktypedetail
  is '�������ա���ȫ���ա��������ա�����ա������ա�סԺҽ�ơ�����ҽ�ơ���ͨҽ�ơ�����ҽ�ơ������˺�ҽ�ơ��ۺ�ҽ��
';
comment on column TBL_LMRISKAPP.subriskflag
  is 'M--����(Main) S--����(Sub) A--���߶����ԡ�';
comment on column TBL_LMRISKAPP.insuperiodflag
  is '1:�й̶��������� 0:��������Ϊ����';
comment on column TBL_LMRISKAPP.insuredflag
  is 'M--�౻����(Multiple)��S--��һ������(Single)';
comment on column TBL_LMRISKAPP.risktype3
  is '2-�ֺ���';
comment on column TBL_LMRISKAPP.risktype7
  is '0-����ֺ�';
comment on column TBL_LMRISKAPP.state
  is '����״̬';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LMRISKAPP
  add constraint PK_TBL_LMRISKAPP primary key (RISKCODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LMRISKRELA
(
  riskcode     VARCHAR2(30) not null,
  relariskcode VARCHAR2(8) not null,
  relacode     VARCHAR2(2) not null,
  managecomgrp VARCHAR2(300) not null,
  dksubprem    VARCHAR2(1)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LMRISKRELA.relacode
  is '01-����
02-����
03-��Ʒ���
04-����
06-����';
comment on column TBL_LMRISKRELA.managecomgrp
  is '��д�����ֹ�ϵ��������Щ��վ����';
comment on column TBL_LMRISKRELA.dksubprem
  is '0��null����
1�����۸����ձ���
';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LMRISKRELA
  add constraint PK_TBL_LMRISKRELA primary key (RISKCODE, RELARISKCODE, RELACODE, MANAGECOMGRP)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LRACTIVEMONTHS
(
  guidenum    VARCHAR2(250),
  activemonth VARCHAR2(20),
  inputnum    VARCHAR2(250) not null,
  infotype    VARCHAR2(10),
  gettype     VARCHAR2(20),
  b1          VARCHAR2(100),
  b2          VARCHAR2(100),
  b3          VARCHAR2(100),
  b4          VARCHAR2(100),
  b5          VARCHAR2(100),
  makedate    DATE,
  maketime    VARCHAR2(8),
  modifydate  DATE,
  modifytime  VARCHAR2(8)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LRACTIVEMONTHS.guidenum
  is '������κ�';
comment on column TBL_LRACTIVEMONTHS.activemonth
  is '���';
comment on column TBL_LRACTIVEMONTHS.inputnum
  is '�������κ�';
comment on column TBL_LRACTIVEMONTHS.infotype
  is '��������';
comment on column TBL_LRACTIVEMONTHS.gettype
  is '��������';
comment on column TBL_LRACTIVEMONTHS.b1
  is '�����ֶ�1';
comment on column TBL_LRACTIVEMONTHS.b2
  is '�����ֶ�2';
comment on column TBL_LRACTIVEMONTHS.b3
  is '�����ֶ�3';
comment on column TBL_LRACTIVEMONTHS.b4
  is '�����ֶ�4';
comment on column TBL_LRACTIVEMONTHS.b5
  is '�����ֶ�5';
comment on column TBL_LRACTIVEMONTHS.makedate
  is '�������';
comment on column TBL_LRACTIVEMONTHS.maketime
  is '���ʱ��';
comment on column TBL_LRACTIVEMONTHS.modifydate
  is '����޸�����';
comment on column TBL_LRACTIVEMONTHS.modifytime
  is '����޸�ʱ��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LRACTIVEMONTHS
  add constraint PK_TBL_ACTIVEMONTH primary key (INPUTNUM)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LRCALLLIST
(
  campcode     VARCHAR2(50) not null,
  calllistno   VARCHAR2(200) not null,
  calllistname VARCHAR2(100) not null,
  usemonth     VARCHAR2(6),
  callarea     VARCHAR2(8),
  comcode      VARCHAR2(10),
  teamtype     VARCHAR2(2),
  actcount     NUMBER,
  remaincount  NUMBER,
  dataprovince VARCHAR2(10),
  datacity     VARCHAR2(10),
  infotype     VARCHAR2(10),
  gettype      VARCHAR2(20),
  validdays    INTEGER,
  acceptdays   INTEGER,
  datausefor   VARCHAR2(100),
  getdate      DATE,
  priority     NUMBER(4),
  divuserid    VARCHAR2(25),
  isgetnum     VARCHAR2(1),
  divdate      DATE,
  divtime      VARCHAR2(8),
  state        VARCHAR2(2),
  plandate     DATE,
  plantime     VARCHAR2(8),
  operator     VARCHAR2(25) not null,
  makedate     DATE not null,
  maketime     VARCHAR2(8) not null,
  modifydate   DATE not null,
  modifytime   VARCHAR2(8) not null,
  calllisttype VARCHAR2(2),
  fdatatype    VARCHAR2(1),
  divstate     VARCHAR2(2),
  empty        VARCHAR2(25),
  isspecial    VARCHAR2(1),
  ispointtype  VARCHAR2(1),
  area         VARCHAR2(20),
  depart       VARCHAR2(20),
  isscreen     VARCHAR2(1)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_LRCALLLIST
  is '7/15
1 ���ֱ��     �����ܼ��� ->����������
2  ����ʣ������  ׷��';
-- Add comments to the columns 
comment on column TBL_LRCALLLIST.campcode
  is 'ר������';
comment on column TBL_LRCALLLIST.calllistno
  is 'ר�����κ�';
comment on column TBL_LRCALLLIST.calllistname
  is 'ר����������';
comment on column TBL_LRCALLLIST.usemonth
  is '����ʹ����
�ƻ�ʹ�����ݵ��·�,�ֶνṹΪ:YYYY��MM��,��201006';
comment on column TBL_LRCALLLIST.callarea
  is '��������';
comment on column TBL_LRCALLLIST.comcode
  is '������������';
comment on column TBL_LRCALLLIST.teamtype
  is '�Ŷ�����: ��ƴ����дָ��, �����Ŷ�ΪXS, ��ϴ�Ŷ�ΪQX';
comment on column TBL_LRCALLLIST.actcount
  is '����������';
comment on column TBL_LRCALLLIST.remaincount
  is '����ʣ������
��ʼ��������һ��';
comment on column TBL_LRCALLLIST.dataprovince
  is '���ݹ���ʡ';
comment on column TBL_LRCALLLIST.datacity
  is '���ݹ�������';
comment on column TBL_LRCALLLIST.infotype
  is '��������';
comment on column TBL_LRCALLLIST.gettype
  is '��������(�������������Ӧ�ſ�)';
comment on column TBL_LRCALLLIST.validdays
  is '��Ч����';
comment on column TBL_LRCALLLIST.acceptdays
  is '������Ч����';
comment on column TBL_LRCALLLIST.datausefor
  is '������;';
comment on column TBL_LRCALLLIST.getdate
  is '������������';
comment on column TBL_LRCALLLIST.priority
  is '���ȼ�';
comment on column TBL_LRCALLLIST.divuserid
  is '������';
comment on column TBL_LRCALLLIST.isgetnum
  is '�Ƿ����ȡ�� =  �ȴ�ϵͳ���Ƿ�ȡС�ѣ�
0  ��
1  ��';
comment on column TBL_LRCALLLIST.divdate
  is '��������';
comment on column TBL_LRCALLLIST.divtime
  is '����ʱ��';
comment on column TBL_LRCALLLIST.state
  is '����״̬
01��Ч
02��ͣ
03�ر�';
comment on column TBL_LRCALLLIST.plandate
  is '�ƻ���������';
comment on column TBL_LRCALLLIST.plantime
  is '�ƻ�����ʱ��';
comment on column TBL_LRCALLLIST.operator
  is '������';
comment on column TBL_LRCALLLIST.makedate
  is '�������';
comment on column TBL_LRCALLLIST.maketime
  is '���ʱ��';
comment on column TBL_LRCALLLIST.modifydate
  is '����޸�����';
comment on column TBL_LRCALLLIST.modifytime
  is '����޸�ʱ��';
comment on column TBL_LRCALLLIST.calllisttype
  is '1-Ԥ��ʽ
2-Ԥ��ʽ';
comment on column TBL_LRCALLLIST.fdatatype
  is '1-��0-��';
comment on column TBL_LRCALLLIST.divstate
  is '01-δ����
02-�����¼��ٷ���
03-�ѷ���';
comment on column TBL_LRCALLLIST.empty
  is '�Ƿ����';
comment on column TBL_LRCALLLIST.area
  is '��';
comment on column TBL_LRCALLLIST.depart
  is '��';
comment on column TBL_LRCALLLIST.isscreen
  is '�Ƿ����οͻ��绰';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LRCALLLIST
  add constraint PK_TBL_LRCALLLIST primary key (CAMPCODE, CALLLISTNO)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LRGUIDE
(
  guidenum       VARCHAR2(250) not null,
  guidename      VARCHAR2(100),
  infotype       VARCHAR2(10),
  gettype        VARCHAR2(20),
  rulemphone     VARCHAR2(1),
  rulecard       VARCHAR2(1),
  rulecardno     VARCHAR2(1),
  rulecustname   VARCHAR2(1),
  rulebirth      VARCHAR2(1),
  infohighdata   VARCHAR2(1),
  infohightype   VARCHAR2(1),
  infomiddata    VARCHAR2(1),
  infomidtype    VARCHAR2(1),
  infolowdata    VARCHAR2(1),
  infolowtype    VARCHAR2(1),
  content        VARCHAR2(1000),
  inputstyle     VARCHAR2(1),
  inputcount     NUMBER(9),
  status         VARCHAR2(1),
  operator       VARCHAR2(25),
  makedate       DATE,
  maketime       VARCHAR2(8),
  modifydate     DATE,
  modifytime     VARCHAR2(8),
  path           VARCHAR2(200),
  cancutnum      VARCHAR2(20),
  managecom      VARCHAR2(20),
  depart         VARCHAR2(20),
  datapurpose    VARCHAR2(20),
  b1             VARCHAR2(100),
  b2             VARCHAR2(100),
  b3             VARCHAR2(100),
  b4             VARCHAR2(100),
  b5             VARCHAR2(100),
  area           VARCHAR2(20),
  covertype1     VARCHAR2(100),
  covertype2     VARCHAR2(100),
  ischeckforcont VARCHAR2(10),
  b6             VARCHAR2(100),
  b7             VARCHAR2(100),
  b8             VARCHAR2(100)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LRGUIDE.guidenum
  is '������κ�';
comment on column TBL_LRGUIDE.guidename
  is '�����������';
comment on column TBL_LRGUIDE.infotype
  is '��������';
comment on column TBL_LRGUIDE.gettype
  is '��������';
comment on column TBL_LRGUIDE.rulemphone
  is '���ع����ֻ���';
comment on column TBL_LRGUIDE.rulecard
  is '���ع���֤������';
comment on column TBL_LRGUIDE.rulecardno
  is '���ع���֤����';
comment on column TBL_LRGUIDE.rulecustname
  is '���ع�������';
comment on column TBL_LRGUIDE.rulebirth
  is '���ع�������';
comment on column TBL_LRGUIDE.infohighdata
  is '�������͸ߵ�����';
comment on column TBL_LRGUIDE.infohightype
  is '�������͸ߵ�����';
comment on column TBL_LRGUIDE.infomiddata
  is '���������е�����';
comment on column TBL_LRGUIDE.infomidtype
  is '���������е�����';
comment on column TBL_LRGUIDE.infolowdata
  is '�������͵͵�����';
comment on column TBL_LRGUIDE.infolowtype
  is '�������͵͵�����';
comment on column TBL_LRGUIDE.content
  is '��ע';
comment on column TBL_LRGUIDE.inputstyle
  is '�Ƿ�ʵʱ';
comment on column TBL_LRGUIDE.inputcount
  is '�������';
comment on column TBL_LRGUIDE.status
  is '���״̬';
comment on column TBL_LRGUIDE.operator
  is '������';
comment on column TBL_LRGUIDE.makedate
  is '�������';
comment on column TBL_LRGUIDE.maketime
  is '���ʱ��';
comment on column TBL_LRGUIDE.modifydate
  is '����޸�����';
comment on column TBL_LRGUIDE.modifytime
  is '����޸�ʱ��';
comment on column TBL_LRGUIDE.path
  is '��ʵʱ����λ��';
comment on column TBL_LRGUIDE.cancutnum
  is '���з�����';
comment on column TBL_LRGUIDE.managecom
  is '��������';
comment on column TBL_LRGUIDE.depart
  is '��';
comment on column TBL_LRGUIDE.datapurpose
  is '������;';
comment on column TBL_LRGUIDE.b1
  is '�����ֶ�1';
comment on column TBL_LRGUIDE.b2
  is '�����ֶ�2';
comment on column TBL_LRGUIDE.b3
  is '�����ֶ�3';
comment on column TBL_LRGUIDE.b4
  is '�����ֶ�4';
comment on column TBL_LRGUIDE.b5
  is '�����ֶ�5';
comment on column TBL_LRGUIDE.area
  is '���ڵ���';
comment on column TBL_LRGUIDE.covertype1
  is '�����ѻ�������';
comment on column TBL_LRGUIDE.covertype2
  is '����δ����δȡ����';
comment on column TBL_LRGUIDE.ischeckforcont
  is '�Ƿ񸲸����б��������� 1-��  0-��';
comment on column TBL_LRGUIDE.b6
  is '�����ֶ�6';
comment on column TBL_LRGUIDE.b7
  is '�����ֶ�7';
comment on column TBL_LRGUIDE.b8
  is '�����ֶ�8';
-- Create/Recreate indexes 
create index IDX_GUIDENUM_MANAGECOM on TBL_LRGUIDE (GUIDENUM, MANAGECOM, MAKEDATE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LRGUIDE
  add constraint PK_TBL_LRGUIDE primary key (GUIDENUM)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LRINPUTDETAIL
(
  custno        VARCHAR2(60) not null,
  calllistno    VARCHAR2(200) not null,
  campcode      VARCHAR2(50) not null,
  inputnum      VARCHAR2(250),
  termcode      VARCHAR2(12),
  possibility   VARCHAR2(2),
  qxflg         VARCHAR2(1),
  rsvdate       DATE,
  rsvtime       VARCHAR2(8),
  rsvtel        VARCHAR2(20),
  groupid       VARCHAR2(20),
  userid        VARCHAR2(25),
  starttime     DATE,
  endtime       DATE,
  remark        VARCHAR2(2000),
  callbackflag  VARCHAR2(1),
  callbackcount NUMBER(6),
  callbackdate  DATE,
  operator      VARCHAR2(25) not null,
  makedate      DATE not null,
  maketime      VARCHAR2(8) not null,
  modifydate    DATE not null,
  modifytime    VARCHAR2(8) not null,
  state         VARCHAR2(2),
  callnums      NUMBER(9),
  getdate       DATE,
  realendtime   DATE,
  lastcalltime  VARCHAR2(8),
  lastcalldate  DATE,
  callmark      VARCHAR2(1),
  issendarea    VARCHAR2(1),
  pcstermcode   VARCHAR2(8),
  gettime       VARCHAR2(10),
  sourcecustno  VARCHAR2(60),
  freesendflag   VARCHAR2(2),
  freezedate     DATE,
  realfreezedate DATE,
  revertdate     DATE,
  b1             VARCHAR2(200),
  b2             VARCHAR2(200),
  b3             VARCHAR2(200),
  b4             VARCHAR2(200),
  b5             VARCHAR2(200)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_LRINPUTDETAIL
  is '��Ӧԭ�������ġ�CUSTCONTROL����
���ݵ���ʱ�Ǽǡ��绰Ӫ���Ǽ�¼���µ�״̬';
-- Add comments to the columns 
comment on column TBL_LRINPUTDETAIL.custno
  is '�����';
comment on column TBL_LRINPUTDETAIL.calllistno
  is 'ר�����κ�';
comment on column TBL_LRINPUTDETAIL.campcode
  is 'ר������';
comment on column TBL_LRINPUTDETAIL.inputnum
  is '�������κ� ��ʽ����Ҫ�����ṩ��������';
comment on column TBL_LRINPUTDETAIL.termcode
  is '������';
comment on column TBL_LRINPUTDETAIL.possibility
  is '��Ը�̶�';
comment on column TBL_LRINPUTDETAIL.qxflg
  is '��ϴ���ݵ�����
1  ��������
2  �Ա�����
3  ��������
4  ��ַ����
5  ְҵ����';
comment on column TBL_LRINPUTDETAIL.rsvdate
  is 'ԤԼ����';
comment on column TBL_LRINPUTDETAIL.rsvtime
  is 'ԤԼʱ��';
comment on column TBL_LRINPUTDETAIL.rsvtel
  is 'ԤԼ�绰';
comment on column TBL_LRINPUTDETAIL.groupid
  is '���';
comment on column TBL_LRINPUTDETAIL.userid
  is '����Ա����';
comment on column TBL_LRINPUTDETAIL.starttime
  is '����ʱ��';
comment on column TBL_LRINPUTDETAIL.endtime
  is '����ʱ��';
comment on column TBL_LRINPUTDETAIL.remark
  is '��ע';
comment on column TBL_LRINPUTDETAIL.operator
  is '������';
comment on column TBL_LRINPUTDETAIL.makedate
  is '�������';
comment on column TBL_LRINPUTDETAIL.maketime
  is '���ʱ��';
comment on column TBL_LRINPUTDETAIL.modifydate
  is '����޸�����';
comment on column TBL_LRINPUTDETAIL.modifytime
  is '����޸�ʱ��';
comment on column TBL_LRINPUTDETAIL.state
  is '0-��ʹ��
1-����
3-ʹ����';
comment on column TBL_LRINPUTDETAIL.callnums
  is '�������';
comment on column TBL_LRINPUTDETAIL.getdate
  is 'ȡ������';
comment on column TBL_LRINPUTDETAIL.realendtime
  is 'ʵ�ʻ���ʱ��';
comment on column TBL_LRINPUTDETAIL.lastcalltime
  is '���ͨ��ʱ��';
comment on column TBL_LRINPUTDETAIL.lastcalldate
  is '���ͨ������';
comment on column TBL_LRINPUTDETAIL.callmark
  is '0-δ�ز�
1-�ز�';
comment on column TBL_LRINPUTDETAIL.pcstermcode
  is 'PCS���������
0,û��������
1,�ɹ�����
2,Ŀ��æ
3,�Է���Ӧ��
4,�Ƿ����Ⲧ����
5,�Է�״̬δ֪
6,�Է�Ϊ�����豸
7,�Է��Ǵ����豸
8,��⵽����Ӧ��
9,�ػ�
10,���ڷ�����
11,�ܽ�
12,IVRִ���쳣
13,�Ⲧ�쳣
14,������ϯʧ��
15,ת��ϯʧ��
16,ת��ϯ·��ʧ��
17,ת��ϯ·��ʱ�ͻ��Ҷ�
18,ת��ϯ�Ŷ�ʱ�ͻ��Ҷ�
19,ת��ϯ����ʱ�ͻ��Ҷ�
20,ת��ϯ�ŶӺ���ϯ����ʱ�ͻ��Ҷ�
21,ת��ϯ��ʱδ���ؽ��
22,��Դ����
23,�������ܺ�
';
comment on column TBL_LRINPUTDETAIL.gettime
  is '������ʱ��������� ��������ȡ��ʱ��� ���ݸ�ʽΪ��23:59:59';
comment on column TBL_LRINPUTDETAIL.sourcecustno
  is 'Դ�ͻ���';
comment on column TBL_LRINPUTDETAIL.freesendflag
  is '1  ������';
-- Create/Recreate indexes 
create index IDX_CALLISTNO_STATE on TBL_LRINPUTDETAIL (CALLLISTNO, CUSTNO, STATE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_DETAIL_SOURCECUST on TBL_LRINPUTDETAIL (SOURCECUSTNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_GETDATE on TBL_LRINPUTDETAIL (GETDATE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_INPUTDTAIL_CAL_CODE on TBL_LRINPUTDETAIL (CALLLISTNO, TERMCODE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_INPUTDTAIL_GROUPID on TBL_LRINPUTDETAIL (GROUPID)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_INPUTDTAIL_RD_CM on TBL_LRINPUTDETAIL (RSVDATE, CALLMARK)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_INPUTDTAIL_UID_TC_LD on TBL_LRINPUTDETAIL (USERID, LASTCALLDATE, TERMCODE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LRINPUTDETAIL_ENDTIME_BDCX on TBL_LRINPUTDETAIL (ENDTIME)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LRINPUTDETAIL_INPUTNUM on TBL_LRINPUTDETAIL (INPUTNUM)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LRINPUTDETAIL_INPUT_CAL on TBL_LRINPUTDETAIL (INPUTNUM, CALLLISTNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TERMCODE_ID on TBL_LRINPUTDETAIL (USERID, TERMCODE, STATE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LRINPUTDETAIL
  add constraint PK_TBL_LRINPUTDETAIL primary key (CUSTNO, CALLLISTNO)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LRINPUTLOG
(
  inputnum       VARCHAR2(250) not null,
  inputname      VARCHAR2(100) not null,
  usemonth       VARCHAR2(6),
  teamtype       VARCHAR2(2),
  dataprovince   VARCHAR2(10),
  datacity       VARCHAR2(10),
  infotype       VARCHAR2(10),
  gettype        VARCHAR2(20),
  datasource     VARCHAR2(1) not null,
  datascript     VARCHAR2(100),
  datausefor     VARCHAR2(100),
  termcode       VARCHAR2(12),
  sendflg        VARCHAR2(3),
  inputstyle     VARCHAR2(1),
  inputcount     NUMBER(9) not null,
  inputdate      DATE,
  inputtime      VARCHAR2(8),
  userid         VARCHAR2(25),
  content        VARCHAR2(1000),
  targetdatabase VARCHAR2(200),
  fcondition     VARCHAR2(300),
  checkstyle     VARCHAR2(1),
  fcount         NUMBER(9),
  loadcount      NUMBER(9),
  fuserid        VARCHAR2(25),
  fdate          DATE,
  ftime          VARCHAR2(8),
  fcontent       VARCHAR2(1000),
  ocount         NUMBER(9),
  odate          DATE,
  otime          VARCHAR2(8),
  ouserid        VARCHAR2(25),
  status         VARCHAR2(2),
  operator       VARCHAR2(25) not null,
  makedate       DATE not null,
  maketime       VARCHAR2(8) not null,
  modifydate     DATE not null,
  modifytime     VARCHAR2(8) not null,
  comcode        VARCHAR2(20),
  cusnum         NUMBER(9),
  guidenum       VARCHAR2(250)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LRINPUTLOG.inputnum
  is '�������κ� ��ʽ����Ҫ�����ṩ��������';
comment on column TBL_LRINPUTLOG.inputname
  is '������������';
comment on column TBL_LRINPUTLOG.usemonth
  is '����ʹ����
�ƻ�ʹ�����ݵ��·�,�ֶνṹΪ:YYYY��MM��,��201006';
comment on column TBL_LRINPUTLOG.teamtype
  is '�Ŷ�����: ��ƴ����дָ��, �����Ŷ�ΪXS, ��ϴ�Ŷ�ΪQX';
comment on column TBL_LRINPUTLOG.dataprovince
  is '���ݹ���ʡ';
comment on column TBL_LRINPUTLOG.datacity
  is '���ݹ�������';
comment on column TBL_LRINPUTLOG.infotype
  is '��������';
comment on column TBL_LRINPUTLOG.gettype
  is '��������(�������������Ӧ�ſ�)';
comment on column TBL_LRINPUTLOG.datasource
  is '������Դ
1   ���ſ�
2   ��������
3   ������ϴ����
4   ������������';
comment on column TBL_LRINPUTLOG.datascript
  is '������Դ����';
comment on column TBL_LRINPUTLOG.datausefor
  is '������;';
comment on column TBL_LRINPUTLOG.termcode
  is '��ϴ���ݽ�����';
comment on column TBL_LRINPUTLOG.sendflg
  is '���ͱ�ʶ
��Ϊ��PSN�������ڣ�������PSW�������⣩��';
comment on column TBL_LRINPUTLOG.inputstyle
  is '���뷽ʽ:
0  ʵʱ����
1  ��̨��ʱ����';
comment on column TBL_LRINPUTLOG.inputcount
  is '�������';
comment on column TBL_LRINPUTLOG.inputdate
  is '��������';
comment on column TBL_LRINPUTLOG.inputtime
  is '����ʱ��';
comment on column TBL_LRINPUTLOG.userid
  is '������ID';
comment on column TBL_LRINPUTLOG.content
  is '���뱸ע';
comment on column TBL_LRINPUTLOG.targetdatabase
  is '����Ŀ���';
comment on column TBL_LRINPUTLOG.fcondition
  is '���˱�׼��
����ȥ��
�绰����ȥ��
֤����ȥ��
�޹���';
comment on column TBL_LRINPUTLOG.checkstyle
  is '���ط�ʽ:
0  ʵʱ����
1  ��̨��ʱ����';
comment on column TBL_LRINPUTLOG.fcount
  is '�ظ�����';
comment on column TBL_LRINPUTLOG.loadcount
  is '���ؼ���';
comment on column TBL_LRINPUTLOG.fuserid
  is '������';
comment on column TBL_LRINPUTLOG.fdate
  is '��������';
comment on column TBL_LRINPUTLOG.ftime
  is '����ʱ��';
comment on column TBL_LRINPUTLOG.fcontent
  is '���ر�ע';
comment on column TBL_LRINPUTLOG.ocount
  is '��������';
comment on column TBL_LRINPUTLOG.odate
  is '��������';
comment on column TBL_LRINPUTLOG.otime
  is '����ʱ��';
comment on column TBL_LRINPUTLOG.ouserid
  is '������';
comment on column TBL_LRINPUTLOG.status
  is '��������״̬��
01  δ����
02  ������
03  �ѵ���
04  ������
05  �ѹ���
06  ������
07  �Ѽ���
08  �ļ��ϴ�ʧ��
99  ����ʧ��
';
comment on column TBL_LRINPUTLOG.operator
  is '������';
comment on column TBL_LRINPUTLOG.makedate
  is '�������';
comment on column TBL_LRINPUTLOG.maketime
  is '���ʱ��';
comment on column TBL_LRINPUTLOG.modifydate
  is '����޸�����';
comment on column TBL_LRINPUTLOG.modifytime
  is '����޸�ʱ��';
comment on column TBL_LRINPUTLOG.comcode
  is '������';
comment on column TBL_LRINPUTLOG.cusnum
  is '����ͻ�����';
comment on column TBL_LRINPUTLOG.guidenum
  is '������κ�';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LRINPUTLOG
  add constraint PK_TBL_LTINPUTLOG primary key (INPUTNUM)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LRNAMELIST
(
  seqno           VARCHAR2(25) not null,
  mobilephone     VARCHAR2(25) not null,
  customno        VARCHAR2(60),
  customname      VARCHAR2(25),
  status          VARCHAR2(1),
  sex             VARCHAR2(8),
  cardtype        VARCHAR2(8),
  cardnum         VARCHAR2(25),
  birthdate       VARCHAR2(25),
  age             VARCHAR2(8),
  operator        VARCHAR2(25) not null,
  makedate        DATE not null,
  maketime        VARCHAR2(8) not null,
  modifydate      DATE not null,
  modifytime      VARCHAR2(8) not null,
  comcode         VARCHAR2(10),
  b1              VARCHAR2(100),
  b2              VARCHAR2(100),
  b3              VARCHAR2(100),
  b4              VARCHAR2(100),
  stopoperateflag VARCHAR2(10),
  stopoperatedate DATE,
  stopmonths      VARCHAR2(10),
  stopdatasource  VARCHAR2(10),
  stopdatatype    VARCHAR2(10)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LRNAMELIST.mobilephone
  is '�ֻ�����';
comment on column TBL_LRNAMELIST.customno
  is '�ͻ����';
comment on column TBL_LRNAMELIST.customname
  is '�ͻ�����';
comment on column TBL_LRNAMELIST.status
  is '״̬
0Ϊ������1Ϊ��������';
comment on column TBL_LRNAMELIST.sex
  is '�Ա�';
comment on column TBL_LRNAMELIST.cardtype
  is '0�������֤
1�������ڲ�
2��������
3��������֤
4����̨��֤
5������ʻ֤
6��������֤
7��������֤��
8��������
A��������֤
';
comment on column TBL_LRNAMELIST.cardnum
  is '֤������';
comment on column TBL_LRNAMELIST.birthdate
  is '��������';
comment on column TBL_LRNAMELIST.age
  is '����';
comment on column TBL_LRNAMELIST.operator
  is '����Ա����';
comment on column TBL_LRNAMELIST.makedate
  is '�������';
comment on column TBL_LRNAMELIST.maketime
  is '���ʱ��';
comment on column TBL_LRNAMELIST.modifydate
  is '���һ���޸�����';
comment on column TBL_LRNAMELIST.modifytime
  is '���һ���޸�ʱ��';
comment on column TBL_LRNAMELIST.comcode
  is '��������';
comment on column TBL_LRNAMELIST.b1
  is '�����ֶ�1';
comment on column TBL_LRNAMELIST.b2
  is '�����ֶ�2';
comment on column TBL_LRNAMELIST.b3
  is '�����ֶ�3';
comment on column TBL_LRNAMELIST.b4
  is '�����ֶ�4';
comment on column TBL_LRNAMELIST.stopoperateflag
  is '1-����
2-ȡ������';
comment on column TBL_LRNAMELIST.stopoperatedate
  is '������������';
comment on column TBL_LRNAMELIST.stopmonths
  is '���ִ�������';
comment on column TBL_LRNAMELIST.stopdatasource
  is '0-����ƽ̨
1-�ܹ�˾
2-�ֹ�˾';
comment on column TBL_LRNAMELIST.stopdatatype
  is '0-��ҵ����
1-���ڽ���';
-- Create/Recreate indexes 
create index IDX_TBL_LRNAMELIST_PHONE on TBL_LRNAMELIST (MOBILEPHONE, STATUS)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LRNAMELIST
  add constraint PK_TBL_LRNAMELIST primary key (SEQNO)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LRTASK
(
  calllistno      VARCHAR2(200) not null,
  taskno          NUMBER(10) not null,
  campcode        VARCHAR2(50),
  divuserid       VARCHAR2(25) not null,
  divorg          VARCHAR2(50),
  divsaleid       VARCHAR2(25),
  divcount        NUMBER(12),
  divstyle        VARCHAR2(1),
  disrulenum      VARCHAR2(1),
  dispara1        VARCHAR2(10),
  dispara2        VARCHAR2(10),
  dispara3        VARCHAR2(10),
  dispara4        VARCHAR2(10),
  status          VARCHAR2(1),
  operator        VARCHAR2(25) not null,
  makedate        DATE not null,
  maketime        VARCHAR2(8) not null,
  modifydate      DATE not null,
  modifytime      VARCHAR2(8) not null,
  tsailegrade     VARCHAR2(100),
  employstartdate DATE,
  employenddate   DATE
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LRTASK.calllistno
  is 'ר�����κ�';
comment on column TBL_LRTASK.taskno
  is '���������
�����η���Ĵ�������Χ1~9999��ÿ�μ�1
����ʱÿ����֯����ÿ���˾�����һ�������
';
comment on column TBL_LRTASK.campcode
  is 'ר������';
comment on column TBL_LRTASK.divuserid
  is '������';
comment on column TBL_LRTASK.divorg
  is '���䵽��֯����¼��֯�ı���
��������
����UM
С��TL';
comment on column TBL_LRTASK.divsaleid
  is '���䵽��֯����¼��ϯ��ID';
comment on column TBL_LRTASK.divcount
  is '��ȡ������Ĭ��Ϊ���ε�ȫ��������
����������֯���߸��˻�ȡ�ĺ�����';
comment on column TBL_LRTASK.divstyle
  is '���䷽ʽ
1���ֶ�
2���Զ�
Ŀǰֻ���ֶ�';
comment on column TBL_LRTASK.disrulenum
  is '�������
    1�����ƽ�����䣻
    2����������������޼����䣻
    3������TSR���𰴱������䣻';
comment on column TBL_LRTASK.dispara1
  is '����������1';
comment on column TBL_LRTASK.dispara2
  is '����������2';
comment on column TBL_LRTASK.dispara3
  is '����������3';
comment on column TBL_LRTASK.dispara4
  is '����������4';
comment on column TBL_LRTASK.status
  is '״̬λ
0Ϊ��Ч��1Ϊ��Ч';
comment on column TBL_LRTASK.operator
  is '������';
comment on column TBL_LRTASK.makedate
  is '�������';
comment on column TBL_LRTASK.maketime
  is '���ʱ��';
comment on column TBL_LRTASK.modifydate
  is '����޸�����';
comment on column TBL_LRTASK.modifytime
  is '����޸�ʱ��';
comment on column TBL_LRTASK.tsailegrade
  is 'ְ��';
comment on column TBL_LRTASK.employstartdate
  is '��˾����';
comment on column TBL_LRTASK.employenddate
  is '��˾ֹ��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LRTASK
  add constraint PK_TBL_LRTASK primary key (CALLLISTNO, TASKNO)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LRTASKINFO
(
  calllistno       VARCHAR2(200) not null,
  custno           VARCHAR2(60) not null,
  inputnum         VARCHAR2(250) not null,
  datasource       VARCHAR2(10),
  custname         VARCHAR2(50),
  custsex          VARCHAR2(1),
  birth            DATE,
  age              NUMBER(6),
  custsource       VARCHAR2(100),
  marriage         VARCHAR2(1),
  card             VARCHAR2(2),
  cardno           VARCHAR2(50),
  company          VARCHAR2(60),
  email            VARCHAR2(60),
  oprovince        VARCHAR2(50),
  ocity            VARCHAR2(50),
  odistrict        VARCHAR2(50),
  oaddress         VARCHAR2(200),
  ozipcode         VARCHAR2(6),
  ophonearea       VARCHAR2(10),
  officephone      VARCHAR2(50),
  oextno           VARCHAR2(10),
  cprovince        VARCHAR2(50),
  ccity            VARCHAR2(50),
  cdistrict        VARCHAR2(50),
  caddress         VARCHAR2(200),
  czipcode         VARCHAR2(6),
  mphone           VARCHAR2(50),
  hprovince        VARCHAR2(50),
  hcity            VARCHAR2(50),
  hdistrict        VARCHAR2(50),
  haddress         VARCHAR2(200),
  hzipcode         VARCHAR2(6),
  hphonearea       VARCHAR2(10),
  hphone           VARCHAR2(80),
  worktype         VARCHAR2(80),
  career           VARCHAR2(120),
  worktype2        VARCHAR2(80),
  career2          VARCHAR2(120),
  careercode       VARCHAR2(10),
  careertype       VARCHAR2(10),
  duty             VARCHAR2(20),
  userid           VARCHAR2(25),
  status           VARCHAR2(1),
  endcode          VARCHAR2(12),
  operator         VARCHAR2(25) not null,
  makedate         DATE not null,
  maketime         VARCHAR2(8) not null,
  modifydate       DATE not null,
  modifytime       VARCHAR2(8) not null,
  datecode         VARCHAR2(1),
  cervaliddate     DATE,
  nativeplace      VARCHAR2(10),
  isriskprofession VARCHAR2(2),
  otherphone       VARCHAR2(20),
  sourcecustno     VARCHAR2(60)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_LRTASKINFO
  is '�͵绰Ӫ���������Ŀ����һ��';
-- Add comments to the columns 
comment on column TBL_LRTASKINFO.calllistno
  is 'ר�����κ�';
comment on column TBL_LRTASKINFO.custno
  is '�����';
comment on column TBL_LRTASKINFO.inputnum
  is '�������κ� ��ʽ����Ҫ�����ṩ��������';
comment on column TBL_LRTASKINFO.datasource
  is '������Դ';
comment on column TBL_LRTASKINFO.custsex
  is '1:��
2:Ů
3:����';
comment on column TBL_LRTASKINFO.marriage
  is '1:δ��
2:�ѻ�
9:����';
comment on column TBL_LRTASKINFO.card
  is '01:���֤
02:����
03:����֤
04:ѧ��֤
99:����';
comment on column TBL_LRTASKINFO.oprovince
  is '��˾����ʡ';
comment on column TBL_LRTASKINFO.cprovince
  is '��ϵʡ';
comment on column TBL_LRTASKINFO.hprovince
  is '��ͥ����ʡ';
comment on column TBL_LRTASKINFO.duty
  is 'ְ��';
comment on column TBL_LRTASKINFO.status
  is '0:��ʹ��
1:����
2:������
3:ʹ����
4:������
5:������
9:��Ч';
comment on column TBL_LRTASKINFO.endcode
  is '������';
comment on column TBL_LRTASKINFO.operator
  is '����Ա';
comment on column TBL_LRTASKINFO.makedate
  is '�������';
comment on column TBL_LRTASKINFO.maketime
  is '���ʱ��';
comment on column TBL_LRTASKINFO.modifydate
  is '����޸�����';
comment on column TBL_LRTASKINFO.modifytime
  is '����޸�ʱ��';
comment on column TBL_LRTASKINFO.datecode
  is '֤����Ч�ڱ�ʶ
1-��Ч��
2-����';
comment on column TBL_LRTASKINFO.cervaliddate
  is '֤����Ч��
��YYYY-MM-DD
֤����Ч�ڣ���������֤����ڱ���¼���ʱ�򣬻��߲������ͻ���Ϣ¼���ʱ��
��������Ŀ��Բ����������9999-12-31';
comment on column TBL_LRTASKINFO.nativeplace
  is '�������ڿͻ���Ϣ��Ͷ�����˵�ʱ���������';
comment on column TBL_LRTASKINFO.otherphone
  is '������ϵ��ʽ';
comment on column TBL_LRTASKINFO.sourcecustno
  is 'Դ�ͻ���';
-- Create/Recreate indexes 
create index IDX_TBL_LRTASKINFO_CUSTNAME on TBL_LRTASKINFO (CUSTNAME)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LRTASKINFO_HPHONE on TBL_LRTASKINFO (HPHONE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LRTASKINFO_MPHONE on TBL_LRTASKINFO (MPHONE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LRTASKINFO_OFFICE on TBL_LRTASKINFO (OFFICEPHONE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index TBL_LRTASKINFO_CUSTNO on TBL_LRTASKINFO (CUSTNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index TBL_LRTASKINFO_INPUTSCUSTNO on TBL_LRTASKINFO (INPUTNUM, SOURCECUSTNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index TBL_LRTASKINFO_SOURCECUSTNO on TBL_LRTASKINFO (SOURCECUSTNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index TBL_LRTASKINFO_STATUS on TBL_LRTASKINFO (STATUS)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index TBL_LRTASKINFO_USERID on TBL_LRTASKINFO (USERID)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LRTASKINFO
  add constraint PK_TBL_LRTASKINFO primary key (CALLLISTNO, CUSTNO)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LRTELLOG
(
  callid        VARCHAR2(50) not null,
  calllistno    VARCHAR2(200),
  custno        VARCHAR2(60),
  tellogno      NUMBER(9),
  endcode       VARCHAR2(20),
  campcode      VARCHAR2(50),
  calltarget    VARCHAR2(20),
  userid        VARCHAR2(25),
  extno         VARCHAR2(20),
  calldate      DATE,
  startcalltime VARCHAR2(8),
  endcalltime   VARCHAR2(8),
  timelong      NUMBER(8),
  calltype      VARCHAR2(1),
  groupid       VARCHAR2(50),
  recurl        VARCHAR2(500),
  rsvtel        VARCHAR2(20),
  rsvdate       DATE,
  rsvtime       VARCHAR2(8),
  status        VARCHAR2(1),
  possibility   VARCHAR2(12),
  remark        VARCHAR2(1000),
  operator      VARCHAR2(25) not null,
  makedate      DATE not null,
  maketime      VARCHAR2(8) not null,
  modifydate    DATE not null,
  modifytime    VARCHAR2(8) not null,
  sessionid     VARCHAR2(100),
  enterpriseid  VARCHAR2(20),
  username      VARCHAR2(30),
  pwd           VARCHAR2(100),
  recordflg     VARCHAR2(1) default '1' not null,
  applyflg      VARCHAR2(1),
  contno        VARCHAR2(20),
  sourcecustno  VARCHAR2(60)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_LRTELLOG
  is '7/18
ר���ų��ȱ��  30  -->  50
7/19
׷�������ֶΣ�
ͨ��Ψһ��ʶ(CTI)
��ҵ���(CTI)
��ϯ����(CTI)
��ϯ����(CTI)
¼����ŷ�ʽ
Ͷ��¼����ʶ
7/27
�������
�������   ����NUMBER-��VARCHAR2
7/27
�������
�������   ���ͻع�
���� ������ˮ��
7/29
�ع�';
-- Add comments to the columns 
comment on column TBL_LRTELLOG.callid
  is '������ˮ��
STS+�绰��¼��ˮ��';
comment on column TBL_LRTELLOG.calllistno
  is 'ר�����κ�';
comment on column TBL_LRTELLOG.custno
  is '�����';
comment on column TBL_LRTELLOG.tellogno
  is '�������';
comment on column TBL_LRTELLOG.endcode
  is '������
���緽ʽ  Ϊ�绰����ʱ��������';
comment on column TBL_LRTELLOG.campcode
  is 'ר������';
comment on column TBL_LRTELLOG.calltarget
  is '�������
���ڼ�¼
�������
���ź���
�ʼ���ַ';
comment on column TBL_LRTELLOG.userid
  is '��ϯ����';
comment on column TBL_LRTELLOG.extno
  is '��ϯ�ֻ���';
comment on column TBL_LRTELLOG.calldate
  is '��������';
comment on column TBL_LRTELLOG.startcalltime
  is '���翪ʼʱ��';
comment on column TBL_LRTELLOG.endcalltime
  is '�������ʱ��';
comment on column TBL_LRTELLOG.timelong
  is 'ͨ��ʱ��  ��λ���루s��';
comment on column TBL_LRTELLOG.calltype
  is '��������';
comment on column TBL_LRTELLOG.groupid
  is '����';
comment on column TBL_LRTELLOG.recurl
  is '¼����ַ';
comment on column TBL_LRTELLOG.rsvtel
  is 'ԤԼ�绰';
comment on column TBL_LRTELLOG.rsvdate
  is 'ԤԼ����';
comment on column TBL_LRTELLOG.rsvtime
  is 'ԤԼʱ��';
comment on column TBL_LRTELLOG.status
  is '�����¾�״̬';
comment on column TBL_LRTELLOG.possibility
  is '��Ը�̶�';
comment on column TBL_LRTELLOG.remark
  is '��ע';
comment on column TBL_LRTELLOG.operator
  is '������';
comment on column TBL_LRTELLOG.makedate
  is '�������';
comment on column TBL_LRTELLOG.maketime
  is '���ʱ��';
comment on column TBL_LRTELLOG.modifydate
  is '����޸�����';
comment on column TBL_LRTELLOG.modifytime
  is '����޸�ʱ��';
comment on column TBL_LRTELLOG.sessionid
  is '¼��������';
comment on column TBL_LRTELLOG.enterpriseid
  is '¼��������';
comment on column TBL_LRTELLOG.username
  is '¼��������';
comment on column TBL_LRTELLOG.pwd
  is '¼��������';
comment on column TBL_LRTELLOG.recordflg
  is '¼����ŷ�ʽ
1��Զ�̣���ţ��
2������';
comment on column TBL_LRTELLOG.applyflg
  is 'Ͷ��¼����ʶ
0  ��Ͷ��¼��
1  Ͷ��¼��';
comment on column TBL_LRTELLOG.sourcecustno
  is 'Դ�ͻ���';
-- Create/Recreate indexes 
create index IDX_LRTELLOG_CALLDATE on TBL_LRTELLOG (CALLDATE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LRTELLOG_CUNO on TBL_LRTELLOG (CUSTNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LRTELLOG_ENDC on TBL_LRTELLOG (ENDCODE)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LRTELLOG_SEID on TBL_LRTELLOG (SESSIONID)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_LRTELLOG_SOURCE on TBL_LRTELLOG (SOURCECUSTNO)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LRTELLOG_GROUPID on TBL_LRTELLOG (GROUPID)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_TBL_LRTELLOG_UG on TBL_LRTELLOG (USERID, GROUPID)
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LRTELLOG
  add constraint PK_TBL_LRTELLOG primary key (CALLID)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_NATIONALITY
(
  nationcode  VARCHAR2(10) not null,
  nationname  VARCHAR2(50),
  orderid     NUMBER,
  enshortname VARCHAR2(50),
  enfullname  VARCHAR2(100),
  chfullname  VARCHAR2(50),
  risklevel   VARCHAR2(20)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_NATIONALITY
  is '7/25
�¹�';
-- Add comments to the columns 
comment on column TBL_NATIONALITY.nationcode
  is '����';
comment on column TBL_NATIONALITY.nationname
  is '����';
comment on column TBL_NATIONALITY.orderid
  is '���';
comment on column TBL_NATIONALITY.enshortname
  is 'Ӣ�ļ��';
comment on column TBL_NATIONALITY.enfullname
  is 'Ӣ��ȫ��';
comment on column TBL_NATIONALITY.chfullname
  is '����ȫ��';
comment on column TBL_NATIONALITY.risklevel
  is '��ȫ����';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_NATIONALITY
  add constraint PK_TBNATIONALITY_NATIONCODE primary key (NATIONCODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_OCCUPATION
(
  bigcodename VARCHAR2(100),
  bigcodeval  VARCHAR2(50) not null,
  midcodename VARCHAR2(100),
  midcodeval  VARCHAR2(50) not null,
  codetype    VARCHAR2(50) not null,
  codename    VARCHAR2(100) not null,
  codeval     VARCHAR2(20) not null,
  codedesc    VARCHAR2(100),
  worktype    VARCHAR2(10),
  isdefault   VARCHAR2(1),
  addname     VARCHAR2(12),
  addtime     DATE,
  editname    VARCHAR2(12),
  edittime    DATE,
  enabled     VARCHAR2(1),
  userlevel   VARCHAR2(8),
  orderid     NUMBER(4)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_OCCUPATION
  is '7/19
�¹�';
-- Add comments to the columns 
comment on column TBL_OCCUPATION.bigcodename
  is '���������';
comment on column TBL_OCCUPATION.bigcodeval
  is '��������';
comment on column TBL_OCCUPATION.midcodename
  is '�з�������';
comment on column TBL_OCCUPATION.midcodeval
  is '�з������';
comment on column TBL_OCCUPATION.codetype
  is '�������';
comment on column TBL_OCCUPATION.codename
  is '��������';
comment on column TBL_OCCUPATION.codeval
  is '����ֵ';
comment on column TBL_OCCUPATION.codedesc
  is '����˵��';
comment on column TBL_OCCUPATION.worktype
  is 'ְҵ���';
comment on column TBL_OCCUPATION.isdefault
  is '�Ƿ�Ĭ��';
comment on column TBL_OCCUPATION.addname
  is '������';
comment on column TBL_OCCUPATION.addtime
  is '����ʱ��';
comment on column TBL_OCCUPATION.editname
  is '�༭��';
comment on column TBL_OCCUPATION.edittime
  is '�༭ʱ��';
comment on column TBL_OCCUPATION.enabled
  is '���÷�';
comment on column TBL_OCCUPATION.userlevel
  is 'ʹ�ü���';
comment on column TBL_OCCUPATION.orderid
  is '�����';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_OCCUPATION
  add constraint PK_TBL_OCCUPATION primary key (BIGCODEVAL, MIDCODEVAL, CODEVAL)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_PERSONALNUM
(
  calllistno VARCHAR2(200) not null,
  userid     VARCHAR2(25) not null,
  divcount   NUMBER(12),
  getcount   NUMBER(12),
  makedate   DATE not null,
  maketime   VARCHAR2(8) not null,
  modifydate DATE not null,
  modifytime VARCHAR2(8) not null
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TBL_PERSONALNUM
  is '7/21
�¹�';
-- Add comments to the columns 
comment on column TBL_PERSONALNUM.calllistno
  is 'ר�����κ�';
comment on column TBL_PERSONALNUM.userid
  is '��ϯ����';
comment on column TBL_PERSONALNUM.divcount
  is '��ȡ������Ĭ��Ϊ���ε�ȫ��������
����������֯���߸��˻�ȡ�ĺ�����';
comment on column TBL_PERSONALNUM.getcount
  is '��ȡ����  ��֯���߸����Ի�ȡ��������
��ʼֵΪ0����֯���߸���ÿȡһ�Σ���ֵ��1';
comment on column TBL_PERSONALNUM.makedate
  is '�������';
comment on column TBL_PERSONALNUM.maketime
  is '���ʱ��';
comment on column TBL_PERSONALNUM.modifydate
  is '����޸�����';
comment on column TBL_PERSONALNUM.modifytime
  is '����޸�ʱ��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_PERSONALNUM
  add constraint PK_TBL_PERSONALNUM primary key (CALLLISTNO, USERID)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Create table
create table TBL_LDPLANRISKINFO
(
  CONTPLANCODE VARCHAR2(20) not null,
  RISKCODE     VARCHAR2(10) not null,
  MAINRISKCODE VARCHAR2(10) not null,
  RISKNAME     VARCHAR2(50),
  RISKLIST     VARCHAR2(10) not null,
  DUTYCODE     VARCHAR2(20),
  DUTYNAME     VARCHAR2(50),
  AMNT         NUMBER(16,2),
  PREM         NUMBER(16,2),
  MULT         NUMBER(2),
  PAYINTV      NUMBER(2),
  PAYYEAR      NUMBER(3),
  INSUYEAR     NUMBER(4),
  PAYMENT      NUMBER(16,2),
  DEDUCTIBLE   NUMBER(16,2),
  B1           VARCHAR2(20),
  B2           VARCHAR2(20),
  B3           VARCHAR2(20),
  B4           VARCHAR2(20),
  B5           VARCHAR2(20),
  MAINRISKFLAG VARCHAR2(20),
  INSUYEARFLAG VARCHAR2(20)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LDPLANRISKINFO.CONTPLANCODE
  is '�ƻ�����';
comment on column TBL_LDPLANRISKINFO.RISKCODE
  is '���ֱ���';
comment on column TBL_LDPLANRISKINFO.MAINRISKCODE
  is '���ձ���';
comment on column TBL_LDPLANRISKINFO.RISKNAME
  is '��������';
comment on column TBL_LDPLANRISKINFO.RISKLIST
  is '��������';
comment on column TBL_LDPLANRISKINFO.DUTYCODE
  is '���α���';
comment on column TBL_LDPLANRISKINFO.DUTYNAME
  is '��������';
comment on column TBL_LDPLANRISKINFO.AMNT
  is '����';
comment on column TBL_LDPLANRISKINFO.PREM
  is '����';
comment on column TBL_LDPLANRISKINFO.MULT
  is '����';
comment on column TBL_LDPLANRISKINFO.PAYINTV
  is '�ɷ�Ƶ��';
comment on column TBL_LDPLANRISKINFO.PAYYEAR
  is '�ɷ�����';
comment on column TBL_LDPLANRISKINFO.INSUYEAR
  is '��������';
comment on column TBL_LDPLANRISKINFO.PAYMENT
  is '�⸶����';
comment on column TBL_LDPLANRISKINFO.DEDUCTIBLE
  is '�����';
comment on column TBL_LDPLANRISKINFO.B1
  is '��ע';
comment on column TBL_LDPLANRISKINFO.MAINRISKFLAG
  is '���ձ�־';
comment on column TBL_LDPLANRISKINFO.INSUYEARFLAG
  is '�����ڼ��ʶ';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LDPLANRISKINFO
  add constraint TBL_LDPLANRISKINFO primary key (RISKLIST, RISKCODE, CONTPLANCODE)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create table
create table TBL_LRRECOVERINPUT
(
  RECOVERNO  VARCHAR2(10) not null,
  CALLLISTNO VARCHAR2(50),
  BESTATE    VARCHAR2(5) not null,
  INPUTNUM   VARCHAR2(50) not null,
  COUNT      NUMBER,
  STATE      VARCHAR2(1),
  MAKEDATE   DATE,
  MAKETIME   VARCHAR2(8),
  MODIFYDATE DATE,
  MODIFYTIME VARCHAR2(8),
  B1         VARCHAR2(100),
  B2         VARCHAR2(100),
  B3         VARCHAR2(100)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LRRECOVERINPUT.RECOVERNO
  is '�������κ�';
comment on column TBL_LRRECOVERINPUT.CALLLISTNO
  is 'ר�����κ�';
comment on column TBL_LRRECOVERINPUT.BESTATE
  is '����ǰ״̬ 01-���·�δ����   02-�Ѽ���δȡ��  03-��ȡ��';
comment on column TBL_LRRECOVERINPUT.INPUTNUM
  is '�������κ�';
comment on column TBL_LRRECOVERINPUT.COUNT
  is '��������';
comment on column TBL_LRRECOVERINPUT.STATE
  is '���λ���״̬ 0-δ����  1-�ѻ���';
comment on column TBL_LRRECOVERINPUT.MAKEDATE
  is '�������';
comment on column TBL_LRRECOVERINPUT.MAKETIME
  is '���ʱ��';
comment on column TBL_LRRECOVERINPUT.MODIFYDATE
  is '����޸�����';
comment on column TBL_LRRECOVERINPUT.MODIFYTIME
  is '����޸�ʱ��';
comment on column TBL_LRRECOVERINPUT.B1
  is '��ע1';
comment on column TBL_LRRECOVERINPUT.B2
  is '��ע2';
comment on column TBL_LRRECOVERINPUT.B3
  is '��ע3';

-- Create table
create table TBL_LMDATADIVERTLOG
(
  divertno     VARCHAR2(20) not null,
  calllistno   VARCHAR2(200) not null,
  custno       VARCHAR2(50) not null,
  targetuserid VARCHAR2(12),
  sourceuserid VARCHAR2(12),
  operator     VARCHAR2(80) not null,
  makedate     DATE not null,
  maketime     VARCHAR2(8) not null,
  modifydate   DATE not null,
  modifytime   VARCHAR2(8) not null,
  serial_id    VARCHAR2(10)
)
tablespace HXSTS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column TBL_LMDATADIVERTLOG.divertno
  is '���κ�10λ��ˮ��';
comment on column TBL_LMDATADIVERTLOG.calllistno
  is 'ר�����κ�';
comment on column TBL_LMDATADIVERTLOG.custno
  is 'ר�����ͣ�01-ͨ���͡�02-��Ŀ�͡�03-����ͣ�';
comment on column TBL_LMDATADIVERTLOG.targetuserid
  is 'ר������';
comment on column TBL_LMDATADIVERTLOG.sourceuserid
  is 'ר������';
comment on column TBL_LMDATADIVERTLOG.operator
  is '������';
comment on column TBL_LMDATADIVERTLOG.makedate
  is '�������';
comment on column TBL_LMDATADIVERTLOG.maketime
  is '���ʱ��';
comment on column TBL_LMDATADIVERTLOG.modifydate
  is '����޸�����';
comment on column TBL_LMDATADIVERTLOG.modifytime
  is '����޸�ʱ��';
comment on column TBL_LMDATADIVERTLOG.serial_id
  is '������ˮ��';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBL_LMDATADIVERTLOG
  add constraint PK_TBL_LMDATADIVERTLOG primary key (DIVERTNO, CALLLISTNO, CUSTNO)
  using index 
  tablespace HXSTS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
