create database product;

use product;
create table Products
(
Id Int identity primary key,
ProductName nvarchar(30) not null,
Manufacturer nvarchar(20) not null,
ProductCount int Default 0,
Price Money not null,
);

create table History
(
Id int identity primary key,
ProductId int Not null,
Operation nvarchar(200) not null,
CreateAt Datetime not null default getdate(),
);

CREATE TRIGGER Product_insert
on Products
after insert, update
as 
update products
set Price = Price + Price * 0.38
where Id = (Select Id from inserted)

insert into Products (ProductName, ProductCount, Manufacturer, Price)
values ('sony12', 2,'Samsung', 7000)
select * from Products

-- �������� ��������
Drop trigger Product_insert

--���������� ��������
Disable trigger Product_insert on Products

--��������� ��������
Enable trigger Product_insert on Products

create trigger prod_ins_nw
on Products
after insert
as
insert into History (ProductId, Operation)
Select Id, '�������� ����� ' + ProductName + ' ����� ' + Manufacturer
from Inserted

insert into Products (ProductName, Manufacturer, ProductCount, Price)
values('Iphone 12', 'Apple', 4, 70000)
Select * from History

create trigger Prod_Del
on Products
after delete
as 
insert into History (ProductId, Operation)
Select Id, '������ ����� ' + ProductName + ' ����� ' + Manufacturer
from deleted

delete from Products
Where Id=3
Select * from History

create Trigger Products_Update
on Products
after update
as
insert into History(ProductId, Operation)
Select id, '������� ����� ' + ProductName + ' �����' + Manufacturer
from Inserted
