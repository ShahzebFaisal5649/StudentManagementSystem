# Student Management System - SQL Server Project

## Overview

The **Student Management System** is a SQL Server-based database project designed to manage students, faculties, courses, departments, enrollments, and grades efficiently. This project demonstrates various SQL operations including table creation, data insertion, constraints application, renaming objects, and more, providing a comprehensive example of database management.

## Table of Contents

- [Project Description](#project-description)
- [Database Schema](#database-schema)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Example Data](#example-data)
- [Contributing](#contributing)
- [License](#license)

## Project Description

This project simulates a Student Management System with the following key entities:
- **Departments**: Represents different academic departments.
- **Faculties**: Contains information about the faculty members.
- **Courses**: Stores the courses offered by departments.
- **Students**: Maintains the students' personal and academic information.
- **Enrollments**: Tracks which students are enrolled in which courses.
- **Grades**: Records the grades assigned to students for their enrolled courses.

The project demonstrates various SQL functionalities including:
- Creating and managing tables.
- Applying constraints and indexes.
- Inserting and manipulating data.
- Implementing views for data aggregation.
- Performing CRUD operations with real-time feedback.

## Database Schema

The database schema consists of the following tables:

- **Departments**: Stores department information.
  - `Department_ID`: Primary key.
  - `Department_Name`: Name of the department (Unique).

- **Faculties**: Stores faculty member information.
  - `Faculty_ID`: Primary key.
  - `Name`: Faculty member's name.
  - `Email`: Faculty member's email (Unique).
  - `Phone`: Faculty member's phone number.
  - `Department_ID`: Foreign key referencing the `Departments` table.

- **Courses**: Stores course information.
  - `Course_ID`: Primary key.
  - `Course_Name`: Name of the course.
  - `Credits`: Number of credits for the course.
  - `Department_ID`: Foreign key referencing the `Departments` table.

- **Students**: Stores student information.
  - `Student_ID`: Primary key.
  - `Name`: Student's name.
  - `Email`: Student's email (Unique).
  - `Phone`: Student's phone number.
  - `Address`: Student's address.
  - `Age`: Student's age (with a constraint that age must be 18 or older).

- **Enrollments**: Tracks student enrollments in courses.
  - `Enrollment_ID`: Primary key.
  - `Student_ID`: Foreign key referencing the `Students` table.
  - `Course_ID`: Foreign key referencing the `Courses` table.
  - `Enrollment_Date`: Date of enrollment (default to current date).

- **Grades**: Stores the grades students receive for courses.
  - `Grade_ID`: Primary key.
  - `Student_ID`: Foreign key referencing the `Students` table.
  - `Course_ID`: Foreign key referencing the `Courses` table.
  - `Grade`: Grade received.
  - `Assigned_Date`: Date the grade was assigned (default to current date).

## Features

- **Comprehensive Schema**: Represents a complete student management system.
- **Data Integrity**: Implements constraints and foreign keys to ensure data consistency.
- **Real-Time Feedback**: Includes `PRINT` and `SELECT` statements to show progress and output after every major step.
- **Advanced SQL Techniques**: Demonstrates table renaming, view creation, and index management.
- **Sample Data**: Pre-populated with example departments, faculties, students, courses, enrollments, and grades.

## Installation

1. **Clone the Repository**: 
   ```bash
   git clone https://github.com/yourusername/student-management-system.git

   
![Screenshot 2024-08-09 152555](https://github.com/user-attachments/assets/01230937-18f5-436e-9e9c-c2785b3c1c06)
