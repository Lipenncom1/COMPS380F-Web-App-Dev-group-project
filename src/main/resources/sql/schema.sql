DROP TABLE IF EXISTS lecture_comments;
drop table if exists attachment;
drop table if exists lecture;
DROP TABLE IF EXISTS poll_comments;
DROP TABLE IF EXISTS user_vote;
DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS poll;
DROP TABLE IF EXISTS users;


create table if not exists lecture (
                                       id bigint generated by default as identity,
                                       lecture_title varchar(255),
                                       primary key (id)
);
create table if not exists attachment (
                                          id uuid default random_uuid() not null,
                                          content blob,
                                          content_type varchar(255),
                                          filename varchar(255),
                                          lecture_id bigint,
                                          primary key (id),
                                          foreign key (lecture_id) references lecture ON DELETE CASCADE
);

DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
                                     username VARCHAR(50) NOT NULL,
                                     password VARCHAR(50) NOT NULL,
                                    email VARCHAR(100),
                                    FULL_NAME VARCHAR (300),
                                    PHONE VARCHAR(8),
                                     PRIMARY KEY (username)
);
CREATE TABLE IF NOT EXISTS user_roles (
                                          user_role_id INTEGER GENERATED ALWAYS AS IDENTITY,
                                          username VARCHAR(50) NOT NULL,
                                          role VARCHAR(50) NOT NULL,
                                          PRIMARY KEY (user_role_id),
                                          FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS lecture_comments(
    comment_id BIGINT GENERATED BY DEFAULT AS IDENTITY,
    lecture_id BIGINT NOT NULL,
    username VARCHAR(50) NOT NULL,
    comment_text VARCHAR(1000) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (lecture_id) REFERENCES lecture(id) ON DELETE CASCADE,
    FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE
    );


create table if not exists poll (
                                    id bigint generated by default as identity,
                                    question varchar(255),
                                    option_a varchar(255),
                                    option_b varchar(255),
                                    option_c varchar(255),
                                    option_d varchar(255),
                                    count_a int default 0,
                                    count_b int default 0,
                                    count_c int default 0,
                                    count_d int default 0,
                                    primary key (id)
);


create table if not exists user_vote (
                                         id bigint generated by default as identity,
                                         username varchar(50) not null,
                                         poll_id bigint not null,
                                         vote_option varchar(1) not null,
                                         primary key (id),
                                         foreign key (username) references users(username) ON DELETE CASCADE,
                                         foreign key (poll_id) references poll(id) ON DELETE CASCADE,
                                         unique (username, poll_id)
);

CREATE TABLE poll_comments (
                               comment_id BIGINT GENERATED BY DEFAULT AS IDENTITY,
                               poll_id BIGINT NOT NULL,
                               username VARCHAR(50) NOT NULL,
                               comment_text VARCHAR(1000) NOT NULL,
                               created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                               PRIMARY KEY (comment_id),
                               FOREIGN KEY (poll_id) REFERENCES poll(id) ON DELETE CASCADE,
                               FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE
);

