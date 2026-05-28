-- 2: library system

CREATE DATABASE library_system;
USE library_system;

CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    category VARCHAR(50),
    isbn VARCHAR(30)
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    loan_date DATE,
    due_date DATE,
    return_date DATE,
    fine INT
);

-- 1. Хугацаа хэтэрсэн ном

SELECT *
FROM loans
WHERE due_date < CURDATE()
AND return_date IS NULL;

-- 2. Гишүүний зээл

SELECT *
FROM loans
WHERE member_id = 1;

-- 3. Ангилал тоолох

SELECT category, COUNT(*)
FROM books
GROUP BY category;

-- 4. Хамгийн их зээлсэн ном

SELECT book_id, COUNT(*)
FROM loans
GROUP BY book_id
ORDER BY COUNT(*) DESC
LIMIT 10;

-- VIEW

CREATE VIEW overdue AS
SELECT *
FROM loans
WHERE due_date < CURDATE()
AND return_date IS NULL;

-- PROCEDURE

CREATE PROCEDURE total_fine(IN id INT)
BEGIN
SELECT SUM(fine)
FROM loans
WHERE member_id = id;
END;

-- INDEX

CREATE INDEX idx_name
ON members(name);

-- INDEX

CREATE INDEX idx_name
ON members(name);

CREATE INDEX idx_date
ON loans(return_date);

