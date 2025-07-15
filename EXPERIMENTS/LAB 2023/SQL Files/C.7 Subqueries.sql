USE CriminalRecord;

-- Name and height of Criminals who are taller than the Avg. height of all Criminals --
SELECT name, height
FROM Criminal 
JOIN Physical_Appearance ON criminal_id = id
WHERE height > (
  SELECT AVG(height)
  FROM Physical_Appearance
);

-- Names and blood group of Criminals with unique blood types --
SELECT name, blood_group
FROM Criminal
WHERE blood_group NOT IN (
  SELECT blood_group
  FROM Criminal
  GROUP BY blood_group
  HAVING COUNT(*) > 1
);

-- Blood group with the highest freq among Criminals and the name of Criminals with that blood group --
SELECT name, blood_group
FROM Criminal
WHERE blood_group in (
  SELECT blood_group
  FROM Criminal
  GROUP BY blood_group
  ORDER BY COUNT(*) DESC
);

-- Name of Criminals whose previous occupation income is higher than the avg. current occupation income of all Criminals --
SELECT name, previous_occupation_income
FROM Criminal
WHERE previous_occupation_income > (
  SELECT AVG(current_occupation_income)
  FROM Criminal
);

-- Name and income of Criminals who have the same current occupation as the highest paid Criminal in that occupation --
SELECT name, current_occupation_income
FROM Criminal
WHERE current_occupation_name = (
  SELECT current_occupation_name
  FROM Criminal
  WHERE current_occupation_income = (
    SELECT MAX(current_occupation_income)
    FROM Criminal
  )
);

-- Names and hair color of Female Criminals who share the same hair color as the specific Criminal --
SELECT name, hair_color
FROM Criminal
JOIN Physical_Appearance ON criminal_id = id
WHERE hair_color = (
  SELECT hair_color
  FROM Physical_Appearance
  WHERE id = 1003
)
AND id IN (
  SELECT criminal_id
  FROM Criminal
  WHERE gender = 'Female'
);

-- Name of Criminals who share the same birth month as another Criminal but were born on different days/year --
SELECT C1.name, C1.dob
FROM Criminal C1
WHERE EXTRACT(MONTH FROM C1.dob) IN (
  SELECT EXTRACT(MONTH FROM C2.dob)
  FROM Criminal C2
  WHERE C1.criminal_id <> C2.criminal_id
);

-- Names of Criminals who changed their occupation for higher income --
SELECT C1.name
FROM Criminal C1
WHERE C1.current_occupation_income > C1.previous_occupation_income
AND C1.current_occupation_name NOT IN (
  SELECT previous_occupation_name
  FROM Criminal C2
  WHERE C1.criminal_id = C2.criminal_id
);
