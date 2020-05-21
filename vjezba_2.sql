# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\pp21\vjezba_2.sql

drop database if exists vjezba_2;
create database vjezba_2;
use vjezba_2;

create table punac(
sifra int not null primary key auto_increment,
suknja varchar(50),
vesta varchar(50) not null,
prviputa datetime,
brat int
);

create table brat(
sifra int not null primary key auto_increment,
gustoca decimal(13,8),
bojaociju varchar(50),
modelnaocala varchar(50) not null,
suknja varchar(50),
maraka decimal(18,3) not null,
hlace varchar(50) not null
);

alter table punac add foreign key(brat) references brat(sifra);

create table prijateljica(
sifra int not null primary key auto_increment,
dukserica varchar(50),
eura decimal(18,8),
treciputa datetime,
hlace varchar(50),
zarucnik int
);

create table neprijateljica(
sifra int not null primary key auto_increment,
introvertno boolean,
vesta varchar(50) not null,
gustoca decimal(13,6),
carape varchar(50) not null,
lipa decimal(18,3) not null,
prijateljica int not null
);

create table svekar(
sifra int not null primary key auto_increment,
prstena int not null,
jmbag char(11),
lipa decimal(13,5) not null,
eura decimal(13,5) not null,
neprijateljica int not null
);

alter table neprijateljica add foreign key(prijateljica) references prijateljica(sifra);

alter table svekar add foreign key(neprijateljica) references neprijateljica(sifra);

create table zarucnik(
sifra int not null primary key auto_increment,
indiferentno boolean,
carape varchar(50),
kratkamajica varchar(50),
ekstroventno boolean not null,
narukvica int,
kuna decimal(13,5)
);

alter table prijateljica add foreign key(zarucnik) references zarucnik(sifra);

create table punica(
sifra int not null primary key auto_increment,
bojaociju varchar(50),
bojakose varchar(50) not null,
majica varchar(50),
prviputa datetime,
hlace varchar(50),
asocijalno boolean not null
);

create table zarucnik_punica(
sifra int not null primary key auto_increment,
zarucnik int not null,
punica int not null
);

alter table zarucnik_punica add foreign key(zarucnik) references zarucnik(sifra);
alter table zarucnik_punica add foreign key(punica) references punica(sifra);

select  * from prijateljica p ;
insert into prijateljica (dukserica,eura,treciputa,hlace,zarucnik) values
(null,null,null,null,null),
(null,null,null,null,null),
(null,null,null,null,null);

select  * from neprijateljica n2 ;
insert into neprijateljica (introvertno,vesta,gustoca,carape,lipa,prijateljica) values
(not true,'Vunena',null,'pamučne','23',1),
(not true,'Pamučna',null,'pamučne','30',3),
(not true,'Nova',null,'kratke','0.77',2);

insert  into zarucnik (indiferentno,carape,kratkamajica,ekstroventno,narukvica,kuna) values
(not true,null,null,true,null,null);

insert into punica (bojaociju,bojakose,majica,prviputa,hlace,asocijalno) values
(null,'zelena',null,null,null,true);

select  * from zarucnik_punica zp ;
insert into zarucnik_punica (zarucnik,punica) values
(1,1),
(1,1),
(1,1);

select * from punac p ;
update punac set vesta ='Osijek';

select * from svekar s ;
delete from svekar where jmbag='00000000007';

select * from prijateljica p ;
select * from prijateljica where treciputa not in (6,14,19,30,40);