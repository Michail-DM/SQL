Create database DMA_Tigran
use DMA_Tigran

create table Department(
Number char(4) not null,
DepartmentName nchar(40) not null,
Location nchar(50),
Constraint Klych_dep Primary key(Number),
)

create table Employee(
Id int not null,
FirstName nchar(50) not null,
LastName nchar(20) not null,
DepartNum char(4)
Constraint Klych_Emloyee Primary key(Id),
Constraint Employee_depNum foreign key (DepartNum) references Department (Number),
)

create table Projects(
Number char(4) not null,
ProjectName nchar(15) not null,
Budget float,
Constraint Klych_Proj Primary key(Number),
)
create table Works_on(
Id_empl int not null,
ProjectNumber char(4) not null,
Job nchar(15),
EnterDate date,
Constraint Klych_works Primary key(Id_empl, ProjectNumber),
Constraint foreighn_Employee foreign key (ProjectNumber) references Projects (Number),
Constraint foreighn_proj foreign key (Id_empl) references Employee (Id),
)

insert Projects (Number, ProjectName, Budget) values
('p1', 'Apollo', 120000),
('p2', 'Gemini', 95000),
('p3', 'Mercury', 185000)

insert Department (Number, DepartmentName, Location) values
('d1', 'Исследования', 'Москва'),
('d2', 'Бух.учёт', 'СПБ'),
('d3', 'Mаркетинг', 'Москва')

insert Employee (Id, FirstName, LastName, DepartNum) values
(253348, 'Дмитрий', 'Волков', 'd3'),
(10102, 'Анна', 'Ивановна', 'd3'),
(18318, 'Игорь', 'Соловьев', 'd1'),
(29348, 'Олег', 'Маменко', 'd2'),
(9031, 'Елена', 'Лебеденко', 'd2'),
(2581, 'Василий', 'Фролов', 'd2'),
(28559, 'Наталья', 'Вершинина', 'd1')

insert Works_on (Id_empl, ProjectNumber, Job, EnterDate) values
(10102, 'p1', 'Аналитик', '2006.10.01'),
(10102, 'p3', 'Менеджер', '2008.01.01'),
(253348, 'p2', 'Консультант', '2007.02.15'),
(18318, 'p2', NULL , '2007.10.01'),
(29348, 'p2', NULL, '2006.12.15'),
(2581, 'p3', 'Аналитик', '2007.10.15'),
(9031, 'p1', 'Менеджер', '2007.04.15'),
(28559, 'p1', NULL , '2007.08.01'),
(28559, 'p2', 'Консультант', '2008.02.01'),
(9031, 'p3', 'Консультант', '2006.11.15'),
(29348, 'p1', 'Консультант', '2007.01.04')


if (Select *
from Employee
where LastName = 'Иванова' and
FirstName = 'Анна')
update Employee Set Lastname='Янова' where LastName='Иванова'
print 'Фамилия успешно изменена'

select * from Employee
declare @fam nchar, @name nchar
select @fam = LastName from employee
select @name = FirstName from employee
if @fam = 'Иванова'
if @name = 'Анна'
update Employee Set Lastname='Dmitrieva' where LastName='Иванова'
update Employee Set Lastname='Dmitrieva' where FirstName='Анна'
print 'Фамилия успешно изменена'
else begin
print 'Пользователь не найден'

CREATE PROCEDURE DelEmp (@Num char(4),@Dep nchar(40), @Loc nchar(50) output)
as begin insert into  Department values (@Num, @Dep, @Loc) 
select * from Department
end

execute DelEmp @Num ='g2', @Dep='MB', @Loc='Мюнхен'
select * from Department

drop procedure DelEmp

CREATE PROCEDURE DelEmp (@Num char(4),@Dep nchar(40), @Loc nchar(50) output)
as begin insert into  Department values (@Num, @Dep, @Loc) 
select * from Department
end

backup database DMA_Tigran
to disk = 'polnoe1.bac'

insert Employee (Id, FirstName, LastName, DepartNum) values
(253349, 'Александр', 'Волков', 'd3'),
(10103, 'Анна', 'Денисовна', 'd3')
backup log DMA_Tigran
to disk = 'tran.bac'

insert Works_on (Id_empl, ProjectNumber, Job, EnterDate) values
(10103, 'p1', 'Аналитик', '2006.10.01'),
(253349, 'p3', 'Менеджер', '2008.01.01')
backup log DMA_Tigran
to disk = 'tran.bac'
backup database DMA_Tigran
to disk = 'df.bac'
with differential

alter table Employee add Otchestvo nchar(20)
alter table Projects add Data date

backup database DMA_Tigran
to disk = 'df.bac'
with differential





Create database DMA_mag
use DMA_mag

create table products(
id_prod int,
Name_Prod nchar(40),
ed_izm nchar(50),
price float,
kolichastvo int,
nds int,
id_cat_pr int,
Constraint Klych_prod Primary key(id_prod),
Constraint cat foreign key (id_cat_pr) references categories(id_cat)
)
drop table products
create table sales(
number_p_p int,
data_sales date,
id_pr_sl int,
kolichestvo_sales int,
Constraint Klych_sales Primary key(number_p_p),
Constraint prodsl foreign key (id_pr_sl) references products(id_prod)
)
drop table sales

create table categories(
Id_cat int,
name nchar(15),
Constraint Klych_cat Primary key(Id_cat),
)
drop table categories
alter table products add Constraint prodsl foreign key (id_prod) references sales(id_pr_sl)
alter table categories add Constraint categ foreign key (id_cat) references products(id_cat_pr)

insert categories (Id_cat, name) values
(1, 'Молочные'),
(2, 'Мукомольные')

insert products (Id_prod, Name_Prod, ed_izm, price, kolichastvo, nds, id_cat_pr) values
(1, 'Молоко', 'литр', 100, 50, 10, 1),
(2, 'Творог','грамм',120, 25, 18, 1),
(3, 'Мука в/сорт','килограмм',80, 100, 10, 2),
(4, 'Мука п/сорт','килограмм',90, 90, 10, 2)

INSERT sales (number_p_p, data_sales, id_pr_sl, kolichestvo_sales) VALUES
(1, '2022.04.01', '1', 5),
(2, '2022.04.01', '2', 5),
(3, '2022.04.01', '3', 8),
(4, '2022.04.01', '1', 2),
(5, '2022.04.05', '4', 15),
(6, '2022.04.05', '3', 5)

select * from Employee
declare @fam nchar, @name nchar
select @fam = LastName from employee
select @name = FirstName from employee
if @fam = 'Иванова'
if @name = 'Анна'

declare @data date, @kolvo char(40), @price float
select @data= data_sales from sales
select @kolvo = kolichestvo_sales from sales
select @price = price from products
if @data = '2022-04-01'
if @price* @kolvo = < 501
print 
select products.Name_Prod, sales.data_sales, sales.kolichestvo_sales, products.price from sales, products
