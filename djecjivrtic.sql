# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\pp21\djecjivrtic.sql

drop database if exists djecjivrtic;
create database djecjivrtic;
use djecjivrtic;

create table odgojnaskupna(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2),
    odgajatelj int
);

create table odgajatelj(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50),
    brojtelefona varchar(50),
    iban varchar(50),
    strucnasprema varchar(50)
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    odgojnaskupna int not null,
    odgajatelj int
);

# vanjski (strani) ključevi 
alter table odgojnaskupna add foreign key (odgajatelj) references odgajatelj(sifra);
alter table dijete add foreign key (odgojnaskupna) references odgojnaskupna(sifra);
alter table dijete add foreign key (odgajatelj) references odgajatelj(sifra);
