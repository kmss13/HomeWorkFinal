CREATE DATABASE  mans_friends;


USE mans_friends;

CREATE TABLE animal_class
(
	Id INT AUTO_INCREMENT PRIMARY KEY, 
	Class_name VARCHAR(40)
);

INSERT INTO animal_class (Class_name)
VALUES ('pack'),
('pet');  


CREATE TABLE pack_animals
(
	  Id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR (20),
    Class_id INT,
    FOREIGN KEY (Class_id) REFERENCES animal_class (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO pack_animals (type, Class_id)
VALUES ('horses', 1),
('cow', 2),  
('donkey', 3),
('camel', 4); 
    
CREATE TABLE pets
(
	  Id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR (20),
    Class_id INT,
    FOREIGN KEY (Class_id) REFERENCES animal_class (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO pets (type, Class_id)
VALUES ('dog', 1),
('cat', 2),  
('parrot', 3),
('hamsters', 4); 

CREATE TABLE cats 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    type_id int,
    Foreign KEY (type_id) REFERENCES pets (Id) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO cats (Name, Birthday, Commands,types_id)
VALUES ('Boris', '2018-21-01', 'meow', 2),
('Woo', '2016-07-02', "sit_down", 2),
('Fel', '2022-01-01', "fooo", 2)  
('Sheldon', '2020-01-01', "meow", 2); 

CREATE TABLE dogs 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    type_id int,
    Foreign KEY (type_id) REFERENCES pets (Id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO dogs (Name, Birthday, Commands, type_id)
VALUES ('Don', '2017-05-01', 'give me your paw', 1),
('Sharik', '2023-06-12', "sit down", 1),
('Boss', '2021-06-12', "give me your paw", 1),  
('Asa', '2016-08-01', "come to me", 1), 
('Dina', '2021-02-10', "voice", 1);

CREATE TABLE hamsters 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    type_id int,
    Foreign KEY (type_id) REFERENCES pets (Id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO hamsters (Name, Birthday, Commands, type_id)
VALUES ('Boo', '2020-10-12', '', 4);

CREATE TABLE parrot 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    type_id int,
    Foreign KEY (type_id) REFERENCES pets (Id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO hamsters (Name, Birthday, Commands, type_id)
VALUES ('Kar', '2012-10-10', '', 3);


CREATE TABLE horses 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    type_id int,
    Foreign KEY (type_id) REFERENCES pack_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO horses (Name, Birthday, Commands, type_id)
VALUES ('Molnia', '2020-12-12', 'run', 1);

CREATE TABLE donkeys 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    type_id int,
    Foreign KEY (type_id) REFERENCES pack_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO donkeys (Name, Birthday, Commands, type_id)
VALUES ('A', '2010-05-10', '', 2),
('B', '2011-03-07', '' 2),  
('C', '2012-05-12', '' 2), 
('D', '2013-12-10', '', 2);

CREATE TABLE camels 
(       
    Id INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    type_id int,
    Foreign KEY (type_id) REFERENCES pack_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO camels (Name, Birthday, Commands, type_id)
VALUES ('A', '2023-04-10', 'come back', 3),
('B', '2022-07-12', 'stop', 3),   
('C', '2021-10-10', 'run', 3);
  

DELETE * FROM camels;

SELECT Name, Birthday, Commands FROM horses
UNION SELECT  Name, Birthday, Commands FROM donkeys;


CREATE TEMPORARY TABLE animals AS 
SELECT *, 'horses' as genus FROM horses
UNION SELECT *, 'donkey' AS genus FROM donkeys
UNION SELECT *, 'gods' AS genus FROM dogs
UNION SELECT *, 'cats' AS genus FROM cats
UNION SELECT *, 'hamsters' AS genus FROM hamsters;

CREATE TABLE young_animal AS
SELECT Name, Birthday, Commands, genus, TIMESTAMPDIFF(MONTH, Birthday, CURDATE()) AS Age_in_month
FROM animals WHERE Birthday BETWEEN ADDDATE(curdate(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);
 
SELECT * FROM young_animal;

    

