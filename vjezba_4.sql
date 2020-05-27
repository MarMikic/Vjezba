# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\pp21\vjezba_4.sql

drop database if exists vjezba_4;
create database vjezba_4;
use vjezba_4;

create table punac(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    majica varchar(46),
    jmbag char(11) not null,
    novcica decimal(18,7) not null,
    maraka decimal(12,6) not null,
    ostavljen int not null
);

create table ostavljen(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(43),
    introvertno boolean,
    kuna decimal(14,10)
);

alter table punac add foreign key(ostavljen) references ostavljen(sifra);

create table mladic(
    sifra int not null primary key auto_increment,
    kuna decimal(15,9),
    lipa decimal(18,5),
    nausnica int,
    stilfrizura varchar(49),
    vesta varchar(34) not null
);

create table zena_mladic(
    sifra int not null primary key auto_increment,
    zena int not null,
    mladic int not null
);

alter table zena_mladic add foreign key(mladic) references mladic(sifra);

create table zena(
    sifra int not null primary key auto_increment,
    suknja varchar(39) not null,
    lipa decimal(18,7),
    prstena int not null
);

alter table zena_mladic add foreign key(zena) references zena(sifra);

create table snasa(
    sifra int not null primary key auto_increment,
    introvertno boolean,
    treciputa datetime,
    haljina varchar(44) not null,
    zena int not null
);

alter table snasa add foreign key(zena) references zena(sifra);

create table becar(
    sifra int not null primary key auto_increment,
    novcica decimal(14,8),
    kratkamajica varchar(48) not null,
    bojaociju varchar(36) not null,
    snasa int not null
);

alter table becar add foreign key(snasa) references snasa(sifra);

create table prijatelj(
    sifra int not null primary key auto_increment,
    eura decimal(16,9),
    prstena int not null,
    gustoca decimal(16,5),
    jmbag char(11) not null,
    suknja varchar(47) not null,
    becar int not null
);

alter table prijatelj add foreign key(becar) references becar(sifra);

select * from mladic m2 ;
insert into mladic (kuna,lipa,nausnica,stilfrizura,vesta) values
(null,null,1,null,'vunena');

select * from zena z2 ;
insert into zena (suknja,lipa,prstena) values
('kratka',null,1);

select * from zena_mladic zm ;
insert into zena_mladic (zena,mladic) values
(1,1),
(1,1),
(1,1);

select * from snasa s2 ;
insert into snasa (introvertno,treciputa,haljina,zena) values
(false,null,'svečana',1),
(false,null,'svečana',1),
(false,null,'svečana',1);

select * from becar b ;
insert into becar (novcica,kratkamajica,bojaociju,snasa) values
(null,'Nike','zelena',1),
(null,'Nike','zelena',1),
(null,'Nike','zelena',1);

update punac set majica='Osijek';

delete from prijatelj where prstena <=17;

select haljina from snasa where treciputa=null;

select mladic.nausnica, prijatelj.jmbag, becar.kratkamajica 
from prijatelj inner join becar on prijatelj.becar=becar.sifra 
inner join snasa on becar.snasa=snasa.sifra
inner join zena on snasa.zena=zena.sifra 
inner join zena_mladic on zena_mladic.zena=zena_mladic.sifra 
inner join mladic on zena_mladic.mladic=mladic.sifra 
where snasa.treciputa="%" and zena.lipa !=29
order by becar.kratkamajica desc;

select zena.lipa, zena.prstena 
from zena left join zena_mladic on zena.sifra = zena_mladic.zena
where zena_mladic.zena is null;