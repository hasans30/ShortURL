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
primary key (shorturl_id),
foreign key (username) references users(username)
);

-- insert into new tables
-- YYYY-MM-DD HH:MM:SS
insert into users ( user_email , password , date_joined )
values
( 'austin@example.com' , 'austinpass' , '2014-07-31 11:15:00' ) ,
( 'DevOps Engineer' , 'technology development engineering' , 'The Data DevOps Engineer plans and conducts activities concerned with ensuring the performance and reliability of our software applications.  This includes monitoring, validating changes, gathering and reporting metrics, testing, incident management, change management, etc.  Able to install, debug and support various environments that support CSIdentity applications.  The Data Engineering Support Engineer is expected to complete tasks independently and with minimum support from management staff.  S/he has a strong ability to grasp new technologies and acquire new skills through independent study and interaction with other team members.' , 'Atlanta' , 'GA' , '2014-03-10' , '2014-06-01' , 1 ) ,
( 'Sr Java Developer' , 'technology engineering software development' , 'We are looking to hire a java engineer. 5+ years experience. That is all for this description.' , 'Rala' , 'MO' , '2014-02-15' , '2014-06-15' , 1 ) ,
( 'Jr Account Representative' , 'sales marketing' , 'We are currently accepting applications for a Jr Account Representative. Responsibilities for this position include: catering to clients needs, working with clients to find the appropriate software solution. Preference will be given to applicants that are account reps for accounts at other organizations that require reps.' , 'Salt Lake City' , 'UT' , '2014-03-01' , '2014-08-01' , 3) ,
( 'Custodial Engineer' , 'janitor custodian' , 'Custodial Engineers at our organization arent just custodians, they are custodial engineer associates. You will clean the halls here with such grace and honor, our positions are world-renowned as something to travel to yada yada I dont know what to say other than this position is perfect for you apply now.' , 'Indianapolis' , 'IN' , '2014-01-01' , '2014-06-01' , 2 )
;
