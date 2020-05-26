# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\pp21\vjezba_2.sql

drop database if exists vjezba_2;
create database vjezba_2;
use vjezba_2;

create table prijatelj(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(37),
    treciputa datetime not null,
    ekstroventno boolean not null,
    prviputa datetime,
    svekar int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno boolean not null
);

alter table prijatelj add foreign key(svekar) references svekar(sifra);

create table decko(
    sifra int not null primary key auto_increment,
    indiferentno boolean,
    vesta varchar(34),
    asocijalno boolean not null
);

create table decko_zarucnica(
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null
);

alter table decko_zarucnica add foreign key(decko) references decko(sifra);

create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose varchar(37) not null,
    novcica decimal(15,9),
    lipa decimal(15,8) not null,
    indiferentno boolean not null
);

alter table decko_zarucnica add foreign key(zarucnica) references zarucnica(sifra);

create table cura(
    sifra int not null primary key auto_increment,
    haljina varchar(33) not null,
    drugiputa datetime not null,
    suknja varchar(38),
    narukvica int,
    introvertno boolean,
    majica varchar(40) not null,
    decko int
);

alter table cura add foreign key(decko) references decko(sifra);

create table neprijatelj(
    sifra int not null primary key auto_increment,
    majica varchar(32),
    haljina varchar(43) not null,
    lipa decimal(16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char(11),
    cura int
);

alter table neprijatelj add foreign key(cura) references cura(sifra);

create table brat(
    sifra int not null primary key auto_increment,
    suknja varchar(47),
    ogrlica int not null,
    asocijalno boolean not null,
    neprijatelj int not null
);

alter table brat add foreign key(neprijatelj) references neprijatelj(sifra);

select * from decko d ;
insert into decko (indiferentno,vesta,asocijalno) values
(false,null,true);

select * from cura c ;
insert into cura (haljina,drugiputa,suknja,narukvica,introvertno,majica,decko) values
('svečana','2020-12-25',null,1,false,'Nike',1),
('svečana','2020-12-25',null,1,false,'Nike',1),
('svečana','2020-12-25',null,1,false,'Nike',1);

select * from neprijatelj n ;
insert into neprijatelj (majica,haljina,lipa,modelnaocala,kuna,jmbag,cura) values
(null,'svečana',null,'Police','9000',null,1),
(null,'svečana',null,'Police','9000',null,1),
(null,'svečana',null,'Police','9000',null,1);

select * from zarucnica z2 ;
insert into zarucnica (narukvica,bojakose,novcica,lipa,indiferentno) values
(1,'zelena',null,'13',true);

select * from decko_zarucnica dz ;
insert into decko_zarucnica (decko,zarucnica) values
(1,1),
(1,1),
(1,1);

update prijatelj set treciputa=2020-04-30;

delete from brat where ogrlica !=14;

select suknja from cura where drugiputa=null;

select zarucnica.novcica, brat.neprijatelj, neprijatelj.haljina 
from brat inner join neprijatelj on brat.neprijatelj=neprijatelj.sifra
inner join cura on neprijatelj.cura=cura.sifra 
inner join decko on cura.decko=decko.sifra
inner join decko_zarucnica on decko_zarucnica.decko=decko.sifra
inner join zarucnica on decko_zarucnica.zarucnica=zarucnica.sifra
where cura.drugiputa=true and decko.vesta like '%ba%'
order by neprijatelj.haljina desc;

select decko.vesta, decko.asocijalno 
from decko left join decko_zarucnica on decko.sifra=decko_zarucnica.decko 
where decko_zarucnica.decko is null;

