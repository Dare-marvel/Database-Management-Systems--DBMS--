USE CriminalRecord;

-- Equijoin to get information about criminals and their physical appearances --
SELECT name, height, weight
FROM Criminal
INNER JOIN Physical_Appearance ON Criminal.criminal_id = Physical_Appearance.id;

-- Non-Equijoin to find pairs of criminals having different blood grps --
SELECT c1.name AS criminal_name, c1.blood_group, c2.name AS related_criminal_name, c2.blood_group AS related_blood_group
FROM Criminal c1, Criminal c2
WHERE c1.criminal_id <> c2.criminal_id
AND c1.blood_group <> c2.blood_group;

-- Self join to find pairs of criminals having same birthplace --
SELECT A.name AS criminal1_name, B.name AS criminal2_name, A.birth_place
FROM Criminal A
JOIN Criminal B ON A.criminal_id != B.criminal_id AND A.birth_place = B.birth_place;

-- Left Outer Join --
SELECT name, dob, gender, height, weight, eye_color, hair_color
FROM Criminal
LEFT OUTER JOIN Physical_Appearance ON criminal_id = id;

-- Right Outer Join --
SELECT name, dob, gender, height, weight, eye_color, hair_color
FROM Criminal
RIGHT OUTER JOIN Physical_Appearance ON criminal_id = id;

-- Full Outer Join --
SELECT name, dob, gender, height, weight, eye_color, hair_color
FROM Criminal
LEFT JOIN Physical_Appearance  ON criminal_id = id
UNION
SELECT name, dob, gender, height, weight, eye_color, hair_color
FROM Criminal
RIGHT JOIN Physical_Appearance  ON criminal_id = id;

-- Cross Join --
SELECT name AS criminal_name, height, weight, eye_color, hair_color
FROM Criminal
CROSS JOIN Physical_Appearance;
