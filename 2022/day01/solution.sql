-- part 1
SELECT SUM(val)
  FROM (SELECT val,
               COUNT(CASE
                     WHEN val IS NULL THEN 1
                     END) OVER (ORDER BY ctid) cnt
          FROM day1) s1
 WHERE val IS NOT NULL
 GROUP BY cnt
 ORDER BY SUM(val) DESC
 LIMIT 1;

-- part 2
SELECT SUM(val)
  FROM (SELECT SUM(val) AS val
          FROM (SELECT val,
                       COUNT(CASE
                             WHEN val IS NULL THEN 1
                             END) OVER (ORDER BY ctid) cnt
                  FROM day1) s1
         WHERE val IS NOT NULL
         GROUP BY cnt
         ORDER BY SUM(val) DESC
         LIMIT 3) s2;
