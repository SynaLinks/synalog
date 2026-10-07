WITH t_0_N AS (SELECT * FROM VALUES
  (-7),
  (-2),
  (0),
  (3),
  (12),
  (1099511627776)
AS UNUSED_TABLE_NAME(x))
SELECT
  N.x AS x
FROM
  t_0_N AS N
WHERE
  (N.x >= -5) AND
  (N.x <= 5) ORDER BY x NULLS LAST;
