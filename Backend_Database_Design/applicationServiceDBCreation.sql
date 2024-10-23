-- Create the database
CREATE DATABASE ApplicationService;

-- Switch to the 'ApplicationService' database
USE ApplicationService;

-- Create the 'ApplicationWorkFlow' table
CREATE TABLE ApplicationWorkFlow (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeId INT NOT NULL,
    createDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastModificationDate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status VARCHAR(255) NOT NULL,
    comment TEXT,
    applicationType VARCHAR(255) NOT NULL
);

-- Create the 'DigitalDocument' table
CREATE TABLE DigitalDocument (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    isRequired BOOLEAN DEFAULT FALSE,
    path VARCHAR(255) NOT NULL,
    description TEXT,
    title VARCHAR(255) NOT NULL
);
