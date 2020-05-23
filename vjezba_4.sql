# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\pp21\vjezba_4.sql

drop database if exists vjezba_4;
create database vjezba_4;
use vjezba_4;

create table svekrva(
    sifra int not null primary key auto_increment,
    hlace varchar(44) not null,
    stilfrizura varchar(33) not null,
    treciputa datetime,
    carape varchar(39),
    gustoca decimal(16,10) not null
);

create table prijateljica(
    sifra int not null primary key auto_increment,
    suknja varchar(46),
    ogrlica int not null,
    eura decimal(12,7) not null,
    introvertno boolean not null,
    svekrva int not null
);

alter table prijateljica add foreign key(svekrva) references svekrva(sifra);

create table sestra(
    sifra int not null primary key auto_increment,
    indiferentno boolean not null,
    prviputa datetime not null,
    suknja varchar(38),
    haljina varchar(31) not null,
    majica varchar(41) not null,
    zarucnica int
);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    prviputa datetime not null,
    indiferentno boolean not null,
    introvertno boolean not null,
    nausnica int,
    vesta varchar(35),
    novcica decimal(17,9),
    sestra int not null
);

alter table neprijatelj add foreign key(sestra) references sestra(sifra);

create table prijatelj(
    sifra int not null primary key auto_increment,
    indiferentno boolean,
    haljina varchar(40),
    ekstroventno boolean,
    lipa decimal(18,5),
    ogrlica int not null,
    neprijatelj int
);

alter table prijatelj add foreign key(neprijatelj) references neprijatelj(sifra);

create table zarucnica(
    sifra int not null primary key auto_increment,
    ekstroventno boolean,
    jmbag char(11),
    novcica decimal(18,6) not null,
    treciputa datetime not null
);

alter table sestra add foreign key(zarucnica) references zarucnica(sifra);

create table zarucnica_mladic(
    sifra int not null primary key auto_increment,
    zarucnica int not null,
    mladic int not null
);

create table mladic(
    sifra int not null primary key auto_increment,
    majica varchar(42) not null,
    eura decimal(18,2) not null,
    hlace varchar(45) not null,
    nausnica int,
    bojaociju varchar(35) not null
);

alter table zarucnica_mladic add foreign key(zarucnica) references zarucnica(sifra);
alter table zarucnica_mladic add foreign key(mladic) references mladic(sifra);

select * from zarucnica z ;
insert into zarucnica (ekstroventno,jmbag,novcica,treciputa) values
(false,null,'45.89','2020-11-25');

select * from  sestra s ;
insert into sestra (indiferentno,prviputa,suknja,haljina,majica,zarucnica) values
(true,'2018-12-13',null,'svečana','sportska-kratka',1),
(true,'2018-12-13',null,'svečana','sportska-kratka',1),
(true,'2018-12-13',null,'svečana','sportska-kratka',1);

select * from neprijatelj n ;
insert into neprijatelj (prviputa,indiferentno,introvertno,nausnica,vesta,novcica,sestra ) values
('2019-02-15',true,true,null,null,null,1),
('2019-02-15',true,true,null,null,null,1),
('2019-02-15',true,true,null,null,null,1);

select * from mladic m ;
insert  into mladic (majica,eura,hlace,nausnica,bojaociju) values
('Kratka','25.99','Levis',null,'zelena');

select * from zarucnica_mladic zm ;
insert into zarucnica_mladic (zarucnica,mladic) values
(1,1),
(1,1),
(1,1);

update  prijateljica set ogrlica=('17');

delete from prijatelj where haljina<='AB';

select suknja from sestra where prviputa='';