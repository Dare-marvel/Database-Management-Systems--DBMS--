CREATE DATABASE BankingDatabase;
USE BankingDatabase;

CREATE TABLE depositor (
    depositor_id INT PRIMARY KEY,
    depositor_name VARCHAR(255),
    opening_date DATE
);

CREATE TABLE account (
    account_id INT PRIMARY KEY,
    depositor_id INT,
    amount DECIMAL(10, 2),
    FOREIGN KEY (depositor_id) REFERENCES depositor(depositor_id)
);

-- Insert sample data into the depositor table
INSERT INTO depositor (depositor_id, depositor_name, opening_date) VALUES
(1, 'Rajesh Kumar', '2005-05-15'),
(2, 'Smita Verma', '2010-08-23'),
(3, 'Amit Singh', '2017-03-10'),
(4, 'Neha Sharma', '2020-12-05'),
(5, 'Anil Verma', '2015-06-18');

-- Insert sample data into the account table
INSERT INTO account (account_id, depositor_id, amount) VALUES
(101, 1, 50000.00),
(102, 1, 75000.50),
(103, 2, 100000.75),
(104, 3, 45000.25),
(105, 4, 6000.00),
(106, 5, 90000.50);

DELIMITER //
CREATE PROCEDURE DisplayDepositorsAfterDate(IN target_date DATE)
BEGIN
    SELECT depositor_name, opening_date
    FROM depositor
    WHERE opening_date > target_date;
END;

CREATE PROCEDURE DisplayDepositorByName(IN target_name VARCHAR(255))
BEGIN
    SELECT *
    FROM depositor
    WHERE depositor_name = target_name;
END;

CREATE PROCEDURE UpdateDepositorNames()
BEGIN
    UPDATE depositor
    SET depositor_name = CONCAT(UPPER(LEFT(depositor_name, 1)), LOWER(SUBSTRING(depositor_name, 2)));
END;
//
DELIMITER ;

CALL DisplayDepositorsAfterDate('1998-12-03');
CALL DisplayDepositorByName('Anil Verma');
CALL UpdateDepositorNames();

SELECT * FROM depositor;