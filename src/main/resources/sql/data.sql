insert into lecture (lecture_title)
values ('1. Introduction to web apps');

INSERT INTO users VALUES ('stan', '{noop}stanpw', 'legendLee@outlook.com','Stan Lee', '54617846');
INSERT INTO user_roles(username, role) VALUES ('stan', 'ROLE_ADMIN');

INSERT INTO users VALUES ('joe', '{noop}joepw', 'justiceJoe@yahoo.com','Joe Quesada','78137613');
INSERT INTO user_roles(username, role) VALUES ('joe', 'ROLE_ADMIN');

INSERT INTO users VALUES ('peter', '{noop}peterpw', 'perfectParker@gmail.com', 'Peter Parker','17612694');
INSERT INTO user_roles(username, role) VALUES ('peter', 'ROLE_USER');

INSERT INTO users VALUES ('tony', '{noop}tonypw', 'tony123@qq.com' ,'Tony Stark','54798321');
INSERT INTO user_roles(username, role) VALUES ('tony', 'ROLE_USER');

INSERT INTO users VALUES ('thor', '{noop}thorpw', 'terrificTHOR@126.com','Thor Odinson','48652315');
INSERT INTO user_roles(username, role) VALUES ('thor', 'ROLE_USER');

INSERT INTO lecture_comments (lecture_id, username, comment_text)
VALUES
    (1, 'stan', 'This lecture looks very interesting!'),
    (1, 'joe', 'Could you provide slides before the lecture?'),
    (1, 'peter', 'I am excited to join this session.');

INSERT INTO attachment (content, content_type, filename, lecture_id)
VALUES
    (x'73616d706c652066696c652031364d6179', 'text/plain', 'sample.txt', 1);

insert into poll (question, option_a, option_b, option_c, option_d, count_a, count_b, count_c, count_d)
values ('When would you like to have your midterm exam?', 'Monday', 'Wednesday', 'Friday', 'Next Monday', 3, 5, 2, 8);

INSERT INTO user_vote (username, poll_id, vote_option)
VALUES
    ('tony', '1', 'B'),
    ('thor', '1', 'C'),
    ('peter', '1', 'D');

INSERT INTO poll_comments (poll_id, username, comment_text)
VALUES
    (1, 'tony', 'I prefer Wednesday because I have other commitments on Monday.'),
    (1, 'thor', 'Friday works best for me!'),
    (1, 'peter', 'I vote for next Monday—it gives us more preparation time.');