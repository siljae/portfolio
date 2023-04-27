drop database if exists webmarket;
create database webmarket default character set utf8 collate utf8_general_ci;
use webmarket;

CREATE TABLE board (
       num int not null auto_increment,
       id varchar(10) not null,
       name varchar(10) not null,
       subject varchar(100) not null,
       content text not null,
       regist_day varchar(30),
       hit int,
       ip varchar(20),
       PRIMARY KEY (num)
)default CHARSET=utf8;

select * from board;
desc board;
drop table board;

CREATE TABLE IF NOT EXISTS product(
	p_id VARCHAR(10) NOT NULL,
	p_name VARCHAR(20),
	p_unitPrice  INTEGER,
	p_description TEXT,
   	p_category VARCHAR(20),
	p_manufacturer VARCHAR(20),
	p_unitsInStock LONG,
	p_condition VARCHAR(20),
	p_fileName  VARCHAR(20),
	PRIMARY KEY (p_id)
)default CHARSET=utf8;

desc product;

INSERT INTO product VALUES('P1234', 'iPhone 6s', 800000, '1334X750 Renina HD display, 8-megapixel iSight Camera','Smart Phone', 'Apple', 1000, 'new', 'P1234.png');
INSERT INTO product VALUES('P1235', 'LG PC gram', 1500000, '3.3-inch,IPS LED display, 5rd Generation Intel Core processors', 'Notebook', 'LG', 1000, 'new', 'P1235.png');
INSERT INTO product VALUES('P1236', 'Galaxy Tab S', 900000, '3.3-inch, 212.8*125.6*6.6mm,  Super AMOLED display, Octa-Core processor', 'Tablet', 'Samsung', 1000, 'new', 'P1236.png');

select * from product;

USE WebMarketDB;

create table member ( 
    id varchar(10) not null,
    password varchar(10) not null,
    name varchar(10) not null,
    gender varchar(4),
    birth  varchar(10),
    mail  varchar(30),
    phone varchar(20),
    address varchar(90),
    regist_day varchar(50),    
    primary key(id) 
) default CHARSET=utf8;

select * from member;
drop table member;