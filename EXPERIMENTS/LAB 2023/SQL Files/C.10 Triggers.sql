CREATE DATABASE Triggers;
USE Triggers;

CREATE TABLE Parent(a INT PRIMARY KEY, b INT);
CREATE TABLE Child(a INT, b INT, FOREIGN KEY (a) REFERENCES Parent(a));

INSERT INTO Parent VALUES (1, 2), (2, 4);
INSERT INTO Child VALUES (1, 10), (2, 7);

Drop TABLE Parent, Child;

DELIMITER //
CREATE PROCEDURE Display()
BEGIN
    SELECT * FROM Parent;
    SELECT * FROM Child;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER cascading_update
AFTER UPDATE ON Parent FOR EACH ROW
BEGIN
    UPDATE Child SET b = NEW.b
    WHERE a = OLD.a;
END;
//
DELIMITER ;

CALL DISPLAY();
UPDATE Parent SET b = 4 WHERE a = 1;
CALL DISPLAY();

DROP trigger cascading_update;

DELIMITER //
CREATE TRIGGER reverse_cascading_update
AFTER UPDATE ON Child FOR EACH ROW
BEGIN
    UPDATE Parent
    SET b = NEW.b
    WHERE a = OLD.a;
END;
//
DELIMITER ;

CALL DISPLAY();
UPDATE Child SET b = 5 WHERE a = 2;
CALL DISPLAY();

DROP trigger reverse_cascading_update;

DELIMITER //
CREATE TRIGGER cascading_delete
BEFORE DELETE ON Parent FOR EACH ROW
BEGIN
    DELETE FROM Child
    WHERE a = OLD.a;
END;
//
DELIMITER ;

CALL DISPLAY();
DELETE FROM Parent WHERE a = 2;
CALL DISPLAY();

DROP trigger cascading_delete;
