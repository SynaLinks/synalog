WITH t_0_S AS (SELECT * FROM VALUES
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
t_4_Prev AS (SELECT
  t_5_S.d AS d,
  MAX(t_6_S.d) AS p
FROM
  t_0_S AS t_5_S, t_0_S AS t_6_S
WHERE
  (t_6_S.d < t_5_S.d) AND
  (t_5_S.r = "south") AND
  (t_6_S.r = "south")
GROUP BY 1),
t_9_Next AS (SELECT
  t_10_S.d AS d,
  MIN(t_11_S.d) AS n
FROM
  t_0_S AS t_10_S, t_0_S AS t_11_S
WHERE
  (t_11_S.d > t_10_S.d) AND
  (t_10_S.r = "south") AND
  (t_11_S.r = "south")
GROUP BY 1),
t_1_Lower AS (SELECT * FROM (
  
    SELECT
      Prev.d AS d
    FROM
      t_4_Prev AS Prev, t_0_S AS t_2_S, t_0_S AS t_3_S
    WHERE
      (t_3_S.v >= t_2_S.v) AND
      (t_2_S.r = "south") AND
      (t_2_S.d = Prev.d) AND
      (t_3_S.r = "south") AND
      (t_3_S.d = Prev.p)
   UNION ALL
  
    SELECT
      Next.d AS d
    FROM
      t_9_Next AS Next, t_0_S AS t_7_S, t_0_S AS t_8_S
    WHERE
      (t_8_S.v >= t_7_S.v) AND
      (t_7_S.r = "south") AND
      (t_7_S.d = Next.d) AND
      (t_8_S.r = "south") AND
      (t_8_S.d = Next.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  1 AS ok
FROM
  t_0_S AS S
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_Lower AS Lower
  WHERE
    (Lower.d = 2)) IS NULL) AND
  (S.r = "south") AND
  (S.d = 2);
