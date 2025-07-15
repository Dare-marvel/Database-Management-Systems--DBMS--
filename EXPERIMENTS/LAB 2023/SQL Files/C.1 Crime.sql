-- Create Database -- 
CREATE DATABASE CriminalRecord;
USE CriminalRecord;

-- Create Criminal Table -- 
CREATE TABLE Criminal (
criminal_id INT PRIMARY KEY, name VARCHAR(30), birth_place VARCHAR(20), dob DATE, gender ENUM("Male", "Female"),
blood_group ENUM("O+", "A+", "B+", "AB+", "O-", "A-", "B-", "AB-"), national_id BIGINT UNSIGNED, passport_id BIGINT UNSIGNED,
threat_level ENUM("Low", "High", "Severe"), previous_occupation_name VARCHAR(20),
previous_occupation_income INT UNSIGNED, current_occupation_name VARCHAR(20),
current_occupation_income INT UNSIGNED
);

-- Update Columns --
ALTER TABLE Criminal MODIFY COLUMN national_id BIGINT UNSIGNED UNIQUE;
ALTER TABLE Criminal MODIFY COLUMN passport_id BIGINT UNSIGNED UNIQUE;

-- View Table Schema --
DESC Criminal;

-- Insert Data -- 
INSERT INTO Criminal values
(1000, "Ravi Kumar", "Mumbai", "1985-07-12", "Male", "A+", 123456789, 231283456, "High", "Construction Worker", 35000, "Security Guard", 40000),
(1001, "Priya Sharma", "Delhi", "1990-04-25", "Female", "B-", 987654321, 424987654, "Severe", "Sales Representative", 45000, "Data Analyst", 55000),
(1002, "Rajesh Singh", "Lucknow", "1980-12-08", "Male", "O+", 456789123, 676456789, "Low", "Teacher", 50000, "Nurse", 60000),
(1003, "Anjali Gupta", "Kolkata", "1995-09-17", "Female", "A-", 654321789, 975654321, "High", "Software Engineer", 75000, "Doctor", 100000),
(1004, "Mohan Sharma", "Chennai", "1988-03-04", "Male", "AB+", 789123456, 275789123, "Severe", "Chef", 40000, "Lawyer", 80000),
(1005, "Sunita Reddy", "Hyderabad", "1992-11-21", "Female", "O-", 234567890, 274234567, "Low", "Retail Salesperson", 30000, "Graphic Designer", 45000),
(1006, "Rohit Patel", "Ahmedabad", "1983-06-30", "Male", "B+", 345678901, 115345678, "High", "Engineer", 70000, "Pilot", 110000),
(1007, "Nisha Gupta", "Jaipur", "1993-08-14", "Female", "AB-", 567890123, 041567890, "Severe", "Accountant", 55000, "Pharmacist", 90000),
(1008, "Sanjay Yadav", "Patna", "1987-02-19", "Male", "A+", 890123456, 406890123, "Low", "Electrician", 42000, "Plumber", 48000),
(1009, "Aishwarya Gupta", "Bangalore", "1998-05-03", "Female", "O+", 123890456, 288678901, "Severe", "Marketing Manager", 60000, "Sales Manager", 70000);

-- View Table Data --
SELECT * FROM Criminal;

CREATE TABLE Physical_Appearance(id INT NOT NULL, height varchar(3), weight varchar(3),
eye_color varchar(10), hair_color varchar(10), FOREIGN KEY (id) REFERENCES Criminal(criminal_id)
);

DESC Physical_Appearance;

INSERT INTO Physical_Appearance values
(1000, "178", "70", "Blue", "Black"),
(1001, "168", "60", "Black", "Red"),
(1002, "173", "75", "Hazel", "Brown"),
(1003, "170", "58", "Brown", "Black"),
(1004, "183", "80", "Black", "Grey"),
(1005, "165", "55", "Brown", "Brown"),
(1006, "188", "90", "Brown", "Black"),
(1007, "168", "65", "Hazel", "Brown"),
(1008, "175", "70", "Brown", "Black"),
(1009, "173", "60", "Brown", "Black");

SELECT * FROM Physical_Appearance;
