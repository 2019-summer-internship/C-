drop database if exists thesing;
create database thesing;
use thesing;

create table users (
	id int primary key comment '�û��˺�',
	flag bool not null default 1 comment '�û�״̬��1-���0-ע��',
	name varchar(30) not null comment '�û�����',
    gengder int comment '�û�����',
    pwd varchar(20) not null comment '�û�����',
    avatar varchar(255) comment '�û�ͷ��·��',
    type int not null comment '�û����ͣ�1-ѧ����2-��ʦ��3-ѧԺ��4-У��',
    info int not null comment '�û���ɫid -> ѧ����/��ʦ��/ѧԺ��/У����',
    phone varchar(11) comment '�û���ϵ��ʽ',
    email varchar(50) comment '�û�����'
)comment='�û���';

create table student (
	_id int primary key comment 'ѧ��id',
    achievement varchar(30) comment '�ɼ�id�б� -> �ɼ���',
    class int not null comment '�༶id -> �༶��',
    major int not null comment 'רҵid -> רҵ��',
    school int not null comment 'ѧԺid -> ѧԺ��',
    project int comment '��Ŀid -> ��Ŀ��',
    teacher int comment '��ʦid -> ��ʦ��'
)comment='ѧ����';

create table teacher (
	_id int primary key comment '��ʦid',
    school int not null comment 'ѧԺid -> ѧԺ��',
    title varchar(100) comment 'ͷ���б�',
    introduction text comment '���',
    students varchar(100) comment '����ѧ��id�б� -> ѧ����',
    projects varchar(100) comment '������Ŀid�б� -> ��Ŀ��'
)comment='��ʦ��';

create table school (
	_id int primary key auto_increment comment 'ѧԺid',
    name varchar(50) not null comment 'ѧԺ����',
    university int not null comment '����ѧԺid -> ѧУ��',
    schedules varchar(50) comment 'ѧԺ�ճ̰���'
)comment='ѧԺ��';

create table university (
	_id int primary key auto_increment comment 'ѧУid',
    name varchar(50) not null comment 'ѧУ����',
    schools varchar(300) not null comment '����ѧԺid�б� -> ѧԺ��'
)comment='ѧУ��';

create table class (
	_id int primary key auto_increment comment '�༶id',
    school int not null comment '����ѧԺid -> ѧԺ��',
    name varchar(50) not null comment '�༶����'
)comment='�༶��';

create table major (
	_id int primary key auto_increment comment 'רҵid',
    school int not null comment '����ѧԺid -> ѧԺ��',
    name varchar(50) not null comment 'רҵ����'
)comment='רҵ��';

create table project (
	_id int primary key auto_increment comment '��Ŀid',
    name varchar(50) not null comment '��Ŀ����',
    publish_time date not null comment '����ʱ��',
    teacher int not null comment '�����ʦ',
    student int comment 'ѡ��ѧ��',
    manager int not null comment '���ѧԺ',
    statu tinyint not null default 1 comment '��Ŀ״̬��1-����ˣ�2-�ѷ�����3-�ѱ�ѡ',
    type varchar(50) not null comment '��Ŀ����',
    form tinyint not null comment '��Ŀ��Դ��1-��ʦ���⣬2-ѧ����������',
    amount tinyint not null comment '��������1~5�ȼ�',
    difficult tinyint not null comment '�Ѷȣ�1~5�ȼ�',
    abstract text not null comment 'ժҪ',
    background text not null comment '��Ŀ����',
    requirement text not null comment '��ĿҪ��',
    enclosure varchar(500) comment '����',
    tasks varchar(100) comment '����id�б� -> ���ȱ�'
)comment='��Ŀ��';

