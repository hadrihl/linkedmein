create database `linkedmein`;

create table `user` (
    id int not null auto_increment,
    username varchar(255) not null,
    email varchar(255) not null,
    password varchar(64) not null,
    firstname varchar(255),
    lastname varchar(255),
    company varchar(255),
    city varchar(100),
    country varchar(100),
    primary key (id)
);

create table `role` (
    id int not null auto_increment,
    name varchar(255) not null,
    primary key (id)
);

create table `users_roles` (
    user_id int not null,
    role_id int not null,
    key `user_fk_idx` (`user_id`),
    key `role_fk_idx` (`role_id`),
    constraint `role_fk` foreign key (`role_id`) references `role` (`id`),
    constraint `user_fk` foreign key (`user_id`) references `user` (`id`)
);

create table `post` (
    id int(11) not null auto_increment,
    position varchar(255) not null,
    company varchar(255) not null, 
    city varchar(255) not null,
    country varchar(255) not null,
    salary varchar(255) not null,
    content longtext not null,
    created_on datetime,
    updated_on datetime,
    img varchar(255),
    status boolean,
    primary key (id)
);