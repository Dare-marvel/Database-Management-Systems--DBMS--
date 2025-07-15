USE CriminalRecord;

SELECT * FROM CriminalData1;
SELECT * FROM CriminalData2;

SELECT criminal_id as id, name, current_occupation_name as occupation FROM CriminalData1 WHERE current_occupation_name != "Doctor"
UNION
SELECT criminal_id, name, current_occupation_name FROM CriminalData2 WHERE current_occupation_name NOT LIKE "%Engineer%";

SELECT name, dob FROM CriminalData1 WHERE YEAR(dob) < 1990
INTERSECT ALL
SELECT name, dob FROM CriminalData2;

SELECT name FROM CriminalData1
EXCEPT
SELECT name FROM CriminalData2;

SELECT
(SELECT AVG(current_occupation_income) FROM CriminalData1) / (SELECT MIN(current_occupation_income) FROM CriminalData2)
AS Result;

SELECT criminal_id, name, ROUND(DATEDIFF(CURRENT_TIMESTAMP, dob)/365, 0) AS age FROM CriminalData1;