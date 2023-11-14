show databases;

create database IMDB;

use IMDB;

create table Movie(
id INT PRIMARY KEY NOT NULL,
title VARCHAR(255) NOT NULL,
release_year INT,
duration VARCHAR(15) 
);

insert into movie(id,title,release_year,duration) values(1,'Maamannan',2023, '157m');
insert into movie(id,title,release_year,duration) values(2,'Vikram',2022,'175m');


create table actor(

id int primary key not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
gender varchar(10) check (gender in ('M','F'))

);

insert into actor(id,first_name,last_name,gender) values(1,'vadi','velu','m');
insert into actor(id,first_name,last_name,gender) values(2,'fahadh','faasil','m');
insert into actor(id,first_name,last_name,gender) values(3,'udayanidhi','stalin','m');
insert into actor(id,first_name,last_name,gender) values(4,'keerthy','suresh','f');
insert into actor(id,first_name,last_name,gender) values(5,'kamal','hasan','m');
insert into actor(id,first_name,last_name,gender) values(6,'vijay','sethubathi','m');

create table directors(
id int primary key not null,
first_name varchar(30) not null,
last_name varchar(30) not null
);

insert into directors(id,first_name,last_name) values(1,'mari','selvaraj');
insert into directors(id,first_name,last_name) values(2,'Lokesh','Kanagaraj');
 

create table movie_director(
director_id int not null,
movie_id int not null,
foreign key(director_id)references directors(id),
foreign key(movie_id)references movie(id)
);

insert into movie_director(director_id,movie_id) values(1,1);
insert into movie_director(director_id,movie_id) values(2,2);

create table genre(
id int primary key not null,
name varchar(20) not null
);

insert into genre(id,name) values(1,'Action');
insert into genre(id,name) values(2,'Crime');
insert into genre(id,name) values(3,'Drama');
insert into genre(id,name) values(4,'Comedy');
insert into genre(id,name) values(5,'Horror');
insert into genre(id,name) values(6,'Sci-Fi/Fantasy');
insert into genre(id,name) values(7,'War Drama');
insert into genre(id,name) values(8,'Thriller');

create table movie_genre(
movie_id int not null,
genre_id int not null,
foreign key (movie_id) references movie(id),
foreign key (genre_id) references genre(id)
);

insert into movie_genre(movie_id,genre_id) values(1,3);
insert into movie_genre(movie_id,genre_id) values(1,7);

create table multiple_media(
movie_id int not null,
id int primary key not null,
image1_url varchar(255),
image2_url varchar(255),
image3_url varchar(255),
video_url varchar(255) ,
foreign key(movie_id)references movie(id)
);

insert into multiple_media(movie_id,id,image1_url,video_url) values(1,1,'https://www.imdb.com/title/tt20242416/mediaviewer/rm414526465/?ref_=tt_ov_i','https://www.imdb.com/video/vi1572128537/?ref_=ttvi_vi_imdb_1');
insert into multiple_media(movie_id,id,image2_url,video_url) values(2,2,'https://www.imdb.com/title/tt9179430/mediaviewer/rm1740833281/?ref_=tt_ov_i','https://www.imdb.com/video/vi3381510681/?ref_=ttvi_vi_imdb_5');


create table actor_skills(
id int primary key not null,
skill_name varchar(100) not null
);

insert into actor_skills(id,skill_name) values(1,'dance');
insert into actor_skills(id,skill_name) values(2,'Memorization');
insert into actor_skills(id,skill_name) values(3,'singing');
insert into actor_skills(id,skill_name) values(4,'communication');
insert into actor_skills(id,skill_name) values(5,'Stamina');
insert into actor_skills(id,skill_name) values(6,'Voice control');
insert into actor_skills(id,skill_name) values(7,'Script analysis');
insert into actor_skills(id,skill_name) values(8,'creativity');

create table actor_skilladd(
actor_id int not null,
skill_id int not null,
foreign key (actor_id) references actor(id),
foreign key (skill_id) references actor_skills(id)
);

insert into actor_skilladd(actor_id,skill_id) values(1,1);
insert into actor_skilladd(actor_id,skill_id) values(1,2);
insert into actor_skilladd(actor_id,skill_id) values(5,1);



create table actor_roles(
id int primary key not null,
actor_role varchar(30) not null
);

insert into actor_roles(id,actor_role) values(1,'Regular/lead');
insert into actor_roles(id,actor_role) values(2,'Supporting');
insert into actor_roles(id,actor_role) values(3,'Recurring');
insert into actor_roles(id,actor_role) values(4,'Day player');
insert into actor_roles(id,actor_role) values(5,'Bit part');
insert into actor_roles(id,actor_role) values(6,'Guest star');
insert into actor_roles(id,actor_role) values(7,'Background');
insert into actor_roles(id,actor_role) values(8,'Body double');
insert into actor_roles(id,actor_role) values(9,'Stunt double');

create table movie_actor_role(
movie_id int not null,
actor_id int not null,
role_id int not null,
foreign key (movie_id)references movie(id),
foreign key (actor_id)references actor(id),
foreign key (role_id)references actor_roles(id)
);

insert into movie_actor_role(movie_id,actor_id,role_id) values(2,5,1);

create table review(
movie_id int not null,
user_name varchar(30) not null,
rating decimal(2,1) CONSTRAINT chk_rating CHECK (rating >= 0 AND rating <= 5),
foreign key(movie_id)references movie(id)
);

insert into review(movie_id,user_name,rating) values(1,'Arun',5);
insert into review(movie_id,user_name,rating) values(2,'Arun',5);
insert into review(movie_id,user_name,rating) values(1,'JK',5);

