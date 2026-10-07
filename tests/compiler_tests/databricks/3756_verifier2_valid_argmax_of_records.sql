WITH t_4_N AS (SELECT * FROM VALUES
  (1, "x"),
  (2, "y"),
  (3, "z")
AS UNUSED_TABLE_NAME(n, s)),
t_1_A AS (SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(t_2_N.n AS value, STRUCT(t_2_N.n AS n, t_2_N.s AS s) AS arg)), false)[0].arg AS best
FROM
  t_4_N AS t_2_N)
SELECT
  t_0_A.best.s AS s
FROM
  t_1_A AS t_0_A;