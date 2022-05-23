Create database Ychet_vremeni
use Ychet_rabochego_vremeni

create table Sotrudnik(
Id char(4) not null,
FIO nchar(40) not null,
id_dolznost char(4) not null,
avto nchar(4),
Stazh int,
pasport nchar(50),
Telefon nchar(50),
Polis nchar(50),
Tip_zp nchar(50),
Zp nchar(50),
Constraint Klych_dep Primary key(Id),
Constraint dolzn foreign key(id_dolznost) references dolznost (Id),

)
drop table Sotrudnik

create table Vremya(
Id char(4) not null,
id_sotrudnik char(4) not null,
Data  date,
vremya_prixoda time,
vremya_uxoda time,
Constraint vremya_kl Primary key(Id),
Constraint vrem foreign key(id_sotrudnik) references Sotrudnik (Id),

)
drop table Vremya


create table Otdel(
Id char(4) not null,
Otdel nchar(15) not null,
Constraint Klych_otd Primary key(Id),

)

create table dolznost(
Id char(4) not null,
Id_otdel char(4) not null,
dolznost nchar(15),
Constraint kl_dolzn Primary key(Id),
Constraint rab_dlzn foreign key (Id_otdel) references Otdel (Id),
)
drop  table Dolznost

insert Otdel (Id, Otdel) values
('o1', 'Бухгалтерия'),
('o2', 'Отдел кадров'),
('o3', 'Администрация'),
('o4', 'Отдел продаж')

insert dolznost (Id, id_otdel, dolznost) values
('d1', 'o1', 'Главбух'),
('d2', 'o1', 'Бухгалтер'),
('d3', 'o2', 'Кадровик'),
('d4', 'o3', 'Зав.отдела'),
('d5', 'o3', 'Директор'),
('d6', 'o4', 'Менеджер')

insert dolznost (Id, id_otdel, dolznost) values
('d1', 'o1', 'Главбух'),
('d2', 'o1', 'Бухгалтер'),
('d3', 'o2', 'Кадровик'),
('d4', 'o3', 'Зав.отдела'),
('d5', 'o3', 'Директор'),
('d6', 'o4', 'Менеджер')

insert Sotrudnik (Id, FIO, id_dolznost, avto, Stazh, pasport,telefon,Polis,Tip_zp,ZP) values
('s1', 'Дбар Марина Валентиновна', 'd1', 'Да', 10, 4211567890, 22-33-44, 235678901, 'Фиксированная', 40000),
('s2', 'Ким Владимир Петрович', 'd2', 'Нет', 10, 4211567876, 62-33-44, 235678953, 'Фиксированная', 30000),
('s3', 'Шкуратов Олег Павлович', 'd3', 'Да', 12, 4211567864, 99-33-44, 235678931, 'Фиксированная', 30000),
('s4', 'Иванов Иван Иванович', 'd4', 'Да', 12, 4211567876, 66-33-44, 235478901, 'Фиксированная', 50000),
('s5', 'Петров Петр Петрович', 'd5', 'Да', 12, 4211565490, 66-55-44, 235678441, 'Фиксированная', 55000),
('s6','Борисов Борис Борисович', 'd6', 'Нет', 12, 4211567890, 42-53-66, 235644901, 'В час', 250)

insert Vremya (Id, id_sotrudnik, Data, vremya_prixoda, vremya_uxoda) values
('v1', 's1', '02-12-2021', '7:00:00', 16:00),
('v2', 's2', '02-12-2021', '7:10:00', 16:00),
('v3', 's3', '02-12-2021', '6:50:00', 11:30),
('v4', 's5', '02-12-2021', '7:00:00', 18:20),
