--Q1
INSERT INTO Reviewer(name, rID)
VALUES('Roger Ebert', 209)

--Q2
INSERT INTO Rating(rID,mID,stars)
SELECT (SELECT rID FROM Reviewer WHERE name = 'James Cameron') , mID, 5 FROM Movie