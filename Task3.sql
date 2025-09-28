USE LibraryDB;

-- 1. Select all columns from Authors
SELECT * FROM Authors;

-- 2. Select specific columns from Books
SELECT Title, PublishedYear FROM Books;

-- 3. Select members who joined after 2022
SELECT FullName, MembershipDate
FROM Members
WHERE MembershipDate > '2022-12-31';

-- 4. Select books published between 1900 and 2000
SELECT Title, PublishedYear
FROM Books
WHERE PublishedYear BETWEEN 1900 AND 2000;

-- 5. Find authors from the United Kingdom
SELECT Name, Country
FROM Authors
WHERE Country = 'United Kingdom';

-- 6. Search books with "Harry" in the title
SELECT Title
FROM Books
WHERE Title LIKE '%Harry%';

-- 7. Get all borrowed books that have not been returned
SELECT BorrowID, MemberID, BookID, BorrowDate
FROM Borrow
WHERE ReturnDate IS NULL;

-- 8. Order members by their MembershipDate (oldest first)
SELECT FullName, MembershipDate
FROM Members
ORDER BY MembershipDate ASC;

-- 9. Order books by PublishedYear (latest first)
SELECT Title, PublishedYear
FROM Books
ORDER BY PublishedYear DESC;

-- 10. Limit results to top 2 newest members
SELECT FullName, MembershipDate
FROM Members
ORDER BY MembershipDate DESC
LIMIT 2;
