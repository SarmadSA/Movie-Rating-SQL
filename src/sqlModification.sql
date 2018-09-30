--Q1
INSERT INTO Reviewer(name, rID)
VALUES('Roger Ebert', 209)

--Q2
INSERT INTO Rating(rID,mID,stars)
SELECT (SELECT rID FROM Reviewer WHERE name = 'James Cameron') , mID, 5 FROM Movie

--Q3
UPDATE Movie
SET year = year + 25
WHERE mID IN (SELECT DISTINCT m.mID
              FROM Movie m
              WHERE (SELECT AVG(rr.stars)
                     FROM Rating rr
                     WHERE rr.mID = m.mID) >=4)