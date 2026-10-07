SELECT
  (CASE WHEN 1 < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('a,b,c', ','), '$[' || 1 || ']') END) AS e;