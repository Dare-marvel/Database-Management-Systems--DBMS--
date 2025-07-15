USE CriminalRecord;

SET AUTOCOMMIT = 0;

INSERT INTO Criminal values
(1000, "Ravi Kumar", "Mumbai", "1985-07-12", "Male", "A+", 123456789, 231283456, "High", "Construction Worker", 35000, "Security Guard", 40000),
(1001, "Priya Sharma", "Delhi", "1990-04-25", "Female", "B-", 987654321, 424987654, "Severe", "Sales Representative", 45000, "Data Analyst", 55000);

SAVEPOINT SP;

INSERT INTO Criminal values
(1002, "Rajesh Singh", "Lucknow", "1980-12-08", "Male", "O+", 456789123, 676456789, "Low", "Teacher", 50000, "Nurse", 60000),
(1003, "Anjali Gupta", "Kolkata", "1995-09-17", "Female", "A-", 654321789, 975654321, "High", "Software Engineer", 75000, "Doctor", 100000),
(1004, "Mohan Sharma", "Chennai", "1988-03-04", "Male", "AB+", 789123456, 275789123, "Severe", "Chef", 40000, "Lawyer", 80000),
(1005, "Sunita Reddy", "Hyderabad", "1992-11-21", "Female", "O-", 234567890, 274234567, "Low", "Retail Salesperson", 30000, "Graphic Designer", 45000),
(1006, "Rohit Patel", "Ahmedabad", "1983-06-30", "Male", "B+", 345678901, 115345678, "High", "Engineer", 70000, "Pilot", 110000),
(1007, "Nisha Gupta", "Jaipur", "1993-08-14", "Female", "AB-", 567890123, 041567890, "Severe", "Accountant", 55000, "Pharmacist", 90000),
(1008, "Sanjay Yadav", "Patna", "1987-02-19", "Male", "A+", 890123456, 406890123, "Low", "Electrician", 42000, "Plumber", 48000),
(1009, "Aishwarya Gupta", "Bangalore", "1998-05-03", "Female", "O+", 123890456, 288678901, "Severe", "Marketing Manager", 60000, "Sales Manager", 70000);

ROLLBACK TO SP;

-- View Table Data --
SELECT * FROM Criminal;

