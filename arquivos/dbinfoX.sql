create database dbinfox;

use dbinfox;

create table tbusuario(
	iduser int primary key ,
    usuario varchar(50) not null,
    fone varchar(15),
    login varchar(15) not null unique,
    senha varchar(15) not null
);

describe tbusuario;

alter table tbusuario add column perfil varchar(20) not null;

update tbusuario set perfil='admin' where iduser=1;

insert into tbusuario (iduser, usuario, fone, login, senha, perfil)
values(3, 'Usuario', '45999999999', 'Usuario', '1234', 'User');

select * from tbusuario;

create table tbclientes(
	idcli int primary key auto_increment,
    nomecli varchar(50) not null,
    endcli varchar(100),
    fonecli varchar(50) not null,
    emailcli varchar(50)
);

insert into tbclientes (nomecli, endcli, fonecli, emailcli)
values('Jonathan', 'Rua sei la', '4599999999', 'jonathan@gmail.com');

select * from tbclientes;

create table tbos(
	os int primary key auto_increment,
    data_os timestamp default current_timestamp,
    equipamento varchar(150) not null,
    defeito varchar(150),
    servico varchar(150),
    tecnico varchar(50),
    valor decimal(10,2),
    idcli int not null,
    foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos (equipamento, defeito, servico, tecnico, valor, idcli)
values('Notebook', 'Bateria viciada', 'troca de bateria', 'Jonathan', 100, 1);

select * from tbos;

select 
	O.os, equipamento, defeito, servico, valor,
	C.nomecli, fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);

alter table tbos add tipo varchar(15) not null after data_os;

alter table tbos add situacao varchar(20) not null after tipo;

select 
	OSER.os, data_os, tipo, situacao, equipamento, valor,
    CLI.nomecli, fonecli
from
	tbos as OSER
inner join
	tbclientes as CLI
	on (CLI.idcli = OSER.idcli);