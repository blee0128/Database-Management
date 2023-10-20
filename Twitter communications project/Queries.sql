use project3;

-- Q1
SELECT tweets.retweet_count, tweets.text_body, TwitterUser.screen_name, TwitterUser.category, TwitterUser.sub_category
FROM tweets, TwitterUser
WHERE tweets.posting_user = TwitterUser.screen_name AND (tweets.month_posted = '1' AND tweets.year_posted = '2016')
ORDER BY tweets.retweet_count DESC
LIMIT 5;

-- Q2
SELECT count(DISTINCT state) as statenum, group_concat(DISTINCT TwitterUser.state ORDER BY state), hashtags.tag_name
FROM TwitterUser, hashtags, tweets, hashtag_used
WHERE tweets.posting_user = TwitterUser.screen_name AND hashtag_used.tweet_id = tweets.tweet_id  AND hashtag_used.tag_name = hashtags.tag_name AND tweets.year_posted = '2016' AND NOT TwitterUser.state = 'na'
GROUP BY hashtags.tag_name
ORDER BY statenum DESC
LIMIT 5;

-- Q3
SELECT TwitterUser.screen_name, TwitterUser.state
FROM TwitterUser,hashtag_used, tweets
WHERE tweets.posting_user = TwitterUser.screen_name AND hashtag_used.tweet_id = tweets.tweet_id  AND (hashtag_used.tag_name = 'HappyNewYear' OR hashtag_used.tag_name = 'NewYear' or hashtag_used.tag_name = 'NewYears' or hashtag_used.tag_name = 'NewYearsDay')
LIMIT 12;

-- Q4
-- When subcategory = ‘GOP’
SELECT TwitterUser.screen_name, TwitterUser.sub_category, TwitterUser.followers
FROM TwitterUser
WHERE TwitterUser.sub_category = 'GOP'
ORDER BY TwitterUser.followers DESC
LIMIT 5;

-- When subcategory = ‘Democrat’
SELECT TwitterUser.screen_name, TwitterUser.sub_category, TwitterUser.followers
FROM TwitterUser
WHERE TwitterUser.Sub_category = 'Democrat'
ORDER BY TwitterUser.followers DESC
LIMIT 5;

-- Q5
SELECT DISTINCT hashtag_used.tag_name, TwitterUser.state
FROM TwitterUser,hashtag_used, tweets
WHERE (tweets.month_posted = '1' AND tweets.year_posted = '2016') AND tweets.posting_user = TwitterUser.screen_name AND hashtag_used.tweet_id = tweets.tweet_id AND (TwitterUser.state = 'Ohio' or TwitterUser.state = 'Alaska' or TwitterUser.state = 'Alabama');

-- Q6
SELECT tweets.text_body, hashtag_used.tag_name, TwitterUser.screen_name, TwitterUser.sub_category
FROM TwitterUser, tweets, hashtag_used
WHERE (TwitterUser.sub_category = 'Democrat' or TwitterUser.sub_category = 'Democrat') AND hashtag_used.tag_name = 'Ohio' AND (tweets.month_posted = '1' AND tweets.year_posted = '2016') AND tweets.posting_user = TwitterUser.screen_name AND hashtag_used.tweet_id = tweets.tweet_id
ORDER BY TwitterUser.followers DESC
LIMIT 5;

-- Q7
SELECT TwitterUser.screen_name, TwitterUser.state, group_concat(DISTINCT url_used.url ORDER BY url_used.url)
FROM TwitterUser, tweets, url_used
WHERE TwitterUser.sub_category = 'GOP' AND (tweets.month_posted = '1' AND tweets.year_posted = '2016') AND tweets.posting_user = TwitterUser.screen_name AND url_used.tweet_id = tweets.tweet_id
GROUP BY TwitterUser.screen_name;

-- Q8
SELECT MentionUser.screen_name, MentionUser.state, GROUP_CONCAT(DISTINCT GOPUser.screen_name)
FROM tweets
INNER JOIN (SELECT screen_name FROM TwitterUser WHERE sub_category = 'GOP') GOPUser ON tweets.posting_user = GOPUser.screen_name
INNER JOIN (SELECT TwitterUser.screen_name, TwitterUser.state, TM.tweet_id FROM TwitterUser
INNER JOIN tweet_mentions TM ON TwitterUser.screen_name = TM.screen_name) MentionUser ON tweets.tweet_id = MentionUser.tweet_id
WHERE tweets.month_posted = '1' AND tweets.year_posted = '2016'
GROUP BY MentionUser.screen_name , MentionUser.state
ORDER BY COUNT(MentionUser.screen_name) DESC
LIMIT 5;

-- Q9
SELECT hashtag_used.tag_name, count(hashtag_used.tag_name) as num_uses
FROM TwitterUser,hashtag_used, tweets
WHERE TwitterUser.sub_category = 'GOP' AND (tweets.month_posted = '1' OR tweets.month_posted = '2' OR tweets.month_posted = '3') AND (tweets.year_posted = '2016') AND hashtag_used.tweet_id = tweets.tweet_id AND tweets.posting_user = TwitterUser.screen_name
GROUP BY hashtag_used.tag_name
ORDER BY num_uses DESC
LIMIT 5;
