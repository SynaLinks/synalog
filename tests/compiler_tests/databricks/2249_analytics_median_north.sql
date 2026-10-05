WITH t_4_S AS (SELECT * FROM VALUES
  ("north", 1, 5),
  ("north", 2, 8),
  ("north", 3, 3),
  ("north", 5, 9),
  ("north", 6, 1),
  ("south", 1, 7),
  ("south", 2, 7),
  ("south", 4, 2),
  ("south", 5, 6),
  ("east", 2, 4),
  ("east", 3, 11),
  ("east", 4, 6),
  ("east", 5, 10),
  ("east", 7, 3)
AS UNUSED_TABLE_NAME(r, d, v)),
t_5_N AS (SELECT
  SUM(1) AS n
FROM
  t_4_S AS t_7_S
WHERE
  (t_7_S.r = "north")),
t_9_Before_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_12_S.d AS d,
      t_13_S.d AS e
    FROM
      t_4_S AS t_12_S, t_4_S AS t_13_S
    WHERE
      (t_13_S.v < t_12_S.v) AND
      (t_12_S.r = "north") AND
      (t_13_S.r = "north")
   UNION ALL
  
    SELECT
      t_16_S.d AS d,
      t_17_S.d AS e
    FROM
      t_4_S AS t_16_S, t_4_S AS t_17_S
    WHERE
      (t_17_S.d < t_16_S.d) AND
      (t_17_S.v = t_16_S.v) AND
      (t_16_S.r = "north") AND
      (t_17_S.r = "north")
  
) AS UNUSED_TABLE_NAME  ),
t_8_Before AS (SELECT
  Before_MultBodyAggAux.d AS d,
  Before_MultBodyAggAux.e AS e
FROM
  t_9_Before_MultBodyAggAux AS Before_MultBodyAggAux
GROUP BY 1, 2),
t_0_Mid AS (SELECT * FROM (
  
    SELECT
      S.v AS v
    FROM
      t_4_S AS S, t_5_N AS t_2_N
    WHERE
      (((((2) * (COALESCE((SELECT
        SUM(1) AS logica_value
      FROM
        t_8_Before AS Before
      WHERE
        (Before.d = S.d)), 0)))) + (1)) = t_2_N.n) AND
      (S.r = "north")
   UNION ALL
  
    SELECT
      t_21_S.v AS v
    FROM
      t_4_S AS t_21_S, t_5_N AS t_19_N
    WHERE
      (((2) * (COALESCE((SELECT
        SUM(1) AS logica_value
      FROM
        t_8_Before AS t_24_Before
      WHERE
        (t_24_Before.d = t_21_S.d)), 0))) = t_19_N.n) AND
      (t_21_S.r = "north")
   UNION ALL
  
    SELECT
      t_37_S.v AS v
    FROM
      t_4_S AS t_37_S, t_5_N AS t_35_N
    WHERE
      (((((2) * (COALESCE((SELECT
        SUM(1) AS logica_value
      FROM
        t_8_Before AS t_38_Before
      WHERE
        (t_38_Before.d = t_37_S.d)), 0)))) + (2)) = t_35_N.n) AND
      (t_37_S.r = "north")
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AVG(Mid.v) AS m
FROM
  t_0_Mid AS Mid;
