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

--Q5
SELECT DISTINCT re1.name, re2.name
FROM Reviewer re1, Reviewer re2, Rating r1, Rating r2, Movie m
WHERE m.mID = r1.mID
  AND m.mID = r2.mID
  AND re1.rID = r1.rID
  AND re2.rID = r2.rID
  AND re2.rID <> re1.rID
  AND re2.name > re1.name

--Q6
SELECT DISTINCT re.name, m.title, ra.stars
FROM Reviewer re, Movie m, Rating ra
WHERE re.rID = ra.rID
  AND ra.mID = m.mID
  AND ra.stars = (SELECT MIN(stars) FROM Rating)

--Q7
SELECT DISTINCT m.title, (SELECT AVG(r.stars)
                          FROM Rating r
                          WHERE r.mID = m.mID) AS avgRating
FROM Movie m, Rating ra
WHERE m.mID = ra.mID
ORDER BY avgRating DESC, m.title

--Q8
SELECT DISTINCT re.name
FROM Reviewer re, Rating ra
WHERE re.rID = ra.rID
  AND (SELECT COUNT(r.rID)
        From Rating r
        WHERE r.rID = ra.rID) >=3

--Q9
SELECT m.title, m.director
FROM Movie m
WHERE (SELECT COUNT(m1.director)
        FROM Movie m1
        WHERE m1.director = m.director) >= 2
ORDER BY m.director, m.title

--Q10
SELECT *
FROM (SELECT DISTINCT m.title, (SELECT AVG(r.stars)
                                FROM Rating r
                                WHERE m.mID = r.mID) AS stars
      FROM Movie m) r
WHERE r.stars = (SELECT MAX(stars)
                 FROM (SELECT DISTINCT m.title, (SELECT AVG(r.stars)
                                                  FROM Rating r
                                                  WHERE m.mID = r.mID) AS stars
                        FROM Movie m))