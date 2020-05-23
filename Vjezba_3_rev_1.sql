# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\pp21\vjezba_3.sql

drop database if exists vjezba_3;
create database vjezba_3;
use vjezba_3;

create table cura(
    sifra int not null primary key auto_increment,
    suknja varchar(50),
    gustoca decimal(16,8),
    ogrlica int not null,
    narukvica int,
    hlace varchar(50),
    decko int
);

create table decko(
    sifra int not null primary key auto_increment,
    suknja varchar(30),
    carape varchar(45),
    dukserica varchar(32)
);

alter table cura add  foreign key(decko) references decko(sifra);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    prstena int,
    carape varchar(36),
    nausnica int,
    prviputa datetime,
    stilfrizura varchar(39),
    becar int not null
);

create table becar(
    sifra int not null primary key auto_increment,
    vesta varchar(42) not null,
    novcica decimal(14,9),
    ekstroventno boolean,
    modelnaocala varchar(35) not null,
    bojaociju varchar(44),
    maraka decimal(16,8)
);

alter table neprijatelj add foreign key(becar) references becar(sifra);

create table brat(
    sifra int not null primary key auto_increment,
    narukvica int,
    introvertno boolean,
    ekstroventno boolean not null,
    vesta varchar(50) not null,
    nausnica int not null,
    neprijatelj int
);

alter table brat add foreign key(neprijatelj) references neprijatelj(sifra);

create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(17,2),
    asocijalno boolean,
    bojaociju varchar(43) not null,
    prviputa datetime not null,
    hlace varchar(45),
    modelnaocala varchar(37) not null,
    brat int
);

alter table prijatelj add foreign key(brat) references brat(sifra);

create table becar_djevojka(
    sifra int not null primary key auto_increment,
    becar int not null,
    djevojka int not null
);

create table djevojka(
    sifra int not null primary key auto_increment,
    introvertno boolean not null,
    maraka decimal(18,2),
    haljina varchar(47),
    hlace varchar(33) not null,
    prviputa datetime
);

alter table becar_djevojka add foreign key(becar) references becar(sifra);
alter table becar_djevojka add foreign key(djevojka) references djevojka(sifra);

select * from becar b ;
insert into becar (vesta,novcica,ekstroventno,modelnaocala,bojaociju,maraka ) values
('vunena',null,true,'Police',null,null);

select * from neprijatelj;
insert into neprijatelj (prstena,carape,nausnica,prviputa,stilfrizura,becar) values
(null,null,null,null,null,1),
(null,null,null,null,null,1),
(null,null,null,null,null,1);

select * from brat b ;
insert into brat (narukvica,introvertno,ekstroventno,vesta,nausnica,neprijatelj) values
(null,not true,true,'vunena',1,null),
(null,not true,true,'vunena',1,null),
(null,not true,true,'vunena',1,null);

select * from djevojka d ;
insert into djevojka (introvertno,maraka,haljina,hlace,prviputa) values
(true,null,null,'Levis',null);

select * from becar_djevojka bd ;
insert  into becar_djevojka (becar,djevojka) values
(1,1),
(1,1),
(1,1);

select * from cura c ;
update cura set gustoca ='14.76';

select * from prijatelj p ;
delete from prijatelj where asocijalno =false ;

select * from neprijatelj;
select nausnica from neprijatelj where carape in ('ana');