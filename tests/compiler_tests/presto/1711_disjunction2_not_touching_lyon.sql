WITH t_0_Ship AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'acme' AS client,
      'paris' AS src,
      'lyon' AS dst,
      12 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      2 AS id,
      'acme' AS client,
      'lyon' AS src,
      'nice' AS dst,
      5 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      3 AS id,
      'bolt' AS client,
      'paris' AS src,
      'nice' AS dst,
      30 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      4 AS id,
      'bolt' AS client,
      'nice' AS src,
      'rome' AS dst,
      8 AS kg,
      'fedex' AS carrier
   UNION ALL
  
    SELECT
      5 AS id,
      'cora' AS client,
      'rome' AS src,
      'milan' AS dst,
      14 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      6 AS id,
      'cora' AS client,
      'milan' AS src,
      'paris' AS dst,
      3 AS kg,
      'dhl' AS carrier
   UNION ALL
  
    SELECT
      7 AS id,
      'acme' AS client,
      'paris' AS src,
      'rome' AS dst,
      22 AS kg,
      'fedex' AS carrier
   UNION ALL
  
    SELECT
      8 AS id,
      'dune' AS client,
      'lyon' AS src,
      'paris' AS dst,
      9 AS kg,
      'ups' AS carrier
   UNION ALL
  
    SELECT
      9 AS id,
      'dune' AS client,
      'nice' AS src,
      'lyon' AS dst,
      11 AS kg,
      'dhl' AS carrier
  
) AS UNUSED_TABLE_NAME  ),
t_2_T_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_3_Ship.id AS id
    FROM
      t_0_Ship AS t_3_Ship
    WHERE
      (t_3_Ship.src = 'lyon')
   UNION ALL
  
    SELECT
      t_4_Ship.id AS id
    FROM
      t_0_Ship AS t_4_Ship
    WHERE
      (t_4_Ship.dst = 'lyon')
  
) AS UNUSED_TABLE_NAME  ),
t_1_T AS (SELECT
  T_MultBodyAggAux.id AS id
FROM
  t_2_T_MultBodyAggAux AS T_MultBodyAggAux
GROUP BY 1)
SELECT
  Ship.id AS id
FROM
  t_0_Ship AS Ship
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_T AS T
  WHERE
    (T.id = Ship.id)) IS NULL) ORDER BY id;