create database clinicaveterinaria;

use clinicaveterinaria;

-- criação de tabelas
create table veterinario
    (
         crv char(5) not null primary key,
         nome varchar(50) not null,
         endereco varchar(100) not null,
         celular char(9) null,
         cpf char(11) not null unique
    );

create table consulta
    ( 
         dataconsulta date not null,
         horario time not null,
         valor decimal(7,2) not null,
         diagnostico varchar(100) not null,
         codigoconsulta int identity not null primary key
   );

create table animal
   (
         nome varchar(50) null,
         tipo varchar(35) not null,
         raca varchar(50) not null,
         idade tinyint null,
         alergia bit not null,
         codanimal int identity primary key
   );
create table herbivoro
   (
         altura decimal(4,2) not null,
         peso decimal(6,4) not null,
         codanimal int not null primary key,
         constraint fkanimalh foreign key (codanimal)
         references animal (codanimal)
   );

-- RELACIONAMENTO ENTRE VETERINARIO E CONSULTA

alter table consulta
add crv char(5) not null
constraint fkVetConsulta foreign key references veterinario(crv);

alter table consulta
add codanimal int not null;

alter table consulta
add constraint fkAnimalConsulta foreign key(codanimal) references animal(codanimal);

create table cliente
(
	nome varchar(30) not null,
	endereco varchar(100) not null,
	telefone char(10),
	celular char(11),
	cpf char (11) not null,
	codCliente int identity not null primary key
);

alter table animal add codCliente int not null;

alter table animal add constraint fkClienteAnimal foreign key (codCliente)
references cliente(codCliente);

-- inserção de dados

insert into veterinario (crv, nome, endereco, celular, cpf)
values ('12345', 'Victor Martins', 'Av. Cecília, 61', '987656575', '18461726615');

-- consulta para visualizar

select crv, nome, endereco, celular, cpf from veterinario;

insert into veterinario (crv, nome, endereco, celular, cpf)
values ('12342', 'Paulo Martins', 'Serpa, 38', '981657462', '86546377716'),
('12343', 'José Martins', 'Av. Joaquim, 15', '971846352', '81746352635'),
('12344', 'Marcos Martins', 'Rua Joaquim Bento, 39', '919473941', '41847163524'),
('12346', 'Luis Martins', 'Vera tereza, 18', '910381736', '71635264457');

insert into cliente (nome, endereco, telefone, celular, cpf)
values('Roberto', 'Av. Cecília', '44467161', '981756473', '19481748873'),
('Robeta', 'Perus', '44215618', '910821785', '16371838816'),
('José', 'Barra Funda', '44467181', '910574611', '19481748873'),
('Augusto', 'Estação da Luz', '44241161', '910476164', '57194819929'),
('Carlos', 'Rua José Augusto Moreira', '44162731', '919487152', '16471516617');

select nome, endereco, telefone, celular, cpf, codCliente from cliente;

insert into animal (nome, tipo, raca, idade, alergia, codCliente)
values ('zeus', 'cachorro', 'bulldog', 2, 0, '1'),
('salsicha', 'cachorro', 'pinscher', 1, 0, '2'),
('thor', 'cachorro', 'bulldog', 4, 1, '3'),
('cat', 'gato', 'persa', 2, 0, '4'),
('loki', 'gato', 'gato-de-bengala', 3, 1, '5');

select nome, tipo, raca, idade, alergia , codanimal from animal;

insert into consulta (dataconsulta, horario, valor, diagnostico, crv, codanimal)
values('2021-12-10', '12:00', 512.33, 'dor de barriga', '12342', '3'),
('2021-12-10', '13:00', 261.20, 'dor estomacal', '12343', '4'),
('2021-12-10', '14:00', 917.19, 'má higiene', '12344', '5'),
('2021-12-10', '15:00', 162.37, 'pulga', '12345', '6'),
('2021-12-10', '16:00', 273.81, 'dor de cabeça', '12346', '7');

select dataconsulta, horario, valor, diagnostico from consulta;

insert into herbivoro (altura, peso, codanimal)
values ('0.81', '18', '3'),
('1.19', '21', '4'),
('1.02', '8', '5'),
('0.62', '19', '6'),
('0.84', '15', '7');

select altura, peso, codanimal from herbivoro;