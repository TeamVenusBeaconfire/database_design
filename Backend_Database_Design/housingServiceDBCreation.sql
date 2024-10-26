-- Create the database
CREATE DATABASE HousingService;

-- Switch to the 'HousingService' database
USE HousingService;

-- Create the 'landlord' table
CREATE TABLE landlord (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    cellPhone VARCHAR(20) NOT NULL
);

-- Insert records into the 'landlord' table
INSERT INTO landlord (firstName, lastName, email, cellPhone)
VALUES 
('John', 'Doe', 'john.doe@example.com', '555-1234'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678'),
('Robert', 'Brown', 'robert.brown@example.com', '555-9876');

-- Create the 'house' table
CREATE TABLE house (
    id INT AUTO_INCREMENT PRIMARY KEY,
    landlordId INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    maxOccupant INT NOT NULL,
    FOREIGN KEY (landlordId) REFERENCES landlord(id)
);

INSERT INTO house (landlordId, address, maxOccupant)
VALUES 
(1, '123 Main St, Cityville', 5),
(2, '456 Oak St, Townsville', 4),
(3, '789 Pine St, Villageville', 6);

-- Create the 'facility' table
CREATE TABLE facility (
    id INT AUTO_INCREMENT PRIMARY KEY,
    houseId INT NOT NULL,
    type VARCHAR(255) NOT NULL,
    description TEXT,
    quantity INT NOT NULL,
    FOREIGN KEY (houseId) REFERENCES house(id)
);

-- Insert records into the 'facility' table
INSERT INTO facility (houseId, type, description, quantity)
VALUES 
(1, 'Bed', 'Bed', 2),
(1, 'Mattress', 'Mattress', 1),
(1, 'Table', 'Table', 1)
(1, 'Chair', 'Chair', 3)
(2, 'Bed', 'Bed', 2),
(2, 'Mattress', 'Mattress', 2),
(2, 'Table', 'Table', 1)
(2, 'Chair', 'Chair', 3)
(3, 'Bed', 'Bed', 2),
(3, 'Mattress', 'Mattress', 2),
(3, 'Table', 'Table', 1)
(3, 'Chair', 'Chair', 3);;

-- Create the 'facilityReport' table
CREATE TABLE facilityReport (
    id INT AUTO_INCREMENT PRIMARY KEY,
    facilityId INT NOT NULL,
    employeeId INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    createDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(255) NOT NULL,
    FOREIGN KEY (facilityId) REFERENCES facility(id)
);

-- Insert records into the 'facilityReport' table
INSERT INTO facilityReport (facilityId, employeeId, title, description, createDate, status)
VALUES 
(1, 1, 'Leaking Faucet', 'The faucet in the upstairs bathroom is leaking', '2024-10-20 10:00:00', 'Open'),
(2, 2, 'Oven Malfunction', 'The oven is not heating up', '2024-10-21 14:30:00', 'Resolved'),
(3, 3, 'Window Crack', 'A bedroom window has a small crack', '2024-10-22 09:15:00', 'Open');

-- Create the 'facilityReportDetail' table
CREATE TABLE facilityReportDetail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    facilityReportId INT NOT NULL,
    employeeId INT NOT NULL,
    comment TEXT,
    createDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    lastModificationDate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (facilityReportId) REFERENCES facilityReport(id)
);

INSERT INTO facilityReportDetail (facilityReportId, employeeId, comment, createDate, lastModificationDate)
VALUES 
(1, 1, 'Plumber scheduled to come tomorrow', '2024-10-21 08:00:00', '2024-10-21 08:00:00'),
(2, 2, 'Oven repair completed, tested and working fine', '2024-10-21 16:00:00', '2024-10-21 16:00:00'),
(3, 3, 'Window replacement scheduled for next week', '2024-10-22 12:00:00', '2024-10-22 12:00:00');
