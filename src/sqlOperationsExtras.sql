--Q1
SELECT DISTINCT re.name
FROM Rating r, Reviewer re, Movie m
WHERE m.title = 'Gone with the Wind'
  AND r.rID = re.rID
  AND r.mID = m.mID

--Q2
SELECT r.name, m.title, ra.stars
FROM Reviewer r, Movie m, Rating ra
WHERE r.rID = ra.rID AND ra.mID = m.mID
AND m.director = r.name

--Q3
SELECT r.name FROM Reviewer r
UNION
SELECT m.title FROM Movie m

--Q4
SELECT m.title
FROM Movie m
EXCEPT
SELECT m.title
FROM Movie m, Rating ra, Reviewer re
WHERE m.mID = ra.mID
  AND re.rID = ra.rID
  AND re.name = 'Chris Jackson'