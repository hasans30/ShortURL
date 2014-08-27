use shorturl;
-- drop old tables
drop table links;

create table links
(
shorturl_id int not null auto_increment,
longurl varchar(255) not null,
date_created datetime not null,
primary key (shorturl_id),
);

insert into links ( longurl , date_created , user_email )
values
( 'http://news.yahoo.com/us/' , NOW() , null ),
( 'http://espn.go.com/mlb/standings' , NOW() , 'austin@example.com' ),
( 'http://www.google.com/intl/en_us/chrome/devices/chromecast/index.html?utm_source=chromecast.com' , NOW() , 'chris@example.com' )