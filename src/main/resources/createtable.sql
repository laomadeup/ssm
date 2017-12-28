/*
用户表：user
*/
DROP TABLE if EXISTS lmxz_USER;
CREATE TABLE lmxz_USER(
	id SMALLINT(15) PRIMARY KEY auto_increment,
	username varchar(20) comment '用户名',
	password varchar(20) comment '密码',
	gender SMALLINT(5) comment '性别：-1：保密，0：女，1：男',
	status SMALLINT(5) comment '状态：-1：删除，0：冻结，1：正常',
	mobile VARCHAR(20) comment '手机号码',
	email varchar(20) comment '邮箱',
	score BIGINT comment '积分',
	experience BIGINT comment '经验',
	level INT comment '等级',
	createTime DATETIME comment '创建时间',
	updateTime DATETIME comment '最后修改时间',
	headimg varchar(300) comment '头像',
	description text comment '自我介绍',
	totalday SMALLINT comment '总签到天数',
	continueday SMALLINT comment '连续签到天数',
	signday DATETIME comment '最后签到日期',
	birthday DATETIME comment '生日',
	roleId SMALLINT(15) comment '角色ID，外键'
);

/*
主题帖
*/
DROP TABLE if EXISTS lmxz_topical;
CREATE TABLE lmxz_topical (

	id SMALLINT(15) PRIMARY KEY auto_increment,
	topicalname VARCHAR(200) COMMENT '主题名称',
	topicalcontent text COMMENT '主题内容',
	status SMALLINT(5) COMMENT '状态：-1：删除，0：隐藏，1：显示',
	createTime datetime COMMENT '创建时间',
	updateTime datetime COMMENT '最后修改时间',
	agreenum SMALLINT COMMENT '点赞数',
	disagreenum SMALLINT COMMENT '踩数',
	type SMALLINT(5) COMMENT '类型：0：普通帖子，1：精华帖子',
	userId SMALLINT(15) COMMENT '帖子所属作者，外键',
	zoneId SMALLINT(15) COMMENT '分区主题,外键'
);

/*
评论
*/
DROP TABLE if EXISTS lmxz_comments;
CREATE TABLE lmxz_comments(
	id SMALLINT(15) PRIMARY KEY auto_increment,
	content VARCHAR(3000) COMMENT '评论内容',
	status SMALLINT(5) COMMENT '状态：-1:删除；0：隐藏；1：显示（默认）',
	agreenum SMALLINT COMMENT '点赞数',
	disagreenum SMALLINT COMMENT '踩数',
	type SMALLINT(5) COMMENT '类型：0：楼层中的评论，1：帖子的楼层',
	createTime DATETIME COMMENT '评论日期',
	userId SMALLINT(15) COMMENT '评论用户id,外键',
	topicalId SMALLINT(15) COMMENT '主题帖Id，外键'

);

/*
内容分区
*/
DROP TABLE if EXISTS lmxz_zone;
CREATE TABLE lmxz_zone(
	id SMALLINT(15) PRIMARY KEY auto_increment,
	title VARCHAR(50) COMMENT '分区主题',
	summary VARCHAR(5000) COMMENT '分区介绍',
	url VARCHAR(500) COMMENT '链接',#这个需不需要？
	status SMALLINT(5) COMMENT '状态：-1：删除；0：隐藏；1：删除',
	level SMALLINT(5) COMMENT '级别',
	total SMALLINT COMMENT '该主题拥有帖子的总条数',
	createTime DATETIME COMMENT '创建时间',
	updateTime DATETIME COMMENT '最后修改时间',
	userId SMALLINT(5) COMMENT '创建分区的用户id，外键'
);

/*
用户关注
*/
DROP TABLE if EXISTS lmxz_follow;
CREATE TABLE lmxz_follow(
	id SMALLINT(15) PRIMARY KEY auto_increment,
	userId SMALLINT(15) COMMENT '关注者',
	followId SMALLINT(15) COMMENT '被关注用户或者贴子',
	type SMALLINT(5) COMMENT '类型：0：关注的帖子，1：关注的是人',
	status SMALLINT(5) COMMENT '状态：0：无法关注，1：可以关注（默认）;后台管理员设置',
	createTime DATETIME COMMENT '创建时间'
);

/*
好友表
*/
DROP TABLE if EXISTS lmxz_association;
CREATE TABLE lmxz_association(
	id SMALLINT(15) PRIMARY KEY auto_increment,
	userId SMALLINT(15) COMMENT '用户Id',
	friendId SMALLINT(15) COMMENT '用户id',
	type SMALLINT(5) COMMENT '朋友类型：0：好友，1：朋友；2：同事；3：亲戚；4：陌生人',
	status SMALLINT(5) COMMENT '状态：0：对方未同意；（默认）1：已成为好友;',
	createTime DATETIME COMMENT '创建时间'
);

