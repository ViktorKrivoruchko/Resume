SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `that_to_three` DEFAULT CHARACTER SET utf8 ;
USE `that_to_three` ;


CREATE TABLE IF NOT EXISTS `that_to_three`.`Пациент` (
  `idПациент` INT NOT NULL,
  `пФИО` VARCHAR(45) NOT NULL,
  `Дата рождения` DATE,
  `Пол` VARCHAR(10) NOT NULL,
  `Контактные данные` VARCHAR(15) NOT NULL,
  `Номер медкарты` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idПациент`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `that_to_three`.`Услуга` (
  `idУслуга` INT NOT NULL,
  `Название` VARCHAR(25) NOT NULL,
  `Стоимость` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`idУслуга`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `that_to_three`.`Врач` (
  `idВрач` INT NOT NULL,
  `вФИО` VARCHAR(45) NOT NULL,
  `Специальность` VARCHAR(20) NOT NULL,
  `Контактные данные` VARCHAR(15) NOT NULL,
  `Кабинет` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`idВрач`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `that_to_three`.`Талон` (
  `idТалон` INT NOT NULL,
  `ФИО пациента` INT NOT NULL,
  `Пол пациента` INT NOT NULL,
  `Дата рождения` INT NOT NULL,
  `ФИО врача` INT NOT NULL,
  `Кабинет` INT NOT NULL,
  `Название услуги` INT NOT NULL,
  `Дата` DATE,
  PRIMARY KEY (`idТалон`),
  INDEX `рпшкпт1_idx` (`ФИО пациента` ASC) VISIBLE,
  INDEX `ттшгтт1_idx` (`ФИО врача` ASC) VISIBLE,
  INDEX `пеуру1_idx` (`Название услуги` ASC) VISIBLE,
  CONSTRAINT `рпшкпт1`
    FOREIGN KEY (`ФИО пациента`)
    REFERENCES `that_to_three`.`Пациент` (`idПациент`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `пеуру1`
    FOREIGN KEY (`Название услуги`)
    REFERENCES `that_to_three`.`Услуга` (`idУслуга`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ттшгтт1`
    FOREIGN KEY (`ФИО врача`)
    REFERENCES `that_to_three`.`Врач` (`idВрач`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


START TRANSACTION;
USE `that_to_three`;
INSERT INTO `that_to_three`.`Пациент` (`idПациент`, `пФИО`, `Дата рождения`, `Пол`, `Контактные данные`, `Номер медкарты`) VALUES (1, 'Петров Иван Иванович', '1974-12-03', 'Мужской', "85125325353", "0001");
INSERT INTO `that_to_three`.`Пациент` (`idПациент`, `пФИО`, `Дата рождения`, `Пол`, `Контактные данные`, `Номер медкарты`) VALUES (2, 'Игорев Степан Алексеевич', '1981-01-01', 'Мужской', "851262462353", "0002");
INSERT INTO `that_to_three`.`Пациент` (`idПациент`, `пФИО`, `Дата рождения`, `Пол`, `Контактные данные`, `Номер медкарты`) VALUES (3, 'Петляева Ирина Игоревна', '2000-05-14', 'Женский', "851253347733", "0003");
INSERT INTO `that_to_three`.`Пациент` (`idПациент`, `пФИО`, `Дата рождения`, `Пол`, `Контактные данные`, `Номер медкарты`) VALUES (4, 'Борисова Светлана Леонидовна', '1984-05-10', 'Женский', "826232353", "0004");
INSERT INTO `that_to_three`.`Пациент` (`idПациент`, `пФИО`, `Дата рождения`, `Пол`, `Контактные данные`, `Номер медкарты`) VALUES (5, 'Кашкин Всеволод Дмитриевич', '1999-05-28', 'Мужской', "8512536432653", "0005");
INSERT INTO `that_to_three`.`Пациент` (`idПациент`, `пФИО`, `Дата рождения`, `Пол`, `Контактные данные`, `Номер медкарты`) VALUES (6, 'Акулов Владимир Евгеньевич', '2002-07-18', 'Мужской', "8512536346", "0006");
INSERT INTO `that_to_three`.`Пациент` (`idПациент`, `пФИО`, `Дата рождения`, `Пол`, `Контактные данные`, `Номер медкарты`) VALUES (7, 'Скоробогатов Егор Иванович', '2004-10-05', 'Мужской', "85125373733", 0007);

COMMIT;


START TRANSACTION;
USE `that_to_three`;
INSERT INTO `that_to_three`.`Услуга` (`idУслуга`, `Название`, `Стоимость`) VALUES (15, 'Чистка зубов', '500');
INSERT INTO `that_to_three`.`Услуга` (`idУслуга`, `Название`, `Стоимость`) VALUES (16, 'Удаление зуба', '2000');
INSERT INTO `that_to_three`.`Услуга` (`idУслуга`, `Название`, `Стоимость`) VALUES (17, 'Лечение кариеса', '2500');
INSERT INTO `that_to_three`.`Услуга` (`idУслуга`, `Название`, `Стоимость`) VALUES (18, 'Профилактический осмотр', '500');
INSERT INTO `that_to_three`.`Услуга` (`idУслуга`, `Название`, `Стоимость`) VALUES (19, 'Установка брекетов', '10000');

COMMIT;


START TRANSACTION;
USE `that_to_three`;
INSERT INTO `that_to_three`.`Врач` (`idВрач`, `вФИО`, `Специальность`, `Контактные данные`, `Кабинет`) VALUES (20, 'Аносова Надежда Владимировна', 'Дантист', '8915151255', '101');
INSERT INTO `that_to_three`.`Врач` (`idВрач`, `вФИО`, `Специальность`, `Контактные данные`, `Кабинет`) VALUES (21, 'Смолин Игорь Иванович', 'Дантист', '89215135567', '102');
INSERT INTO `that_to_three`.`Врач` (`idВрач`, `вФИО`, `Специальность`, `Контактные данные`, `Кабинет`) VALUES (22, 'Дмитриенко Анна Дмитриевна', 'Дантист', '8953268568', '103');
INSERT INTO `that_to_three`.`Врач` (`idВрач`, `вФИО`, `Специальность`, `Контактные данные`, `Кабинет`) VALUES (23, 'Смирнова Валерия Викторовна', 'Дантист', '89743256813', '104');


COMMIT;


START TRANSACTION;
USE `that_to_three`;
INSERT INTO `that_to_three`.`Талон` (`idТалон`, `ФИО пациента`, `Пол пациента`, `Дата рождения`, `ФИО врача`, `Кабинет`, `Название услуги`, `Дата`) VALUES (24, 1, 1, 1, 20, 20, 15, '2023-05-14');
INSERT INTO `that_to_three`.`Талон` (`idТалон`, `ФИО пациента`, `Пол пациента`, `Дата рождения`, `ФИО врача`, `Кабинет`, `Название услуги`, `Дата`) VALUES (25, 2, 2, 2, 21, 21, 17, '2023-05-07');
INSERT INTO `that_to_three`.`Талон` (`idТалон`, `ФИО пациента`, `Пол пациента`, `Дата рождения`, `ФИО врача`, `Кабинет`, `Название услуги`, `Дата`) VALUES (26, 3, 3, 3, 22, 22, 19, '2023-05-11');
INSERT INTO `that_to_three`.`Талон` (`idТалон`, `ФИО пациента`, `Пол пациента`, `Дата рождения`, `ФИО врача`, `Кабинет`, `Название услуги`, `Дата`) VALUES (27, 4, 4, 4, 22, 22, 16, '2023-05-15');
INSERT INTO `that_to_three`.`Талон` (`idТалон`, `ФИО пациента`, `Пол пациента`, `Дата рождения`, `ФИО врача`, `Кабинет`, `Название услуги`, `Дата`) VALUES (28, 5, 5, 5, 20, 20, 18, '2023-05-05');
INSERT INTO `that_to_three`.`Талон` (`idТалон`, `ФИО пациента`, `Пол пациента`, `Дата рождения`, `ФИО врача`, `Кабинет`, `Название услуги`, `Дата`) VALUES (29, 6, 6, 6, 23, 23, 16, '2023-04-25');
INSERT INTO `that_to_three`.`Талон` (`idТалон`, `ФИО пациента`, `Пол пациента`, `Дата рождения`, `ФИО врача`, `Кабинет`, `Название услуги`, `Дата`) VALUES (30, 7, 7, 7, 21, 21, 18, '2023-04-18');


COMMIT;


-- 1.   Поиск всех пациентов, зарегистрированных в поликлиники
SELECT пФИО, `Дата рождения`, Пол
FROM Пациент;

-- 2.	Поиск пациента по фамилии, имени и отчеству.
SELECT пФИО, `Дата рождения`, Пол
FROM Пациент
WHERE пФИО = 'Кашкин Всеволод Дмитриевич';

-- 3.	Поиск медицинской карты пациента по номеру.
SELECT пФИО, `Номер медкарты`
FROM Пациент
WHERE `Номер медкарты` = '0001';

-- 4.	Поиск всех врачей, работающих в поликлинике.
SELECT вФИО, Специальность
FROM Врач;

-- 5.	Поиск врача по ФИО или должности.
SELECT вФИО, Специальность, `Контактные данные`, Кабинет
FROM Врач
WHERE вФИО = 'Аносова Надежда Владимировна';

-- 6.	Поиск записей на прием к врачу или на процедуры.
SELECT пФИО, Название, вФИО , Дата
FROM Талон
join Пациент on idПациент = `ФИО пациента`
join Услуга on idУслуга = `Название услуги`
join Врач on idВрач = `ФИО врача`;

-- 7.	Поиск записей к врачу в мае
SELECT вФИО, Название, Дата
FROM Талон
join Врач on idВрач = `ФИО врача`
join Услуга on idУслуга = `Название услуги`
WHERE extract(month from Дата) = 05;

-- 8.	Поиск записей на определённую процедуру
SELECT пФИО, Название, Дата
FROM Талон
join Пациент on idПациент = `ФИО пациента`
join Услуга on idУслуга = `Название услуги`
WHERE Название = 'Удаление зуба'