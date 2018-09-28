--Q1
SELECT DISTINCT re.name
FROM Rating r, Reviewer re, Movie m
WHERE m.title = 'Gone with the Wind'
  AND r.rID = re.rID
  AND r.mID = m.mID