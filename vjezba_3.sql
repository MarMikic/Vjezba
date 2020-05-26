# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\pp21\vjezba_3.sql

drop database if exists vjezba_3;
create database vjezba_3;
use vjezba_3;

create table svekar(
    sifra int not null primary key auto_increment,
    novcica decimal(16,8) not null,
    suknja varchar(44) not null,
    bojakose varchar(36),
    prstena int,
    narukvica int not null,
    cura int not null
);

create table cura(
    sifra int not null primary key auto_increment,
    dukserica varchar(49),
    maraka decimal(13,7),
    drugiputa datetime,
    majica varchar(49),
    novcica decimal(15,8),
    ogrlica int not null
);

alter table svekar add foreign key(cura) references cura(sifra);

create table punica(
    sifra int not null primary key auto_increment,
    asocijalno boolean,
    kratkamajica varchar(44),
    kuna decimal(13,8) not null,
    vesta varchar(32) not null,
    snasa int
);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    kuna decimal(15,6) not null,
    eura decimal(12,9) not null,
    treciputa datetime,
    ostavljena int not null
);

alter table punica add foreign key(snasa) references snasa(sifra);

create table ostavljena(
    sifra int not null primary key auto_increment,
    kuna decimal(17,5),
    lipa decimal(15,6),
    majica varchar(35),
    modelnaocala varchar(31) not null,
    prijatelj int
);

alter table snasa add foreign key(ostavljena) references ostavljena(sifra);

create table prijatelj(
    sifra int not null primary key auto_increment,
    kuna decimal(16,10),
    haljina varchar(37),
    lipa decimal(13,10),
    dukserica varchar(31),
    indiferentno boolean not null
);

alter table ostavljena add foreign key(prijatelj) references prijatelj(sifra);

create table prijatelj_brat(
    sifra int not null primary key auto_increment,
    prijatelj int not null,
    brat int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    ogrlica int not null,
    ekstroventno boolean not null
);

alter table prijatelj_brat add foreign key(prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key(brat) references brat(sifra);

select * from brat b ;
insert into brat (jmbag,ogrlica,ekstroventno) values
(null,1,true);

select * from prijatelj p ;
insert into prijatelj (kuna,haljina,lipa,dukserica,indiferentno) values
(null,null,null,null,true);

select * from prijatelj_brat pb;
insert into prijatelj_brat (prijatelj,brat) values
(1,1),
(1,1),
(1,1);

select * from ostavljena o ;
insert into ostavljena (kuna,lipa,majica,modelnaocala,prijatelj) values
(null,null,null,'Police',1),
(null,null,null,'Police',1),
(null,null,null,'Police',1);

select * from snasa s ;
insert into snasa (introvertno,kuna,eura,treciputa,ostavljena) values
(null,'33','10',null,1),
(null,'33','10',null,1),
(null,'33','10',null,1);

update  svekar set suknja='Osijek';

delete from punica where kratkamajica='AB';

select majica from ostavljena where lipa not in (9,10,20,30 or 35);

select brat.ekstroventno, punica.vesta, snasa.kuna 
from punica inner join snasa on punica.snasa=punica.sifra 
inner join ostavljena on snasa.ostavljena=ostavljena.sifra
inner join prijatelj on ostavljena.prijatelj=prijatelj.sifra 
inner join prijatelj_brat on prijatelj_brat.prijatelj=prijatelj_brat.sifra 
inner join brat on prijatelj_brat.brat=brat.sifra 
where ostavljena.lipa !=91 and prijatelj.haljina like '%ba%'
order by snasa.kuna desc;

select prijatelj.haljina, prijatelj.lipa 
from prijatelj inner join prijatelj_brat on prijatelj.sifra=prijatelj_brat.prijatelj 
where prijatelj_brat.prijatelj is null;
