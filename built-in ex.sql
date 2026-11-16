DROP DATABASE IF EXISTS training_functions;
DROP DATABASE IF EXISTS training_functions;
CREATE DATABASE training_functions;
USE training_functions;
CREATE TABLE CourseEnrollments (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(40),
LastName VARCHAR(40),
CourseName VARCHAR(40),
Fee DECIMAL(10,2),
EnrollmentDate DATE,
CompletionDate DATE
);
select * from CourseEnrollments;


INSERT INTO CourseEnrollments
(StudentID, FirstName, LastName, CourseName, Fee, EnrollmentDate, CompletionDate)
VALUES
(101, 'Aman', 'Sharma', 'Python', 12500.75, '2026-01-05', '2026-03-20'),
(102, 'Priya', 'Verma', 'MySQL', 9800.40, '2026-01-12', '2026-02-28'),
(103, 'Rahul', 'Singh', 'Python', 15750.90, '2026-02-01', '2026-04-15'),
(104, 'Neha', 'Gupta', 'Power BI', 11200.25, '2026-02-10', '2026-05-05'),
(105, 'Ishita', 'Kapoor', 'MySQL', 8900.60, '2026-03-03', '2026-04-22'),
(106, 'Arjun', 'Mehta', 'Python', 13650.15, '2026-03-15', '2026-06-10'),
(107, 'Simran', 'Joshi', 'Power BI', 10400.95, '2026-04-01', '2026-06-30'),
(108, 'Vikas', 'Rao', 'MySQL', 7600.50, '2026-04-18', '2026-05-29'),
(109, 'Kiran', 'Malik', 'Python', 14999.99, '2026-05-02', '2026-07-25'),
(110, 'Rohan', 'Sethi', 'Power BI', 11950.35, '2026-05-20', '2026-08-14');
select * from CourseEnrollments;
-- Ques And Ans

-- 1. Display each student’s full name in uppercase with a single space between the first and last names using CONCAT() and UPPER().
SELECT
StudentID,
UPPER(CONCAT(FirstName, ' ', LastName)) AS FullName
FROM CourseEnrollments;

-- 2. Display each student’s full name with the first letter of FirstName in uppercase and the
-- remaining letters unchanged, using CONCAT(), UPPER() and SUBSTRING().

SELECT  StudentID,
CONCAT(
UPPER(SUBSTRING(FirstName, 1,1)),
SUBSTRING(FirstName,2))
AS FullName
from CourseEnrollments;

-- 3. Create a student code consisting of the first three letters of CourseName in uppercase, a hyphen, and StudentID using LEFT(), UPPER() and CONCAT().
 SELECT
StudentID,
CONCAT(UPPER(LEFT(CourseName, 3)), '-', StudentID) AS StudentCode
FROM CourseEnrollments;

-- 4. Display FirstName reversed and also display its original character count using REVERSE() and CHAR_LENGTH().

SELECT
FirstName,
REVERSE(FirstName) AS ReversedName,
CHAR_LENGTH(FirstName) AS CharacterCount
FROM CourseEnrollments;

-- 5. Display the position of the letter a in FirstName using LOCATE(), along with FirstName.
SELECT
FirstName,
LOCATE('a', FirstName) AS PositionOfA
FROM CourseEnrollments;

-- 6.Replace every letter a in FirstName with o, then convert the result to uppercase using REPLACE() and UPPER().
SELECT
FirstName,
UPPER(REPLACE(FirstName, 'a', 'o')) AS ReplacedName
FROM CourseEnrollments;

-- 7.Display FirstName padded on the left with zeroes to a total length of 12 characters using LPAD().

SELECT
FirstName,
LPAD(FirstName, 12, '0') AS PaddedName
FROM CourseEnrollments;

-- 8. Display a course label made of the last two letters of CourseName, a hyphen, and the first two
-- letters of FirstName using RIGHT(), LEFT() and CONCAT().
SELECT
FirstName,
CourseName,
CONCAT(
RIGHT(CourseName, 2),'-',LEFT(FirstName, 2)
) AS CourseLabel
FROM CourseEnrollments;

-- 9.Display the first three letters of FirstName in uppercase followed by the last two letters of
-- LastName in lowercase using SUBSTRING(), RIGHT(), UPPER(), LOWER() and CONCAT().

SELECT
FirstName,
LastName,
CONCAT(
UPPER(SUBSTRING(FirstName, 1, 3)),
LOWER(RIGHT(LastName, 2))
) AS CustomName
FROM CourseEnrollments;

-- 10. Display Fee rounded to one decimal place and also Fee rounded to the nearest whole number using ROUND().
SELECT
Fee,
ROUND(Fee, 1) AS RoundOneDecimal,
ROUND(Fee, 0) AS RoundWholeNumber
FROM CourseEnrollments;

