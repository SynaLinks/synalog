WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "ann" AS name,
      90 AS score,
      2.5 AS x,
      true AS ok
   UNION ALL
  
    SELECT
      2 AS id,
      "bob" AS name,
      75 AS score,
      null AS x,
      false AS ok
   UNION ALL
  
    SELECT
      3 AS id,
      "cid" AS name,
      90 AS score,
      3.0 AS x,
      true AS ok
   UNION ALL
  
    SELECT
      4 AS id,
      "dee" AS name,
      null AS score,
      1.25 AS x,
      false AS ok
   UNION ALL
  
    SELECT
      5 AS id,
      "eve" AS name,
      60 AS score,
      10.0 AS x,
      true AS ok
   UNION ALL
  
    SELECT
      6 AS id,
      "fay" AS name,
      75 AS score,
      0.5 AS x,
      null AS ok
   UNION ALL
  
    SELECT
      7 AS id,
      "gus" AS name,
      88 AS score,
      2.5 AS x,
      false AS ok
   UNION ALL
  
    SELECT
      8 AS id,
      "hal" AS name,
      null AS score,
      null AS x,
      true AS ok
   UNION ALL
  
    SELECT
      9 AS id,
      "ida" AS name,
      100 AS score,
      7.75 AS x,
      false AS ok
   UNION ALL
  
    SELECT
      10 AS id,
      "jon" AS name,
      60 AS score,
      12.0 AS x,
      true AS ok
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.id AS id,
  V.name AS name,
  V.score AS score,
  V.x AS x
FROM
  t_0_V AS V ORDER BY name desc;