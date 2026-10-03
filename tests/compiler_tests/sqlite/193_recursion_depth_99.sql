ATTACH DATABASE ':memory:' AS logica_test;

DROP TABLE IF EXISTS logica_test.Reach_ifr0;
CREATE TABLE logica_test.Reach_ifr0 AS WITH t_0_Reach_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f1.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f1 AS Reach_MultBodyAggAux_f1
GROUP BY Reach_MultBodyAggAux_f1.y;

-- Interacting with table logica_test.Reach_ifr0

DROP TABLE IF EXISTS logica_test.Reach_ifr1;
CREATE TABLE logica_test.Reach_ifr1 AS WITH t_0_Reach_MultBodyAggAux_f2 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr0 AS Reach_ifr0, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr0.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f2.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f2 AS Reach_MultBodyAggAux_f2
GROUP BY Reach_MultBodyAggAux_f2.y;

-- Interacting with table logica_test.Reach_ifr1

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f3 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr1 AS Reach_ifr1, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr1.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f3.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f3 AS Reach_MultBodyAggAux_f3
GROUP BY Reach_MultBodyAggAux_f3.y;

-- Interacting with table logica_test.Reach_ifr2

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

-- Interacting with table logica_test.Reach_ifr3

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

-- Interacting with table logica_test.Reach_ifr2

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr3;
CREATE TABLE logica_test.Reach_ifr3 AS WITH t_0_Reach_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr2, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr2.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f4.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f4 AS Reach_MultBodyAggAux_f4
GROUP BY Reach_MultBodyAggAux_f4.y;

DROP TABLE IF EXISTS logica_test.Reach_ifr2;
CREATE TABLE logica_test.Reach_ifr2 AS WITH t_0_Reach_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr3 AS Reach_ifr3, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr3.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f5.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f5 AS Reach_MultBodyAggAux_f5
GROUP BY Reach_MultBodyAggAux_f5.y;

DROP TABLE IF EXISTS logica_test.Reach;
CREATE TABLE logica_test.Reach AS WITH t_0_Reach_MultBodyAggAux_f6 AS (SELECT * FROM (
  
    SELECT
      0 AS y
   UNION ALL
  
    SELECT
      ((x_7.value) + (1)) AS y
    FROM
      logica_test.Reach_ifr2 AS Reach_ifr4, JSON_EACH((select json_group_array(n) from (with recursive t as(select 0 as n union all select n + 1 as n from t where n + 1 < 200) select n from t) where n < 200)) as x_7
    WHERE
      (Reach_ifr4.y = x_7.value)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_f6.y AS y
FROM
  t_0_Reach_MultBodyAggAux_f6 AS Reach_MultBodyAggAux_f6
GROUP BY Reach_MultBodyAggAux_f6.y;

-- Interacting with table logica_test.Reach

SELECT
  MAX(Reach.y) AS m
FROM
  logica_test.Reach AS Reach;