-- 11. Display Fee rounded upward and downward to whole numbers in separate columns using CEIL() and FLOOR().

SELECT
Fee,
CEIL(Fee) AS UpwardValue,     
--   CEIL() = next higher integer.

FLOOR(Fee) AS DownwardValue

-- FLOOR() = previous lower integer.
FROM CourseEnrollments;

-- 12. Display the remainder when Fee is divided by 500 using MOD(), alongside the original Fee.
SELECT
Fee,MOD(Fee, 500) AS Remainder
FROM CourseEnrollments;

-- 13. Display the absolute difference between Fee and 10000 using ABS().
SELECT
Fee,ABS(Fee - 10000) AS AbsoluteDifference
FROM CourseEnrollments;

-- 14. Display Fee multiplied by 1.18 and rounded to two decimal places using ROUND().

SELECT
Fee,ROUND(Fee * 1.18, 2) AS UpdatedFee
FROM CourseEnrollments;

-- 15.Display Fee formatted with a thousands separator and exactly two decimal places using FORMAT().
SELECT
Fee,FORMAT(Fee, 2) AS FormattedFee
FROM CourseEnrollments;

-- 16 Display the enrollment year, enrollment month name and enrollment day name in separate columns using YEAR(), MONTHNAME() and DAYNAME().

SELECT
EnrollmentDate,
YEAR(EnrollmentDate) AS EnrollmentYear,
MONTHNAME(EnrollmentDate) AS MonthName,
DAYNAME(EnrollmentDate) AS DayName
FROM CourseEnrollments;

-- 17. Display EnrollmentDate in DD/MM/YYYY format and CompletionDate in Month DD, YYYY format using DATE_FORMAT().
 SELECT
EnrollmentDate,
DATE_FORMAT(EnrollmentDate, '%d/%m/%Y') AS EnrollmentFormatted,
DATE_FORMAT(CompletionDate, '%M %d, %Y') AS CompletionFormatted
FROM CourseEnrollments;

-- 18. Calculate the number of days between EnrollmentDate and CompletionDate using TIMESTAMPDIFF().
SELECT
StudentID,
EnrollmentDate,
CompletionDate,
TIMESTAMPDIFF(DAY, EnrollmentDate, CompletionDate) AS TotalDays
FROM CourseEnrollments;

-- 19. Display the date 1 month and 10 days after EnrollmentDate using nested DATE_ADD() calls.
SELECT
EnrollmentDate,
DATE_ADD(
    DATE_ADD(EnrollmentDate, INTERVAL 1 MONTH),
    INTERVAL 10 DAY
) AS NewDate
FROM CourseEnrollments;

-- 20. Display the date exactly 7 days before CompletionDate using DATE_ADD() with a negative interval.
 SELECT
CompletionDate,
DATE_ADD(CompletionDate, INTERVAL -7 DAY) AS PreviousDate
FROM CourseEnrollments;

-- 21. Display the number of complete months between EnrollmentDate and CompletionDate using TIMESTAMPDIFF().
SELECT
StudentID,
EnrollmentDate,
CompletionDate,
TIMESTAMPDIFF(MONTH, EnrollmentDate, CompletionDate) AS TotalMonths
FROM CourseEnrollments;

-- 22. Display the enrollment date shifted forward by 1 year, 2 months and 5 days using nested DATE_ADD() calls.

SELECT
EnrollmentDate,
DATE_ADD(
    DATE_ADD(
        DATE_ADD(EnrollmentDate, INTERVAL 1 YEAR),
        INTERVAL 2 MONTH
    ),
    INTERVAL 5 DAY
) AS UpdatedDate
FROM CourseEnrollments;

-- 23. Display EnrollmentDate and CompletionDate with their weekday names using DAYNAME().
SELECT
EnrollmentDate,
DAYNAME(EnrollmentDate) AS EnrollmentDay,
CompletionDate,
DAYNAME(CompletionDate) AS CompletionDay
FROM CourseEnrollments;

-- 24. Display the number of days from EnrollmentDate until the current date using TIMESTAMPDIFF() and CURDATE().
 SELECT
StudentID,
EnrollmentDate,
CURDATE() AS CurrentDate,
TIMESTAMPDIFF(DAY, EnrollmentDate, CURDATE()) AS DaysPassed
FROM CourseEnrollments;

-- 25. Display the original CompletionDate and its date after adding 15 days, formatted as DD/MM/YYYY using DATE_ADD() and DATE_FORMAT().
SELECT
StudentID,
DATE_FORMAT(CompletionDate, '%d/%m/%Y') AS OriginalDate,
DATE_FORMAT(
    DATE_ADD(CompletionDate, INTERVAL 15 DAY),
    '%d/%m/%Y'
) AS UpdatedDate
FROM CourseEnrollments;









