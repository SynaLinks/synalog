SELECT
  LENGTH("ab ") AS n,
  ((CASE WHEN ("ab " = "ab") THEN 1 ELSE 0 END) + (1)) AS d;