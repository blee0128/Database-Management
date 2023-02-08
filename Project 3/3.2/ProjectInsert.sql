use project3;

LOAD DATA LOCAL INFILE '/Users/benjaminlee/Desktop/FALL 2021/COM S 363/project 3/dataCSV/user.csv' 
INTO TABLE TwitterUser
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Screen_name, Name, Sub_category, Category, state, NumFollowers, NumFollowing);

LOAD DATA LOCAL INFILE '/Users/benjaminlee/Desktop/FALL 2021/COM S 363/project 3/dataCSV/tweets.csv' 
INTO TABLE tweet
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Tid, Textbody, Retweet_count, Retweeted, PostDate, Posting_user);

LOAD DATA LOCAL INFILE '/Users/benjaminlee/Desktop/FALL 2021/COM S 363/project 3/dataCSV/tweets.csv' 
INTO TABLE newtweet 
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES 
(Tid, @col2, @col3, @col4,@col5,@col6) 
set day_posted= day(str_to_date(@col5, '%Y-%m-%d %H:%i:%s')), 
month_posted= month(str_to_date(@col5, '%Y-%m-%d %H:%i:%s')), 
year_posted= year(str_to_date(@col5, '%Y-%m-%d %H:%i:%s')); 

LOAD DATA LOCAL INFILE '/Users/benjaminlee/Desktop/FALL 2021/COM S 363/project 3/dataCSV/urlused.csv' 
INTO TABLE urlS
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@col1, Url);

LOAD DATA LOCAL INFILE '/Users/benjaminlee/Desktop/FALL 2021/COM S 363/project 3/dataCSV/urlused.csv' 
INTO TABLE urlused
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Tid, Url);

LOAD DATA LOCAL INFILE '/Users/benjaminlee/Desktop/FALL 2021/COM S 363/project 3/dataCSV/tagged.csv' 
INTO TABLE Hashtags
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@col1, Hastagname);

LOAD DATA LOCAL INFILE '/Users/benjaminlee/Desktop/FALL 2021/COM S 363/project 3/dataCSV/tagged.csv' 
INTO TABLE tagged
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Tid, Hastagname);

LOAD DATA LOCAL INFILE '/Users/benjaminlee/Desktop/FALL 2021/COM S 363/project 3/dataCSV/mentioned.csv' 
INTO TABLE mentioned
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Tid, Screen_name);

