# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\pp21\vjezba_6.sql

drop database if exists vjezba_6;
create database vjezba_6;
use vjezba_6;

create table ostavljena(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    haljina varchar(41) not null,
    prviputa datetime not null,
    majica varchar(33)
);

create table djevojka(
    sifra int not null primary key auto_increment,
    maraka decimal(12,10),
    asocijalno boolean not null,
    drugiputa datetime not null,
    ostavljena int
);

alter table djevojka add foreign key(ostavljena) references ostavljena(sifra);

create table snasa(
    sifra int not null primary key auto_increment,
    dukserica varchar(33) not null,
    narukvica int not null,
    kuna decimal(17,10) not null,
    asocijalno boolean not null,
    zena int
);

create table zena(
    sifra int not null primary key auto_increment,
    ekstroventno boolean not null,
    prstena int,
    indiferentno boolean,
    asocijalno boolean,
    modelnaocala varchar(47),
    zarucnica int not null
);

alter table snasa add foreign key(zena) references zena(sifra);

create table zarucnica(
    sifra int not null primary key auto_increment,
    prviputa datetime not null,
    kuna decimal(14,5),
    bojaociju varchar(35) not null,
    novcica decimal(13,6) not null,
    gustoca decimal(14,9) not null,
    haljina varchar(33),
    svekrva int not null
);

alter table zena add foreign key(zarucnica) references zarucnica(sifra);

create table svekrva(
    sifra int not null primary key auto_increment,
    modelnaocala varchar(41),
    ogrlica int not null,
    lipa decimal(16,6)
);

alter table zarucnica add foreign key(svekrva) references svekrva(sifra);

create table svekrva_brat(
    sifra int not null primary key auto_increment,
    svekrva int not null,
    brat int not null
);

create table brat(
    sifra int not null primary key auto_increment,
    lipa decimal(12,8),
    jmbag char(11),
    ogrlica int
);

alter table svekrva_brat add foreign key(svekrva) references svekrva(sifra);
alter table svekrva_brat add foreign key(brat) references brat(sifra);

select * from svekrva s;
insert into svekrva (modelnaocala,ogrlica,lipa) values
(null,1,null);

select * from zarucnica z;
insert into zarucnica (prviputa,kuna,bojaociju,novcica,gustoca,haljina,svekrva) values
('2020-12-25',null,'plava','203.66','25.5',null,1),
('2020-12-25',null,'plava','203.66','25.5',null,1),
('2020-12-25',null,'plava','203.66','25.5',null,1);

select * from zena;
insert into zena (ekstroventno,prstena,indiferentno,asocijalno,modelnaocala,zarucnica) values
(true,null,false,false,null,1),
(true,null,false,false,null,1),
(true,null,false,false,null,1);

select * from brat b2;
insert into brat (lipa,jmbag,ogrlica) values
(null,null,null);

select * from svekrva_brat sb;
insert into svekrva_brat (svekrva,brat) values
(1,1),
(1,1),
(1,1);

update djevojka set asocijalno=false;

delete from snasa where narukvica<=12;

select bojaociju from zarucnica where kuna not in (8,13,18,29,35);
