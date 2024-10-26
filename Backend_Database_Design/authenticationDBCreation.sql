-- Create the database
CREATE DATABASE authentication;

-- Switch to the 'authentication' database
USE authentication;

-- Create the 'User' table
CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    createDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastModificationDate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    activeFlag BOOLEAN DEFAULT TRUE
);

-- Insert records into the 'User' table
INSERT INTO User (username, email, password, activeflag)
VALUES 
('employee1', 'employee1@gmail.com', '12345678', TRUE),
('hr1', 'hr1@gmail.com', '12345678', TRUE),
('inactive1', 'inactive1@gmail.com', '12345678', FALSE);

-- Create the 'Role' table
CREATE TABLE Role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    roleName VARCHAR(255) NOT NULL,
    roleDescription TEXT NOT NULL,
    createDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastModificationdate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO Role (rolename, roledescription)
VALUES 
('employee', 'Regular employee with standard access rights'),
('HR', 'Human Resources personnel with special access rights'),
('Applicant', 'Onboarding Application Applicant');

-- Create the 'UserRole' table
CREATE TABLE UserRole (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userid INT NOT NULL,
    roleid INT NOT NULL,
    activeFlag BOOLEAN DEFAULT TRUE,
    createDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastModificationdate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (userid) REFERENCES User(id),
    FOREIGN KEY (roleid) REFERENCES Role(id)
);

-- Insert records into the 'UserRole' table
INSERT INTO UserRole (userid, roleid, activeflag)
VALUES 
(1, 1, TRUE), -- employee1 as an employee
(2, 2, TRUE), -- hr1 as HR
(3, 1, FALSE); -- inactive1 as an inactive employee

-- Create the 'RegistrationToken' table
CREATE TABLE RegistrationToken (
    id INT AUTO_INCREMENT PRIMARY KEY,
    token VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    expirationDate DATETIME NOT NULL,
    createdBy INT NOT NULL,
    FOREIGN KEY (createdby) REFERENCES User(id)
);

-- Insert records into the 'RegistrationToken' table
INSERT INTO RegistrationToken (token, email, expirationdate, createdby)
VALUES 
('token_123', 'employee1@gmail.com', '2024-12-31 23:59:59', 2),
('token_456', 'employee2@gmail.com', '2024-11-30 23:59:59', 2);
