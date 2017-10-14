
create database Evento;
use Evento;

------------------------------------------
create table usuario (
id int(10) not null primary key auto_increment,
login varchar(50) not null , 
senha varchar (60) not null,
id_P_Fisica int (10) not null,
id_P_Juri int (10) not null,
CONSTRAINT fk_P_Fisica 
	FOREIGN KEY (id_P_Fisica)
    REFERENCES P_Fisica (id),
CONSTRAINT fk_P_Juri
	FOREIGN KEY (id_P_Juri)
    REFERENCES P_Juri (id)
);
---------------------------------------------
create table P_Fisica (
id int (10) not null primary key auto_increment,
nomecomp varchar (80) not null,
cpf int(11) not null unique,
rg int (12) not null ,
end_res varchar (100) not null,
telefone int (60) not null,
email varchar (70) not null unique,
id_C_Credito int (10) not null,
CONSTRAINT fk_C_Credito
	FOREIGN KEY (id_C_Credito)
    REFERENCES C_Credito (id)

);
-----------------------------------------------
create table P_Juri (
id int (10) not null primary key auto_increment,
nomefantasia varchar (90) not null,
inscri_estadual varchar (50) not null,
razaosocial varchar (100) not null,
endereco varchar (100) not null,
telefone int(30) not null,
nomeresponsavel varchar (60) not null,
email varchar (30) not null,
id_C_Credito int (10) not null,
id_boleto int (10) not null,
CONSTRAINT fk_C_Credito
	FOREIGN KEY (id_C_Credito)
    REFERENCES C_Credito (id),
CONSTRAINT fk_boleto
	FOREIGN KEY (id_boleto)
    REFERENCES boleto (id)
);
-------------------------------------------------
create table C_Credito (
id int (10) not null primary key auto_increment,
num_conta int(70) not null,
num_agencia int (20) not null,
bandeira varchar(70) not null,
vencimento date not null,
codigo int (6) not null
);
-------------------------------------------------
create table boleto (
id int(10) not null primary key auto_increment,
codigobarra int(100) not null,
vencimento date not null
);
--------------------------------------------------
create table eventos (
id int(10) not null primary key auto_increment,
nome varchar (200) not null,
dataevento date not null,
num_vagas int (200) not null,
valoringresso float (60) not null,
statusaprov boolean not null,
tipoevento varchar (110) not null,
material_nescessario varchar (100) not null
);
-------------------------------------------------
create table participa_evento (
id int (10) not null primary key auto_increment,
id_usuario int (10) not null,
id_eventos int (10) not null,

CONSTRAINT fk_usuario 
	FOREIGN KEY (id_usuario)
    REFERENCES usuario (id),
CONSTRAINT fk_eventos
	FOREIGN KEY (id_eventos)
    REFERENCES eventos (id)
);
------------------------------------------------
create table pagamento(
id int (10) not null primary key auto_increment,
id_C_Credito int (10) not null,
id_boleto int(10) not null,
CONSTRAINT fk_C_Credito 
	FOREIGN KEY (id_C_Credito)
    REFERENCES C_Credito (id),
CONSTRAINT fk_boleto
	FOREIGN KEY (id_boleto)
    REFERENCES boleto (id)
);
-------------------------------------------------
create table participa_pagamento (
id_participa_evento int (10) not null,
id_pagamento int(10) not null,
CONSTRAINT fk_participa_evento 
	FOREIGN KEY (id_participa_evento)
    REFERENCES participa_evento (id),
CONSTRAINT fk_pagamento
	FOREIGN KEY (id_pagamento)
    REFERENCES pagamento (id),
primary key (id_participa_evento,id_pagamento)
);
--------------------------------------------------





