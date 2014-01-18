create table if not exists hz_users (
	user_id bigint NOT NULL AUTO_INCREMENT primary key, 
    username VARCHAR(64) not null unique,
    usergroup varchar(64), 
	uuid varchar(255) ,
	email varchar(255),
    passwd VARCHAR(64)
);

CREATE TABLE if not exists hz_user_roles (
    id bigint not null auto_increment primary key,
    user_id bigint,
    role_uuid varchar(255),
    user_role VARCHAR(32)
);

insert  hz_users (username, passwd) values ('admin',MD5('Welcome1'));
insert  hz_users (username, passwd) values ('operation',MD5('Welcome1'));
insert  hz_users (username, passwd) values ('sales',MD5('Welcome1'));
insert  hz_users (username, passwd) values ('hr',MD5('Welcome1'));

update hz_users set uuid = uuid() where user_id<5;
update hz_users set passwd = 'Welcome1' where user_id<5;

#debug
#select * from hz_users;
#select * from hz_user_roles;

insert hz_user_roles (user_id, user_role) values (1, 'admin');
insert hz_user_roles (user_id, user_role) values (1, 'operation');
insert hz_user_roles (user_id, user_role) values (2, 'operation');
insert hz_user_roles (user_id, user_role) values (3, 'operation');
insert hz_user_roles (user_id, user_role) values (4, 'operation');

update hz_user_roles set role_uuid = uuid() where id<7;

# JBOSS JAAS 设置2个主要的查询
#SELECT passwd from hz_users where username = 'admin' ;
#select ur.user_role, 'Roles' from hz_user_roles ur, hz_users u where ur.user_id = u.user_id and u.username = 'admin';