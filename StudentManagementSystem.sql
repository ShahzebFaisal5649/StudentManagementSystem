-- Create database
CREATE DATABASE StudentManagementSystem;
GO

-- Use database
USE StudentManagementSystem;
GO

-- Create tables
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY IDENTITY(1,1),
    Department_Name VARCHAR(100) NOT NULL UNIQUE
);
GO

CREATE TABLE Faculties (
    Faculty_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20) NOT NULL,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
GO

CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY IDENTITY(1,1),
    Course_Name VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
GO

CREATE TABLE Students (
    Student_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    Age INT NULL
);
GO

CREATE TABLE Enrollments (
    Enrollment_ID INT PRIMARY KEY IDENTITY(1,1),
    Student_ID INT,
    Course_ID INT,
    Enrollment_Date DATE DEFAULT GETDATE(),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO

CREATE TABLE Grades (
    Grade_ID INT PRIMARY KEY IDENTITY(1,1),
    Student_ID INT,
    Course_ID INT,
    Grade VARCHAR(10) NOT NULL,
    Assigned_Date DATE DEFAULT GETDATE(),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO

-- Insert sample data
INSERT INTO Departments (Department_Name) VALUES ('Computer Science');
INSERT INTO Departments (Department_Name) VALUES ('Mathematics');
GO

INSERT INTO Faculties (Name, Email, Phone, Department_ID) VALUES ('Ali', 'Ali@mail.com', '1234567890', 1);
INSERT INTO Faculties (Name, Email, Phone, Department_ID) VALUES ('Ahmed', 'Ahmed@mail.com', '0987654321', 2);
GO

INSERT INTO Courses (Course_Name, Credits, Department_ID) VALUES ('Introduction to Programming', 3, 1);
INSERT INTO Courses (Course_Name, Credits, Department_ID) VALUES ('Calculus', 4, 2);
GO

INSERT INTO Students (Name, Email, Phone, Address, Age) VALUES ('Asfa', 'Asfa@mail.com', '1111111111', '123 Main St', 19);
INSERT INTO Students (Name, Email, Phone, Address, Age) VALUES ('Abdul', 'Abdul@mail.com', '2222222222', '456 St', 21);
GO

INSERT INTO Enrollments (Student_ID, Course_ID) VALUES (1, 1);
INSERT INTO Enrollments (Student_ID, Course_ID) VALUES (2, 2);
GO

INSERT INTO Grades (Student_ID, Course_ID, Grade) VALUES (1, 1, 'A');
INSERT INTO Grades (Student_ID, Course_ID, Grade) VALUES (2, 2, 'B');
GO

-- Rename table
EXEC sp_rename 'Enrollments', 'Student_Courses';
GO

-- Apply constraints
ALTER TABLE Students
ADD CONSTRAINT CK_Student_Age CHECK (Age >= 18);
GO

ALTER TABLE Courses
ADD CONSTRAINT CK_Course_Credits CHECK (Credits >= 1);
GO

-- Insert data to test the Age constraint
INSERT INTO Students (Name, Email, Phone, Address, Age) VALUES ('Usman', 'usman@mail.com', '3333333333', '789 St', 20);
-- The following insert will fail due to the age constraint
-- INSERT INTO Students (Name, Email, Phone, Address, Age) VALUES ('hina', 'hina@mail.com', '4444444444', '101 St', 17);
GO

-- Insert data to test the Credits constraint
INSERT INTO Courses (Course_Name, Credits, Department_ID) VALUES ('Data Structures', 3, 1);
-- The following insert will fail due to the credits constraint
-- INSERT INTO Courses (Course_Name, Credits, Department_ID) VALUES ('Algorithms', 0, 1);
GO

-- Delete some records
DELETE FROM Grades WHERE Student_ID = 2;
GO

DELETE FROM Student_Courses WHERE Student_ID = 2;
GO

DELETE FROM Students WHERE Student_ID = 2;
GO

-- Rename table back
EXEC sp_rename 'Student_Courses', 'Enrollments';
GO

-- Default constraint
ALTER TABLE Enrollments
ADD CONSTRAINT DF_Enrollment_Date DEFAULT GETDATE() FOR Enrollment_Date;
GO

-- Create index
CREATE INDEX IX_Student_Name ON Students (Name);
GO

-- Create view
CREATE VIEW VW_Student_Grades AS
SELECT S.Name, C.Course_Name, G.Grade
FROM Students S
INNER JOIN Enrollments E ON S.Student_ID = E.Student_ID
INNER JOIN Courses C ON E.Course_ID = C.Course_ID
INNER JOIN Grades G ON E.Enrollment_ID = G.Grade_ID;
GO

-- Drop objects
DROP VIEW VW_Student_Grades;
GO

DROP INDEX IX_Student_Name ON Students;
GO

-- Drop tables in the correct order to avoid foreign key violations
DROP TABLE Grades;
DROP TABLE Enrollments;
DROP TABLE Courses;
DROP TABLE Students;
DROP TABLE Faculties;
DROP TABLE Departments;
GO

-- Drop database
DROP DATABASE StudentManagementSystem;
