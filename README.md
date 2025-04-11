# Quiz-Database

## Overview
The Quiz Web Application is a dynamic and engaging platform designed for creating, managing, and participating in quizzes. It supports different types of users, including regular users and administrators, each with varied access and responsibilities. The primary goal is to offer an interactive learning environment while enabling efficient content management and performance tracking.

## Features
- **User Registration and Profiles:** Users can register, maintain profiles, and personalize their experience with optional profile pictures and bios.
- **Quiz Creation:** Users can create quizzes with multiple questions and answers, categorized for easy organization.
- **Quiz Participation:** Participants can attempt quizzes, with their scores and completion status tracked.
- **Achievement System:** Users earn achievements based on their quiz activity and performance, promoting engagement and motivation.
- **Performance Analysis:** The system automatically calculates and stores scores, allowing users to track their progress.

## Database Design

### Entities and Attributes

1. **Users**
   - Attributes: ID, username, email, password hash, profile picture, admin status, account creation date, last profile update date.
   - Description: Stores essential user data for authentication and account management.

2. **User Profiles**
   - Attributes: ID, bio, creation date, last update date.
   - Description: Extends user information with additional profile details.

3. **Categories**
   - Attributes: ID, name.
   - Description: Represents different categories under which quizzes are organized.

4. **Quizzes**
   - Attributes: ID, title, unique code, creation date, last update date.
   - Description: Stores quiz-related metadata, including the creator and associated category.

5. **Questions**
   - Attributes: ID, content.
   - Description: Contains individual questions belonging to a specific quiz.

6. **Answers**
   - Attributes: ID, content, correctness flag, question ID.
   - Description: Stores possible answer options and indicates the correct one.

7. **Scores**
   - Attributes: ID, score value, timestamp.
   - Description: Records final scores achieved by users in quizzes.

8. **Quiz Attempts**
   - Attributes: ID, score, completion status, timestamp.
   - Description: Tracks a user's attempt on a quiz, including completion status.

9. **Achievements**
   - Attributes: ID, name, description, icon.
   - Description: Represents various achievements that users can earn.

### Relationships
- **Users and User Profiles:** One-to-One.
- **Users and Quizzes:** One-to-Many.
- **Quizzes and Categories:** Many-to-One.
- **Quizzes and Questions:** One-to-Many.
- **Questions and Answers:** One-to-Many.
- **Users and Quiz Attempts:** One-to-Many.
- **Quizzes and Quiz Attempts:** One-to-Many.
- **Quiz Attempts and Scores:** One-to-One.
- **Users and Scores:** One-to-Many.
- **Users and Achievements:** One-to-Many.
- **Achievements and User Achievements:** One-to-Many.

## Entity Relationship Diagram
The ER diagram visually represents the relationships between the entities in the database. It ensures a well-structured and modular system design.

## Relational Model
The relational model is derived from the ER diagram and consists of the following tables:
1. **User**
2. **UserProfile**
3. **Category**
4. **Quiz**
5. **Question**
6. **Answer**
7. **Score**
8. **QuizAttempt**
9. **Achievement**
10. **UserAchievement**

## Normalization
The database schema is normalized up to Boyce-Codd Normal Form (BCNF) to eliminate redundancy and ensure data integrity.

## SQL Queries
The project includes a set of SQL queries covering various aspects such as data retrieval, updates, and complex joins to demonstrate the functionality of the database.

## Tools and Technologies
- **Backend Framework:** Python (Flask)
- **Database:** MySQL
- **Environment:** VS Code, MySQL Workbench
- **Version Control:** Git

## Project Demonstration
The project demonstration was conducted using MySQL Shell and MySQL Workbench to interact directly with the database, test functionalities, and verify that the backend logic and schema worked as intended.

## Learning Outcomes
- **Database Design:** Gained a deeper understanding of relational database design and normalization.
- **Data Integrity:** Practiced implementing constraints to ensure data integrity.
- **Complex SQL Queries:** Explored advanced SQL queries for data retrieval and manipulation.
- **Manual Testing:** Learned to simulate user activity and test application scenarios without a GUI.

## Challenges
- **Database Normalization:** Ensuring normalization up to BCNF.
- **Managing Relationships:** Handling different types of relationships between entities.
- **Data Consistency:** Designing the schema to prevent inconsistent data.
- **Testing Without GUI:** Simulating real-world operations through SQL queries.

## Conclusion
This project provided valuable experience in designing, building, and testing a robust relational database system. It strengthened my foundation in data modeling and SQL, essential for future backend development tasks.
