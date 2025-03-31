CREATE TABLE IF NOT EXISTS USERINFO (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    sid VARCHAR(20) DEFAULT 'a0000000' NOT NULL UNIQUE,
    username VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fullName VARCHAR(20) DEFAULT 'FACKY CHAIN' NOT NULL,
    phoneNum VARCHAR(20),
    email VARCHAR(50),
    role VARCHAR(20) DEFAULT 'STUDENT'     --student/teacher/admin
);

CREATE TABLE IF NOT EXISTS MATERIAL (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    class_num VARCHAR(20) DEFAULT 'Lec0' NOT NULL UNIQUE,
    file_link VARCHAR(255) DEFAULT 'https://mailouhkedu-my.sharepoint.com/:w:/g/personal/s1281580_live_hkmu_edu_hk/EU09lK8DY3JKvr4laxtS9_UBUppM9O56zno_5Ewe4K1_LA?e=j4nhUv' NOT NULL
);

CREATE TABLE IF NOT EXISTS CLASS_COMMENTS (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    class_num VARCHAR(20) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USERINFO(id),
    FOREIGN KEY (class_num) REFERENCES MATERIAL(class_num)
    );
---poll question storage
CREATE TABLE IF NOT EXISTS POLL (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    question VARCHAR(255) DEFAULT 'sample question xxx' NOT NULL,
    created_by BIGINT NOT NULL,
    FOREIGN KEY (created_by) REFERENCES USERINFO(id)
    );

---Voting options table (record the number of votes for each option)
CREATE TABLE IF NOT EXISTS POLL_OPTION (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    poll_id BIGINT NOT NULL,
    option_text VARCHAR(100) NOT NULL,
    vote_count INT DEFAULT 0,
    FOREIGN KEY (poll_id) REFERENCES POLL(id)
);

-- User voting record table (record user selection)
CREATE TABLE IF NOT EXISTS USER_VOTE (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    poll_id BIGINT NOT NULL,
    option_id BIGINT NOT NULL,
    voted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USERINFO(id),
    FOREIGN KEY (poll_id) REFERENCES POLL(id),
    FOREIGN KEY (option_id) REFERENCES POLL_OPTION(id),
    UNIQUE (user_id, poll_id)  -- keep user can only choose one option
);

---Voting Comment Form (Associating users and votes)
CREATE TABLE IF NOT EXISTS POLL_COMMENTS (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    poll_id BIGINT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USERINFO(id),
    FOREIGN KEY (poll_id) REFERENCES POLL(id)
);
