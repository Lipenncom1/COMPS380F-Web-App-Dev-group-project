---admin account password:admin123
INSERT INTO USERINFO (sid, username, password, role)
VALUES ('a0000000', 'admin', '$2a$10$Dy2LuSadB8li2vYAGPbRH.Xt24V.QFWUXv1cEwc1CdLaCckjC20MS', 'ADMIN');

---course material
INSERT INTO MATERIAL (class_num) VALUES ('Lec1');

---poll question
INSERT INTO POLL (question, created_by)
VALUES ('Which date do you prefer for the mid-term test?', 1);