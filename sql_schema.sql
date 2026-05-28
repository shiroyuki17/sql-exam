-- 1: hotel system 

CREATE DATABASE hotel_system;
USE hotel_system;

CREATE TABLE guests (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE rooms (
    id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(10),
    type VARCHAR(30),
    price INT
);

CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE
);

CREATE TABLE payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount INT
);