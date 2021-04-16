
drop table if exists mydates;
drop table if exists mydates_archive;

CREATE TABLE mydates_archive
(
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  mydate datetime,
  PRIMARY KEY (`id`)
);
CREATE TABLE mydates
(
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  mydate datetime,
  PRIMARY KEY (`id`)
);

DROP PROCEDURE IF EXISTS filldates;
DELIMITER ||
CREATE PROCEDURE filldates(dateStart DATETIME, dateEnd DATETIME)
BEGIN
  WHILE dateStart <= dateEnd DO
    INSERT INTO mydates (mydate) VALUES (dateStart);
    SET dateStart = date_add(dateStart, INTERVAL 1 minute);
  END WHILE;
END;
||
DELIMITER ;


CALL filldates('2021-04-16 12:00:00','2021-04-16 17:00:00');


select * from mydates limit 2;


