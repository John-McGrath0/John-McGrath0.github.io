CREATE DATABASE BookifyDB0;
--Q3.1
CREATE TABLE Guest (
Guest_ID INT PRIMARY KEY,
Full_name VARCHAR(30),
Email VARCHAR(30)
);

INSERT INTO Guest (Guest_ID, Full_name, Email) VALUES
(1, 'Alex Smith', 'a.s@mail.com'),
(2, 'Bobby Johnson', 'b.j@mail.com'),
(3, 'Mike Davis', 'm.d@mail.com');
SELECT * FROM Guest;

CREATE TABLE Room (
Room_ID INT PRIMARY KEY,
Price FLOAT,
typeroom VARCHAR(10)
);
INSERT INTO Room (Room_ID, Price, typeroom) VALUES
(101, 100, 'Single'),
(102, 120, 'Double'),
(103, 100, 'Double'),
(104, 150, 'Single');
SELECT * FROM Room;

CREATE TABLE Reservation (
Reservation_ID INT PRIMARY KEY,
Guest_ID INT,
Room_ID INT,
NO_of_Guest INT,
Reservation_date DATE,
FOREIGN KEY (Guest_ID) REFERENCES Guest (Guest_ID),
FOREIGN KEY (Room_ID) REFERENCES Room (Room_ID)
);
SELECT * FROM Reservation;

INSERT INTO Reservation (Reservation_ID, Guest_ID, Room_ID, NO_of_Guest, Reservation_date) VALUES
(1, 1, 101, 1, '2025-11-15'),
(2, 1, 101, 1, '2025-11-16'),
(3, 2, 102, 1, '2025-11-15');
INSERT INTO Reservation (Reservation_ID, Guest_ID, Room_ID, NO_of_Guest, Reservation_date) VALUES
(4, 3, 103, 2, '2025-11-14'),
(5, 2, 103, 1, '2025-11-15');

--3.2
SELECT typeroom FROM Room;
--3.3
SELECT Reservation_date FROM Reservation 
ORDER BY Reservation_date DESC;
--3.4
INSERT INTO Guest (Guest_ID, Full_name, Email) VALUES
(4, 'Ewan Connolly', 'e.c@mail.com'),
(5, 'Maya Evans', 'm.e@mail.com');
--3.5
INSERT INTO Reservation (Reservation_ID, Guest_ID, Room_ID, NO_of_Guest, Reservation_date) VALUES
(6, 4, 104, 1, '2025-11-26');
--3.6
UPDATE Reservation
SET Reservation_date = '2025-11-13'
WHERE Guest_ID = 3;
SELECT * FROM Reservation;
--3.7
SELECT AVG(Price) FROM Room;
--3.8
SELECT Room_ID, Price, typeroom FROM Room
WHERE Price > 110;
--3.9
SELECT DISTINCT(Full_Name) FROM Guest
INNER JOIN Reservation ON Guest.Guest_ID=Reservation.Guest_ID
WHERE Reservation_date= '2025-11-15';
--3.10
SELECT Reservation_ID, Full_Name AS Total_Reservations FROM Reservation
FULL OUTER JOIN Guest ON Reservation.Guest_ID=Guest.Guest_ID
ORDER BY Total_Reservations DESC;
