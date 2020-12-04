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
  is '编码类型';
comment on column LDCODE.code
  is '编码';
comment on column LDCODE.codename
  is '编码名称';
comment on column LDCODE.codealias
  is '编码别名';
comment on column LDCODE.comcode
  is '机构代码';
comment on column LDCODE.othersign
  is '其它标志';
comment on column LDCODE.status
  is '状态位
0为无效，1为有效';
comment on column LDCODE.comname
  is '公司名称';
comment on column LDCODE.comadress
  is '公司地址';
comment on column LDCODE.codedesc
  is '代码说明';
comment on column LDCODE.uselevel
  is '使用级别';
comment on column LDCODE.orderid
  is '排序号';
comment on column LDCODE.operator
  is '操作人';
comment on column LDCODE.makedate
  is '入机日期';
comment on column LDCODE.maketime
  is '入机时间';
comment on column LDCODE.modifydate
  is '最后修改日期';
comment on column LDCODE.modifytime
  is '最后修改时间';
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
  is '员工代码';
comment on column TBL_LAAGENT.telcom
  is '销售机构编码';
comment on column TBL_LAAGENT.password
  is '密码';
comment on column TBL_LAAGENT.branchtype
  is '员工类型';
comment on column TBL_LAAGENT.tsalekind
  is '角色类别';
comment on column TBL_LAAGENT.name
  is '姓名';
comment on column TBL_LAAGENT.sex
  is '性别';
comment on column TBL_LAAGENT.birthday
  is '出生日期';
comment on column TBL_LAAGENT.age
  is '员工年龄';
comment on column TBL_LAAGENT.nativeplace
  is '籍贯';
comment on column TBL_LAAGENT.nationality
  is '民族';
comment on column TBL_LAAGENT.marriage
  is '婚姻状况';
comment on column TBL_LAAGENT.homeaddresscode
  is '家庭地址编码';
comment on column TBL_LAAGENT.homeaddress
  is '家庭地址';
comment on column TBL_LAAGENT.postaladdress
  is '通讯地址';
comment on column TBL_LAAGENT.zipcode
  is '邮政编码';
comment on column TBL_LAAGENT.rgtaddress
  is '户口所在地';
comment on column TBL_LAAGENT.phone
  is '电话';
comment on column TBL_LAAGENT.mobile
  is '手机';
comment on column TBL_LAAGENT.email
  is 'e_mail';
comment on column TBL_LAAGENT.marriagedate
  is '结婚日期';
comment on column TBL_LAAGENT.idnotype
  is '证件号码类型';
comment on column TBL_LAAGENT.idno
  is '证件号码';
comment on column TBL_LAAGENT.source
  is '来源地';
comment on column TBL_LAAGENT.bloodtype
  is '血型';
comment on column TBL_LAAGENT.polityvisage
  is '政治面貌';
comment on column TBL_LAAGENT.degree
  is '学历';
comment on column TBL_LAAGENT.graduateschool
  is '毕业院校';
comment on column TBL_LAAGENT.speciality
  is '专业';
comment on column TBL_LAAGENT.posttitle
  is '职称';
comment on column TBL_LAAGENT.foreignlevel
  is '外语水平';
comment on column TBL_LAAGENT.workage
  is '从业年限';
comment on column TBL_LAAGENT.oldcom
  is '原工作单位';
comment on column TBL_LAAGENT.oldoccupation
  is '原职业';
comment on column TBL_LAAGENT.headship
  is '工作职务（体制）';
comment on column TBL_LAAGENT.business
  is '工种/行业';
comment on column TBL_LAAGENT.emergentlink
  is '紧急联系人';
comment on column TBL_LAAGENT.emergentphone
  is '紧急联系人电话';
comment on column TBL_LAAGENT.salequaf
  is '销售资格';
comment on column TBL_LAAGENT.smokeflag
  is '销售资格标记
为空或为''0''表示有销售资格，为‘1’表示无销售资格';
comment on column TBL_LAAGENT.quafno
  is '员工资格证号码';
comment on column TBL_LAAGENT.quafstartdate
  is '证书开始日期';
comment on column TBL_LAAGENT.quafenddate
  is '证书结束日期';
comment on column TBL_LAAGENT.retaincontno
  is '聘用合同号码';
comment on column TBL_LAAGENT.retainstartdate
  is '劳动合同开始日期';
comment on column TBL_LAAGENT.retainenddate
  is '劳动合同截至日期';
comment on column TBL_LAAGENT.trainperiods
  is '培训期数';
comment on column TBL_LAAGENT.trainpassflag
  is '培训通过标记
0-通过
1-未通过';
comment on column TBL_LAAGENT.traindate
  is '培训日期';
comment on column TBL_LAAGENT.receiptno
  is '保证金收据号';
comment on column TBL_LAAGENT.assumoney
  is '保证金';
comment on column TBL_LAAGENT.tsalestate
  is '代理人状态
"01－在职，
02－二次增员，
03－准离职,
04-离职"
';
comment on column TBL_LAAGENT.employdate
  is '录用日期';
comment on column TBL_LAAGENT.indueformdate
  is '转正日期';
comment on column TBL_LAAGENT.cautionerbirthday
  is '准离职日期';
comment on column TBL_LAAGENT.outworkdate
  is '离司日期';
comment on column TBL_LAAGENT.approver
  is '复核员';
comment on column TBL_LAAGENT.approvedate
  is '档案调入日期（复核日期）';
comment on column TBL_LAAGENT.remark
  is '备注';
comment on column TBL_LAAGENT.recommendagent
  is '推荐员工';
comment on column TBL_LAAGENT.qualipassflag
  is '档案标志位
0 or null-档案未调入
1-档案调入。';
comment on column TBL_LAAGENT.archievecode
  is '档案编码';
comment on column TBL_LAAGENT.bankcode
  is '银行编码';
comment on column TBL_LAAGENT.bankaccno
  is '银行帐户';
comment on column TBL_LAAGENT.creditgrade
  is '信用等级';
comment on column TBL_LAAGENT.accnocrdate
  is '帐户建立日期';
comment on column TBL_LAAGENT.togaeflag
  is '司服是否领取标志
Y-已领取
N-未领取';
comment on column TBL_LAAGENT.operator
  is '操作员代码';
comment on column TBL_LAAGENT.makedate
  is '入机日期';
comment on column TBL_LAAGENT.maketime
  is '入机时间';
comment on column TBL_LAAGENT.modifydate
  is '最后一次修改日期';
comment on column TBL_LAAGENT.modifytime
  is '最后一次修改时间';
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
  is '级别编码';
comment on column TBL_LAAGENTGRADE.gradeid
  is '级别ID
