create database db_generation_game_online;

use db_generation_game_online;

drop table tb_classe;

create table tb_classe (
id_classe bigint auto_increment,
classe varchar(255) not null,
nivel bigint(10) not null,
arma varchar(255),
primary key (id_classe)
);

alter table tb_personagem  drop column classe;
insert into tb_classe(classe, nivel, arma) values 
('guerreiro', 70, 'espada e escudo'),('feiticeiro', 75, 'magia de ataque'),
('necromante', 70, 'magia do caos'), ('druida', 55, 'magia de cura'),('fada', 75, 'magia refinada');

select * from tb_classe;


create table tb_personagem (
id_personagem bigint auto_increment primary key,
nome varchar(255),
poder_de_ataque bigint,
poder_de_defesa bigint,
classe varchar(255),
origem varchar(255),
fk_id_classe bigint,
foreign key (fk_id_classe) references tb_classe(id_classe)
);

select * from tb_classe;
select * from tb_personagem;

-- excluir coluna classe criada de forma errada
-- ALTER TABLE <tabela> DROP COLUMN <coluna>;
ALTER TABLE tb_personagem drop column classe;
-- drop table tb_personagem;

insert into tb_personagem(nome, poder_de_ataque, poder_de_defesa, origem, fk_id_classe) values ('Legolas',7000,2000,'Terra dos Elfos',1);
insert into tb_personagem(nome, poder_de_ataque, poder_de_defesa, origem, fk_id_classe) values ('Voldmort',10000,9600,'Harry Land',2);
insert into tb_personagem(nome, poder_de_ataque, poder_de_defesa, origem, fk_id_classe) values ('super mato',5000,8000,'Terra dos Elfos',3);
insert into tb_personagem(nome, poder_de_ataque, poder_de_defesa, origem, fk_id_classe) values ('Falamansa',10000,7848,'Terra do Forró',4);
insert into tb_personagem(nome, poder_de_ataque, poder_de_defesa, origem, fk_id_classe) values ('Araketu',8000,7778,'Terra da Pipoca',2);
insert into tb_personagem(nome, poder_de_ataque, poder_de_defesa, origem, fk_id_classe) values ('Economia',9977,7778,'Terra Brasilis',5);

-- select*from tb_classe c inner join tb_personagem p on p.fk_id_classe = c.id_classe;

-- 3 inner joins, mesmo resultado.
select*from tb_classe inner join tb_personagem on tb_personagem.fk_id_classe = tb_classe.id_classe;
select*from tb_classe inner join tb_personagem on tb_classe.id_classe = tb_personagem.fk_id_classe;
select*from tb_classe c inner join tb_personagem p on p.fk_id_classe = c.id_classe;

select * from tb_personagem where poder_de_ataque > 2000;
select * from tb_personagem where poder_de_ataque between 1000 and 2000;
select * from tb_personagem where nome like '%c%';

/* não tenho classe arqueiro, mas tenho feiticeiro então selecionando os personagens de uma classe específica com inner join.
pois as tabelas estão separadas */
select* from tb_personagem p inner join tb_classe c on p.fk_id_classe = c.id_classe where classe = "feiticeiro";

