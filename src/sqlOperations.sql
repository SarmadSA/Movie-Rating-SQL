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