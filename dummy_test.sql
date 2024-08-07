
-- Insert data into Users
INSERT INTO Users (username, password, email, phone) VALUES
('user1', 'password1', 'user1@example.com', '1234567890'),
('user2', 'password2', 'user2@example.com', '0987654321');

-- Insert data into Owners
INSERT INTO Owners (username, password, email, phone) VALUES
('owner1', 'password1', 'owner1@example.com', '1234567890'),
('owner2', 'password2', 'owner2@example.com', '0987654321');

-- Insert data into Shops
INSERT INTO Shops (owner_id, name, address, phone, type) VALUES
(1, 'Auto Repair Shop 1', '123 Main St', '555-1234', 'automotive'),
(2, 'Motorcycle Wash 1', '456 Elm St', '555-5678', 'motorcycle');

-- Insert data into Services
INSERT INTO Services (shop_id, name, description, price, type) VALUES
(1, 'Oil Change', 'Complete oil change', 29.99, 'repair'),
(1, 'Car Wash', 'Exterior car wash', 19.99, 'wash'),
(2, 'Bike Wash', 'Complete bike wash', 14.99, 'wash');

-- Insert data into Vehicles
INSERT INTO Vehicles (user_id, type, make, model, year, plate_number) VALUES
(1, 'automotive', 'Toyota', 'Camry', 2020, 'ABC123'),
(2, 'motorcycle', 'Yamaha', 'R1', 2018, 'XYZ789');

-- Insert data into Bookings
INSERT INTO Bookings (user_id, service_id, vehicle_id, booking_date, status) VALUES
(1, 1, 1, '2024-08-10 10:00:00', 'confirmed'),
(2, 3, 2, '2024-08-11 11:00:00', 'pending');

-- Select all users
SELECT * FROM Users;

-- Select all owners
SELECT * FROM Owners;

-- Select all shops
SELECT * FROM Shops;

-- Select all services
SELECT * FROM Services;

-- Select all vehicles
SELECT * FROM Vehicles;

-- Select all bookings
SELECT * FROM Bookings;

-- Join query to view bookings with user, service, and vehicle details
SELECT 
    b.id AS booking_id,
    u.username AS user,
    s.name AS service,
    v.make AS vehicle_make,
    v.model AS vehicle_model,
    b.booking_date,
    b.status
FROM Bookings b
JOIN Users u ON b.user_id = u.id
JOIN Services s ON b.service_id = s.id
JOIN Vehicles v ON b.vehicle_id = v.id;