--drop database if exists nt208;
create database if not exists nt208;
use nt208;
--drop table if exists categories;
create table if not exists categories(
  cat_id int not null auto_increment,
  cat_name varchar(255),
  primary key(cat_id)
);

--drop table if exists products;
create table if not exists products(
  id int not null auto_increment,
  name varchar(255),
  cat_id int,
  url varchar(255),
  primary key(id),
  foreign key(cat_id) references categories(id)
);