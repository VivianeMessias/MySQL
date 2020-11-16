create database if not exists db_faculdade;
use db_faculdade;

create table if not exists tbl_departamento(
id_departamento tinyint primary key auto_increment,
nome_departamento varchar(60) not null
);

create table if not exists tbl_professor(
id_professor tinyint primary key auto_increment,
nome_professor varchar(50) not null,
sobrenome_professor varchar(50) not null,
cpf varchar(15) not null,
status_professor tinyint,
id_departamento tinyint,
constraint fk_prof_depart foreign key (id_departamento) references tbl_departamento(id_departamento)
);

create table if not exists tbl_curso(
id_curso tinyint primary key auto_increment,
nome_curso varchar(100) not null,
id_departamento tinyint,
constraint fk_curso_depart foreign key (id_departamento) references tbl_departamento(id_departamento)
);

create table if not exists tbl_periodo(
id_periodo tinyint primary key auto_increment,
periodo varchar(10) not null
);

create table if not exists tbl_turma(
id_turma tinyint primary key auto_increment,
num_alunos int not null,
data_inicio date not null,
data_fim date not null,
id_periodo tinyint,
id_curso tinyint,
constraint fk_turma_periodo foreign key (id_periodo) references tbl_periodo(id_periodo),
constraint fk_turma_curso foreign key (id_curso) references tbl_curso(id_curso)
);

create table if not exists tbl_disciplina(
id_disciplina tinyint primary key auto_increment,
nome_disc varchar(100) not null,
descricao varchar(100) not null,
num_alunos int not null,
carga_horaria int not null,
id_departamento tinyint,
constraint fk_disc_depart foreign key (id_departamento) references tbl_departamento(id_departamento)
);

create table if not exists tbl_prof_disciplina(
id_professor tinyint,
id_disciplina tinyint,
primary key (id_professor, id_disciplina),
constraint fk_prof_disc_prof foreign key (id_professor) references tbl_professor(id_professor),
constraint fk_disc_prof_disc foreign key (id_disciplina) references tbl_disciplina(id_disciplina)
);

create table if not exists tbl_curso_disciplina(
id_curso tinyint,
id_disciplina tinyint,
primary key (id_curso, id_disciplina),
constraint fk_curso_disc_curso foreign key (id_curso) references tbl_curso(id_curso),
constraint fk_disc_curso_disc foreign key (id_disciplina) references tbl_disciplina(id_disciplina)
);

create table if not exists tbl_aluno(
id_aluno tinyint primary key auto_increment,
nome_aluno varchar(50) not  null,
sobrenome_aluno varchar(50) not null,
cpf varchar(15) not null,
status_aluno tinyint not null,
id_turma tinyint,
id_curso tinyint,
constraint fk_aluno_turma foreign key (id_turma) references tbl_turma(id_turma),
constraint fk_aluno_curso foreign key (id_curso) references tbl_curso(id_curso)
);

create table if not exists tbl_aluno_disc(
id_aluno tinyint,
id_disciplina tinyint,
primary key (id_aluno, id_disciplina),
constraint fk_aluno_disc_aluno foreign key (id_aluno) references tbl_aluno(id_aluno),
constraint fk_disc_aluno_disc foreign key (id_disciplina) references tbl_disciplina(id_disciplina)
);

create table if not exists tbl_historico(
id_historico tinyint primary key auto_increment,
data_inicio date not null,
data_fim date not null,
id_aluno tinyint,
constraint fk_aluno_hist foreign key (id_aluno) references tbl_aluno(id_aluno)
);

create table if not exists tbl_disc_hist(
id_historico tinyint,
id_disciplina tinyint,
primary key (id_historico, id_disciplina),
nota int not null,
frequencia int not null,
constraint fk_hist_disc_hist foreign key (id_historico) references tbl_historico(id_historico),
constraint fk_disc_hist_disc foreign key (id_disciplina) references tbl_disciplina(id_disciplina)
);

create table if not exists tbl_tipo_telefone(
id_tipo_telefone tinyint primary key auto_increment,
tipo_telefone varchar(10) not null
);

create table if not exists tbl_telefone_aluno(
id_telefone tinyint primary key auto_increment,
num_telefone varchar(25) not null,
id_aluno tinyint,
id_tipo_telefone tinyint,
constraint fk_aluno_tel foreign key (id_aluno) references tbl_aluno(id_aluno),
constraint fk_tipotel_tel foreign key (id_tipo_telefone) references tbl_tipo_telefone(id_tipo_telefone)
);

create table if not exists tbl_tipo_lougradouro(
id_tipo_lougradouro tinyint primary key auto_increment,
tipo_lougradouro varchar(15) not null
);

create table if not exists tbl_endereco_aluno(
id_endereco_aluno tinyint primary key auto_increment,
nome_rua varchar(30) not null,
numero varchar(10) not null,
complemento varchar(20) not null,
cidade varchar(30) not null,
uf varchar(2) not null,
cep varchar(10) not null,
id_aluno tinyint,
id_tipo_lougradouro tinyint,
constraint fk_aluno_end foreign key (id_aluno) references tbl_aluno(id_aluno),
constraint fk_tipolougr_end foreign key (id_tipo_lougradouro) references tbl_tipo_lougradouro(id_tipo_lougradouro)
);
alter table tbl_departamento auto_increment = 1;
 
insert into tbl_departamento (nome_departamento)
values("Ciências Humanas"),
	  ("Biológicas"),
	  ("Exatas"),
      ("Tecnologia");

select * from tbl_departamento;


