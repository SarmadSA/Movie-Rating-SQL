--Q1
SELECT title FROM movie WHERE director = 'Steven Spielberg';

--Q2
SELECT DISTINCT m.year
FROM Movie m, Rating r
WHERE r.mID = m.mID
  AND r.stars >= 4
ORDER BY m.year

--Q3
SELECT DISTINCT m.title
From Movie m
LEFT JOIN Rating r ON m.mID = r.mID
WHERE r.mID IS NULL

--Q4
SELECT rev.name
FROM Reviewer rev, Rating ra
WHERE ra.rID = rev.rID
  AND ra.ratingDate IS NULL

--Q5
SELECT re.name, m.title, ra.stars, ra.ratingDate
FROM Movie m, Reviewer re, Rating ra
WHERE m.mID = ra.mID
  AND re.rID = ra.rID
ORDER BY re.name, m.title, ra.stars

--Q6
SELECT r.name , m.title
FROM Rating r1, Rating r2, Reviewer r, Movie m
WHERE r1.rID = r2.rID
  AND r1.mID = r2.mID
  AND r1.rID = r.rID
  AND r1.mID = m.mID
  AND r1.stars > r2.stars
  AND r1.ratingDate > r2.ratingDate