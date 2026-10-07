WITH t_0_W AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'naïve' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      null AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W.k AS k,
  (WITH RECURSIVE synalog_r(i, t) AS (SELECT LENGTH((WITH RECURSIVE synalog_r(i, t) AS (SELECT LENGTH(W.s), '' UNION ALL SELECT i - 1, t || SUBSTR(W.s, i, 1) FROM synalog_r WHERE i > 0) SELECT t FROM synalog_r WHERE i = 0)), '' UNION ALL SELECT i - 1, t || SUBSTR((WITH RECURSIVE synalog_r(i, t) AS (SELECT LENGTH(W.s), '' UNION ALL SELECT i - 1, t || SUBSTR(W.s, i, 1) FROM synalog_r WHERE i > 0) SELECT t FROM synalog_r WHERE i = 0), i, 1) FROM synalog_r WHERE i > 0) SELECT t FROM synalog_r WHERE i = 0) AS v,
  (WITH RECURSIVE synalog_r(i, t) AS (SELECT LENGTH(W.s), '' UNION ALL SELECT i - 1, t || SUBSTR(W.s, i, 1) FROM synalog_r WHERE i > 0) SELECT t FROM synalog_r WHERE i = 0) AS r
FROM
  t_0_W AS W ORDER BY k NULLS LAST;