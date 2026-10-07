WITH t_0_A AS (SELECT * FROM VALUES
  (1, 10, 8),
  (1, 11, 4),
  (2, 10, 12),
  (3, 12, 20),
  (3, 14, 2),
  (4, 12, 6),
  (6, 11, 15),
  (5, 13, 1)
AS UNUSED_TABLE_NAME(id, pid, hours))
SELECT
  A.id AS id
FROM
  t_0_A AS A
WHERE
  (CASE WHEN (A.hours < 5) THEN ((A.hours) * (2)) ELSE A.hours END >= 8)
GROUP BY 1 ORDER BY id NULLS LAST;