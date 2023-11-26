create table if not exists users
(
    id        int auto_increment
        primary key,
    username  varchar(255) not null,
    full_name varchar(255) not null,
    password  varchar(255) not null,
    constraint users_username_unique
        unique (username)
);

