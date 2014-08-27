drop database shorturl;
create database shorturl;
drop user 'shorturluser'@'%';
create user 'shorturluser'@'%' identified by 'shorturlpass';
grant all privileges on shorturl.* to 'shorturluser'@'%';
flush privileges;