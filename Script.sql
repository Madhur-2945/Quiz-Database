create database quiz;

use quiz;

CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(120) NOT NULL UNIQUE,
    password_hash VARCHAR(128) NOT NULL,
    profile_picture VARCHAR(200) DEFAULT 'default.jpg',
    is_admin BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE UserProfile (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE,
    bio TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE Category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Quiz (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    code VARCHAR(10) NOT NULL UNIQUE,
    user_id INT NOT NULL,
    category_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

CREATE TABLE Question (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(200) NOT NULL,
    quiz_id INT NOT NULL,
    FOREIGN KEY (quiz_id) REFERENCES Quiz(id)
);

CREATE TABLE Answer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(200) NOT NULL,
    is_correct BOOLEAN DEFAULT FALSE,
    question_id INT NOT NULL,
    FOREIGN KEY (question_id) REFERENCES Question(id)
);

CREATE TABLE Score (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    quiz_id INT NOT NULL,
    score INT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (quiz_id) REFERENCES Quiz(id)
);

CREATE TABLE QuizAttempt (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    quiz_id INT NOT NULL,
    score INT,
    completed BOOLEAN DEFAULT FALSE,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (quiz_id) REFERENCES Quiz(id)
);

CREATE TABLE Achievement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    icon VARCHAR(100) DEFAULT 'trophy.png'
);

CREATE TABLE UserAchievement (
    user_id INT,
    achievement_id INT,
    earned_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, achievement_id),
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (achievement_id) REFERENCES Achievement(id)
);

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    is_admin BOOLEAN NOT NULL
);

-- Inserting values into tables
INSERT INTO User (username, email, password_hash, is_admin) VALUES
('john_doe', 'john@example.com', 'hashedpass1', FALSE),
('jane_smith', 'jane@example.com', 'hashedpass2', TRUE),
('bob_jones', 'bob@example.com', 'hashedpass3', FALSE),
('alice_w', 'alice@example.com', 'hashedpass4', FALSE),
('mike_r', 'mike@example.com', 'hashedpass5', FALSE),
('sarah_k', 'sarah@example.com', 'hashedpass6', FALSE),
('tom_h', 'tom@example.com', 'hashedpass7', FALSE),
('emma_l', 'emma@example.com', 'hashedpass8', FALSE),
('david_m', 'david@example.com', 'hashedpass9', FALSE),
('lisa_p', 'lisa@example.com', 'hashedpass10', FALSE);

INSERT INTO UserProfile (user_id, bio) VALUES
(1, 'Love quizzes and trivia games'),
(2, 'Quiz master and admin'),
(3, 'Casual quiz enthusiast'),
(4, 'History buff'),
(5, 'Science nerd'),
(6, 'Pop culture fan'),
(7, 'Sports lover'),
(8, 'Book worm'),
(9, 'Movie buff'),
(10, 'Music enthusiast');

INSERT INTO Category (name) VALUES
('History'),
('Science'),
('Geography'),
('Sports'),
('Entertainment'),
('Literature'),
('Music'),
('Art'),
('Technology'),
('General Knowledge');

INSERT INTO Quiz (title, code, user_id, category_id) VALUES
('MySQL Basics', 'SQL01', 2, 9),
('MongoDB Queries', 'MON01', 5, 9),
('C++ Fundamentals', 'CPP01', 1, 9),
('Java OOP Concepts', 'JAV01', 7, 9),
('Python Essentials', 'PYT01', 9, 9),
('HTML5 Features', 'HTM01', 4, 9),
('CSS Styling', 'CSS01', 8, 9),
('JavaScript Basics', 'JS01', 10, 9),
('PHP Programming', 'PHP01', 5, 9),
('Ruby Fundamentals', 'RUB01', 2, 9);

INSERT INTO Question (content, quiz_id) VALUES
('What is a PRIMARY KEY in MySQL?', 1),
('How do you create a table in MySQL?', 1),
('What is a JOIN operation in MySQL?', 1),

('What is a MongoDB collection?', 2),
('How do you insert a document in MongoDB?', 2),
('What is a MongoDB aggregation?', 2),

