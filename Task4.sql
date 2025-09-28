USE LibraryDB;

-- 1. Count total number of books
SELECT COUNT(*) AS TotalBooks
FROM Books;

-- 2. Count books by category
SELECT c.CategoryName, COUNT(b.BookID) AS NumberOfBooks
FROM Books b
JOIN Categories c ON b.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

-- 3. Count books by each author
SELECT a.Name AS AuthorName, COUNT(b.BookID) AS BooksWritten
FROM Authors a
LEFT JOIN Books b ON a.AuthorID = b.AuthorID
GROUP BY a.Name;

-- 4. Average publication year of books
SELECT AVG(PublishedYear) AS AvgPublishedYear
FROM Books;

-- 5. Count number of members joined per year
SELECT YEAR(MembershipDate) AS JoinYear, COUNT(MemberID) AS MembersJoined
FROM Members
GROUP BY YEAR(MembershipDate)
ORDER BY JoinYear;

-- 6. Count how many books each member borrowed
SELECT m.FullName, COUNT(b.BorrowID) AS BooksBorrowed
FROM Members m
LEFT JOIN Borrow b ON m.MemberID = b.MemberID
GROUP BY m.FullName;

-- 7. Find members who borrowed more than 1 book (HAVING)
SELECT m.FullName, COUNT(b.BorrowID) AS BooksBorrowed
FROM Members m
JOIN Borrow b ON m.MemberID = b.MemberID
GROUP BY m.FullName
HAVING COUNT(b.BorrowID) > 1;

-- 8. Find most borrowed books by count
SELECT bk.Title, COUNT(br.BorrowID) AS TimesBorrowed
FROM Books bk
JOIN Borrow br ON bk.BookID = br.BookID
GROUP BY bk.Title
ORDER BY TimesBorrowed DESC;

-- 9. Earliest and latest borrow date
SELECT MIN(BorrowDate) AS FirstBorrow, MAX(BorrowDate) AS LastBorrow
FROM Borrow;

-- 10. Average number of borrowed books per member
SELECT AVG(BooksBorrowed) AS AvgBooksPerMember
FROM (
    SELECT COUNT(BorrowID) AS BooksBorrowed
    FROM Borrow
    GROUP BY MemberID
) sub;
