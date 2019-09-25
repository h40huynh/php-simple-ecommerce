use nt208;

insert into categories(cat_name) values('Laptop');
insert into categories(cat_name) values('Camera');
insert into categories(cat_name) values('Drink');

insert into categories(cat_name) values('Phone');
insert into categories(cat_name) values('Tablet');

insert into products(name, cat_id) values('Thinkpad', 1);
insert into products(name, cat_id) values('Thinkpad 2', 1);
insert into products(name, cat_id) values('Thinkpad 3', 1);

insert into products(name, cat_id) values('Camera', 2);
insert into products(name, cat_id) values('Camera 2', 2);
insert into products(name, cat_id) values('Camera 3', 2);

insert into products(name, cat_id) values('Dr Thanh', 3);
insert into products(name, cat_id) values('Number 1', 3);
insert into products(name, cat_id) values('Nutri boost', 1);
DELETE  FROM `products` WHERE name = 'Nutri boost';

