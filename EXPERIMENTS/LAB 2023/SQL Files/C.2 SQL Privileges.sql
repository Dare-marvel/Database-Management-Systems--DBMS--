USE CriminalRecord;

-- Create a New User DB Admin --
CREATE USER Admin IDENTIFIED BY "Admin";

-- Grant Admin Read Privilege --
GRANT SELECT ON CriminalRecord.* TO Admin;

-- Revoke Admin Read Privilege --
REVOKE SELECT ON CriminalRecord.* FROM Admin;

-- Create New Role --
CREATE ROLE admin;

-- Modify Role Privileges --
GRANT ALL PRIVILEGES ON CriminalRecord.* TO admin;