create database db_pizzaria_legal;

use db_pizzaria_legal;

drop table tb_categoria;


create table tb_categoria(
id int primary key auto_increment,
tamanho varchar(100) not null,
categoria varchar(50) not null, 
massa varchar(50) not null
);


INSERT INTO db_pizzaria_legal.tb_categoria(`tamanho`,`categoria`, `massa`) VALUES ("gigante", "doce", "media");
INSERT INTO db_pizzaria_legal.tb_categoria(`tamanho`,`categoria`, `massa`) VALUES ("normal", "salgada", "media");
INSERT INTO db_pizzaria_legal.tb_categoria(`tamanho`,`categoria`, `massa`) VALUES ("broto", "doce", "fina");
INSERT INTO db_pizzaria_legal.tb_categoria(`tamanho`,`categoria`, `massa`) VALUES ("familia", "doce", "media");
INSERT INTO db_pizzaria_legal.tb_categoria(`tamanho`,`categoria`, `massa`) VALUES ("broto", "salgada", "pan");

select*from tb_categoria;

drop table tb_pizza;

create table tb_pizza(
id int primary key auto_increment not null, 
sabor varchar (150) not null, 
valor bigint(20) not null,
caixa varchar(50) not null, 
refrigerante varchar(50) not null, 
fk_id_categoria int, -- só coloca o not null, se ela NÃO PUDER  ficar vazia.
foreign key(fk_id_categoria) references tb_categoria(id)
);


select * from tb_pizza;


INSERT INTO db_pizzaria_legal.tb_pizza(`sabor`,`valor`, `caixa`,`refrigerante`, fk_id_categoria) VALUES ("Calabresa", "45", "presente","Pepsi", 1);
INSERT INTO db_pizzaria_legal.tb_pizza(`sabor`,`valor`, `caixa`,`refrigerante`, fk_id_categoria) VALUES ("Gorgonzola e alho poró", "58", "presente","Pepsi", 2);
INSERT INTO db_pizzaria_legal.tb_pizza(`sabor`,`valor`, `caixa`,`refrigerante`, fk_id_categoria) VALUES ("Alho", "58", "natal","Pepsi", 3);
INSERT INTO db_pizzaria_legal.tb_pizza(`sabor`,`valor`, `caixa`,`refrigerante`, fk_id_categoria) VALUES ("Parmesão", "58", "comercial","Fanta laranja", 4);
INSERT INTO db_pizzaria_legal.tb_pizza(`sabor`,`valor`, `caixa`,`refrigerante`, fk_id_categoria) VALUES ("Polvo", "58", "personalizado","teste", 5);
INSERT INTO db_pizzaria_legal.tb_pizza(`sabor`,`valor`, `caixa`,`refrigerante`, fk_id_categoria) VALUES ("Mussarela", "58", "natal","Pepsi", 5);
INSERT INTO db_pizzaria_legal.tb_pizza(`sabor`,`valor`, `caixa`,`refrigerante`, fk_id_categoria) VALUES ("Gorgonzola e alho poró", "58", "aniversário","Coca cola", 4);


select * from tb_pizza;

-- nesse select, temos que referenciar todo o caminho, banco de dados, tabela e coluna
select * from tb_pizza where valor > 45;
select * from db_pizzaria_legal.tb_pizza where valor between 29 and 60;
select * from db_pizzaria_legal.tb_pizza where sabor like '%c%';

-- fazendo inner join 
            -- tabela_a --   -- tabela_b --     
select*from tb_pizza p inner join tb_categoria c on p.fk_id_categoria = c.id;

-- puxando as pizzas de uma categoria específica.
select*from tb_categoria c inner join tb_pizza p on p.fk_id_categoria = c.id where categoria = "doce";

