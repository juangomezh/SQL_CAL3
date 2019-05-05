drop table if exists record;
drop table if exists plays;
drop table if exists aboutdisks;
drop table if exists aboutconcerts;
drop table if exists opinions;
drop table if exists members;
drop table if exists buytickets;
drop table if exists buydisks;
drop table if exists perform;
drop table if exists musicgroup;
drop table if exists instrument;
drop table if exists has;
drop table if exists composes;
drop table if exists song;

drop table if exists musician;
drop table if exists tickets;
drop table if exists user;
drop table if exists disk;
drop table if exists concerts;

create table musician
(	name varchar(10),
	surname	varchar(30),
    address varchar(30),
    zipcode numeric(6,0),
    phone numeric(9,0) ,
    city	varchar(30),
    province varchar(50),
    ID char(9),
    primary key (ID)
);
create table instrument
( name varchar(10),
  numserie numeric(10,0),
  primary key (numserie)
);
create table song
(	duration int,
    day numeric(2,0),
    month numeric(2,0),
    year numeric(4,0),
	name varchar(20),
    ID char(9),
    primary key (name, ID),
    foreign key (ID) references musician (ID)
);
create table musicgroup
(	genre varchar(30),
	groupID varchar(9),
    primary key (groupID)
);
create table concerts
(	venue	varchar(50),
	City	varchar(50),
    	Country	varchar(50),
   	day	  numeric(2,0),
 	month numeric(2,0),
 	year numeric(4,0),
    	Code	char(9),
    primary key (Code)
);
create table disk
(	Referencenumber numeric(9,0),
	format		varchar(10), check (format in ("Digital","Physical")),
	title	varchar(50),
	day	  numeric(2,0),
 	month numeric(2,0),
 	year numeric(4,0),
	genre varchar(30),
    	typeofencoding		varchar(10), check (typeofencoding in("MP3", "AAC", "WMA", "FLAC") and format in ("Digital")),
	Size	int,
		typeofphy	varchar(10), check (typeofphy in ("CD", "LP") and format in ("Physical")),
    primary key (Referencenumber)
);

create table user
(	name varchar(30),
	surname varchar(40),
    DNI		char(9),
	email varchar(30),
    points int,    
	primary key (email)
);
create table tickets
(	ticketcode	numeric(9,0),
	concertcode char(9),
	day	  numeric(2,0),
 	month numeric(2,0),
 	year numeric(4,0),
    price int,
    primary key (ticketcode),
    foreign key(concertcode) references concerts(Code)
);

create table plays
(	ID	char(9),
	numserie numeric(10,0),
    primary Key (ID, numserie),
    foreign key (ID) references musician(ID),
    foreign key (numserie) references instrument(numserie)
);
create table composes
(	duration int,
	name varchar(20),
    ID varchar(9),
    primary key(ID, name),
    foreign key(name) references song(name),
    foreign key(ID) references musician(ID)
);
create table has
(	Referencenumber numeric(9,0),
	duration		int,
	day	  numeric(2,0),
 	month numeric(2,0),
 	year numeric(4,0),
	name varchar(20),
    ID	char(9),
    primary Key(Referencenumber, ID, duration, name), 
    foreign Key(Referencenumber) references disk(Referencenumber),
    foreign Key(ID) references musician(ID),
    foreign Key(name) references song(name)
    );
create table members
(	ID	char(9),
	groupID varchar(9),
    primary key(ID, groupID),
    foreign key(ID) references musician(ID),
    foreign key(groupID) references musicgroup(groupID)
    );
create table perform 
(	groupID		char(9),
	Code	char(9),
    primary Key(groupID, Code),
    foreign key(groupID) references musicgroup(groupID),
    foreign key(Code) references concerts(Code)
    );
create table record
(	Referencenumber numeric(9,0),
    groupID	varchar(9),
    primary key(groupID, Referencenumber),
    foreign key(groupID) references musicgroup(groupID),
    foreign key(Referencenumber) references disk(Referencenumber)
    );
create table buytickets
(	ticketcode	numeric(9,0),
	email varchar(30),
	primary key(ticketcode, email),
    foreign key(ticketcode) references tickets(ticketcode),
    foreign key(email) references user(email)
);
create table buydisks
(
	Referencenumber	 numeric(9,0),
	email varchar(30),
	primary key(Referencenumber, email),
    foreign key(Referencenumber) references disk(Referencenumber),
    foreign key(email) references user(email)
);
create table aboutdisks
(
	Referencenumber numeric(9,0),
	rating		int check (rating<11),
	email	varchar(30),
    opdescription	varchar(500),
	primary key(Referencenumber, email, opdescription),
    foreign key(Referencenumber) references disk(Referencenumber),
    foreign key(email) references user(email)
);

create table aboutconcerts
(
	Code	char(9),
    email varchar(30),
	opdescription	varchar(500),
	primary key(Code, email, opdescription),
    foreign key(Code) references concerts(Code),
    foreign key(email) references user(email)
);