('What is a pointer in C++?', 3),
('How do you declare a variable in C++?', 3),
('What is a class in C++?', 3),

('What is inheritance in Java?', 4),
('How do you create an object in Java?', 4),
('What is polymorphism in Java?', 4),

('What is a Python list?', 5),
('How do you define a function in Python?', 5),
('What is a dictionary in Python?', 5),

('What is the purpose of <div> in HTML?', 6),
('How do you create a hyperlink in HTML?', 6),
('What is the <form> element in HTML?', 6),

('What does CSS stand for?', 7),
('How do you apply styles to an HTML element?', 7),
('What is a CSS selector?', 7),

('What is a JavaScript function?', 8),
('How do you declare a variable in JavaScript?', 8),
('What is an event in JavaScript?', 8),

('What is PHP used for?', 9),
('How do you connect to a database in PHP?', 9),
('What is a PHP session?', 9),

('What is a Ruby gem?', 10),
('How do you define a method in Ruby?', 10),
('What is a Ruby module?', 10);

INSERT INTO Answer (content, is_correct, question_id) VALUES
-- MySQL
('Unique identifier for a row', TRUE, 91),
('A table index', FALSE, 91),
('Using the CREATE TABLE statement', TRUE, 92),
('Using the INSERT statement', FALSE, 92),
('Combining rows from two or more tables', TRUE, 93),
('Deleting rows from a table', FALSE, 93),

-- MongoDB
('Group of documents', TRUE, 94),
('A single record', FALSE, 94),
('Using the insertOne() method', TRUE, 95),
('Using the deleteOne() method', FALSE, 95),
('Operations that process data records', TRUE, 96),
('Operations that delete data records', FALSE, 96),

-- C++
('Memory address reference', TRUE, 97),
('A data type', FALSE, 97),
('Using the type specifier', TRUE, 98),
('Using the class keyword', FALSE, 98),
('A blueprint for creating objects', TRUE, 99),
('A function declaration', FALSE, 99),

-- Java
('Class extending another class', TRUE, 100),
('A loop structure', FALSE, 100),
('Using the new keyword', TRUE, 101),
('Using the class keyword', FALSE, 101),
('Ability of different classes to be treated as instances of the same class', TRUE, 102),
('Ability to create multiple objects', FALSE, 102),

-- Python
('Ordered collection of items', TRUE, 103),
('A dictionary', FALSE, 103),
('Using the def keyword', TRUE, 104),
('Using the class keyword', FALSE, 104),
('A collection of key-value pairs', TRUE, 105),
('An ordered list', FALSE, 105),

-- HTML
('Content division element', TRUE, 106),
('Image container', FALSE, 106),
('Using the <a> tag', TRUE, 107),
('Using the <div> tag', FALSE, 107),
('A container for user input', TRUE, 108),
('A container for images', FALSE, 108),

-- CSS
('Cascading Style Sheets', TRUE, 109),
('Computer Style System', FALSE, 109),
('Using the style attribute', TRUE, 110),
('Using the class attribute', FALSE, 110),
('A pattern used to select elements', TRUE, 111),
('A method to delete elements', FALSE, 111),

-- JavaScript
('Reusable code block', TRUE, 112),
('A variable type', FALSE, 112),
('Using the var keyword', TRUE, 113),
('Using the function keyword', FALSE, 113),
('User actions detected by the browser', TRUE, 114),
('Database connections', FALSE, 114),

-- PHP
('Server-side scripting', TRUE, 115),
('Client-side styling', FALSE, 115),
('Using the mysqli_connect function', TRUE, 116),
('Using the echo statement', FALSE, 116),
('A way to store user information across requests', TRUE, 117),
('A method to delete user information', FALSE, 117),

-- Ruby
('Reusable library/package', TRUE, 118),
('A database table', FALSE, 118),
('Using the def keyword', TRUE, 119),
('Using the class keyword', FALSE, 119),
('A collection of methods and constants', TRUE, 120),
('A data type', FALSE, 120);


INSERT INTO Score (user_id, quiz_id, score) VALUES
(1, 1, 85),
(3, 2, 70),
(4, 3, 95),
(5, 4, 60),
(6, 5, 80),
(7, 6, 75),
(8, 7, 90),
(9, 8, 65),
(10, 9, 88),
(1, 10, 82);

