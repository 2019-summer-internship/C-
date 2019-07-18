drop database if exists thesing;
create database thesing;
use thesing;

create table users (
	id int primary key,
	flag bool,
	name varchar(30),
    gengder int,
    pwd varchar(20),
    avatar varchar(255),
    type int,
    phone varchar(11),
    email varchar(50)
);

create table student (
	_id int primary key,
    achievement varchar(30),
    class int,
    major int,
    school int,
    project int,
    teacher int
);

create table teacher (
	_id int primary key,
    school int,
    title varchar(100),
    introduction text,
    students varchar(100),
    projects varchar(100)
);

create table school (
	_id int primary key auto_increment,
    name varchar(50),
    schedules varchar(50)
);

create table university (
	_id int primary key auto_increment,
    name varchar(50),
    schools varchar(300)
);

create table class (
	_id int primary key auto_increment,
    school int,
    name varchar(50)
);

create table major (
	_id int primary key auto_increment,
    school int,
    name varchar(50)
);

create table project (
	_id int primary key auto_increment,
    name varchar(50),
    publish_time date,
    teacher int,
    student int,
    manager int,
    statu tinyint,
    type varchar(50),
    form tinyint,
    amount tinyint,
    difficult tinyint,
    abstract text,
    background text,
    requirement text,
    enclosure varchar(500)
);

create table message (
	_id int primary key auto_increment,
    sender int,
    receiver int,
    statu tinyint,
    send_time date,
    type tinyint,
    content text,
    image varchar(100),
    file varchar(100),
    label varchar(50)
);

create table task (
    _id int primary key auto_increment,
    name varchar(50),
    label varchar(50),
    publish_time date,
    statu tinyint
);

create table mail (
	_id int primary key auto_increment,
    flag_sender bool,
    flag_receiver bool,
    sender int,
    receiver int,
    send_time date,
    title varchar(100),
    content text,
    statu tinyint
);

create table examine (
	_id int primary key auto_increment,
    student int,
    teacher int,
    score int,
    statu tinyint,
    files varchar(100)
);

create table examine_file (
	_id int primary key auto_increment,
    examine int,
    name varchar(50),
    score int,
    feedback text,
    statu tinyint
);

create table reconsider (
	_id int primary key auto_increment,
    applicant int,
    manager int,
    student int,
    consititution int,
    reason text,
    statu tinyint
);

create table achievement (
	_id int primary key auto_increment,
    student int,
    score int,
    stage tinyint,
    consititution varchar(100)
);

create table consititution (
	_id int primary key auto_increment,
    achievement int,
    name varchar(50),
    rate float,
    score int,
    teacher int,
    grede_time date
);

create table shedule (
	_id int primary key auto_increment,
    flag bool,
    school int,
    stage tinyint,
    satrt_time date,
    end_time date,
    content text
);