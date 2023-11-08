CREATE TABLE Cliente 
( 
 id_Cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
 nome VARCHAR(80),  
 email VARCHAR(80),  
 tel VARCHAR(40),  
 senha VARCHAR(40)  
); 

CREATE TABLE Destino 
( 
 id_Destino INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
 nome_Destino VARCHAR(80),  
 preco_Destino FLOAT,  
 data_Destino DATE  
); 

CREATE TABLE compra 
( 
 id_Compra INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
 data_Compra DATE,  
 total_Compra FLOAT,  
 id_Destino INT,  
 id_Cliente INT,  
 FOREIGN KEY(id_Destino) REFERENCES Destino (id_Destino),
 FOREIGN KEY(id_Cliente) REFERENCES Cliente (id_Cliente)
); 

CREATE VIEW cliente_destino AS
select c.id_Compra, c.data_Compra, c.total_Compra, l.*, u.* 
from compra c, destino l, cliente u 
where c.id_Destino = l.id_Destino and c.id_Cliente = u.id_Cliente;

insert into Cliente (nome, email, tel, senha) values ('Suyanne Pereira','suyanne@email' ,'986137647', '123');
insert into Destino (nome_Destino, preco_Destino, data_Destino) values ('Nova York', 500.00,'2024-10-05');
insert into Compra (data_Compra, total_Compra, id_Destino, id_Cliente) values ('2023-03-10', 500.00, 2 , 1);

select c.id_Compra, c.data_Compra, c.total_Compra, l.*, u.* 
from compra c, destino l, cliente u 
where c.id_Destino = l.id_Destino and c.id_Cliente = u.id_Cliente; 