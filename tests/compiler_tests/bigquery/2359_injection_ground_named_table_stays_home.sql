DROP TABLE IF EXISTS logica_test.Users;
CREATE TABLE logica_test.Users AS WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V;

-- Interacting with table logica_test.Users

SELECT
  Q.x AS x
FROM
  logica_test.Users AS Q ORDER BY x NULLS LAST;