create table message (
	_id int primary key auto_increment comment '��Ϣid',
    sender int not null comment '������id -> �û���',
    receiver int not null comment '������id -> �û���',
    statu tinyint not null default 1 comment '״̬��1-δ����2-�Ѷ�',
    send_time date not null comment '����ʱ��',
    type tinyint not null comment '��Ϣ���ͣ�1-���֣�2-ͼƬ��3-�ļ�',
    content text comment '����',
    image varchar(100) comment 'ͼƬ·��',
    file varchar(100) comment '�ļ�·��',
    label varchar(50) comment '�ļ���ǩ'
)comment='��Ϣ��';

create table task (
    _id int primary key auto_increment comment '����id',
    name varchar(50) comment '��������',
    project int not null comment '������Ŀ',
    label varchar(50) comment '��ǩ',
    publish_time date not null comment '����ʱ��',
    statu tinyint not null default 1 comment '״̬��1-δ��ʼ��2-���ڽ��У�3-�����'
)comment='���ȱ�';

create table mail (
	_id int primary key auto_increment comment '֪ͨid',
    flag_sender bool not null default 1 comment '�������Ƿ�ɾ�����',
    flag_receiver bool not null default 1 comment '�������Ƿ�ɾ�����',
    sender int not null comment '������id -> �û���',
    receiver int not null comment '������id -> �û���',
    send_time date not null comment '����ʱ��',
    title varchar(100) not null comment '����',
    content text not null comment '����',
    statu tinyint not null default 1 comment '״̬��1-δ����2-�Ѷ�'
)comment='֪ͨ��';

create table examine (
	_id int primary key auto_increment comment '����id',
    student int not null comment '����ѧ��id -> ѧ����',
    teacher int not null comment '���ĵ�ʦid -> ��ʦ��',
    score int not null comment '�ɼ�',
    statu tinyint not null default 1 comment '״̬��1-��δ��ʼ��2-���ڽ��У�3-�Ѿ����',
    files varchar(100) comment '�ļ�id�б� -> �����ļ���'
)comment='���ı�';

create table examine_file (
	_id int primary key auto_increment comment '�����ļ�id',
    examine int not null comment '��������id -> ���ı�',
    file varchar(50) not null comment '�����ļ�·��',
    score int comment '�÷�',
    feedback text comment '����',
    statu tinyint not null default 1 comment '״̬��1-δ��ʼ��2-�����'
)comment='�����ļ���';

create table reconsider (
	_id int primary key auto_increment comment '����id',
    applicant int not null comment '�����id -> �û���',
    manager int not null comment '���ѧԺid -> ѧԺ��',
    student int not null comment '����ɼ�����ѧ��',
    reason text not null comment '����ԭ��',
    statu tinyint not null default 1 comment '״̬��1-δ����2-�Ѳ��أ�3-�ѽ���'
)comment='�����';

create table achievement (
	_id int primary key auto_increment comment '�ɼ�id',
    student int not null comment '����ѧ��id -> ѧ����',
    score int comment '�ɼ�',
    stage tinyint not null comment '�׶�',
    consititution varchar(100) comment '�ɼ����id�б� -> �ɼ���ɱ�'
)comment='�ɼ���';

create table consititution (
	_id int primary key auto_increment comment '�ɼ����id',
    achievement int not null comment '�����ɼ�id -> �ɼ���',
    name varchar(50) comment '���������',
    rate float not null comment '��ɱ���',
    score int comment '�÷�',
    teacher int comment '���ֵ�ʦid -> ��ʦ��',
    grede_time date comment '����ʱ��'
)comment='�ɼ���ɱ�';

create table shedule (
	_id int primary key auto_increment comment '�ճ�id',
    flag bool not null default 0 comment '�Ƿ�ɾ����0-δɾ����1-��ɾ��',
    school int not null comment '����ѧԺid -> ѧԺ��',
    stage tinyint not null comment '�׶Σ�1-���⣬2-ѡ�⣬3-���⣬4-���ڣ�5-����',
    satrt_time date not null comment '��ʼʱ��',
    end_time date not null comment '����ʱ��',
    content text comment '�ճ�˵��'
)comment='�ճ̱�';