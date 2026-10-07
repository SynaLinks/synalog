WITH t_4_E AS (SELECT * FROM (
  
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
t_5_D AS (SELECT * FROM (
  
    SELECT
      10 AS d,
      "sales" AS dn,
      "paris" AS city
   UNION ALL
  
    SELECT
      20 AS d,
      "tech" AS dn,
      "oslo" AS city
   UNION ALL
  
    SELECT
      30 AS d,
      "ops" AS dn,
      "paris" AS city
   UNION ALL
  
    SELECT
      40 AS d,
      "legal" AS dn,
      "rome" AS city
  
) AS UNUSED_TABLE_NAME  ),
t_1_Pick_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_2_E.id AS id
    FROM
      t_4_E AS t_2_E, t_5_D AS t_3_D
    WHERE
      (t_3_D.d = t_2_E.d) AND
      (t_3_D.city = "oslo")
   UNION ALL
  
    SELECT
      t_6_E.id AS id
    FROM
      t_4_E AS t_6_E
    WHERE
      (t_6_E.pay > 4500)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Pick AS (SELECT
  Pick_MultBodyAggAux.id AS id
FROM
  t_1_Pick_MultBodyAggAux AS Pick_MultBodyAggAux
GROUP BY id)
SELECT
  E.n AS n
FROM
  t_0_Pick AS Pick, t_4_E AS E
WHERE
  (E.id = Pick.id) ORDER BY n NULLS LAST;