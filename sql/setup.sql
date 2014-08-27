use app_ly;
-- drop old tables
drop table links;
drop table users;

-- create new tables
create table users
(
user_email varchar(255) not null,
password varchar(255) not null,
date_joined datetime not null,
primary key (user_email)
);

create table links
(
shorturl_id int not null auto_increment,
longurl varchar(255) not null,
date_created datetime not null,
user_email varchar(255),
primary key (shorturl_id),
foreign key (user_email) references users(user_email)
);

-- insert into new tables
insert into users ( user_email , password , date_joined )
values
( 'austin@example.com' , 'austinpass' , NOW() ),
( 'chris@example.com' , 'chrispass' , NOW() )
;

insert into links ( longurl , date_created , user_email )
values
( 'http://news.yahoo.com/us/' , NOW() , null ),
( 'http://espn.go.com/mlb/standings' , NOW() , 'austin@example.com' ),
( 'http://www.google.com/intl/en_us/chrome/devices/chromecast/index.html?utm_source=chromecast.com' , NOW() , 'chris@example.com' )