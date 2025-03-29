---admin account password:admin123
INSERT INTO USERINFO (sid, username, password, role)
VALUES ('a0000000', 'admin', '$2a$10$xn3LI/AjqicFYZFruSwve.681477XaVNaUQbr1gioaWPn4twsRYW', 'ADMIN');

---course material
INSERT INTO MATERIAL (class_num) VALUES ('Lec1');

---poll question
INSERT INTO POLL (question, created_by)
VALUES ('Which date do you prefer for the mid-term test?', 1);