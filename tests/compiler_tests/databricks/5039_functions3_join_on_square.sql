WITH t_3_V AS (SELECT * FROM VALUES
  (1, 3, "ab"),
  (2, -4, "hello"),
  (3, 0, ""),
  (4, null, "x"),
  (5, 12, null),
  (6, 7, "seven")
AS UNUSED_TABLE_NAME(k, x, s)),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      V.k AS a,
      t_1_V.k AS b
    FROM
      t_3_V AS V, t_3_V AS t_1_V
    WHERE
      (V.k < t_1_V.k) AND
      (((V.x) * (V.x)) = ((((t_1_V.x) * (t_1_V.x))) + (7)))
   UNION ALL
  
    SELECT
      t_4_V.k AS a,
      t_5_V.k AS b
    FROM
      t_3_V AS t_4_V, t_3_V AS t_5_V
    WHERE
      (t_4_V.k < t_5_V.k) AND
      (((t_4_V.x) * (t_4_V.x)) = ((t_5_V.x) * (t_5_V.x)))
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.a AS a,
  Q_MultBodyAggAux.b AS b
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY 1, 2 ORDER BY a NULLS LAST, b NULLS LAST;