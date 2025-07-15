USE CriminalRecord;

-- Create a View --
CREATE VIEW HighThreatCriminals AS
SELECT criminal_id, name, threat_level
FROM Criminal
WHERE threat_level = 'High';

SELECT * FROM HighThreatCriminals;

-- Insert into View --
INSERT INTO HighThreatCriminals (criminal_id, name, threat_level)
VALUES (1010, 'Kiran Verma', 'High');

SELECT * FROM HighThreatCriminals;

-- Update a View --
UPDATE HighThreatCriminals
SET threat_level = 'Severe'
WHERE criminal_id = 1010;

SELECT * FROM HighThreatCriminals;

-- Grant Access to a View --
GRANT SELECT ON CriminalRecord.HighThreatCriminals TO Admin;

-- Revoke Access from a View --
REVOKE SELECT ON CriminalRecord.HighThreatCriminals FROM Admin;

-- Drop a View --
DROP VIEW HighThreatCriminals;
