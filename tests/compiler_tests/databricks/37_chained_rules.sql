WITH t_0_Raw AS (SELECT * FROM VALUES
  (1),
  (2),
  (3),
  (4),
  (5)
AS UNUSED_TABLE_NAME(v))
SELECT
  Raw.v AS v,
  ((Raw.v) * (2)) AS doubled,
  ((((Raw.v) * (2))) + (10)) AS plus_ten
FROM
  t_0_Raw AS Raw
WHERE
  (Raw.v > 2) ORDER BY v NULLS LAST;