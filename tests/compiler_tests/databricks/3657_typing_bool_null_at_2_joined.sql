WITH t_2_K AS (SELECT * FROM VALUES
  (1),
  (2),
  (3)
AS UNUSED_TABLE_NAME(k)),
t_3_V AS (SELECT * FROM VALUES
  (1, true),
  (2, false),
  (3, null)
AS UNUSED_TABLE_NAME(k, v))
SELECT
  t_0_K.k AS k,
  t_1_V.v AS r
FROM
  t_2_K AS t_0_K, t_3_V AS t_1_V
WHERE
  (t_1_V.k = t_0_K.k) ORDER BY k NULLS LAST;