create database if not exists MeusLivros;
use MeusLivros;

create table if not exists tbl_assunto(
id_assunto tinyint auto_increment primary key,
assunto varchar(100) not null
);

create table if not exists tbl_categ(
id_categ tinyint auto_increment primary key,
nome_categ varchar(100) not null
);

create table if not exists tbl_edit(
id_edit smallint auto_increment primary key,
nome_edit varchar(100) not null
);

create table if not exists tbl_aut(
id_aut smallint auto_increment primary key,
nome_aut varchar(50) not null,
sobrenome_aut varchar(50) not null
);
create table if not exists tbl_livr(
id_livr mediumint auto_increment primary key,
isbn varchar(13) not null,
nome_livr varchar(50) not null,
valor_livr float not null,
data_public date not null,
id_edit smallint not null,
id_categ tinyint not null,
id_assunto tinyint not null,
constraint fk_edit_livr foreign key (id_edit) references tbl_edit(id_edit),
constraint fk_categ_livr foreign key (id_categ) references tbl_categ(id_categ),
constraint fk_assunt_livr foreign key (id_assunto) references tbl_assunto(id_assunto)
);

create table if not exists tbl_livr_aut(
id_livr_aut mediumint auto_increment primary key,
id_aut smallint not null,
id_livr mediumint not null,
constraint fk_livr_aut_aut foreign key (id_aut) references tbl_aut(id_aut),
constraint fk_livr_aut_livr foreign key (id_livr) references tbl_livr(id_livr)
);

insert into tbl_aut(nome_aut, sobrenome_aut)
values("Weslley", "Rimar");
select * from tbl_aut;

insert into tbl_edit(nome_edit)
values("Novatec");
select * from tbl_edit;

insert into tbl_assunto(assunto)
values("Informática");
select * from tbl_assunto;

insert into tbl_categ(nome_categ)
values("Livro Didático");
select * from tbl_categ;

insert into tbl_livr values (default, '9788575225295', 'Construindo Aplicações web com PHP e MySQL', 75.50, "2020-09-18", 1, 1, 1);
select count(*) from tbl_livr;


update tbl_livr set valor_livr = 50.99 where id_livr = 1;
update tbl_livr set nome_livr = 'Construindo algumas Aplicações web com PHP e MySQL' where id_livr = 1;

delete from tbl_livr where id_livr = 4;

alter table tbl_livr auto_increment = 1;

