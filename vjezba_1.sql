# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\pp21\vjezba_1.sql

drop database if exists vjezba_1;
create database vjezba_1;
use vjezba_1;

create table sestra(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    hlace varchar(50),
    vesta varchar(50),
    prviputa datetime,
    modelnaocala varchar(33),
    becar int
);

create table becar(
    sifra int not null primary key auto_increment,
    drugiputa datetime,
    carape varchar(50),
    bojaociju varchar(50),
    haljina varchar(50)
);

alter table sestra add foreign key (becar) references becar(sifra);

create table ostavljena(
    sifra int not null primary key auto_increment,
    jmbag char(11),
    bojaociju varchar(50),
    suknja varchar(50),
    bojakose varchar(50),
    prviputa datetime,
    carape varchar(50)
);

create table mladic(
    sifra int not null primary key auto_increment,
    prstena int,
    maraka decimal(15,9),
    suknja varchar(50),
    narukvica int,
    ostavljena int
);

alter table mladic add foreign key (ostavljena) references ostavljena(sifra);

create table ostavljena_snasa(
    sifra int not null primary key auto_increment,
    ostavljena int,
    snasa int
);

alter table ostavljena_snasa add foreign key (ostavljena) references ostavljena(sifra);

create table snasa(
    sifra int not null primary key auto_increment,
    eura decimal(14,5),
    narukvica int,
    drugiputa datetime,
    carape varchar(50)
);

alter table ostavljena_snasa add foreign key (snasa) references snasa(sifra);

create table cura(
    sifra int not null primary key auto_increment,
    bojakose varchar(50),
    jmbag char(11),
    prstena int,
    dukserica varchar(50),
    mladic int
);

alter table cura add foreign key (mladic) references mladic(sifra);
    
create table punac(
    sifra int not null primary key auto_increment,
    ekstroventno boolean,
    vesta varchar(50),
    asocijalno boolean,
    prviputa datetime,
    eura decimal(15,6),
    cura int
);

alter table punac add foreign key (cura) references cura(sifra);

select * from mladic;
insert  into mladic (prstena,maraka,suknja,narukvica,ostavljena) values
(true,'300','kratka',true,null),
(true,'1500','duga',true,null),
(true,'999','kratka',true,null);

select * from cura;
insert into cura (bojakose,jmbag,prstena,dukserica,mladic) VALUES
('zelena','14578963214',1,'Nike',1),
('žuta','45632147859',1,'Adidas',1),
('plava','78521365894',1,'Puma',1);

select * from ostavljena_snasa;
insert into ostavljena_snasa (ostavljena, snasa) values
(null,null),
(null,null),
(null,null);

select * from sestra;
update sestra set hlace='Osijek';

select * from punac;
delete from punac where vesta!='AB';

select * from mladic;
select * from mladic where maraka not in (7,11,18,25,40);

select *,vesta from sestra;
select *,prviputa from punac;
