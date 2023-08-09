CREATE SCHEMA IF NOT EXISTS that_to_three;
 
CREATE TABLE IF NOT EXISTS that_to_three.Субъект ( 
  idСубъект INTEGER NOT NULL, 
  Название VARCHAR(25) NOT NULL, 
  PRIMARY KEY (idСубъект)
);
 
CREATE TABLE IF NOT EXISTS that_to_three.Город ( 
  idГород INTEGER NOT NULL, 
  Название VARCHAR(15) NOT NULL, 
  Субъект INTEGER NOT NULL, 
  PRIMARY KEY (idГород), 
  CONSTRAINT пльу FOREIGN KEY (Субъект) 
    REFERENCES that_to_three.Субъект(idСубъект) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS that_to_three."Семейное положение" (
  "idСемейное положение" SERIAL PRIMARY KEY,
  "Наименование" VARCHAR(15) NOT NULL
);
 
CREATE TABLE IF NOT EXISTS that_to_three."Заявитель" (
  "idЗаявитель" SERIAL PRIMARY KEY,
  "ФИО" VARCHAR(45) NOT NULL,
  "Адрес жительства" INT NOT NULL,
  "Семейное положение" INT NOT NULL,
  CONSTRAINT "рпшкпт" 
    FOREIGN KEY ("Адрес жительства") 
    REFERENCES that_to_three."Город" ("idГород") 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION, 
  CONSTRAINT "ттшгтт" 
    FOREIGN KEY ("Семейное положение") 
    REFERENCES that_to_three."Семейное положение" ("idСемейное положение") 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION,
  CONSTRAINT "рпшкпт_idx"
    FOREIGN KEY ("Адрес жительства")
    REFERENCES that_to_three."Город" ("idГород")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "ттшгтт_idx"
    FOREIGN KEY ("Семейное положение")
    REFERENCES that_to_three."Семейное положение" ("idСемейное положение")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS that_to_three.Заявление ( 
  idЗаявление INT NOT NULL, 
  Человек INT NOT NULL, 
  Регистрационный_номер VARCHAR(45) NOT NULL, 
  Дата DATE, 
  PRIMARY KEY (idЗаявление), 
  CONSTRAINT ирол FOREIGN KEY (Человек) 
    REFERENCES that_to_three.Заявитель(idЗаявитель) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION);
 
CREATE INDEX IF NOT EXISTS ирол_idx ON that_to_three.Заявление(Человек ASC); 
 
BEGIN; 
INSERT INTO that_to_three.Субъект (idСубъект, Название) VALUES (1, 'Алтайский край'); 
INSERT INTO that_to_three.Субъект (idСубъект, Название) VALUES (2, 'Московская область'); 
INSERT INTO that_to_three.Субъект (idСубъект, Название) VALUES (3, 'Новосибирская область'); 
COMMIT;

BEGIN; 
SET search_path TO that_to_three; 
INSERT INTO Город (idГород, Название, Субъект) VALUES (4, 'Барнаул', 1); 
INSERT INTO Город (idГород, Название, Субъект) VALUES (5, 'Алейск', 1); 
INSERT INTO Город (idГород, Название, Субъект) VALUES (6, 'Москва', 2); 
INSERT INTO Город (idГород, Название, Субъект) VALUES (7, 'Новосибирск', 3); 
 
COMMIT; 

BEGIN; 
SET search_path TO that_to_three; 
INSERT INTO "Семейное положение" ("idСемейное положение", "Наименование") VALUES (22, 'Женат(а)'); 
INSERT INTO "Семейное положение" ("idСемейное положение", "Наименование") VALUES (23, 'Не женат(а)'); 
INSERT INTO "Семейное положение" ("idСемейное положение", "Наименование") VALUES (24, 'Разведен(а)'); 
 
COMMIT;

BEGIN; 
SET search_path TO that_to_three; 
INSERT INTO Заявитель (idЗаявитель, ФИО, "Адрес жительства", "Семейное положение") VALUES (8, 'Шишков Иван Алексеевич', 5, 24); 
INSERT INTO Заявитель (idЗаявитель, ФИО, "Адрес жительства", "Семейное положение") VALUES (9, 'Криворучко Виктор Евгеньевич', 4, 23); 
INSERT INTO Заявитель (idЗаявитель, ФИО, "Адрес жительства", "Семейное положение") VALUES (10, 'Алексеев Петр Иванович', 7, 22); 
INSERT INTO Заявитель (idЗаявитель, ФИО, "Адрес жительства", "Семейное положение") VALUES (11, 'Захваткин Максим Алексеевич', 4, 22); 
INSERT INTO Заявитель (idЗаявитель, ФИО, "Адрес жительства", "Семейное положение") VALUES (12, 'Чуканова Елизавета Павловна', 6, 23); 
INSERT INTO Заявитель (idЗаявитель, ФИО, "Адрес жительства", "Семейное положение") VALUES (13, 'Смирнова Валерия Артемовна', 7, 24); 
INSERT INTO Заявитель (idЗаявитель, ФИО, "Адрес жительства", "Семейное положение") VALUES (14, 'Гончаренко Егор Семенович', 6, 23); 
COMMIT; 

BEGIN; 
SET search_path TO that_to_three; 
INSERT INTO Заявление (idЗаявление, Человек, "Регистрационный_номер", "Дата") VALUES (15, 8, '15325622', '2023-12-25'); 
INSERT INTO Заявление (idЗаявление, Человек, "Регистрационный_номер", "Дата") VALUES (16, 9, '623636', '2023-09-24'); 
INSERT INTO Заявление (idЗаявление, Человек, "Регистрационный_номер", "Дата") VALUES (17, 10, '26264', '2023-01-14'); 
INSERT INTO Заявление (idЗаявление, Человек, "Регистрационный_номер", "Дата") VALUES (18, 11, '62643634', '2023-05-07'); 
INSERT INTO Заявление (idЗаявление, Человек, "Регистрационный_номер", "Дата") VALUES (19, 12, '673473735', '2023-11-22'); 
INSERT INTO Заявление (idЗаявление, Человек, "Регистрационный_номер", "Дата") VALUES (20, 13, '73737537634', '2023-03-21'); 
INSERT INTO Заявление (idЗаявление, Человек, "Регистрационный_номер", "Дата") VALUES (21, 14, '426457594', '2023-04-22'); 
COMMIT;