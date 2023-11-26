create table if not exists notes
(
    id      int auto_increment
        primary key,
    title   varchar(255) not null,
    message text         null,
    user    varchar(255) not null,
    constraint notes_users_username_fk
        foreign key (user) references users (username)
);

