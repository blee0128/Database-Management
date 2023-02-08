drop database if exists project3;
create database project3;
use project3;

SET GLOBAL local_infile = 'ON';

CREATE TABLE user (
Screen_name varchar(200) PRIMARY KEY,
Name varchar(200),
Sub_category varchar(200),
Category varchar(200),
Ofstate varchar(200),
NumFollowers int,
NumFollowing int);

CREATE TABLE tweet (
Tid BIGINT PRIMARY KEY,
Textbody varchar(1000),
Retweet_count int,
Retweeted int,
PostDate datetime,
Posting_user varchar(200),
FOREIGN KEY (Posting_user) REFERENCES user(Screen_name) ON UPDATE CASCADE ON DELETE CASCADE);

  CREATE TABLE newtweet (
  Tid bigint PRIMARY KEY,
  Day_posted int DEFAULT NULL,
  Month_posted int DEFAULT NULL,
  Year_posted int default NULL
  );

CREATE TABLE urls (
Url varchar(600) PRIMARY KEY);

CREATE TABLE urlused (
Url varchar(600),
Tid BIGINT,
PRIMARY KEY(Url, Tid),
FOREIGN KEY (Tid) REFERENCES tweet(Tid) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (Url) REFERENCES urls(Url) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE Hashtags (
Hastagname varchar(200) PRIMARY KEY);

CREATE TABLE tagged (
Hastagname varchar(200),
Tid BIGINT,
PRIMARY KEY(Hastagname, Tid),
FOREIGN KEY (Tid) REFERENCES tweet(Tid) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (Hastagname) REFERENCES Hashtags(Hastagname) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE mentioned (
Screen_name varchar(200),
Tid BIGINT,
PRIMARY KEY(Screen_name, Tid),
FOREIGN KEY (Tid) REFERENCES tweet(Tid) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (Screen_name) REFERENCES user(Screen_name) ON UPDATE CASCADE ON DELETE CASCADE);