WITH t_1_W_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_4 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[0, 1], synalog_e -> ROW(synalog_e))) as pushkin(x_4)
   UNION ALL
  
    SELECT
      x_6 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[2, 3], synalog_e -> ROW(synalog_e))) as pushkin(x_6)
   UNION ALL
  
    SELECT
      x_8 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[4, 5], synalog_e -> ROW(synalog_e))) as pushkin(x_8)
   UNION ALL
  
    SELECT
      x_10 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[6, 7], synalog_e -> ROW(synalog_e))) as pushkin(x_10)
   UNION ALL
  
    SELECT
      x_12 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[8, 9], synalog_e -> ROW(synalog_e))) as pushkin(x_12)
   UNION ALL
  
    SELECT
      x_14 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[10, 11], synalog_e -> ROW(synalog_e))) as pushkin(x_14)
   UNION ALL
  
    SELECT
      x_16 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[12, 13], synalog_e -> ROW(synalog_e))) as pushkin(x_16)
   UNION ALL
  
    SELECT
      x_18 AS x
    FROM
      UNNEST(TRANSFORM(ARRAY[14, 15], synalog_e -> ROW(synalog_e))) as pushkin(x_18)
  
) AS UNUSED_TABLE_NAME  ),
t_0_W AS (SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_1_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_0_W AS W;