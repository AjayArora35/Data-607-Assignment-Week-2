#NOTE: This script is meant to be run on MySQL.  Some DDL statements are specific to MySQL

#Create a database AjayMovies
DROP DATABASE IF EXISTS AjayMovies;
CREATE DATABASE AjayMovies;

#Use the created DB
USE AjayMovies;

#Create a table for data entry
CREATE TABLE Movies (
 MovieId INT NOT NULL AUTO_INCREMENT,
 MovieName VARCHAR(255) NOT NULL,
 MovieRank smallint NOT NULL,
 RankingPersonName VARCHAR(255) NOT NULL,
 RankingPersonRelation VARCHAR(255) NULL,
 PRIMARY KEY (MovieId));
 
CREATE TABLE MovieRanking (
 Id INT NOT NULL AUTO_INCREMENT,
 MovieRankId INT NOT NULL,
 MovieRankDescription VARCHAR(255) NOT NULL,
 PRIMARY KEY (Id));
 
DROP USER IF EXISTS  'ajmovieuser'@'localhost'; 
 
#Create a temporary user for access to AjayMovies DB 
 CREATE USER 'ajmovieuser'@'localhost';
  #IDENTIFIED BY 'password';
GRANT ALL
  ON AjayMovies.*
  TO 'ajmovieuser'@'localhost';
 
 #MovieRank: 1 = Must see, 2 = Good, 3 = Passing time, 4 = Not worth the popcorn, 5 = Save your money
 #Data entry

INSERT INTO Movies (MovieName, MovieRank, RankingPersonName, RankingPersonRelation)
VALUES ('Avengers', 1, 'Aiden', 'Nephew'),
	   ('Endgame', 1, 'Lia', 'Neice'),
       ('The Mule', 3, 'Lauren', null),
       ('A-Team', 2, 'Anju', 'Sister'),
       ('IpMan', 2, 'Bill', 'Brother-in-law'),
       ('Aquaman', 4, 'Brian', 'Friend'),
       ('Die Another Day', 4, 'Happy', 'Brother'),
       ('Batman & Robin', 5, 'Bryan', null),
       ('Wild Wild West', 5, 'Dan', 'Brother-in-law'),
       ('Godzilla', 4, 'Tom', 'Brother-in-law'),
	   ('Welcome to Marwen', 4, 'Lauren', 'Friend');

INSERT INTO MovieRanking (MovieRankId, MovieRankDescription)
VALUES (1, 'Must see'),
	   (2, 'Good'),
       (3, 'Passing time'),
       (4, 'Not worth the popcorn'),
       (5, 'Save your money')
