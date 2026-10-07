WITH t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "ann" AS n,
      null AS boss,
      10 AS d,
      5000 AS pay
   UNION ALL
  
    SELECT
      2 AS id,
      "bob" AS n,
      1 AS boss,
      10 AS d,
      4000 AS pay
   UNION ALL
  
    SELECT
      3 AS id,
      "cid" AS n,
      1 AS boss,
      20 AS d,
      4200 AS pay
   UNION ALL
  
    SELECT
      4 AS id,
      "dee" AS n,
      2 AS boss,
      10 AS d,
      3000 AS pay
   UNION ALL
  
    SELECT
      5 AS id,
      "eve" AS n,
      3 AS boss,
      20 AS d,
      3100 AS pay
   UNION ALL
  
    SELECT
      6 AS id,
      "fay" AS n,
      3 AS boss,
      null AS d,
      2900 AS pay
   UNION ALL
  
    SELECT
      7 AS id,
      "gus" AS n,
      null AS boss,
      30 AS d,
      6000 AS pay
   UNION ALL
  
    SELECT
      8 AS id,
      "hal" AS n,
      7 AS boss,
      30 AS d,
      2500 AS pay
  
) AS UNUSED_TABLE_NAME  ),
t_2_A AS (SELECT
  t_3_E.d AS d,
  AVG(t_3_E.pay) AS a
FROM
  t_1_E AS t_3_E
GROUP BY d)
SELECT
  E.n AS n
FROM
  t_1_E AS E, t_2_A AS t_0_A
WHERE
  (E.pay > t_0_A.a) AND
  (t_0_A.d = E.d) ORDER BY n NULLS LAST;