# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\pp21\vjezba_1.sql

drop database if exists vjezba_1;
create database vjezba_1;
use vjezba_1;

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int
    );

alter table cura add foreign key(punac) references punac(sifra);

create table sestra(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int
);

create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar(44),
    sestra int not null
);

alter table zena add foreign key(sestra) references sestra(sifra);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int not null
);

alter table muskarac add foreign key(zena) references zena(sifra);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno boolean,
    ekstroventno boolean not null,
    dukserica varchar(48) not null,
    muskarac int
);

alter table mladic add foreign key(muskarac) references muskarac(sifra);

create table sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

alter table sestra_svekar add foreign key(sestra) references sestra(sifra);
alter table sestra_svekar add foreign key(svekar) references svekar(sifra);

select * from sestra s ;
insert into sestra (introvertno,haljina,maraka,hlace,narukvica) values
(false,'svečana',null,'svečane',1);

select * from zena z ;
insert into zena (treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra) values
(null,null,'Adidas','12354789651','zelena',null,1),
(null,null,'Adidas','12354789651','zelena',null,1),
(null,null,'Adidas','12354789651','zelena',null,1);

select * from muskarac m;
insert into muskarac (bojaociju,hlace,modelnaocala,maraka,zena) values
('zelena',null,null,'33.33',1),
('zelena',null,null,'33.33',1),
('zelena',null,null,'33.33',1);

select * from svekar;
insert into svekar (bojaociju,prstena,dukserica,lipa,eura,majica) values
('zelena',null,null,null,null,null);

select * from sestra_svekar ss ;
insert into sestra_svekar (sestra,svekar) values
(1,1),
(1,1),
(1,1);

update cura set gustoca='15,77';

delete from mladic where kuna<=15.78;

select kratkamajica from zena where hlace='ana';

# 5.Prikažite dukserica iz tablice svekar,
#   asocijalno iz tablice mladic te hlace iz tablice muskarac
#   uz uvjet da su vrijednosti kolone hlace iz tablice zena počinju slovom
#   a te da su vrijednosti kolone haljina iz tablice sestra sadrže niz znakova ba.
#   Podatke posložite po hlace iz tablice muskarac silazno. (10)
#   svaku tablicu treba samo jednom navesti (napomena od profesora)

select svekar.dukserica, mladic.asocijalno, muskarac.hlace
from mladic inner join muskarac on mladic.muskarac = muskarac.sifra
inner join zena on muskarac.zena = zena.sifra
inner join sestra on zena.sestra = sestra.sifra
inner join sestra_svekar on sestra_svekar.sestra = sestra.sifra
inner join svekar on sestra_svekar.svekar = svekar.sifra
where zena.hlace='a%' and sestra.haljina like '%ba%'
order by muskarac.hlace desc;

# 6.Prikažite kolone haljina i maraka iz tablice sestra čiji se primarni ključ
#   ne nalaze u tablici sestra_svekar. (5)
select sestra.haljina, sestra.maraka
from sestra left join sestra_svekar on sestra.sifra = sestra_svekar.sestra
where sestra_svekar.sestra is null;
