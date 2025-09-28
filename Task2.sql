USE LibraryDB;

-- INSERT DATA

INSERT INTO Authors (Name, Country)
VALUES 
('George Orwell', 'United Kingdom'),
('J.K. Rowling', 'United Kingdom'),
('Mark Twain', 'United States'),
('Unknown Author', NULL);

INSERT INTO Categories (CategoryName)
VALUES
('Fiction'),
('Science Fiction'),
('Fantasy'),
('Non-Fiction');

INSERT INTO Books (Title, AuthorID, CategoryID, PublishedYear)
VALUES
('1984', 1, 2, 1949),
('Harry Potter and the Philosopher''s Stone', 2, 3, 1997),
('Adventures of Tom Sawyer', 3, 1, 1876),
('Mystery Book Without Author', NULL, 1, 2000);

INSERT INTO Members (FullName, Email, MembershipDate)
VALUES
('Alice Johnson', 'alice@example.com', '2022-01-15'),
('Bob Smith', NULL, '2022-02-20'),
('Charlie Brown', 'charlie@example.com', '2023-05-10');

INSERT INTO Borrow (MemberID, BookID, BorrowDate, ReturnDate)
VALUES
(1, 1, '2023-06-01', '2023-06-15'),
(2, 2, '2023-07-01', NULL),
(3, 3, '2023-08-05', '2023-08-20');

-- UPDATE DATA

UPDATE Authors
SET Country = 'Unknown'
WHERE Country IS NULL;

UPDATE Members
SET Email = 'bob.smith@example.com'
WHERE MemberID = 2 AND Email IS NULL;

UPDATE Borrow
SET ReturnDate = '2023-07-20'
WHERE BorrowID = 2;

-- DELETE DATA

DELETE FROM Books
WHERE Title = 'Mystery Book Without Author';

DELETE FROM Members
WHERE MemberID NOT IN (SELECT DISTINCT MemberID FROM Borrow);

-- FINAL CHECK

SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Borrow;
