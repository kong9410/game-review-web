CREATE TABLE `boardschema`.`user` (
  `name` VARCHAR(10) NOT NULL,
  `ID` VARCHAR(12) NOT NULL,
  `PW` VARCHAR(12) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `admin` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC));