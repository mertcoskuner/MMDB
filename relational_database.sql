-- Create the Users table to store information about the users of the application
CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each user
    username VARCHAR(50) UNIQUE NOT NULL, -- Username of the user (must be unique)
    password VARCHAR(255) NOT NULL, -- User's password
    email VARCHAR(100) UNIQUE NOT NULL, -- User's email address (must be unique)
    phone VARCHAR(20), -- User's phone number
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp when the user was created
);

-- Create the Owners table to store information about the owners of the shops
CREATE TABLE Owners (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each owner
    username VARCHAR(50) UNIQUE NOT NULL, -- Username of the owner (must be unique)
    password VARCHAR(255) NOT NULL, -- Owner's password
    email VARCHAR(100) UNIQUE NOT NULL, -- Owner's email address (must be unique)
    phone VARCHAR(20), -- Owner's phone number
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp when the owner was created
);

-- Create the Shops table to store information about the shops
CREATE TABLE Shops (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each shop
    owner_id INT, -- Foreign key referencing the owner of the shop
    name VARCHAR(100) NOT NULL, -- Name of the shop
    address VARCHAR(255) NOT NULL, -- Address of the shop
    phone VARCHAR(20), -- Phone number of the shop
    type ENUM('automotive', 'motorcycle') NOT NULL, -- Type of shop (automotive or motorcycle)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the shop was created
    FOREIGN KEY (owner_id) REFERENCES Owners(id) -- Constraint linking to the Owners table
);

-- Create the Services table to store information about the services provided by the shops
CREATE TABLE Services (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each service
    shop_id INT, -- Foreign key referencing the shop providing the service
    name VARCHAR(100) NOT NULL, -- Name of the service
    description TEXT, -- Description of the service
    price DECIMAL(10, 2) NOT NULL, -- Price of the service
    type ENUM('repair', 'wash') NOT NULL, -- Type of service (repair or wash)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the service was created
    FOREIGN KEY (shop_id) REFERENCES Shops(id) -- Constraint linking to the Shops table
);

-- Create the Vehicles table to store information about the vehicles registered by users
CREATE TABLE Vehicles (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each vehicle
    user_id INT, -- Foreign key referencing the user who owns the vehicle
    type ENUM('automotive', 'motorcycle') NOT NULL, -- Type of vehicle (automotive or motorcycle)
    make VARCHAR(100), -- Make of the vehicle
    model VARCHAR(100), -- Model of the vehicle
    year INT, -- Year of manufacture of the vehicle
    plate_number VARCHAR(20) UNIQUE, -- License plate number of the vehicle (must be unique)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the vehicle was registered
    FOREIGN KEY (user_id) REFERENCES Users(id) -- Constraint linking to the Users table
);

-- Create the Bookings table to store information about the service bookings made by users
CREATE TABLE Bookings (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each booking
    user_id INT, -- Foreign key referencing the user who made the booking
    service_id INT, -- Foreign key referencing the service being booked
    vehicle_id INT, -- Foreign key referencing the vehicle for which the service is booked
    booking_date TIMESTAMP NOT NULL, -- Date and time of the booking
    status ENUM('pending', 'confirmed', 'completed', 'cancelled') DEFAULT 'pending', -- Status of the booking
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the booking was created
    FOREIGN KEY (user_id) REFERENCES Users(id), -- Constraint linking to the Users table
    FOREIGN KEY (service_id) REFERENCES Services(id), -- Constraint linking to the Services table
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(id) -- Constraint linking to the Vehicles table
);



