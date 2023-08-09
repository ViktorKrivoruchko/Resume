SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `that_to_three` DEFAULT CHARACTER SET utf8 ;
USE `that_to_three` ;


CREATE TABLE IF NOT EXISTS `that_to_three`.`Субъект` (
  `idСубъект` INT NOT NULL,
  `Название` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idСубъект`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `that_to_three`.`Город` (
  `idГород` INT NOT NULL,
  `Название` VARCHAR(15) NOT NULL,
  `Субъект` INT NOT NULL,
  PRIMARY KEY (`idГород`),
  INDEX `пльу_idx` (`Субъект` ASC) VISIBLE,
  CONSTRAINT `пльу`
    FOREIGN KEY (`Субъект`)
    REFERENCES `that_to_three`.`Субъект` (`idСубъект`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `that_to_three`.`Семейное положение` (
  `idСемейное положение` INT NOT NULL,
  `Наименование` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idСемейное положение`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `that_to_three`.`Заявитель` (
  `idЗаявитель` INT NOT NULL AUTO_INCREMENT,
  `ФИО` VARCHAR(45) NOT NULL,
  `Адрес жительства` INT NOT NULL,
  `Семейное положение` INT NOT NULL,
  PRIMARY KEY (`idЗаявитель`),
  INDEX `рпшкпт_idx` (`Адрес жительства` ASC) VISIBLE,
  INDEX `ттшгтт_idx` (`Семейное положение` ASC) VISIBLE,
  CONSTRAINT `рпшкпт`
    FOREIGN KEY (`Адрес жительства`)
    REFERENCES `that_to_three`.`Город` (`idГород`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ттшгтт`
    FOREIGN KEY (`Семейное положение`)
    REFERENCES `that_to_three`.`Семейное положение` (`idСемейное положение`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `that_to_three`.`Заявление` (
  `idЗаявление` INT NOT NULL,
  `Человек` INT NOT NULL,
  `Регистрационный номер` VARCHAR(45) NOT NULL,
  `Дата` DATE,
  PRIMARY KEY (`idЗаявление`),
  INDEX `ирол_idx` (`Человек` ASC) VISIBLE,
  CONSTRAINT `ирол`
    FOREIGN KEY (`Человек`)
    REFERENCES `that_to_three`.`Заявитель` (`idЗаявитель`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


START TRANSACTION;
USE `that_to_three`;
INSERT INTO `that_to_three`.`Субъект` (`idСубъект`, `Название`) VALUES (1, 'Алтайский край');
INSERT INTO `that_to_three`.`Субъект` (`idСубъект`, `Название`) VALUES (2, 'Московская область');
INSERT INTO `that_to_three`.`Субъект` (`idСубъект`, `Название`) VALUES (3, 'Новосибирская область');

COMMIT;


START TRANSACTION;
USE `that_to_three`;
INSERT INTO `that_to_three`.`Город` (`idГород`, `Название`, `Субъект`) VALUES (4, 'Барнаул', 1);
INSERT INTO `that_to_three`.`Город` (`idГород`, `Название`, `Субъект`) VALUES (5, 'Алейск', 1);
INSERT INTO `that_to_three`.`Город` (`idГород`, `Название`, `Субъект`) VALUES (6, 'Москва', 2);
INSERT INTO `that_to_three`.`Город` (`idГород`, `Название`, `Субъект`) VALUES (7, 'Новосибирск', 3);

COMMIT;


START TRANSACTION;
USE `that_to_three`;
INSERT INTO `that_to_three`.`Семейное положение` (`idСемейное положение`, `Наименование`) VALUES (22, 'Женат(а)');
INSERT INTO `that_to_three`.`Семейное положение` (`idСемейное положение`, `Наименование`) VALUES (23, 'Не женат(а)');
INSERT INTO `that_to_three`.`Семейное положение` (`idСемейное положение`, `Наименование`) VALUES (24, 'Разведен(а)');

COMMIT;


START TRANSACTION;
USE `that_to_three`;
INSERT INTO `that_to_three`.`Заявитель` (`idЗаявитель`, `ФИО`, `Адрес жительства`, `Семейное положение`) VALUES (8, 'Шишков Иван Алексеевич', 5, 24);
INSERT INTO `that_to_three`.`Заявитель` (`idЗаявитель`, `ФИО`, `Адрес жительства`, `Семейное положение`) VALUES (9, 'Криворучко Виктор Евгеньевич', 4, 23);
INSERT INTO `that_to_three`.`Заявитель` (`idЗаявитель`, `ФИО`, `Адрес жительства`, `Семейное положение`) VALUES (10, 'Алексеев Петр Иванович', 7, 22);
INSERT INTO `that_to_three`.`Заявитель` (`idЗаявитель`, `ФИО`, `Адрес жительства`, `Семейное положение`) VALUES (11, 'Захваткин Максим Алексеевич', 7, 22);
INSERT INTO `that_to_three`.`Заявитель` (`idЗаявитель`, `ФИО`, `Адрес жительства`, `Семейное положение`) VALUES (12, 'Чуканова Елизавета Павловна', 6, 23);
INSERT INTO `that_to_three`.`Заявитель` (`idЗаявитель`, `ФИО`, `Адрес жительства`, `Семейное положение`) VALUES (13, 'Смирнова Валерия Артемовна', 7, 24);
INSERT INTO `that_to_three`.`Заявитель` (`idЗаявитель`, `ФИО`, `Адрес жительства`, `Семейное положение`) VALUES (14, 'Гончаренко Егор Семенович', 6, 23);

COMMIT;


START TRANSACTION;
USE `that_to_three`;
INSERT INTO `that_to_three`.`Заявление` (`idЗаявление`, `Человек`, `Регистрационный номер`, `Дата`) VALUES (15, 8, '15325622', '2023-12-25');
INSERT INTO `that_to_three`.`Заявление` (`idЗаявление`, `Человек`, `Регистрационный номер`, `Дата`) VALUES (16, 9, '623636', '2023-09-24');
INSERT INTO `that_to_three`.`Заявление` (`idЗаявление`, `Человек`, `Регистрационный номер`, `Дата`) VALUES (17, 10, '26264', '2023-01-14');
INSERT INTO `that_to_three`.`Заявление` (`idЗаявление`, `Человек`, `Регистрационный номер`, `Дата`) VALUES (18, 11, '62643634', '2023-05-07');
INSERT INTO `that_to_three`.`Заявление` (`idЗаявление`, `Человек`, `Регистрационный номер`, `Дата`) VALUES (19, 12, '673473735', '2023-11-22');
INSERT INTO `that_to_three`.`Заявление` (`idЗаявление`, `Человек`, `Регистрационный номер`, `Дата`) VALUES (20, 13, '73737537634', '2023-03-21');
INSERT INTO `that_to_three`.`Заявление` (`idЗаявление`, `Человек`, `Регистрационный номер`, `Дата`) VALUES (21, 14, '426457594', '2023-04-22');

COMMIT;