INSERT INTO QuizAttempt (user_id, quiz_id, score, completed) VALUES
(1, 1, 85, TRUE),
(3, 2, 70, TRUE),
(4, 3, 95, TRUE),
(5, 4, 60, TRUE),
(6, 5, 80, TRUE),
(7, 6, 75, TRUE),
(8, 7, 90, TRUE),
(9, 8, 65, TRUE),
(10, 9, 88, TRUE),
(1, 10, NULL, FALSE);

INSERT INTO Achievement (name, description) VALUES
('Quiz Novice', 'Complete 1 quiz'),
('Quiz Pro', 'Score 90+ on 3 quizzes'),
('Category Master', 'Complete all quizzes in a category'),
('Quick Thinker', 'Complete quiz in under 5 min'),
('Perfect Score', 'Get 100% on any quiz'),
('Quiz Creator', 'Create your first quiz'),
('Trivia Buff', 'Complete 10 quizzes'),
('Streak Master', 'Complete 5 quizzes in a row'),
('Knowledge Seeker', 'Try all categories'),
('Community Star', 'Help 5 other users');

INSERT INTO UserAchievement (user_id, achievement_id) VALUES
(1, 1),
(2, 6),
(3, 1),
(4, 5),
(5, 1),
(6, 7),
(7, 1),
(8, 2),
(9, 1),
(10, 3);


-- Run SQL queries (minimum 20) covering all concepts learned in the class
-- Query 1: Retrieve all users with their profile bio
SELECT u.username, up.bio
FROM User u
LEFT JOIN UserProfile up ON u.id = up.user_id;

-- Query 2: Update a user's email
UPDATE User
SET email = 'john.doe.updated@example.com'
WHERE username = 'john_doe';

-- Query 3: Lists all category names in alphabetical order
SELECT name
FROM Category
ORDER BY name ASC;

-- Query 4: Shows quiz titles alongside the usernames of their creators
SELECT q.title, u.username
FROM Quiz q
JOIN User u ON q.user_id = u.id;

-- Query 4: Shows quiz titles alongside the usernames of their creators
SELECT q.title, u.username
FROM Quiz q
JOIN User u ON q.user_id = u.id;

-- Query 5: Counts the number of questions for each quiz, including quizzes with zero questions
SELECT q.title, COUNT(qu.id) AS question_count
FROM Quiz q
LEFT JOIN Question qu ON q.id = qu.quiz_id
GROUP BY q.title;

-- Query 6: Retrieves usernames and emails of users who are not administrators
SELECT username, email
FROM User
WHERE is_admin = FALSE;

-- Query 7: Counts the number of attempts for each quiz, including quizzes with no attempts
SELECT q.title, COUNT(qa.id) AS attempt_count
FROM Quiz q
LEFT JOIN QuizAttempt qa ON q.id = qa.quiz_id
GROUP BY q.title;

-- Query 8: Lists the content of all questions for a specific quiz (e.g., quiz_id = 1)
SELECT content
FROM Question
WHERE quiz_id = 1;

-- Query 9: Updates the email address of a user with a specific username (e.g., 'john_doe')
UPDATE User
SET email = 'john.doe.new@example.com'
WHERE username = 'john_doe';

-- Query 10: Calculates the average score across all scores recorded in the Score table
SELECT AVG(score) AS overall_average_score
FROM Score;

-- Query 11: Identifies quizzes that have no associated questions
SELECT q.title
FROM Quiz q
LEFT JOIN Question qu ON q.id = qu.quiz_id
WHERE qu.id IS NULL;

-- Query 12: Counts the number of quizzes in each category, including categories with zero quizzes
SELECT c.name, COUNT(q.id) AS quiz_count
FROM Category c
LEFT JOIN Quiz q ON c.id = q.category_id
GROUP BY c.name;

-- Query 13: Lists distinct usernames of users who have attempted at least one quiz
SELECT DISTINCT u.username
FROM User u
JOIN QuizAttempt qa ON u.id = qa.user_id;

