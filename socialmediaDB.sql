create database if not exists socialmedia;

use socialmedia;

drop table if exists comments;
drop table if exists posts;
drop table if exists user_data;

CREATE TABLE user_data (
	user_id int(11) not null auto_increment,
	username varchar(20) not null,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	email varchar(40) not null,
	primary key (user_id)
);

CREATE TABLE posts (
	post_id int(11) not null auto_increment,
	user_id int(11) not null,
	post_content varchar(255),
	time_posted datetime default current_timestamp,
	primary key (post_id),	
	foreign key (user_id) references user_data(user_id)
);

CREATE TABLE comments (
	comment_id int(11) not null auto_increment,
	user_id int(11) not null,
	post_id int(11) not null,
	comment_content varchar(255),
	time_posted datetime default current_timestamp,
	primary key (comment_id),
	foreign key (user_id) references user_data(user_id),	
	foreign key (post_id) references posts(post_id)
);
