create table `boardschema`.`freelist`(
	id int(11) not null primary key auto_increment,
	game varchar(45) null,
	title varchar(45) null,
	writer varchar(45) null,
	days timestamp default current_timestamp,
	review varchar(45) null,
	view int(11) null,
	memo text null
);