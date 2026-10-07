WITH t_2_Values AS (SELECT * FROM VALUES
  (2, 3),
  (4, 5)
AS UNUSED_TABLE_NAME(a, b))
SELECT
  t_0_Values.a AS a,
  t_0_Values.b AS b,
  ((((t_0_Values.a) * (t_0_Values.a))) + (((t_0_Values.b) * (t_0_Values.b)))) AS result
FROM
  t_2_Values AS t_0_Values ORDER BY a NULLS LAST;