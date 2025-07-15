USE CriminalRecord;

-- Count the number of criminals by gender --
SELECT gender, COUNT(*) AS gender_count
FROM Criminal
GROUP BY gender;

-- Sum of previous and present income of all criminals --
SELECT name, SUM(current_occupation_income + previous_occupation_income) AS total_income
FROM Criminal
GROUP BY name;

-- Average age of all criminals --
SELECT ROUND(AVG(DATEDIFF(CURDATE(), dob) / 365), 2) AS avg_age
FROM Criminal;

-- Criminal having the lowest current income --
SELECT name, current_occupation_income
FROM Criminal
WHERE current_occupation_income = (SELECT MIN(current_occupation_income) FROM Criminal);

-- Criminal having the highest previous income --
SELECT name, previous_occupation_income
FROM Criminal
WHERE previous_occupation_income = (SELECT MAX(previous_occupation_income) FROM Criminal);

-- Group criminals by blood group and find blood groups with at least 2 individuals --
SELECT blood_group
FROM Criminal
GROUP BY blood_group
HAVING COUNT(*) >= 2;

-- Group criminals by current occupation and list occupations having an average income greater than 40000 --
SELECT current_occupation_name, AVG(current_occupation_income) AS avg_income
FROM Criminal
GROUP BY current_occupation_name
HAVING avg_income > 40000;
