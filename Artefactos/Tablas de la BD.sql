﻿create table "user"(
  id SERIAL primary key,
  first_name varchar,
  last_name varchar,
  email varchar,
  account varchar,
  user_type INTEGER,
  "password" varchar
);


insert into "user"(first_name,last_name,email,account,user_type,"password") values('javier','marin','algo@gmail.com','paracelso',2,'contraceña');
insert into "user"(first_name,last_name,email,account,user_type,"password") values('francisco','marin','algo@gmail.com','froznar',1,'contraceña');



insert into "user"(first_name,last_name,email,account,user_type,"password") values('javier','marin','algo@gmail.com','paracelso',2,'contraceña');
insert into "user"(first_name,last_name,email,account,user_type,"password") values('francisco','marin','algo@gmail.com','froznar',1,'contraceña');

insert into "user"(first_name,last_name,email,account,user_type,"password") values('Darth','Vader','darth@gmail.com','ucsp',3,'pass');
insert into "user"(first_name,last_name,email,account,user_type,"password") values('Paula','','paula@gmail.com','ucsp',3,'pass');
insert into "user"(first_name,last_name,email,account,user_type,"password") values('Vanessa','Santillana','vs@gmail.com','ucsp',4,'pasword');


create table "proveedor"(
  id_proveedor SERIAL primary key,
  name_proveedor varchar
);

insert into "proveedor"(name_proveedor) values('juan');



/*Clase Producto*/
Create table product(
  id SERIAL primary key,
  nameProduct varchar,
  price integer,
  stack integer,
  productType varchar
 
);

Create table sale(
  id SERIAL primary key,
  nameBuyer varchar,
  DNI integer,
  RUC integer,
  address varchar,
  voucher varchar,
  priceTotal integer,
  dateSale TIMESTAMP WITH TIME ZONE
);

create table sale_product(
    id_sale_product SERIAL primary key,
    id_sale integer,
    id_producto integer,
    cantidad integer,
    precio_unidad numeric (6,2),
    foreign key (id_product) references product(id_product)
        on delete no action
        on update no action,
    foreign key (id_sale) references sale(id_sale)
        on delete no action
        on update no action,
);

insert into product(nameProduct,price,stack,productType) values('Caja Metalica',58,2000,'Producto A');
insert into product(nameProduct,price,stack,productType) values('Pegamento',6,80,'Producto B');
insert into product(nameProduct,price,stack,productType) values('Fierro de Acero',250,4200,'Producto A');
insert into product(nameProduct,price,stack,productType) values('Tubos',120,1002,'Producto C');
select * from product

insert into sale(nameBuyer,DNI,RUC,address,voucher,priceTotal,dateSale)
values('Maria Sanchez',72545430,1423,'Av Independencia','voucher 1',150,now);