CREATE SCHEMA IF NOT EXISTS that_to_three;
 
CREATE TABLE IF NOT EXISTS that_to_three.Самолет ( 
  idСамолет SERIAL PRIMARY KEY, 
  Название VARCHAR(15) NOT NULL 
);

CREATE TABLE IF NOT EXISTS that_to_three.Аэропорт (
  idАэропорт SERIAL PRIMARY KEY,
  Наименование VARCHAR(15) NOT NULL,
  Город VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS that_to_three.Пассажир ( 
  idПассажир SERIAL PRIMARY KEY,  
  ФИО VARCHAR(45) NOT NULL, 
  Паспортные_данные VARCHAR(45) NOT NULL
);
 
CREATE TABLE IF NOT EXISTS that_to_three.Билет (
  idБилет SERIAL PRIMARY KEY,
  Номер VARCHAR(45) NOT NULL,
  Дата DATE,
  Время_вылета TIME,
  Самолёт INT NOT NULL,
  Аэропорт INT NOT NULL,
  Пассажир INT NOT NULL,
  CONSTRAINT "рпшкпт" 
    FOREIGN KEY (Самолёт) 
    REFERENCES that_to_three.Самолет (idСамолет) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION, 
  CONSTRAINT "ттшгтт" 
    FOREIGN KEY (Аэропорт) 
    REFERENCES that_to_three.Аэропорт (idАэропорт) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION,
  CONSTRAINT "рпшкпт_idx"
    FOREIGN KEY (Самолёт) 
    REFERENCES that_to_three.Самолет (idСамолет) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION,
  CONSTRAINT "ттшгтт_idx"
    FOREIGN KEY (Аэропорт) 
    REFERENCES that_to_three.Аэропорт (idАэропорт) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION,
  CONSTRAINT "ирол" 
    FOREIGN KEY (Пассажир) 
    REFERENCES that_to_three.Пассажир (idПассажир) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION,
  CONSTRAINT "ирол_idx" 
    FOREIGN KEY (Пассажир) 
    REFERENCES that_to_three.Пассажир (idПассажир) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION
);
 
BEGIN; 
INSERT INTO that_to_three.Самолет (idСамолет, Название) VALUES (1, 'Лучший'); 
INSERT INTO that_to_three.Самолет (idСамолет, Название) VALUES (2, 'Летающий'); 
INSERT INTO that_to_three.Самолет (idСамолет, Название) VALUES (3, 'ПМЖЛ'); 
INSERT INTO that_to_three.Самолет (idСамолет, Название) VALUES (4, 'Агроном');
INSERT INTO that_to_three.Самолет (idСамолет, Название) VALUES (5, 'Просторы'); 
COMMIT;

BEGIN; 
SET search_path TO that_to_three; 
INSERT INTO Аэропорт (idАэропорт, Наименование, Город) VALUES (6, 'Черниговский', 'Москва'); 
INSERT INTO Аэропорт (idАэропорт, Наименование, Город) VALUES (7, 'Смольный', 'Москва'); 
INSERT INTO Аэропорт (idАэропорт, Наименование, Город) VALUES (8, 'Добрый', 'Самара'); 
INSERT INTO Аэропорт (idАэропорт, Наименование, Город) VALUES (9, 'Смешной', 'Калининград'); 
INSERT INTO Аэропорт (idАэропорт, Наименование, Город) VALUES (10, 'Счастливый', 'Самара'); 
 
COMMIT; 

BEGIN; 
SET search_path TO that_to_three; 
INSERT INTO Пассажир (idПассажир, ФИО, Паспортные_данные) VALUES (11, 'Иванов Иван Игоревич', '23144'); 
INSERT INTO Пассажир (idПассажир, ФИО, Паспортные_данные) VALUES (12, 'Петров Степан Семенович', '251351');
INSERT INTO Пассажир (idПассажир, ФИО, Паспортные_данные) VALUES (13, 'Шишков Иван Алексеевич', '261361');
INSERT INTO Пассажир (idПассажир, ФИО, Паспортные_данные) VALUES (14, 'Жукова Лена Викторовна', '2362');
INSERT INTO Пассажир (idПассажир, ФИО, Паспортные_данные) VALUES (15, 'Дмитриенко Леонид Дмитриевич', '2754');
 
COMMIT;

BEGIN; 
SET search_path TO that_to_three; 
INSERT INTO Билет (idБилет, Номер, Дата, Время_вылета, Самолёт, Аэропорт, Пассажир) VALUES (16, '15161', '2022-04-25', '13:12:11', 1, 10, 11); 
INSERT INTO Билет (idБилет, Номер, Дата, Время_вылета, Самолёт, Аэропорт, Пассажир) VALUES (17, '754735', '2022-05-14', '13:12:11', 2, 9, 12);
INSERT INTO Билет (idБилет, Номер, Дата, Время_вылета, Самолёт, Аэропорт, Пассажир) VALUES (18, '84534', '2022-05-25', '13:12:11', 5, 8, 13);
INSERT INTO Билет (idБилет, Номер, Дата, Время_вылета, Самолёт, Аэропорт, Пассажир) VALUES (19, '84632', '2022-01-25', '13:12:11', 3, 6, 14);
INSERT INTO Билет (idБилет, Номер, Дата, Время_вылета, Самолёт, Аэропорт, Пассажир) VALUES (20, '34788', '2022-02-25', '13:12:11', 4, 7, 15);
COMMIT;