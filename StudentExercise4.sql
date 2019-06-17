--Create Exercise table
CREATE TABLE ExercisesL (
    Id INTEGER NOT NULL PRIMARY KEY,
    [Name] VARCHAR (50) NOT null,
    [language] VARCHAR (50) NOT NULL

);
--Create  Cohort table
CREATE TABLE CohortOne (
    Id INTEGER NOT NULL PRIMARY KEY,
    [Name] VARCHAR (50) NOT NULL
);

--Create student table
CREATE TABLE Students (
    id INTEGER NOT NULL PRIMARY KEY,
    FirstName VARCHAR (50),
    LastName VARCHAR (50),
    SlackHandle VARCHAR (50),
    CohortOneId INTEGER NOT null,
    CONSTRAINT FK_STUDENT_CohortOne FOREIGN KEY(CohortOneId) REFERENCES CohortOne(Id)

); 


--Create StudentExercise table
CREATE TABLE StudentForExercises (
    id INTEGER NOT NULL PRIMARY KEY,
    StudentsId INTEGER NOT NULL,
    ExercisesLId INTEGER NOT NULL,
    CONSTRAINT FK_Students FOREIGN KEY(StudentsId) REFERENCES Students(id),
    CONSTRAINT FK_ExercisesLId FOREIGN KEY(ExercisesLId) REFERENCES ExercisesL(id)
);


--Create Insturector table
CREATE TABLE InstructorsClass (
    id INTEGER NOT NULL PRIMARY KEY,
    FirstName VARCHAR (50),
    LastName VARCHAR (50),
    SlackHandle VARCHAR (50),
    CohortOneId INTEGER NOT null,
    CONSTRAINT FK_InstructorsClass_CohortOne FOREIGN KEY(CohortOneId) REFERENCES CohortOne(Id)

); 

--Running all the Query
SELECT * FROM Students;
SELECT * FROM CohortOne;
SELECT * FROM ExercisesL;
SELECT * FROM InstructorsClass;
SELECT * FROM StudentForExercises;


-- DROP TABLE CohortOne;
-- DROP TABLE student;
-- DROP TABLE StudentExercises;
-- DROP TABLE InstructorsClass;
-- DROP TABLE Exercises;



-- DELETE from Student where id =10;
-- DELETE from Student where id =11;
-- DELETE from Student where id =1;


--Insert Three new Cohort 
INSERT INTO CohortOne (ID,[Name]) VALUES(1,'COHORT 30');
INSERT INTO CohortOne (ID,[Name]) VALUES(2,'COHORT 31');
INSERT INTO CohortOne (ID,[Name]) VALUES(3,'COHORT 32');

--Insert 10 Students into student table

INSERT INTO Students (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 02, 'Chris', 'Morgan', 'Chris@slack.com', 3);
INSERT INTO Students (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 03, 'Billy', 'Tom', 'aliBill@slack.com', 1);
INSERT INTO Students (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 04, 'Rose', 'Wisotzky', 'Rose@slack.com', 2);
INSERT INTO Students (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 05, 'Loah', 'Hoefling', 'leah@slack.com', 2);
INSERT INTO Students (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 06, 'William', 'Mitchell', 'Mitchell@slack.com', 3);
INSERT INTO Students (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 07, 'Dek', 'Haji', 'Dek@slack.com', 3);
INSERT INTO Students (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 08, 'Joel', 'Mondesir', 'Joel@slack.com', 2);
INSERT INTO Students (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 09, 'Josh', 'Like', 'Josh@slack.com', 1);
INSERT INTO Students (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 010, 'John', 'Brown', 'John@slack.com', 2);
INSERT INTO Students (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 011, 'Kelly', 'Handerson', 'Kell@slack.com', 1);

--Insert 5 instructors row on instructor table
INSERT INTO InstructorsClass (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 011, 'Jisi', 'David', 'jisi@slack.com', 1);

INSERT INTO InstructorsClass (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 014,'John','Filling','Ajohny@slack.com', 2);
INSERT INTO InstructorsClass (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 015, 'Kristen', 'Moaly', 'kristen@slack.com', 1);
INSERT INTO InstructorsClass (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 012, 'Andy', 'Collin', 'Andy@slack.com', 2);
INSERT INTO InstructorsClass (ID, FirstName, LastName, SlackHandle, CohortOneId)
VALUES( 013, 'Steve', 'Brownlee', 'steve@slack.com', 3);

--Insert five Exercises into exercise table

INSERT INTO ExercisesL (id,[Name], [Language])VALUES(01,'Nutshell', 'React');
INSERT INTO ExercisesL (id, [Name],[Language]) VALUES( 02, 'Condition', 'JavaScript');
INSERT INTO ExercisesL (id, [Name],[Language]) VALUES( 03, 'Classes', 'C#');
INSERT INTO ExercisesL (id, [Name],[Language]) VALUES( 04, 'Inner Join', 'SQL');
INSERT INTO ExercisesL (id, [Name],[Language]) VALUES( 05, 'Background Color', 'CSS');
SELECT * FROM ExercisesL;

--Create StudentsExercise table
INSERT INTO StudentForExercises (Id,StudentsId, ExercisesLId) VALUES (1,02, 01);
INSERT INTO StudentForExercises (Id,StudentsId, ExercisesLId) VALUES (2,04, 02);
INSERT INTO StudentForExercises (Id,StudentsId, ExercisesLId) VALUES (3,02, 03);
INSERT INTO StudentForExercises (Id,StudentsId, ExercisesLId) VALUES (4,07, 05);
INSERT INTO StudentForExercises (Id,StudentsId, ExercisesLId) VALUES (5,06, 04);
INSERT INTO StudentForExercises (Id,StudentsId, ExercisesLId) VALUES (6,01, 03);
INSERT INTO StudentForExercises (Id,StudentsId, ExercisesLId) VALUES (7,02, 04);
INSERT INTO StudentForExercises (Id,StudentsId, ExercisesLId) VALUES (8,04, 05);
INSERT INTO StudentForExercises (Id,StudentsId, ExercisesLId) VALUES (9,11, 03);
INSERT INTO StudentForExercises (Id,StudentsId, ExercisesLId) VALUES (10,10, 01);
INSERT INTO StudentForExercises (Id,StudentsId, ExercisesLId) VALUES (11,09, 02);
INSERT INTO StudentForExercises (Id,StudentsId, ExercisesLId) VALUES (12,05, 04);
INSERT INTO StudentForExercises (Id,StudentsId, ExercisesLId) VALUES (13,05, 03);
select * FROM StudentForExercises;

--JOIN query for studentExercise and student
SELECT firstName, lastName 
 from StudentForExercises ex
  JOIN Students s on ex.StudentsId = s.id
  ORDER by StudentsId
