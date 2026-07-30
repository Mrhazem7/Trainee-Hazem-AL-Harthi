CREATE DATABASE Twitter_Simulation;
USE Twitter_Simulation;

CREATE TABLE Users (
    user_id     INT AUTO_INCREMENT PRIMARY KEY,
    username    VARCHAR(50) NOT NULL UNIQUE,
    password    BINARY(64) NOT NULL,
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Profiles (
    user_id       INT PRIMARY KEY,
    display_name  VARCHAR(100) NOT NULL,
    bio           VARCHAR(255),
    email         VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Tweets (
    tweet_id    INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT NOT NULL,
    content     VARCHAR(280) NOT NULL,
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Follows (
    follower_id  INT NOT NULL,
    followed_id  INT NOT NULL,
    followed_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (follower_id, followed_id),
    FOREIGN KEY (follower_id) REFERENCES Users(user_id),
    FOREIGN KEY (followed_id) REFERENCES Users(user_id)
);

CREATE TABLE Likes (
    user_id    INT NOT NULL,
    tweet_id   INT NOT NULL,
    liked_at   DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, tweet_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (tweet_id) REFERENCES Tweets(tweet_id)
);

DELIMITER //

CREATE PROCEDURE createAccount(
    IN p_username     VARCHAR(50),
    IN p_password     VARCHAR(255),
    IN p_display_name VARCHAR(100)
)
BEGIN
    DECLARE new_user_id INT;

    INSERT INTO Users (username, password)
    VALUES (p_username, MD5(p_password));

    SET new_user_id = LAST_INSERT_ID();

    INSERT INTO Profiles (user_id, display_name)
    VALUES (new_user_id, p_display_name);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE User_Follow(
    IN p_follower_username VARCHAR(50),
    IN p_followed_username VARCHAR(50)
)
BEGIN
    DECLARE v_follower_id INT;
    DECLARE v_followed_id INT;

    SELECT user_id INTO v_follower_id
    FROM Users WHERE username = p_follower_username;

    SELECT user_id INTO v_followed_id
    FROM Users WHERE username = p_followed_username;

    INSERT INTO Follows (follower_id, followed_id)
    VALUES (v_follower_id, v_followed_id);
END //

DELIMITER ;

CALL createAccount('ahmed_k', 'MyPass123', 'Ahmed Khalid');
CALL createAccount('sara_n',  'SecurePass456', 'Sara Nasser');
CALL createAccount('khalid_f','Str0ngPass!', 'Khalid Fahad');
CALL createAccount('nouf_s',  'Passw0rd789', 'Nouf Saad');

SELECT * FROM Users;
SELECT * FROM Profiles;

CALL User_Follow('ahmed_k', 'sara_n');
CALL User_Follow('ahmed_k', 'khalid_f');
CALL User_Follow('sara_n',  'ahmed_k');
CALL User_Follow('nouf_s',  'ahmed_k');

SELECT * FROM Follows;

INSERT INTO Tweets (user_id, content) VALUES
(1, 'أول تغريدة لي على المنصة!'),
(1, 'اليوم يوم جميل لتعلم SQL'),
(2, 'أحب قواعد البيانات كثيرًا'),
(3, 'من يريد التحدث عن الذكاء الاصطناعي؟');

INSERT INTO Likes (user_id, tweet_id) VALUES
(2, 1), (3, 1), (1, 3), (4, 2);

SELECT
    u.username,
    COUNT(t.tweet_id) AS Tweet_Count
FROM Users u
INNER JOIN Tweets t ON u.user_id = t.user_id
WHERE u.username = 'ahmed_k'
GROUP BY u.username;
