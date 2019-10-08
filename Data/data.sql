--drop database if exists nt208;
create database if not exists nt208;
use nt208;
drop table if exists categories;
create table if not exists categories(
  cat_id int not null auto_increment,
  cat_name varchar(255),
  primary key(cat_id)
);

drop table if exists products;
create table if not exists products(
  id int not null auto_increment,
  name varchar(255),
  cat_id int,
  price float,
  url varchar(255),
  primary key(id),
  foreign key(cat_id) references categories(cat_id)
);

------------
-- Inventory
------------

create table if not exists inventory_in(
  inventory_id int not null auto_increment,
  product_id int,
  import_date datetime,
  quantity int,
  primary key(inventory_id),
  foreign key(product_id) references products(id)
);

create table if not exists inventory_out(
  io_id int not null auto_increment,
  inventory_id int,
  export_date datetime,
  quantity int,
  primary key(io_id),
  foreign key(inventory_id) references inventory_in(inventory_id)
);

create table if not exists inventory_management(
  im_id int not null auto_increment,
  inventory_id int,
  in_stock int,
  sold_amount int,
  update_date datetime,
  update_type varchar(10),
  primary key(im_id),
  foreign key(inventory_id) references inventory_in(inventory_id)
);

create table if not exists inventory_performance(
  ip_id int not null auto_increment,
  inventory_id int,
  from_date datetime,
  to_date datetime,
  performance float,
  primary key(ip_id),
  foreign key(inventory_id) references inventory_in(inventory_id)
);