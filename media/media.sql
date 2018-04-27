DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
  `movieid` int(10) NOT NULL AUTO_INCREMENT,
  `movietitle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`movieid`)
);


INSERT INTO movies (`movieid`,`movietitle`) VALUES (null, 'Titanic');
INSERT INTO movies (`movieid`,`movietitle`) VALUES (null, 'Avatar');
INSERT INTO movies (`movieid`,`movietitle`) VALUES (null, 'Black Panther');
INSERT INTO movies (`movieid`,`movietitle`) VALUES (null, 'The Dark Knight');
INSERT INTO movies (`movieid`,`movietitle`) VALUES (null, 'Jurassic World');
INSERT INTO movies (`movieid`,`movietitle`) VALUES (null, 'The Avengers');





DROP TABLE IF EXISTS `movieyear`;
CREATE TABLE `movieyear` (
  `movieid` int(10) NOT NULL,
  `movieyear` year(4) DEFAULT NULL,
  PRIMARY KEY `movieid` (`movieid`),
  FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`) ON UPDATE CASCADE
);


INSERT INTO `movieyear` VALUES (1,1997),(2,2009),(3,2018),(4,2008),(5,2015),(6,2012);




DROP TABLE IF EXISTS `moviegenre`;
CREATE TABLE `moviegenre` (
  `movieid` int(1) NOT NULL,
  `moviegenre` varchar(255) DEFAULT NULL,
  PRIMARY KEY `movieid` (`movieid`),
  FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`) ON UPDATE CASCADE
);

INSERT INTO `moviegenre` VALUES (1,'Drama, Disaster'),(2,'Fantasy, Science'),(3,'Fantasy, Science'),(4,'Drama, Crime'),(5,'Science'),(6,'Fantasy, Science');

SELECT movies.movieid, movies.movietitle, movieyear.movieyear, moviegenre.moviegenre FROM moviegenre INNER JOIN movies ON moviegenre.movieid=movies.movieid INNER JOIN movieyear ON movieyear.movieid=movies.movieid WHERE moviegenre.moviegenre LIKE 'science';