/*
好友申请表
*/
DROP TABLE if EXISTS lmxz_application;
CREATE TABLE lmxz_application(
	id SMALLINT(15) PRIMARY KEY auto_increment,
	userId SMALLINT(15) COMMENT '用户Id,外键',
	friendId SMALLINT(15) COMMENT '用户id，外键',
	content VARCHAR(200) COMMENT '申请添加好友的话',
	createTime DATETIME COMMENT '创建日期'
);


/*
点赞表
*/
DROP TABLE if EXISTS lmxz_agree;
CREATE TABLE lmxz_agree(

	id SMALLINT(15) PRIMARY KEY auto_increment,
	agreeId SMALLINT(15) COMMENT '被点赞的帖子或者评论，外键',
	userId SMALLINT(15) COMMENT '用户id，外键',
	type SMALLINT(5) COMMENT '类型：0：帖子；1：评论',
	isagree SMALLINT(5) COMMENT '是否赞同：0：踩，1：点赞',
	createTime DATETIME COMMENT '创建时间'
);

/*
公告表（通知）
*/
DROP TABLE if EXISTS lmxz_announcement;
CREATE TABLE lmxz_announcement(
	id SMALLINT(15) PRIMARY KEY auto_increment,
	title VARCHAR(100) COMMENT '公告标题',
	content text COMMENT '公告内容',
	status SMALLINT(5) COMMENT '状态：-1：删除，0：隐藏；1：显示',
	createTime DATETIME COMMENT '创建日期',
	updateTime DATETIME COMMENT '最后修改日期',
	zoneId SMALLINT(15) COMMENT '分区id，外键（当为null时，面向全站的公告）',
	userId SMALLINT(15) COMMENT '用户id，外键,创建人',
	adminId SMALLINT(15) COMMENT '用户id,外键，最后修改人',
	attId SMALLINT(5) COMMENT '附件id，外键'
);

/*
附件表
*/
DROP TABLE if EXISTS lmxz_attachment;
CREATE TABLE lmxz_attachment(
	id SMALLINT(15) PRIMARY KEY auto_increment,
	filename VARCHAR(50) COMMENT '文件名',
	fileurl VARCHAR(200) COMMENT '文件路径:自己重命名文件名',
	type SMALLINT(5) COMMENT '类型：0：帖子的，1：公告的,2:帖子楼层,3:站内信',
	belongId SMALLINT(15) COMMENT '属于哪条记录的附件',
	userId SMALLINT(15) COMMENT '上传附加文件的用户,外键',
	status SMALLINT(5) COMMENT '状态：0：隐藏：1：显示',
	createTime 	DATETIME COMMENT '创建日期'
);


/*
站内信表
*/
DROP TABLE if EXISTS lmxz_message;
CREATE TABLE lmxz_message (
  id SMALLINT(15) PRIMARY KEY auto_increment,
  sendId SMALLINT(15) COMMENT '发信人',
  reciveId SMALLINT(15) COMMENT '收件人',
  title VARCHAR(100) COMMENT '标题',
  content text COMMENT '内容',
  sendTime DATETIME COMMENT '发送时间',
  updateTime DATETIME COMMENT '修改时间',
  status SMALLINT(5) COMMENT '状态：-1: 删除，0：未读，1：已读',
  isDraft SMALLINT(5) COMMENT '是否草稿',
  type SMALLINT(5) COMMENT '类型：0：私信，1：更新通知'
);

/*
任务
*/
DROP TABLE if EXISTS lmxz_mission;
CREATE TABLE lmxz_mission (
  id SMALLINT(15) PRIMARY KEY auto_increment,
	title VARCHAR(100) COMMENT '标题',
  content text COMMENT '内容',
  createTime DATETIME COMMENT '创建时间',
  startTime DATETIME COMMENT '开始时间',
  endTime DATETIME COMMENT '结束时间',
  achieveType SMALLINT(5) COMMENT '达成类型',
	iscomplete SMALLINT(5) COMMENT '任务是否完成'
);

/*
角色表
*/
DROP TABLE if EXISTS lmxz_role;
CREATE TABLE lmxz_role(
	id SMALLINT(15) PRIMARY KEY auto_increment,
	rolename VARCHAR(38) COMMENT '角色名称',
	rightJson longtext COMMENT '权限json,格式为{"表名":""操作代号","模块代号":""操作代号,操作代号"},如,{"message":["S","U","Q","D"],"mission":["S"]}:其中S,D,U,Q：增删改查'
);














