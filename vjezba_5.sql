# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\pp21\vjezba_5.sql

drop database if exists vjezba_5;
create database vjezba_5;
use vjezba_5;

create table sestra(
    sifra int not null primary key auto_increment,
    kratkamajica varchar(50) not null,
    bojaociju varchar(30),
    haljina varchar(44),
    treciputa datetime
);

create table brat(
    sifra int not null primary key auto_increment,
    kuna decimal(14,9),
    drugiputa datetime not null,
    hlace varchar(46),
    jmbag char(11),
    sestra int not null
);

alter table brat add foreign key(sestra) references sestra(sifra);

create table becar(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    haljina varchar(38) not null,
    prstena int,
    narukvica int not null,
    eura decimal(17,5),
    zarucnica int not null
);

create table zarucnik(
    sifra int not null primary key auto_increment,
    vesta varchar(49),
    bojakose varchar(42),
    eura decimal(18,6) not null,
    gustoca decimal(17,10) not null,
    suknja varchar(45),
    dukserica varchar(52),
    becar int
);

alter table zarucnik add foreign key(becar) references becar(sifra);

create table cura(
    sifra int not null primary key auto_increment,
    carape varchar(47) not null,
    bojakose varchar(50),
    bojaociju varchar(30),
    majica varchar(36) not null,
    eura decimal(13,8) not null,
    zarucnik int not null
);

alter table cura add foreign key(zarucnik) references zarucnik(sifra);

create table zarucnica(
    sifra int not null primary key auto_increment,
    narukvica int,
    indiferentno boolean not null,
    eura decimal(14,5),
    lipa decimal(14,7) not null,
    kuna decimal(13,5),
    nausnica int
);

alter table becar add foreign key(zarucnica) references zarucnica(sifra);

create table zarucnica_snasa(
    sifra int not null primary key auto_increment,
    zarucnica int not null,
    snasa int not null
);

create table snasa(
    sifra int not null primary key auto_increment,
    narukvica int not null,
    lipa decimal(16,5) not null,
    bojakose varchar(42) not null,
    bojaociju varchar(38)
);

alter table zarucnica_snasa add foreign key(zarucnica) references zarucnica(sifra);
alter table zarucnica_snasa add foreign key(snasa) references snasa(sifra);


select * from  zarucnik z2 ;
insert into zarucnik (vesta,bojakose,eura,gustoca,suknja,dukserica,becar) values
(null,null,'33.33','452.3',null,null,null),
(null,null,'33.33','452.3',null,null,null),
(null,null,'33.33','452.3',null,null,null);

select * from zarucnica z ;
insert into zarucnica (narukvica,indiferentno,eura,lipa,kuna,nausnica) values
(null,true,null,'45',null,null);

select * from becar b ;
insert into becar (treciputa,haljina,prstena,narukvica,eura,zarucnica) values
(null,'svečana',null,1,null,1),
(null,'svečana',null,1,null,1),
(null,'svečana',null,1,null,1);

select * from snasa s ;
insert into snasa (narukvica,lipa,bojakose,bojaociju) values
(1,'21','plava',null);

select * from zarucnica_snasa zs ;
insert into zarucnica_snasa (zarucnica,snasa) values
(1,1),
(1,1),
(1,1);

update brat set drugiputa=2016-04-10;

delete  from cura where bojakose !='AB';

select prstena from becar b where haljina ='ana';