-- Query 14: Finds the most recent quiz attempt timestamp for each user
SELECT u.username, MAX(qa.timestamp) AS latest_attempt
FROM User u
LEFT JOIN QuizAttempt qa ON u.id = qa.user_id
GROUP BY u.username;

-- Query 15: Retrieves all answers for a specific question (e.g., question_id = 1) with their correctness
SELECT content, is_correct
FROM Answer
WHERE question_id = 1;

-- Query 16: Updates the title of a specific quiz (e.g., quiz_id = 5)
UPDATE Quiz
SET title = 'Python Basics Revised'
WHERE id = 5;

-- Query 17: Lists usernames of users who achieved a perfect score (e.g., 100) in any quiz
SELECT DISTINCT u.username
FROM User u
JOIN Score s ON u.id = s.user_id
WHERE s.score = 100;

-- Query 18: Counts the total number of achievements earned across all users
SELECT COUNT(*) AS total_achievements
FROM UserAchievement;

-- Query 19: Lists quiz titles created after a specific date (e.g., January 1, 2025)
SELECT title, created_at
FROM Quiz
WHERE created_at > '2025-01-01';

-- Query 20: Creates a view showing each category and the number of quizzes it contains
CREATE VIEW QuizCategoryStats AS
SELECT c.name, COUNT(q.id) AS quiz_count
FROM Category c
LEFT JOIN Quiz q ON c.id = q.category_id
GROUP BY c.name;

-- Query 21: Creates a temporary table for quiz statistics, demonstrating DDL without permanent table creation
CREATE TEMPORARY TABLE TempQuizStats (
    quiz_id INT,
    question_count INT,
    PRIMARY KEY (quiz_id)
);

-- Query 22: Inserts a new user, testing NOT NULL and UNIQUE constraints (assuming 'alice' doesn’t exist)
INSERT INTO User (username, email, password_hash, is_admin)
VALUES ('Alexander', 'alexander@example.com', 'hashed_pass789', FALSE);

-- Query 23: Inserts a new quiz for an existing user (e.g., user_id = 1), ensuring foreign key validity
INSERT INTO Quiz (title, code, user_id, category_id)
VALUES ('SQL Advanced', 'SQL02', 1, 9);

-- Query 24: Deletes a quiz and its dependent questions safely (e.g., quiz with code 'SQL02')
DELETE FROM Question WHERE quiz_id = (SELECT id FROM Quiz WHERE code = 'SQL02');
DELETE FROM Quiz WHERE code = 'SQL02';

-- Query 25: Combines usernames of admins and users with perfect scores using UNION
SELECT username FROM User WHERE is_admin = TRUE
UNION
SELECT u.username FROM User u
JOIN Score s ON u.id = s.user_id WHERE s.score = 100;

-- Query 26: Finds usernames common to admins and quiz creators using INTERSECT
SELECT username FROM User WHERE is_admin = TRUE
INTERSECT
SELECT u.username FROM User u
JOIN Quiz q ON u.id = q.user_id;

-- Query 27: Lists quizzes with above-average question counts using a sub-query
SELECT title
FROM Quiz q
WHERE (SELECT COUNT(*) FROM Question qu WHERE qu.quiz_id = q.id) > 
      (SELECT (SELECT COUNT(*) FROM Question) / (SELECT COUNT(*) FROM Quiz));
      
-- Query 28: Finds users who scored higher than the average score on any quiz
SELECT DISTINCT u.username
FROM User u
JOIN Score s ON u.id = s.user_id
WHERE s.score > (SELECT AVG(score) FROM Score);

-- Query 29: Creates a view of top-scoring users per quiz
CREATE VIEW TopScores AS
SELECT q.title, u.username, MAX(s.score) AS top_score
FROM Quiz q
JOIN Score s ON q.id = s.quiz_id
JOIN User u ON s.user_id = u.id
GROUP BY q.title, u.username;

-- Query 30: Alters the TopScores view to add a filter for scores above 80
ALTER VIEW TopScores AS
SELECT q.title, u.username, MAX(s.score) AS top_score
FROM Quiz q
JOIN Score s ON q.id = s.quiz_id
JOIN User u ON s.user_id = u.id
WHERE s.score > 80
GROUP BY q.title, u.username;