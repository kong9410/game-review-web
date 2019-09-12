CREATE TABLE `boardschema`.`comment2` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `refnum` INT NOT NULL,
  `writer` VARCHAR(12) NOT NULL,
  `content` TEXT NOT NULL,
  PRIMARY KEY (`num`));
