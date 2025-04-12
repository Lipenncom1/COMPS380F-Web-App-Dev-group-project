insert into lecture (lecture_title)
values ('testing if title enters');


INSERT INTO users VALUES ('keith', '{noop}keithpw');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_ADMIN');

INSERT INTO users VALUES ('john', '{noop}johnpw');
INSERT INTO user_roles(username, role) VALUES ('john', 'ROLE_ADMIN');

INSERT INTO users VALUES ('mary', '{noop}marypw');
INSERT INTO user_roles(username, role) VALUES ('mary', 'ROLE_USER');



insert into poll (question, option_a, option_b, option_c, option_d, count_a, count_b, count_c, count_d)
values ('When would you like to have your midterm exam?', 'Monday', 'Wednesday', 'Friday', 'Next Monday', 3, 5, 2, 8);

