--Q1
SELECT title FROM movie WHERE director = 'Steven Spielberg';

--Q2
SELECT DISTINCT m.year
FROM Movie m, Rating r
WHERE r.mID = m.mID
  AND r.stars >= 4
ORDER BY m.year