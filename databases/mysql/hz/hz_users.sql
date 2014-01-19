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

#密码为 Welcome1 加密后存入数据库
#密码生成方法为 登录linux服务器 echo -n "Welcome1" | openssl dgst -md5 -binary | openssl base64
insert  hz_users (username, passwd) values ('admin','tW4LTqSWIoO+52JSXC1JDw==');
insert  hz_users (username, passwd) values ('operation','tW4LTqSWIoO+52JSXC1JDw==');
insert  hz_users (username, passwd) values ('sales','tW4LTqSWIoO+52JSXC1JDw==');
insert  hz_users (username, passwd) values ('hr','tW4LTqSWIoO+52JSXC1JDw==');

update hz_users set uuid = uuid() where user_id<5;
update hz_users set passwd ='tW4LTqSWIoO+52JSXC1JDw==' where user_id<5;

#debug'b56e0b4ea4962283bee762525c2d490f'
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