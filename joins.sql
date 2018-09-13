-- Create a query to get all fields from the `users` table
SELECT * 
FROM users;

-- Create a query to get all fields from the `posts` table where the `user_id` is 100
SELECT *
FROM posts
-- join users on posts.users_id_fk=users.id
WHERE users_id_fk = 100;

-- Create a query to get all posts fields, the user's first name, and the user's last name, from the `posts` table where the user's id is 200

select posts.*, users.firs_tname, users.last_name
from posts
join users on posts.users_id_fk=users.id
where users_id_fk = 200;

-- Create a query to get all posts fields, and the user's username, from the `posts` table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'

select posts.*, users.username
from posts
join users on posts.users_id_fk=users.id
where users.firs_tname = 'Norene' 
and users.last_name = 'Schmitt';


-- Create a query to get usernames from the `users` table where the user has created a post after January 1, 2015

select username
from users
join posts on users.id=posts.users_id_fk
where posts.created_at > '01-01-2015';


-- Create a query to get the post title, post content, and user's username where the user who created the post joined before January 1, 2015

select posts.title, posts."content", users.username
from users
join posts on users.id=posts.users_id_fk
where users.created_at < '01-01-2015';

-- Create a query to get the all rows in the `comments` table, showing post title (aliased as 'Post Title'), and the all the comment's fields

select posts.title as "Post Title", "comments".*
from "comments"
join posts on posts.id="comments".posts_id_fk;

-- Create a query to get the all rows in the `comments` table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015

select posts.title as "post_title", posts.url as "post_url", "comments".body as "comment_body"
from "comments"
join posts on posts.id="comments".posts_id_fk
where posts.created_at < '01-01-2015';

-- Create a query to get the all rows in the `comments` table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created after January 1, 2015

select posts.title as "post_title", posts.url as "post_url", "comments".body as "comment_body"
from "comments"
join posts on posts.id="comments".posts_id_fk
where posts.created_at > '01-01-2015';

-- Create a query to get the all rows in the `comments` table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the comment body contains the word 'USB'

select posts.title as "post_title", posts.url as "post_url", "comments".body as "comment_body"
from "comments"
join posts on posts.id="comments".posts_id_fk
where "comments".body like '%USB%';

-- Create a query to get the post title (aliased as post_title), first name of the author of the post, last name of the author of the post, and comment body (aliased to comment_body), where the comment body contains the word 'matrix' ( should have 855 results )

select posts.title as "post_title", users.firs_tname, users.last_name, "comments".body as "comment_body"
from "comments"
join posts on "comments".posts_id_fk=posts.id
join users on "comments".users_id_fk=users.id
where "comments".body like '%matrix%';

-- Create a query to get the first name of the author of the comment, last name of the author of the comment, and comment body (aliased to comment_body), where the comment body contains the word 'SSL' and the post content contains the word 'dolorum' ( should have 102 results )

select users.firs_tname, users.last_name, "comments".body as "comments_body"
from "comments"
join posts on "comments".posts_id_fk=posts.id
join users on "comments".users_id_fk=users.id
where "comments".body like '%SSL%' 
and posts."content" like '%dolorum%';

-- Create a query to get the first name of the author of the post (aliased to post_author_first_name), last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title), username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body), where the comment body contains the word 'SSL' or 'firewall' and the post content contains the word 'nemo' ( should have 218 results )

select  u.firs_tname as "post_author_first_name", 
	u.last_name as "post_author_last_name", 
	p.title as "post_title", 
	u.username as "comment_author_username",
	c.body as "comment_body"
from "comments" c
join posts p on c.posts_id_fk=p.id
join users u on c.users_id_fk=u.id
where (c.body like '%SSL%' or c.body like '%firewall%')
and p."content" like '%nemo%';


-- ###### Additional Queries ######

-- Count how many comments have been written on posts that have been created after July 14, 2015 ( should have one result, the value of the count should be 27)

select count ("comments".body)
from "comments"
join posts on "comments".posts_id_fk=posts.id
where posts.created_at > '2015-07-14';


-- Find all users who comment about 'programming' ( should have 336 results)
select users.*
from "comments"
join users on "comments".users_id_fk= users.id
where "comments".body like '%programming%';