0，1，2...(代表职级所处的代理人级别）';
comment on column TBL_LAAGENTGRADE.gradename
  is '职级名称';
comment on column TBL_LAAGENTGRADE.branchtype
  is '团队类型';
comment on column TBL_LAAGENTGRADE.gradeproperty1
  is '级别属性1';
comment on column TBL_LAAGENTGRADE.gradeproperty2
  is '级别属性2';
comment on column TBL_LAAGENTGRADE.gradeproperty3
  is '级别属性3';
comment on column TBL_LAAGENTGRADE.gradeproperty4
  is '级别属性4';
comment on column TBL_LAAGENTGRADE.gradeproperty5
  is '级别属性5';
comment on column TBL_LAAGENTGRADE.gradeproperty6
  is '级别属性6';
comment on column TBL_LAAGENTGRADE.gradeproperty7
  is '级别属性7';
comment on column TBL_LAAGENTGRADE.gradeproperty8
  is '级别属性8';
comment on column TBL_LAAGENTGRADE.gradeproperty9
  is '级别属性9';
comment on column TBL_LAAGENTGRADE.gradeproperty10
  is '级别属性10';
comment on column TBL_LAAGENTGRADE.noti
  is '备注';
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
  is '团队编码';
comment on column TBL_LABRANCHGROUP.telcom
  is '销售机构编码';
comment on column TBL_LABRANCHGROUP.name
  is '团队名称';
comment on column TBL_LABRANCHGROUP.upbranch
  is '上级团队编码';
comment on column TBL_LABRANCHGROUP.branchattr
  is '团队外部编码';
comment on column TBL_LABRANCHGROUP.branchseries
  is '团队序列编码';
comment on column TBL_LABRANCHGROUP.branchtype
  is '团队类型';
comment on column TBL_LABRANCHGROUP.branchlevel
  is '团队级别';
comment on column TBL_LABRANCHGROUP.branchmanager
  is '团队管理人';
comment on column TBL_LABRANCHGROUP.branchaddresscode
  is '团队地址遍号';
comment on column TBL_LABRANCHGROUP.branchaddress
  is '团队地址';
comment on column TBL_LABRANCHGROUP.branchphone
  is '团队电话';
comment on column TBL_LABRANCHGROUP.branchfax
  is '团队传真';
comment on column TBL_LABRANCHGROUP.branchzipcode
  is '团队邮编';
comment on column TBL_LABRANCHGROUP.founddate
  is '成立日期';
comment on column TBL_LABRANCHGROUP.enddate
  is '停业日期';
comment on column TBL_LABRANCHGROUP.endflag
  is '停业标志';
comment on column TBL_LABRANCHGROUP.branchmanagername
  is '团队管理人姓名';
comment on column TBL_LABRANCHGROUP.branchjobtype
  is '团队工作类型；0-内勤，1-销售';
comment on column TBL_LABRANCHGROUP.brancharea
  is '是否参与分配开关；0-关，1-开
';
comment on column TBL_LABRANCHGROUP.astartdate
  is '调整日期';
comment on column TBL_LABRANCHGROUP.operator
  is '操作员';
comment on column TBL_LABRANCHGROUP.makedate
  is '入机日期';
comment on column TBL_LABRANCHGROUP.maketime
  is '入机时间';
comment on column TBL_LABRANCHGROUP.modifydate
  is '最后一次修改日期';
comment on column TBL_LABRANCHGROUP.modifytime
  is '最后一次修改时间';
comment on column TBL_LABRANCHGROUP.attribute1
  is '上级直辖部编码';
comment on column TBL_LABRANCHGROUP.upbranchattr
  is 'UMA直辖组属性；1-直辖，0-非直辖';
comment on column TBL_LABRANCHGROUP.qthomologousdepart
  is '质检对应部';
comment on column TBL_LABRANCHGROUP.qthomologousaera
  is '质检对应区';
comment on column TBL_LABRANCHGROUP.tsaleflag
  is '是否有在职人员 1-有 0-没有';
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
根据渠道接口的开发需要新规表';
-- Add comments to the columns 
comment on column TBL_LABRANCHLEVEL.branchlevelcode
  is '81-电销组
82-电销部
83-电销分区
84-电销中心
';
comment on column TBL_LABRANCHLEVEL.branchleveltype
  is '0－默认。';
comment on column TBL_LABRANCHLEVEL.branchlevelid
  is '（职级属性2，相当于机构级别的内部编码 1,2,3....）';
comment on column TBL_LABRANCHLEVEL.branchtype
  is '展业类型(1-个人营销，2-团险，3－银行保险，4－收费员，5－直销，6－银代续期，9－其他)
';
comment on column TBL_LABRANCHLEVEL.branchproperty
  is '（上门，电话，其他）；';
comment on column TBL_LABRANCHLEVEL.agentkind
  is '机构对应属性';
comment on column TBL_LABRANCHLEVEL.subjectproperty
  is '直辖属性';
comment on column TBL_LABRANCHLEVEL.branchlevelproperty1
  is '机构中实际是否有增员';
comment on column TBL_LABRANCHLEVEL.branchlevelproperty2
  is '展业机构编码长度定义';
comment on column TBL_LABRANCHLEVEL.branchtype2
  is '01-直销
02-中介
03-交叉销售';
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
  is '01-总公司
02-分公司
03-中心支公司
04-支公司(营销服务部)
';
comment on column TBL_LATELCOM.comareatype
  is '1:一类地区
2：二类地区';
comment on column TBL_LATELCOM.comtype
  is '01-销售
02-清洗
03-质检
04-催收';
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
  is '员工代码';
comment on column TBL_LATREE.telcom
  is '销售机构编码';
comment on column TBL_LATREE.tsalegrade
  is '员工级别';
comment on column TBL_LATREE.tsaleseries
  is '员工系列';
comment on column TBL_LATREE.tsalelastseries
  is '员工上次系列';
comment on column TBL_LATREE.tsalelastgrade
  is '员工上次级别';
comment on column TBL_LATREE.introagency
  is '增员员工备用';
comment on column TBL_LATREE.upagent
  is '上级主管';
comment on column TBL_LATREE.oldstartdate
  is '前职级起聘日期';
comment on column TBL_LATREE.oldenddate
  is '前职级解聘日期';
comment on column TBL_LATREE.startdate
  is '现职级起聘日期';
comment on column TBL_LATREE.astartdate
  is '考核开始日期';
comment on column TBL_LATREE.assesstype
  is '考核类型';
comment on column TBL_LATREE.state
  is '代理人状态
在职－0、准离职-3、离职-4';
comment on column TBL_LATREE.branchattr
  is '团队外部编码';
comment on column TBL_LATREE.branchtype
  is '员工类型';
comment on column TBL_LATREE.initgrade
  is '入司职级';
comment on column TBL_LATREE.tsaleline
  is '代理人发展路线';
comment on column TBL_LATREE.insideflag
  is '内外勤标记';
comment on column TBL_LATREE.connmanagerstate
  is '衔接人员状态标志
';
comment on column TBL_LATREE.connsuccdate
  is '定级完成日期';
comment on column TBL_LATREE.tsalegradersn
  is '当前职级起聘原因
记录业务员当前职级的起聘原因，包括入司起聘职级、正常考核晋升降级职级、人为手工行政晋升降级职级
0-入司起聘职级
1-考核结果职级
2-行政干预职级';
comment on column TBL_LATREE.operator
  is '操作员代码';
comment on column TBL_LATREE.makedate
  is '入机日期';
comment on column TBL_LATREE.maketime
  is '入机时间';
comment on column TBL_LATREE.modifydate
  is '最后一次修改日期';
comment on column TBL_LATREE.modifytime
  is '最后一次修改时间';
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
1  追加  地址号、家庭邮编、家庭传真、单位邮编、
    单位传真、收费地址收费邮编、收费电话、
    操作员、入机日期、入机时间、最后修改日期、最后修改时间
2  区/县  长度变更40 ->200
3  字段位置调整(需重新生成)
4  主键变更
5  删除  名称、性别、出生日期、证件类型、证件号码
';
-- Add comments to the columns 
comment on column TBL_LCADDRESS.custno
  is '客户编号';
comment on column TBL_LCADDRESS.addressno
  is '地址号';
comment on column TBL_LCADDRESS.province
  is '省';
comment on column TBL_LCADDRESS.city
  is '市';
comment on column TBL_LCADDRESS.county
  is '区/县';
comment on column TBL_LCADDRESS.postaladdress
  is '通讯地址';
comment on column TBL_LCADDRESS.zipcode
  is '联系邮编';
comment on column TBL_LCADDRESS.phone
  is '通讯电话';
comment on column TBL_LCADDRESS.fax
  is '通讯传真';
comment on column TBL_LCADDRESS.homeaddress
  is '家庭地址';
comment on column TBL_LCADDRESS.homezipcode
  is '家庭邮编';
comment on column TBL_LCADDRESS.homephone
  is '家庭电话';
comment on column TBL_LCADDRESS.homefax
  is '家庭传真';
comment on column TBL_LCADDRESS.grpname
  is '单位名称';
comment on column TBL_LCADDRESS.companyaddress
  is '单位地址';
comment on column TBL_LCADDRESS.companyzipcode
  is '单位邮编';
comment on column TBL_LCADDRESS.companyphone
  is '单位电话';
comment on column TBL_LCADDRESS.companyfax
  is '单位传真';
comment on column TBL_LCADDRESS.payaddress
  is '收费地址';
comment on column TBL_LCADDRESS.payzipcode
  is '收费邮编';
comment on column TBL_LCADDRESS.payphone
  is '收费电话';
comment on column TBL_LCADDRESS.mobile
  is '手机';
comment on column TBL_LCADDRESS.email
  is 'e_mail';
comment on column TBL_LCADDRESS.posted
  is '数据传输标志';
comment on column TBL_LCADDRESS.updatetime
  is '更新时间';
comment on column TBL_LCADDRESS.operator
  is '操作员';
comment on column TBL_LCADDRESS.makedate
  is '入机日期';
comment on column TBL_LCADDRESS.maketime
  is '入机时间';
comment on column TBL_LCADDRESS.modifydate
  is '最后修改日期';
comment on column TBL_LCADDRESS.modifytime
  is '最后修改时间';
comment on column TBL_LCADDRESS.hprovince
  is '省';
comment on column TBL_LCADDRESS.hcity
  is '市';
comment on column TBL_LCADDRESS.hcounty
  is '区/县';
comment on column TBL_LCADDRESS.wprovince
  is '省';
comment on column TBL_LCADDRESS.wcity
  is '市';
comment on column TBL_LCADDRESS.wcounty
  is '区/县';
comment on column TBL_LCADDRESS.mprovince
  is '省';
comment on column TBL_LCADDRESS.mcity
  is '市';
comment on column TBL_LCADDRESS.mcounty
  is '区/县';
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
  is '合同号码';
comment on column TBL_LCAPPNT.customerno
  is '投保人客户号';
comment on column TBL_LCAPPNT.appntname
  is '投保人名称';
comment on column TBL_LCAPPNT.appntsex
  is '投保人性别';
comment on column TBL_LCAPPNT.appntbirthday
  is '投保人出生日期';
comment on column TBL_LCAPPNT.idtype
  is '投保人证件类型';
comment on column TBL_LCAPPNT.idno
  is '投保人证件号码';
comment on column TBL_LCAPPNT.marriage
  is '婚姻状况';
comment on column TBL_LCAPPNT.degree
  is '学历';
comment on column TBL_LCAPPNT.nativeplace
  is '国籍';
comment on column TBL_LCAPPNT.age
  is '年龄';
comment on column TBL_LCAPPNT.rgtaddress
  is '户口所在地';
comment on column TBL_LCAPPNT.nationality
  is '民族';
comment on column TBL_LCAPPNT.worktype
  is '职业（工种) -行业';
comment on column TBL_LCAPPNT.occupationtype
  is '职业类别 --职业等级';
comment on column TBL_LCAPPNT.occupationcode
  is '职业代码';
comment on column TBL_LCAPPNT.occupationname
  is '职业名称  -职业';
comment on column TBL_LCAPPNT.pluralitytype
  is '兼职职业等级';
comment on column TBL_LCAPPNT.pluralitycode
  is '兼职职业代码';
comment on column TBL_LCAPPNT.pluralityname
  is '兼职职业名称';
comment on column TBL_LCAPPNT.highestworktype
  is '最高职业等级';
comment on column TBL_LCAPPNT.license
  is '驾照';
comment on column TBL_LCAPPNT.licensetype
  is '驾照类型';
comment on column TBL_LCAPPNT.posted
  is '数据传输标志';
comment on column TBL_LCAPPNT.updatetime
  is '更新时间';
comment on column TBL_LCAPPNT.relationtoinsured
  is '与被保人关系';
comment on column TBL_LCAPPNT.callback
  is '回访电话';
comment on column TBL_LCAPPNT.email
  is '电子邮箱';
comment on column TBL_LCAPPNT.operator
  is '操作员';
comment on column TBL_LCAPPNT.makedate
  is '入机日期';
comment on column TBL_LCAPPNT.maketime
  is '入机时间';
comment on column TBL_LCAPPNT.modifydate
  is '最后修改日期';
comment on column TBL_LCAPPNT.modifytime
  is '最后修改时间';
comment on column TBL_LCAPPNT.iscustomer
  is '不是-0 是-1';
comment on column TBL_LCAPPNT.highcode
  is '最高职业代码';
comment on column TBL_LCAPPNT.highworktype
  is '最高职业(工种)';
comment on column TBL_LCAPPNT.datecode
  is '1-有效期
2-终身';
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
  is '合同号码';
comment on column TBL_LCBNF.polno
  is '保单险种号码';
comment on column TBL_LCBNF.bnftype
  is '受益人类别';
comment on column TBL_LCBNF.customerno
  is '被保人客户号';
comment on column TBL_LCBNF.bnfgrade
  is '受益人级别';
comment on column TBL_LCBNF.bnfno
  is '受益人序号';
comment on column TBL_LCBNF.relationtoinsured
  is '与被保人关系';
comment on column TBL_LCBNF.name
  is '客户姓名';
comment on column TBL_LCBNF.sex
  is '客户性别';
comment on column TBL_LCBNF.birthday
  is '客户出生日期';
comment on column TBL_LCBNF.idtype
  is '证件类型';
comment on column TBL_LCBNF.idno
  is '证件号码';
comment on column TBL_LCBNF.bnflot
  is '受益份额';
comment on column TBL_LCBNF.posted
  is '数据传输标志';
comment on column TBL_LCBNF.age
  is '年龄';
comment on column TBL_LCBNF.operator
  is '操作员';
comment on column TBL_LCBNF.makedate
  is '入机日期';
comment on column TBL_LCBNF.maketime
  is '入机时间';
comment on column TBL_LCBNF.modifydate
  is '最后修改日期';
comment on column TBL_LCBNF.modifytime
  is '最后修改时间';
comment on column TBL_LCBNF.updatetime
  is '更新时间';
comment on column TBL_LCBNF.sybl
  is '受益人所占受益比例';
comment on column TBL_LCBNF.nativeplace
  is '国籍代码';
comment on column TBL_LCBNF.datecode
  is '证件有效期代码';
comment on column TBL_LCBNF.worktype
  is '行业代码';
comment on column TBL_LCBNF.occupationcode
  is '职业代码';
comment on column TBL_LCBNF.occupationname
  is '职业名称';
comment on column TBL_LCBNF.syorder
  is '受益顺序代码';
comment on column TBL_LCBNF.cervaliddate
  is '证件有效期';
comment on column TBL_LCBNF.mphone
  is '受益人联系电话';
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
  is '合同号码--保单号';
comment on column TBL_LCCONT.prtno
  is '印刷号码--投保单号';
comment on column TBL_LCCONT.custseqno
  is '任务号';
comment on column TBL_LCCONT.custno
  is '客户编号';
comment on column TBL_LCCONT.polapplydate
  is '投保单申请日期';
comment on column TBL_LCCONT.cvalidate
  is '保单生效日期';
comment on column TBL_LCCONT.tsalecode
  is '代理人编码';
comment on column TBL_LCCONT.tsalename
  is '代理人姓名';
comment on column TBL_LCCONT.agentcom
  is '代理机构';
comment on column TBL_LCCONT.agentgroup
  is '代理人组别';
comment on column TBL_LCCONT.agentrelatoappnt
  is '主业务员与投保人的关系';
comment on column TBL_LCCONT.managecom
  is '管理机构';
comment on column TBL_LCCONT.salechnl
  is '销售渠道';
comment on column TBL_LCCONT.getpoldate
  is '保单送达日期';
comment on column TBL_LCCONT.getpoltime
  is '保单送达时间';
comment on column TBL_LCCONT.customgetpoldate
  is '保单回执客户签收日期';
comment on column TBL_LCCONT.paylocation
  is '交费位置';
comment on column TBL_LCCONT.bankcode
  is '续期银行编码';
comment on column TBL_LCCONT.bankaccno
  is '续期银行帐号';
comment on column TBL_LCCONT.accname
  is '续期银行帐户名';
comment on column TBL_LCCONT.newpaymode
  is '首期交费方式';
comment on column TBL_LCCONT.newbankcode
  is '首期银行编码';
comment on column TBL_LCCONT.newbankaccno
  is '首期银行帐号';
comment on column TBL_LCCONT.newaccname
  is '首期银行帐户名';
comment on column TBL_LCCONT.agentbankcode
  is '银代银行代码';
comment on column TBL_LCCONT.bankagent
  is '代柜员';
comment on column TBL_LCCONT.prem
  is '保费';
comment on column TBL_LCCONT.yearprem
  is '年化保费';
comment on column TBL_LCCONT.extpaymode
  is '续期缴费方式';
comment on column TBL_LCCONT.sendtime
  is '提交时间';
comment on column TBL_LCCONT.accepttime
  is '核保受理时间';
comment on column TBL_LCCONT.mnchktime
  is '人工核保时间';
comment on column TBL_LCCONT.printtime
  is '打印时间';
comment on column TBL_LCCONT.tobanktime
  is '制盘时间';
comment on column TBL_LCCONT.insuretime
  is '承保日期';
comment on column TBL_LCCONT.canceltime
  is '撤单日期';
comment on column TBL_LCCONT.reefftime
  is '复效日期';
comment on column TBL_LCCONT.checkstate
  is '自核状态';
comment on column TBL_LCCONT.sendstate
  is '快递状态';
comment on column TBL_LCCONT.polstate
  is '保单状态
01	暂存
02	待发送
03	已受理
04	打印中
05	快递中
06	已签收
07	转账中
08	转账失败
09	待签单
10	已承保
11	保单失效
12	保单终止
13	保单取消';
comment on column TBL_LCCONT.salecom
  is '销售机构';
comment on column TBL_LCCONT.username
  is '销售员姓名';
comment on column TBL_LCCONT.userid
  is '销售员代码';
comment on column TBL_LCCONT.posted
  is '数据传输标志';
comment on column TBL_LCCONT.updatetime
  is '更新时间';
comment on column TBL_LCCONT.remark
  is '备注';
comment on column TBL_LCCONT.state
  is '状态';
comment on column TBL_LCCONT.reprtflag
  is 'REPRTFLAG';
comment on column TBL_LCCONT.payintv
  is '缴费频率';
comment on column TBL_LCCONT.tobanktimes
  is '转账次数';
comment on column TBL_LCCONT.yeartotalprem
  is '年缴保费';
comment on column TBL_LCCONT.groupid
  is '组别';
comment on column TBL_LCCONT.campname
  is '专案名称';
comment on column TBL_LCCONT.telcom
  is '电销中心';
comment on column TBL_LCCONT.courier
  is '快递员';
comment on column TBL_LCCONT.signatory
  is '签署人';
comment on column TBL_LCCONT.operator
  is '操作员';
comment on column TBL_LCCONT.makedate
  is '入机日期';
comment on column TBL_LCCONT.maketime
  is '入机时间';
comment on column TBL_LCCONT.modifydate
  is '最后修改日期';
comment on column TBL_LCCONT.modifytime
  is '最后修改时间';
comment on column TBL_LCCONT.epressmode
  is '快递方式
1  TSR自取
2  快递配送
';
comment on column TBL_LCCONT.sustype
  is '首拔-01、加保-02、拓单-03';
comment on column TBL_LCCONT.conttype
  is '保单形式
1-电子保单
2-电子保单加纸质保单
3-纸质保单';
comment on column TBL_LCCONT.qastate
  is '质检状态
1-待质检
2-合格
3-补录音
4-停单';
comment on column TBL_LCCONT.fistprem
  is '首期保费';
comment on column TBL_LCCONT.otheramnt
  is '既往其他公司累计保额';
comment on column TBL_LCCONT.areacode
  is '区域代码';
comment on column TBL_LCCONT.isfan
  is '是否反洗钱  1 是    0 否';
comment on column TBL_LCCONT.firstconttype
  is '首次保单形式';
comment on column TBL_LCCONT.isright
  is '新兵连审核使用
0 不合格
1 合格';
comment on column TBL_LCCONT.sourcecustno
  is '源客户号';
comment on column TBL_LCCONT.printtype
  is '打印类型';
comment on column TBL_LCCONT.printfalg
  is '打印结果标示';
comment on column TBL_LCCONT.printresult
  is '打印结果';
comment on column TBL_LCCONT.dprintdate
  is '电子保单打印日期';
comment on column TBL_LCCONT.dunicode
  is '电子保单打印唯一流水号';
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
  is '保单号';
comment on column TBL_LCCONTTRACK.serialno
  is '每次操作加1';
comment on column TBL_LCCONTTRACK.contstate
  is '保单状态';
comment on column TBL_LCCONTTRACK.operator
  is '操作员';
comment on column TBL_LCCONTTRACK.makedate
  is '入机日期';
comment on column TBL_LCCONTTRACK.maketime
  is '入机时间';
comment on column TBL_LCCONTTRACK.modifydate
  is '最后修改日期';
comment on column TBL_LCCONTTRACK.modifytime
  is '最后修改时间';
comment on column TBL_LCCONTTRACK.contstatereason
  is '保单状态释义
01	暂存
02	自核未通过
03	待发送
04	TL发送自核后
05	自核通过后
06	打印完成
07	客户签收成功
08	签收成功后，银行划款中
09	转账失败
10	签单成功
11	复效成功
12	保单失效
13	退保
14	犹退
15	协议退保
16	失效终止
17	理赔终止
18	逾期
19	信息有误
20	取消保单
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
  is '任务号';
comment on column TBL_LCFREESENDINFO.contno
  is '合同号码';
comment on column TBL_LCFREESENDINFO.prtno
  is '印刷号码';
comment on column TBL_LCFREESENDINFO.productname
  is '免费产品名称';
comment on column TBL_LCFREESENDINFO.productcode
  is '免费产品编码';
comment on column TBL_LCFREESENDINFO.sendtime
  is '赠送时间';
comment on column TBL_LCFREESENDINFO.efftime
  is '生效时间';
comment on column TBL_LCFREESENDINFO.exptime
  is '有效期截止时间';
comment on column TBL_LCFREESENDINFO.custname
  is '客户姓名';
comment on column TBL_LCFREESENDINFO.sex
  is '性别';
comment on column TBL_LCFREESENDINFO.birth
  is '生日';
comment on column TBL_LCFREESENDINFO.idno
  is '证件号码';
comment on column TBL_LCFREESENDINFO.city
  is '联系城市';
comment on column TBL_LCFREESENDINFO.district
  is '联系城区';
comment on column TBL_LCFREESENDINFO.address
  is '联系地址';
comment on column TBL_LCFREESENDINFO.zipcode
  is '联系邮编';
comment on column TBL_LCFREESENDINFO.phone
  is '联系电话';
comment on column TBL_LCFREESENDINFO.worktype
  is '行业';
comment on column TBL_LCFREESENDINFO.occupationname
  is '职业';
comment on column TBL_LCFREESENDINFO.occupationcode
  is '职业代码';
comment on column TBL_LCFREESENDINFO.occupationtype
  is '职业等级';
comment on column TBL_LCFREESENDINFO.active
  is '1 为激活 2 激活 0激活中';
comment on column TBL_LCFREESENDINFO.remark
  is '备注';
comment on column TBL_LCFREESENDINFO.updatetime
  is '更新时间';
comment on column TBL_LCFREESENDINFO.giftserial
  is '赠品序号';
comment on column TBL_LCFREESENDINFO.hcity
  is '家庭城市';
comment on column TBL_LCFREESENDINFO.hdistrict
  is '家庭城区';
comment on column TBL_LCFREESENDINFO.haddress
  is '家庭地址';
comment on column TBL_LCFREESENDINFO.pmaturity
  is '车险到期日';
comment on column TBL_LCFREESENDINFO.insuretime
  is '投保时间';
comment on column TBL_LCFREESENDINFO.idtype
  is '证件类型';
comment on column TBL_LCFREESENDINFO.state
  is '是否已清洗转销售';
comment on column TBL_LCFREESENDINFO.sourcecustno
  is '源客户号';
comment on column TBL_LCFREESENDINFO.cleanno
  is '清洗流水号';
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
  is '合同号码';
comment on column TBL_LCINSURED.customerno
  is '被保人客户号';
comment on column TBL_LCINSURED.name
  is '被保人名称';
comment on column TBL_LCINSURED.sex
  is '被保人性别';
comment on column TBL_LCINSURED.birthday
  is '被保人出生日期';
comment on column TBL_LCINSURED.idtype
  is '被保人证件类型';
comment on column TBL_LCINSURED.idno
  is '被保人证件号码';
comment on column TBL_LCINSURED.marriage
  is '婚姻状况';
comment on column TBL_LCINSURED.degree
  is '学历';
comment on column TBL_LCINSURED.nativeplace
  is '国籍';
comment on column TBL_LCINSURED.rgtaddress
  is '户口所在地';
comment on column TBL_LCINSURED.nationality
  is '民族';
comment on column TBL_LCINSURED.worktype
  is '职业（工种)';
comment on column TBL_LCINSURED.occupationtype
  is '职业类别';
comment on column TBL_LCINSURED.occupationcode
  is '职业代码';
comment on column TBL_LCINSURED.occupationname
  is '职业名称';
comment on column TBL_LCINSURED.pluralitytype
  is '兼职职业等级';
comment on column TBL_LCINSURED.highestworktype
  is '最高职业等级';
comment on column TBL_LCINSURED.pluralityname
  is '兼职职业名称';
comment on column TBL_LCINSURED.pluralitycode
  is '兼职职业代码';
comment on column TBL_LCINSURED.license
  is '驾照';
comment on column TBL_LCINSURED.licensetype
  is '驾照类型';
comment on column TBL_LCINSURED.sequenceno
  is '客户内部号码';
comment on column TBL_LCINSURED.relationtomaininsured
  is '与主被保人关系';
comment on column TBL_LCINSURED.relationtoappnt
  is '与投保人关系';
comment on column TBL_LCINSURED.insuredno
  is '被保人次序';
comment on column TBL_LCINSURED.posted
  is '数据传输标志';
comment on column TBL_LCINSURED.email
  is '电子邮箱';
comment on column TBL_LCINSURED.updatetime
  is '更新时间';
comment on column TBL_LCINSURED.age
  is '年龄';
comment on column TBL_LCINSURED.callback
  is '回访电话';
comment on column TBL_LCINSURED.operator
  is '操作员';
comment on column TBL_LCINSURED.makedate
  is '入机日期';
comment on column TBL_LCINSURED.maketime
  is '入机时间';
comment on column TBL_LCINSURED.modifydate
  is '最后修改日期';
comment on column TBL_LCINSURED.modifytime
  is '最后修改时间';
comment on column TBL_LCINSURED.iscustomer
  is '不是-0 是-1';
comment on column TBL_LCINSURED.highcode
  is '最高职业代码';
comment on column TBL_LCINSURED.highworktype
  is '最高职业(工种)';
comment on column TBL_LCINSURED.datecode
  is '1-有效期
2-终身';
comment on column TBL_LCINSURED.height
  is '身高';
comment on column TBL_LCINSURED.weight
  is '体重';
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
  is '保单险种号码';
comment on column TBL_LCPOL.contno
  is '合同号码';
comment on column TBL_LCPOL.riskcode
  is '险种编码';
comment on column TBL_LCPOL.mainriskcode
  is '主险种代码';
comment on column TBL_LCPOL.amnt
  is '基本保额';
comment on column TBL_LCPOL.prem
  is '保费';
comment on column TBL_LCPOL.mult
  is '份数';
comment on column TBL_LCPOL.rnewflag
  is '续保标志';
comment on column TBL_LCPOL.insuyearflag
  is '保险年龄年期标志';
comment on column TBL_LCPOL.payendyearflag
  is '终交年龄年期标志';
comment on column TBL_LCPOL.getbankcode
  is '领取银行编码';
comment on column TBL_LCPOL.getbankaccno
  is '领取银行账户';
comment on column TBL_LCPOL.getaccname
  is '领取银行户名';
comment on column TBL_LCPOL.autopayflag
  is '自动垫交标志';
comment on column TBL_LCPOL.bonusgetmode
  is '红利金领取方式';
comment on column TBL_LCPOL.subflag
  is '减额交清标志';
comment on column TBL_LCPOL.customerno
  is '被保人客户号';
comment on column TBL_LCPOL.posted
  is '数据传输标志';
comment on column TBL_LCPOL.updatetime
  is '更新时间';
comment on column TBL_LCPOL.payintv
  is '交费间隔';
comment on column TBL_LCPOL.payyears
  is '交费年期';
comment on column TBL_LCPOL.insuyear
  is '保险年龄年期';
comment on column TBL_LCPOL.payendyear
  is '终交年龄年期';
comment on column TBL_LCPOL.addprem
  is '追加保费';
comment on column TBL_LCPOL.addpremintv
  is '追加保费频率';
comment on column TBL_LCPOL.riskversion
  is '险种版本';
comment on column TBL_LCPOL.cvalidate
  is '生效日';
comment on column TBL_LCPOL.operator
  is '操作员';
comment on column TBL_LCPOL.makedate
  is '入机日期';
comment on column TBL_LCPOL.maketime
  is '入机时间';
comment on column TBL_LCPOL.modifydate
  is '最后修改日期';
comment on column TBL_LCPOL.modifytime
  is '最后修改时间';
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
  is '地域类型
01-省
02-市
03-区/县';
comment on column TBL_LDADDRESS.placecode
  is '地域代码';
comment on column TBL_LDADDRESS.placename
  is '地域名称';
comment on column TBL_LDADDRESS.upplacename
  is '上级地域代码';
comment on column TBL_LDADDRESS.jc
  is '首字母';
comment on column TBL_LDADDRESS.placestate
  is '地址状 1-有效 0-无效';
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
  is '银行编码';
comment on column TBL_LDBANK.bankname
  is '银行名称';
comment on column TBL_LDBANK.comcode
  is '所属机构';
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
新规';
-- Add comments to the columns 
comment on column TBL_LDCITY.citycode
  is '市级编码';
comment on column TBL_LDCITY.cityname
  is '城市名称';
comment on column TBL_LDCITY.provincecode
  is '省编码';
comment on column TBL_LDCITY.cityorder
  is '显示顺序';
comment on column TBL_LDCITY.validflag
  is '状态位
0为无效，1为有效';
comment on column TBL_LDCITY.operator
  is '操作人';
comment on column TBL_LDCITY.makedate
  is '入机日期';
comment on column TBL_LDCITY.maketime
  is '入机时间';
comment on column TBL_LDCITY.modifydate
  is '最后修改日期';
comment on column TBL_LDCITY.modifytime
  is '最后修改时间';
comment on column TBL_LDCITY.comcode
  is '管理机构';
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
  is '该字段暂时用于存储收费员渠道的机构地区类型
1-一类地区
2-二类地区
3-三类地区
4-四类地区';
comment on column TBL_LDCOM.servicename
  is '01-支公司(营销服务部)
02-中心支公司
03-分公司
04-总公司';
comment on column TBL_LDCOM.serviceno
  is '01-支公司(营销服务部)
02-中心支公司
03-分公司
04-总公司';
comment on column TBL_LDCOM.servicephone
  is '01-支公司(营销服务部)
02-中心支公司
03-分公司
04-总公司';
comment on column TBL_LDCOM.servicepostaddress
  is '01-支公司(营销服务部)
02-中心支公司
03-分公司
04-总公司';
comment on column TBL_LDCOM.comgrade
  is '01-总公司
02-分公司
03-中心支公司
04-支公司(营销服务部)
';
comment on column TBL_LDCOM.comareatype
  is '1:一类地区
2：二类地区';
comment on column TBL_LDCOM.isdirunder
  is '1:直属中支
2：非直属中支（如：营销服务部）';
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
  is '保险套餐计划表';
-- Add comments to the columns 
comment on column TBL_LDPLAN.contplancode
  is '保险计划编码    00-默认值';
comment on column TBL_LDPLAN.contplanname
  is '保险计划名称';
comment on column TBL_LDPLAN.plantype
  is '计划类别:
0-固定计划；
1-非固定计划
3-险种默认值
4-套餐计划';
comment on column TBL_LDPLAN.planrule
  is '计划规则';
comment on column TBL_LDPLAN.plansql
  is '计划规则sql';
comment on column TBL_LDPLAN.remark
  is '参数个数';
comment on column TBL_LDPLAN.operator
  is '操作员';
comment on column TBL_LDPLAN.makedate
  is '入机日期';
comment on column TBL_LDPLAN.maketime
  is '入机时间';
comment on column TBL_LDPLAN.modifydate
  is '最后一次修改日期';
comment on column TBL_LDPLAN.modifytime
  is '最后一次修改时间';
comment on column TBL_LDPLAN.peoples3
  is '可投保人数';
comment on column TBL_LDPLAN.remark2
  is '参数个数';
comment on column TBL_LDPLAN.managecom
  is '管理机构';
comment on column TBL_LDPLAN.salechnl
  is '销售渠道:
1-个人营销,2-团险直销,3-银行代理
';
comment on column TBL_LDPLAN.startdate
  is '销售起期';
comment on column TBL_LDPLAN.enddate
  is '销售止期';
comment on column TBL_LDPLAN.state
  is '状态:
用以存储产品组合所处状态

0-申请中（产品组合保存时指定）
1-待审核
2-审核中
3-待审批
4-审批中

5-审核不通过
7-审批不通过

9-完成';
comment on column TBL_LDPLAN.ifelc
  is '是否生产电子保单 0 否 1 是';
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
  is '险种保险套餐计划表';
-- Add comments to the columns 
comment on column TBL_LDPLANRISK.mainriskcode
  is '主险险种编码';
comment on column TBL_LDPLANRISK.mainriskversion
  is '主险险种版本';
comment on column TBL_LDPLANRISK.riskcode
  is '险种编码';
comment on column TBL_LDPLANRISK.riskversion
  is '险种版本';
comment on column TBL_LDPLANRISK.contplancode
  is '保险计划编码:
00-默认值';
comment on column TBL_LDPLANRISK.contplanname
  is '保险计划名称';
comment on column TBL_LDPLANRISK.remark
  is '参数个数';
comment on column TBL_LDPLANRISK.operator
  is '操作员';
comment on column TBL_LDPLANRISK.makedate
  is '入机日期';
comment on column TBL_LDPLANRISK.maketime
  is '入机时间';
comment on column TBL_LDPLANRISK.modifydate
  is '最后一次修改日期';
comment on column TBL_LDPLANRISK.modifytime
  is '最后一次修改时间';
comment on column TBL_LDPLANRISK.plantype
  is '计划类别：
0-固定计划；
1-非固定计划
3-险种默认值
4-套餐计划';
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
新规';
-- Add comments to the columns 
comment on column TBL_LDPROVINCE.provincecode
  is '省编码';
comment on column TBL_LDPROVINCE.provincename
  is '省名称';
comment on column TBL_LDPROVINCE.provinceorder
  is '显示顺序';
comment on column TBL_LDPROVINCE.validflag
  is '状态位
0为无效，1为有效';
comment on column TBL_LDPROVINCE.operator
  is '操作人';
comment on column TBL_LDPROVINCE.makedate
  is '入机日期';
comment on column TBL_LDPROVINCE.maketime
  is '入机时间';
comment on column TBL_LDPROVINCE.modifydate
  is '最后修改日期';
comment on column TBL_LDPROVINCE.modifytime
  is '最后修改时间';
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
  is '父层代码';
comment on column TBL_LDTERMCODE.clevel
  is '父层代码的所属层级加1
初始值为 1';
comment on column TBL_LDTERMCODE.enabled
  is '是否显示';
comment on column TBL_LDTERMCODE.userlevel
  is '用户级别';
comment on column TBL_LDTERMCODE.orderid
  is '排序号';
comment on column TBL_LDTERMCODE.status
  is '状态位
0为无效，1为有效';
comment on column TBL_LDTERMCODE.operator
  is '操作人';
comment on column TBL_LDTERMCODE.makedate
  is '入机日期';
comment on column TBL_LDTERMCODE.maketime
  is '入机时间';
comment on column TBL_LDTERMCODE.modifydate
  is '最后修改日期';
comment on column TBL_LDTERMCODE.modifytime
  is '最后修改时间';
comment on column TBL_LDTERMCODE.termtype
  is '结束码类型
0、销售结束码
1、清洗结束码';
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
  is '7/13  MANAGECOM  管理机构   追加
          MENUGRPCODE 菜单分组编码  追加 ->删除';
-- Add comments to the columns 
comment on column TBL_LDUSER.usercode
  is '用户编码';
comment on column TBL_LDUSER.username
  is '用户姓名';
comment on column TBL_LDUSER.managecom
  is '管理机构';
comment on column TBL_LDUSER.comcode
  is '机构编码';
comment on column TBL_LDUSER.password
  is '口令';
comment on column TBL_LDUSER.userdescription
  is '用户描述';
comment on column TBL_LDUSER.userstate
  is '用户状态';
comment on column TBL_LDUSER.superpopedomflag
  is '超级权限标志';
comment on column TBL_LDUSER.validstartdate
  is '有效开始日期';
comment on column TBL_LDUSER.validenddate
  is '有效结束日期';
comment on column TBL_LDUSER.phone
  is '电话';
comment on column TBL_LDUSER.extphone
  is '分机号';
comment on column TBL_LDUSER.position
  is '地址';
comment on column TBL_LDUSER.email
  is 'e-mail';
comment on column TBL_LDUSER.defmaxnum
  is '日最大取号量';
comment on column TBL_LDUSER.spemaxnum
  is '特殊取号量';
comment on column TBL_LDUSER.operator
  is '操作员代码';
comment on column TBL_LDUSER.makedate
  is '入机日期';
comment on column TBL_LDUSER.maketime
  is '入机时间';
comment on column TBL_LDUSER.modifydate
  is '最后一次修改日期';
comment on column TBL_LDUSER.modifytime
  is '最后一次修改时间';
comment on column TBL_LDUSER.insideflag
  is '内外勤标记';
comment on column TBL_LDUSER.amcode
  is '分中心编码';
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
  is '等同于既存电销的【CAMPAIGN】
7/15
1 所属区域、电销中心、专案归属省、专案归属城市 --》追加';
-- Add comments to the columns 
comment on column TBL_LMCAMPAIGN.campcode
  is '专案编码';
comment on column TBL_LMCAMPAIGN.campname
  is '专案名称';
comment on column TBL_LMCAMPAIGN.camptype
  is '专案类型（01-通用型、02-项目型、03-外包型）';
comment on column TBL_LMCAMPAIGN.campaigntalk
  is '专案话术';
comment on column TBL_LMCAMPAIGN.campaignsrit
  is '专案描述';
comment on column TBL_LMCAMPAIGN.callarea
  is '所属区域';
comment on column TBL_LMCAMPAIGN.comcode
  is '所属电销中心';
comment on column TBL_LMCAMPAIGN.teamtype
  is '团队类型: 用拼音简写指代, 销售团队为XS, 清洗团队为QX';
comment on column TBL_LMCAMPAIGN.dataprovince
  is '专案归属省';
comment on column TBL_LMCAMPAIGN.datacity
  is '专案归属城市';
comment on column TBL_LMCAMPAIGN.status
  is '专案状态
0:有效
1:无效';
comment on column TBL_LMCAMPAIGN.partnercode
  is '合作对象代码';
comment on column TBL_LMCAMPAIGN.startdate
  is '开始日期';
comment on column TBL_LMCAMPAIGN.enddate
  is '结束日期';
comment on column TBL_LMCAMPAIGN.addname
  is '插入人';
comment on column TBL_LMCAMPAIGN.addtime
  is '插入时间';
comment on column TBL_LMCAMPAIGN.editname
  is '编辑人';
comment on column TBL_LMCAMPAIGN.edittime
  is '编辑时间';
comment on column TBL_LMCAMPAIGN.orderid
  is '排序号';
comment on column TBL_LMCAMPAIGN.fdatatype
  is '是否自建';
comment on column TBL_LMCAMPAIGN.operator
  is '操作人';
comment on column TBL_LMCAMPAIGN.makedate
  is '入机日期';
comment on column TBL_LMCAMPAIGN.maketime
  is '入机时间';
comment on column TBL_LMCAMPAIGN.modifydate
  is '最后修改日期';
comment on column TBL_LMCAMPAIGN.modifytime
  is '最后修改时间';
comment on column TBL_LMCAMPAIGN.infotype
  is '数据类型';
comment on column TBL_LMCAMPAIGN.gettype
  is '名单详述(和名单类型相对应着看)';
comment on column TBL_LMCAMPAIGN.recheck
  is '是否查重
0-否
1-是';
comment on column TBL_LMCAMPAIGN.purpose
  is '专案用途 0-自建团队 1-外包团队';
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
  is '用于专案批次与导入批次的数据关联';
-- Add comments to the columns 
comment on column TBL_LMDATAREL.calllistno
  is '专案批次号';
comment on column TBL_LMDATAREL.inputnum
  is '导入批次号 格式：需要阳光提供命名规则';
comment on column TBL_LMDATAREL.campcode
  is '专案编码';
comment on column TBL_LMDATAREL.status
  is '状态位
0为无效，1为有效';
comment on column TBL_LMDATAREL.operator
  is '操作人';
comment on column TBL_LMDATAREL.makedate
  is '入机日期';
comment on column TBL_LMDATAREL.maketime
  is '入机时间';
comment on column TBL_LMDATAREL.modifydate
  is '最后修改日期';
comment on column TBL_LMDATAREL.modifytime
  is '最后修改时间';
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
  is '人为的分类
DX-短险
DB-确定给付型
DC-确定缴费型';
comment on column TBL_LMRISKAPP.risktype
  is 'L--寿险(Life)、
A--意外险(Accident)、
H--健康险(Health)
';
comment on column TBL_LMRISKAPP.riskperiod
  is 'L--长险(Long)、M--一年期险(Middle)、S--极短期险(Short)';
comment on column TBL_LMRISKAPP.risktypedetail
  is '定期寿险、两全寿险、终身寿险、年金保险、意外险、住院医疗、手术医疗、普通医疗、疾病医疗、意外伤害医疗、综合医疗
';
comment on column TBL_LMRISKAPP.subriskflag
  is 'M--主险(Main) S--附险(Sub) A--两者都可以。';
comment on column TBL_LMRISKAPP.insuperiodflag
  is '1:有固定保险期限 0:保险期限为终身';
comment on column TBL_LMRISKAPP.insuredflag
  is 'M--多被保人(Multiple)、S--单一被保人(Single)';
comment on column TBL_LMRISKAPP.risktype3
  is '2-分红险';
comment on column TBL_LMRISKAPP.risktype7
  is '0-保额分红';
comment on column TBL_LMRISKAPP.state
  is '险种状态';
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
  is '01-主附
02-主主
03-产品组合
04-附附
06-捆绑';
comment on column TBL_LMRISKRELA.managecomgrp
  is '填写该险种关系允许在哪些区站出现';
comment on column TBL_LMRISKRELA.dksubprem
  is '0或null：无
1：代扣附加险保费
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
  is '入库批次号';
comment on column TBL_LRACTIVEMONTHS.activemonth
  is '活动月';
comment on column TBL_LRACTIVEMONTHS.inputnum
  is '导入批次号';
comment on column TBL_LRACTIVEMONTHS.infotype
  is '名单类型';
comment on column TBL_LRACTIVEMONTHS.gettype
  is '名单详述';
comment on column TBL_LRACTIVEMONTHS.b1
  is '备用字段1';
comment on column TBL_LRACTIVEMONTHS.b2
  is '备用字段2';
comment on column TBL_LRACTIVEMONTHS.b3
  is '备用字段3';
comment on column TBL_LRACTIVEMONTHS.b4
  is '备用字段4';
comment on column TBL_LRACTIVEMONTHS.b5
  is '备用字段5';
comment on column TBL_LRACTIVEMONTHS.makedate
  is '入库日期';
comment on column TBL_LRACTIVEMONTHS.maketime
  is '入库时间';
comment on column TBL_LRACTIVEMONTHS.modifydate
  is '最后修改日期';
comment on column TBL_LRACTIVEMONTHS.modifytime
  is '最后修改时间';
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
1 名字变更     数据总件数 ->数据总数量
2  批次剩余数量  追加';
-- Add comments to the columns 
comment on column TBL_LRCALLLIST.campcode
  is '专案编码';
comment on column TBL_LRCALLLIST.calllistno
  is '专案批次号';
comment on column TBL_LRCALLLIST.calllistname
  is '专案批次名称';
comment on column TBL_LRCALLLIST.usemonth
  is '数据使用月
计划使用数据的月份,字段结构为:YYYY年MM月,如201006';
comment on column TBL_LRCALLLIST.callarea
  is '所属区域';
comment on column TBL_LRCALLLIST.comcode
  is '所属电销中心';
comment on column TBL_LRCALLLIST.teamtype
  is '团队类型: 用拼音简写指代, 销售团队为XS, 清洗团队为QX';
comment on column TBL_LRCALLLIST.actcount
  is '数据总数量';
comment on column TBL_LRCALLLIST.remaincount
  is '批次剩余数量
初始和总数量一样';
comment on column TBL_LRCALLLIST.dataprovince
  is '数据归属省';
comment on column TBL_LRCALLLIST.datacity
  is '数据归属城市';
comment on column TBL_LRCALLLIST.infotype
  is '数据类型';
comment on column TBL_LRCALLLIST.gettype
  is '名单详述(和名单类型相对应着看)';
comment on column TBL_LRCALLLIST.validdays
  is '有效天数';
comment on column TBL_LRCALLLIST.acceptdays
  is '受理有效天数';
comment on column TBL_LRCALLLIST.datausefor
  is '数据用途';
comment on column TBL_LRCALLLIST.getdate
  is '批次生成日期';
comment on column TBL_LRCALLLIST.priority
  is '优先级';
comment on column TBL_LRCALLLIST.divuserid
  is '分配者';
comment on column TBL_LRCALLLIST.isgetnum
  is '是否计入取号 =  既存系统的是否取小堆？
0  是
1  否';
comment on column TBL_LRCALLLIST.divdate
  is '分配日期';
comment on column TBL_LRCALLLIST.divtime
  is '分配时间';
comment on column TBL_LRCALLLIST.state
  is '批次状态
01有效
02暂停
03关闭';
comment on column TBL_LRCALLLIST.plandate
  is '计划分配日期';
comment on column TBL_LRCALLLIST.plantime
  is '计划分配时间';
comment on column TBL_LRCALLLIST.operator
  is '操作人';
comment on column TBL_LRCALLLIST.makedate
  is '入机日期';
comment on column TBL_LRCALLLIST.maketime
  is '入机时间';
comment on column TBL_LRCALLLIST.modifydate
  is '最后修改日期';
comment on column TBL_LRCALLLIST.modifytime
  is '最后修改时间';
comment on column TBL_LRCALLLIST.calllisttype
  is '1-预览式
2-预测式';
comment on column TBL_LRCALLLIST.fdatatype
  is '1-是0-否';
comment on column TBL_LRCALLLIST.divstate
  is '01-未分配
02-允许下级再分配
03-已分配';
comment on column TBL_LRCALLLIST.empty
  is '是否清空';
comment on column TBL_LRCALLLIST.area
  is '部';
comment on column TBL_LRCALLLIST.depart
  is '区';
comment on column TBL_LRCALLLIST.isscreen
  is '是否屏蔽客户电话';
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
  is '入库批次号';
comment on column TBL_LRGUIDE.guidename
  is '入库批次名称';
comment on column TBL_LRGUIDE.infotype
  is '名单类型';
comment on column TBL_LRGUIDE.gettype
  is '名单详述';
comment on column TBL_LRGUIDE.rulemphone
  is '除重规则手机号';
comment on column TBL_LRGUIDE.rulecard
  is '除重规则证件类型';
comment on column TBL_LRGUIDE.rulecardno
  is '除重规则证件号';
comment on column TBL_LRGUIDE.rulecustname
  is '除重规则姓名';
comment on column TBL_LRGUIDE.rulebirth
  is '除重规则生日';
comment on column TBL_LRGUIDE.infohighdata
  is '数据类型高的数据';
comment on column TBL_LRGUIDE.infohightype
  is '数据类型高的类型';
comment on column TBL_LRGUIDE.infomiddata
  is '数据类型中的数据';
comment on column TBL_LRGUIDE.infomidtype
  is '数据类型中的类型';
comment on column TBL_LRGUIDE.infolowdata
  is '数据类型低的数据';
comment on column TBL_LRGUIDE.infolowtype
  is '数据类型低的类型';
comment on column TBL_LRGUIDE.content
  is '备注';
comment on column TBL_LRGUIDE.inputstyle
  is '是否实时';
comment on column TBL_LRGUIDE.inputcount
  is '入库数量';
comment on column TBL_LRGUIDE.status
  is '入库状态';
comment on column TBL_LRGUIDE.operator
  is '操作人';
comment on column TBL_LRGUIDE.makedate
  is '入库日期';
comment on column TBL_LRGUIDE.maketime
  is '入库时间';
comment on column TBL_LRGUIDE.modifydate
  is '最后修改日期';
comment on column TBL_LRGUIDE.modifytime
  is '最后修改时间';
comment on column TBL_LRGUIDE.path
  is '非实时导入位置';
comment on column TBL_LRGUIDE.cancutnum
  is '可切分数量';
comment on column TBL_LRGUIDE.managecom
  is '电销中心';
comment on column TBL_LRGUIDE.depart
  is '部';
comment on column TBL_LRGUIDE.datapurpose
  is '数据用途';
comment on column TBL_LRGUIDE.b1
  is '备用字段1';
comment on column TBL_LRGUIDE.b2
  is '备用字段2';
comment on column TBL_LRGUIDE.b3
  is '备用字段3';
comment on column TBL_LRGUIDE.b4
  is '备用字段4';
comment on column TBL_LRGUIDE.b5
  is '备用字段5';
comment on column TBL_LRGUIDE.area
  is '所在地区';
comment on column TBL_LRGUIDE.covertype1
  is '覆盖已回收数据';
comment on column TBL_LRGUIDE.covertype2
  is '覆盖未回收未取数据';
comment on column TBL_LRGUIDE.ischeckforcont
  is '是否覆盖已有保单的数据 1-是  0-否';
comment on column TBL_LRGUIDE.b6
  is '备用字段6';
comment on column TBL_LRGUIDE.b7
  is '备用字段7';
comment on column TBL_LRGUIDE.b8
  is '备用字段8';
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
  is '对应原来电销的【CUSTCONTROL】表
数据导入时登记、电话营销是记录最新的状态';
-- Add comments to the columns 
comment on column TBL_LRINPUTDETAIL.custno
  is '任务号';
comment on column TBL_LRINPUTDETAIL.calllistno
  is '专案批次号';
comment on column TBL_LRINPUTDETAIL.campcode
  is '专案编码';
comment on column TBL_LRINPUTDETAIL.inputnum
  is '导入批次号 格式：需要阳光提供命名规则';
comment on column TBL_LRINPUTDETAIL.termcode
  is '结束码';
comment on column TBL_LRINPUTDETAIL.possibility
  is '意愿程度';
comment on column TBL_LRINPUTDETAIL.qxflg
  is '清洗数据的质量
1  姓名有误
2  性别有误
3  生日有误
4  地址有误
5  职业有误';
comment on column TBL_LRINPUTDETAIL.rsvdate
  is '预约日期';
comment on column TBL_LRINPUTDETAIL.rsvtime
  is '预约时间';
comment on column TBL_LRINPUTDETAIL.rsvtel
  is '预约电话';
comment on column TBL_LRINPUTDETAIL.groupid
  is '组号';
comment on column TBL_LRINPUTDETAIL.userid
  is '销售员编码';
comment on column TBL_LRINPUTDETAIL.starttime
  is '启用时间';
comment on column TBL_LRINPUTDETAIL.endtime
  is '冻结时间';
comment on column TBL_LRINPUTDETAIL.remark
  is '备注';
comment on column TBL_LRINPUTDETAIL.operator
  is '操作人';
comment on column TBL_LRINPUTDETAIL.makedate
  is '入机日期';
comment on column TBL_LRINPUTDETAIL.maketime
  is '入机时间';
comment on column TBL_LRINPUTDETAIL.modifydate
  is '最后修改日期';
comment on column TBL_LRINPUTDETAIL.modifytime
  is '最后修改时间';
comment on column TBL_LRINPUTDETAIL.state
  is '0-可使用
1-回收
3-使用中';
comment on column TBL_LRINPUTDETAIL.callnums
  is '拨打次数';
comment on column TBL_LRINPUTDETAIL.getdate
  is '取号日期';
comment on column TBL_LRINPUTDETAIL.realendtime
  is '实际回收时间';
comment on column TBL_LRINPUTDETAIL.lastcalltime
  is '最后通话时间';
comment on column TBL_LRINPUTDETAIL.lastcalldate
  is '最后通话日期';
comment on column TBL_LRINPUTDETAIL.callmark
  is '0-未回拨
1-回拨';
comment on column TBL_LRINPUTDETAIL.pcstermcode
  is 'PCS呼入结束码
0,没有外呼结果
1,成功结束
2,目标忙
3,对方无应答
4,非法的外拨号码
5,对方状态未知
6,对方为传真设备
7,对方非传真设备
8,检测到语音应答
9,关机
10,不在服务区
11,拒接
12,IVR执行异常
13,外拨异常
14,锁定座席失败
15,转坐席失败
16,转座席路由失败
17,转座席路由时客户挂断
18,转座席排队时客户挂断
19,转座席振铃时客户挂断
20,转坐席排队后坐席振铃时客户挂断
21,转座席超时未返回结果
22,资源不足
23,黑名单拒呼
';
comment on column TBL_LRINPUTDETAIL.gettime
  is '用于用时间查找数据 用来保存取号时间点 数据格式为：23:59:59';
comment on column TBL_LRINPUTDETAIL.sourcecustno
  is '源客户号';
comment on column TBL_LRINPUTDETAIL.freesendflag
  is '1  已赠险';
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
  is '导入批次号 格式：需要阳光提供命名规则';
comment on column TBL_LRINPUTLOG.inputname
  is '导入批次名称';
comment on column TBL_LRINPUTLOG.usemonth
  is '数据使用月
计划使用数据的月份,字段结构为:YYYY年MM月,如201006';
comment on column TBL_LRINPUTLOG.teamtype
  is '团队类型: 用拼音简写指代, 销售团队为XS, 清洗团队为QX';
comment on column TBL_LRINPUTLOG.dataprovince
  is '数据归属省';
comment on column TBL_LRINPUTLOG.datacity
  is '数据归属城市';
comment on column TBL_LRINPUTLOG.infotype
  is '数据类型';
comment on column TBL_LRINPUTLOG.gettype
  is '名单详述(和名单类型相对应着看)';
comment on column TBL_LRINPUTLOG.datasource
  is '数据来源
1   集团库
2   合作数据
3   电销清洗数据
4   电销销售数据';
comment on column TBL_LRINPUTLOG.datascript
  is '数据来源描述';
comment on column TBL_LRINPUTLOG.datausefor
  is '数据用途';
comment on column TBL_LRINPUTLOG.termcode
  is '清洗数据结束码';
comment on column TBL_LRINPUTLOG.sendflg
  is '配送标识
记为“PSN（配送内）”、“PSW（配送外）”';
comment on column TBL_LRINPUTLOG.inputstyle
  is '导入方式:
0  实时导入
1  后台定时导入';
comment on column TBL_LRINPUTLOG.inputcount
  is '导入件数';
comment on column TBL_LRINPUTLOG.inputdate
  is '导入日期';
comment on column TBL_LRINPUTLOG.inputtime
  is '导入时间';
comment on column TBL_LRINPUTLOG.userid
  is '导入人ID';
comment on column TBL_LRINPUTLOG.content
  is '导入备注';
comment on column TBL_LRINPUTLOG.targetdatabase
  is '过滤目标库';
comment on column TBL_LRINPUTLOG.fcondition
  is '过滤标准：
姓名去重
电话号码去重
证件号去重
无过滤';
comment on column TBL_LRINPUTLOG.checkstyle
  is '加载方式:
0  实时加载
1  后台定时加载';
comment on column TBL_LRINPUTLOG.fcount
  is '重复件数';
comment on column TBL_LRINPUTLOG.loadcount
  is '加载件数';
comment on column TBL_LRINPUTLOG.fuserid
  is '加载者';
comment on column TBL_LRINPUTLOG.fdate
  is '加载日期';
comment on column TBL_LRINPUTLOG.ftime
  is '加载时间';
comment on column TBL_LRINPUTLOG.fcontent
  is '加载备注';
comment on column TBL_LRINPUTLOG.ocount
  is '导出件数';
comment on column TBL_LRINPUTLOG.odate
  is '导出日期';
comment on column TBL_LRINPUTLOG.otime
  is '导出时间';
comment on column TBL_LRINPUTLOG.ouserid
  is '导出者';
comment on column TBL_LRINPUTLOG.status
  is '导入批次状态：
01  未导入
02  导入中
03  已导入
04  过滤中
05  已过滤
06  加载中
07  已加载
08  文件上传失败
99  处理失败
';
comment on column TBL_LRINPUTLOG.operator
  is '操作人';
comment on column TBL_LRINPUTLOG.makedate
  is '入机日期';
comment on column TBL_LRINPUTLOG.maketime
  is '入机时间';
comment on column TBL_LRINPUTLOG.modifydate
  is '最后修改日期';
comment on column TBL_LRINPUTLOG.modifytime
  is '最后修改时间';
comment on column TBL_LRINPUTLOG.comcode
  is '所属部';
comment on column TBL_LRINPUTLOG.cusnum
  is '申请客户数量';
comment on column TBL_LRINPUTLOG.guidenum
  is '入库批次号';
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
  is '手机号码';
comment on column TBL_LRNAMELIST.customno
  is '客户编号';
comment on column TBL_LRNAMELIST.customname
  is '客户姓名';
comment on column TBL_LRNAMELIST.status
  is '状态
0为正常，1为勿扰名单';
comment on column TBL_LRNAMELIST.sex
  is '性别';
comment on column TBL_LRNAMELIST.cardtype
  is '0——身份证
1——户口簿
2——护照
3——军官证
4——台胞证
5——驾驶证
6——回乡证
7——其它证件
8——其它
A——出生证
';
comment on column TBL_LRNAMELIST.cardnum
  is '证件号码';
comment on column TBL_LRNAMELIST.birthdate
  is '出生日期';
comment on column TBL_LRNAMELIST.age
  is '年龄';
comment on column TBL_LRNAMELIST.operator
  is '操作员代码';
comment on column TBL_LRNAMELIST.makedate
  is '入机日期';
comment on column TBL_LRNAMELIST.maketime
  is '入机时间';
comment on column TBL_LRNAMELIST.modifydate
  is '最后一次修改日期';
comment on column TBL_LRNAMELIST.modifytime
  is '最后一次修改时间';
comment on column TBL_LRNAMELIST.comcode
  is '电销中心';
comment on column TBL_LRNAMELIST.b1
  is '备用字段1';
comment on column TBL_LRNAMELIST.b2
  is '备用字段2';
comment on column TBL_LRNAMELIST.b3
  is '备用字段3';
comment on column TBL_LRNAMELIST.b4
  is '备用字段4';
comment on column TBL_LRNAMELIST.stopoperateflag
  is '1-禁播
2-取消禁播';
comment on column TBL_LRNAMELIST.stopoperatedate
  is '禁播操作日期';
comment on column TBL_LRNAMELIST.stopmonths
  is '数字代表月数';
comment on column TBL_LRNAMELIST.stopdatasource
  is '0-公共平台
1-总公司
2-分公司';
comment on column TBL_LRNAMELIST.stopdatatype
  is '0-企业禁播
1-公众禁播';
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
  is '专案批次号';
comment on column TBL_LRTASK.taskno
  is '分配任务号
该批次分配的次数，范围1~9999，每次加1
分配时每个组织或者每个人均产生一个任务号
';
comment on column TBL_LRTASK.campcode
  is '专案编码';
comment on column TBL_LRTASK.divuserid
  is '分配者';
comment on column TBL_LRTASK.divorg
  is '分配到组织，记录组织的编码
电销中心
部门UM
小组TL';
comment on column TBL_LRTASK.divsaleid
  is '分配到组织，记录坐席的ID';
comment on column TBL_LRTASK.divcount
  is '可取件数，默认为批次的全部件数。
设置允许组织或者个人获取的号码量';
comment on column TBL_LRTASK.divstyle
  is '分配方式
1、手动
2、自动
目前只有手动';
comment on column TBL_LRTASK.disrulenum
  is '分配规则
    1：随机平均分配；
    2：按个人任务池上限件分配；
    3：根据TSR级别按比例分配；';
comment on column TBL_LRTASK.dispara1
  is '分配规则参数1';
comment on column TBL_LRTASK.dispara2
  is '分配规则参数2';
comment on column TBL_LRTASK.dispara3
  is '分配规则参数3';
comment on column TBL_LRTASK.dispara4
  is '分配规则参数4';
comment on column TBL_LRTASK.status
  is '状态位
0为无效，1为有效';
comment on column TBL_LRTASK.operator
  is '操作人';
comment on column TBL_LRTASK.makedate
  is '入机日期';
comment on column TBL_LRTASK.maketime
  is '入机时间';
comment on column TBL_LRTASK.modifydate
  is '最后修改日期';
comment on column TBL_LRTASK.modifytime
  is '最后修改时间';
comment on column TBL_LRTASK.tsailegrade
  is '职级';
comment on column TBL_LRTASK.employstartdate
  is '入司起期';
comment on column TBL_LRTASK.employenddate
  is '入司止期';
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
  is '和电话营销画面的项目保持一致';
-- Add comments to the columns 
comment on column TBL_LRTASKINFO.calllistno
  is '专案批次号';
comment on column TBL_LRTASKINFO.custno
  is '任务号';
comment on column TBL_LRTASKINFO.inputnum
  is '导入批次号 格式：需要阳光提供命名规则';
comment on column TBL_LRTASKINFO.datasource
  is '数据来源';
comment on column TBL_LRTASKINFO.custsex
  is '1:男
2:女
3:其他';
comment on column TBL_LRTASKINFO.marriage
  is '1:未婚
2:已婚
9:其他';
comment on column TBL_LRTASKINFO.card
  is '01:身份证
02:护照
03:军官证
04:学生证
99:其他';
comment on column TBL_LRTASKINFO.oprovince
  is '公司所在省';
comment on column TBL_LRTASKINFO.cprovince
  is '联系省';
comment on column TBL_LRTASKINFO.hprovince
  is '家庭所在省';
comment on column TBL_LRTASKINFO.duty
  is '职务';
comment on column TBL_LRTASKINFO.status
  is '0:可使用
1:回收
2:冻结中
3:使用中
4:黑名单
5:白名单
9:无效';
comment on column TBL_LRTASKINFO.endcode
  is '结束码';
comment on column TBL_LRTASKINFO.operator
  is '操作员';
comment on column TBL_LRTASKINFO.makedate
  is '入机日期';
comment on column TBL_LRTASKINFO.maketime
  is '入机时间';
comment on column TBL_LRTASKINFO.modifydate
  is '最后修改日期';
comment on column TBL_LRTASKINFO.modifytime
  is '最后修改时间';
comment on column TBL_LRTASKINFO.datecode
  is '证件有效期标识
1-有效期
2-终身';
comment on column TBL_LRTASKINFO.cervaliddate
  is '证件有效期
至YYYY-MM-DD
证件有效期，如果是身份证必填，在保单录入的时候，或者拨打界面客户信息录入的时候，
如果其他的可以不填，或者永久9999-12-31';
comment on column TBL_LRTASKINFO.nativeplace
  is '国籍，在客户信息，投被保人的时候界面填入';
comment on column TBL_LRTASKINFO.otherphone
  is '其他联系方式';
comment on column TBL_LRTASKINFO.sourcecustno
  is '源客户号';
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
专案号长度变更  30  -->  50
7/19
追加以下字段：
通话唯一标识(CTI)
企业编号(CTI)
坐席工号(CTI)
坐席密码(CTI)
录音存放方式
投保录音标识
7/27
主键变更
联络序号   类型NUMBER-》VARCHAR2
7/27
主键变更
联络序号   类型回滚
增加 联络流水号
7/29
重构';
-- Add comments to the columns 
comment on column TBL_LRTELLOG.callid
  is '联络流水号
STS+电话记录流水号';
comment on column TBL_LRTELLOG.calllistno
  is '专案批次号';
comment on column TBL_LRTELLOG.custno
  is '任务号';
comment on column TBL_LRTELLOG.tellogno
  is '联络序号';
comment on column TBL_LRTELLOG.endcode
  is '结束码
联络方式  为电话联络时必须输入';
comment on column TBL_LRTELLOG.campcode
  is '专案编码';
comment on column TBL_LRTELLOG.calltarget
  is '联络号码
用于记录
联络号码
短信号码
邮件地址';
comment on column TBL_LRTELLOG.userid
  is '坐席工号';
comment on column TBL_LRTELLOG.extno
  is '坐席分机号';
comment on column TBL_LRTELLOG.calldate
  is '联络日期';
comment on column TBL_LRTELLOG.startcalltime
  is '联络开始时间';
comment on column TBL_LRTELLOG.endcalltime
  is '联络结束时间';
comment on column TBL_LRTELLOG.timelong
  is '通话时长  单位：秒（s）';
comment on column TBL_LRTELLOG.calltype
  is '呼出类型';
comment on column TBL_LRTELLOG.groupid
  is '组编号';
comment on column TBL_LRTELLOG.recurl
  is '录音地址';
comment on column TBL_LRTELLOG.rsvtel
  is '预约电话';
comment on column TBL_LRTELLOG.rsvdate
  is '预约日期';
comment on column TBL_LRTELLOG.rsvtime
  is '预约时间';
comment on column TBL_LRTELLOG.status
  is '数据新旧状态';
comment on column TBL_LRTELLOG.possibility
  is '意愿程度';
comment on column TBL_LRTELLOG.remark
  is '备注';
comment on column TBL_LRTELLOG.operator
  is '操作人';
comment on column TBL_LRTELLOG.makedate
  is '入机日期';
comment on column TBL_LRTELLOG.maketime
  is '入机时间';
comment on column TBL_LRTELLOG.modifydate
  is '最后修改日期';
comment on column TBL_LRTELLOG.modifytime
  is '最后修改时间';
comment on column TBL_LRTELLOG.sessionid
  is '录音调听用';
comment on column TBL_LRTELLOG.enterpriseid
  is '录音调听用';
comment on column TBL_LRTELLOG.username
  is '录音调听用';
comment on column TBL_LRTELLOG.pwd
  is '录音调听用';
comment on column TBL_LRTELLOG.recordflg
  is '录音存放方式
1、远程（青牛）
2、本地';
comment on column TBL_LRTELLOG.applyflg
  is '投保录音标识
0  非投保录音
1  投保录音';
comment on column TBL_LRTELLOG.sourcecustno
  is '源客户号';
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
新规';
-- Add comments to the columns 
comment on column TBL_NATIONALITY.nationcode
  is '代号';
comment on column TBL_NATIONALITY.nationname
  is '名称';
comment on column TBL_NATIONALITY.orderid
  is '序号';
comment on column TBL_NATIONALITY.enshortname
  is '英文简称';
comment on column TBL_NATIONALITY.enfullname
  is '英文全称';
comment on column TBL_NATIONALITY.chfullname
  is '中文全称';
comment on column TBL_NATIONALITY.risklevel
  is '安全级别';
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
新规';
-- Add comments to the columns 
comment on column TBL_OCCUPATION.bigcodename
  is '大分类名称';
comment on column TBL_OCCUPATION.bigcodeval
  is '大分类代码';
comment on column TBL_OCCUPATION.midcodename
  is '中分类名称';
comment on column TBL_OCCUPATION.midcodeval
  is '中分类代码';
comment on column TBL_OCCUPATION.codetype
  is '代码类别';
comment on column TBL_OCCUPATION.codename
  is '代码名称';
comment on column TBL_OCCUPATION.codeval
  is '代码值';
comment on column TBL_OCCUPATION.codedesc
  is '代码说明';
comment on column TBL_OCCUPATION.worktype
  is '职业类别';
comment on column TBL_OCCUPATION.isdefault
  is '是否默认';
comment on column TBL_OCCUPATION.addname
  is '插入人';
comment on column TBL_OCCUPATION.addtime
  is '插入时间';
comment on column TBL_OCCUPATION.editname
  is '编辑人';
comment on column TBL_OCCUPATION.edittime
  is '编辑时间';
comment on column TBL_OCCUPATION.enabled
  is '可用否';
comment on column TBL_OCCUPATION.userlevel
  is '使用级别';
comment on column TBL_OCCUPATION.orderid
  is '排序号';
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
新规';
-- Add comments to the columns 
comment on column TBL_PERSONALNUM.calllistno
  is '专案批次号';
comment on column TBL_PERSONALNUM.userid
  is '坐席工号';
comment on column TBL_PERSONALNUM.divcount
  is '可取件数，默认为批次的全部件数。
设置允许组织或者个人获取的号码量';
comment on column TBL_PERSONALNUM.getcount
  is '已取件数  组织或者个人以获取到得数量
初始值为0，组织或者个人每取一次，数值加1';
comment on column TBL_PERSONALNUM.makedate
  is '入机日期';
comment on column TBL_PERSONALNUM.maketime
  is '入机时间';
comment on column TBL_PERSONALNUM.modifydate
  is '最后修改日期';
comment on column TBL_PERSONALNUM.modifytime
  is '最后修改时间';
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
  is '计划编码';
comment on column TBL_LDPLANRISKINFO.RISKCODE
  is '险种编码';
comment on column TBL_LDPLANRISKINFO.MAINRISKCODE
  is '主险编码';
comment on column TBL_LDPLANRISKINFO.RISKNAME
  is '险种名称';
comment on column TBL_LDPLANRISKINFO.RISKLIST
  is '险种序列';
comment on column TBL_LDPLANRISKINFO.DUTYCODE
  is '责任编码';
comment on column TBL_LDPLANRISKINFO.DUTYNAME
  is '责任名称';
comment on column TBL_LDPLANRISKINFO.AMNT
  is '保额';
comment on column TBL_LDPLANRISKINFO.PREM
  is '保费';
comment on column TBL_LDPLANRISKINFO.MULT
  is '份数';
comment on column TBL_LDPLANRISKINFO.PAYINTV
  is '缴费频率';
comment on column TBL_LDPLANRISKINFO.PAYYEAR
  is '缴费年期';
comment on column TBL_LDPLANRISKINFO.INSUYEAR
  is '保险年期';
comment on column TBL_LDPLANRISKINFO.PAYMENT
  is '赔付比例';
comment on column TBL_LDPLANRISKINFO.DEDUCTIBLE
  is '免赔额';
comment on column TBL_LDPLANRISKINFO.B1
  is '备注';
comment on column TBL_LDPLANRISKINFO.MAINRISKFLAG
  is '主险标志';
comment on column TBL_LDPLANRISKINFO.INSUYEARFLAG
  is '保险期间标识';
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
  is '回收批次号';
comment on column TBL_LRRECOVERINPUT.CALLLISTNO
  is '专案批次号';
comment on column TBL_LRRECOVERINPUT.BESTATE
  is '回收前状态 01-已下发未加载   02-已加载未取号  03-已取号';
comment on column TBL_LRRECOVERINPUT.INPUTNUM
  is '导入批次号';
comment on column TBL_LRRECOVERINPUT.COUNT
  is '回收数量';
comment on column TBL_LRRECOVERINPUT.STATE
  is '批次回收状态 0-未回收  1-已回收';
comment on column TBL_LRRECOVERINPUT.MAKEDATE
  is '入机日期';
comment on column TBL_LRRECOVERINPUT.MAKETIME
  is '入机时间';
comment on column TBL_LRRECOVERINPUT.MODIFYDATE
  is '最后修改日期';
comment on column TBL_LRRECOVERINPUT.MODIFYTIME
  is '最后修改时间';
comment on column TBL_LRRECOVERINPUT.B1
  is '备注1';
comment on column TBL_LRRECOVERINPUT.B2
  is '备注2';
comment on column TBL_LRRECOVERINPUT.B3
  is '备注3';

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
  is '批次号10位流水号';
comment on column TBL_LMDATADIVERTLOG.calllistno
  is '专案批次号';
comment on column TBL_LMDATADIVERTLOG.custno
  is '专案类型（01-通用型、02-项目型、03-外包型）';
comment on column TBL_LMDATADIVERTLOG.targetuserid
  is '专案话术';
comment on column TBL_LMDATADIVERTLOG.sourceuserid
  is '专案描述';
comment on column TBL_LMDATADIVERTLOG.operator
  is '操作人';
comment on column TBL_LMDATADIVERTLOG.makedate
  is '入机日期';
comment on column TBL_LMDATADIVERTLOG.maketime
  is '入机时间';
comment on column TBL_LMDATADIVERTLOG.modifydate
  is '最后修改日期';
comment on column TBL_LMDATADIVERTLOG.modifytime
  is '最后修改时间';
comment on column TBL_LMDATADIVERTLOG.serial_id
  is '改派流水号';
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
