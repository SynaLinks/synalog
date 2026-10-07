SELECT
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('a,b,c', ','), '$[' || 0 || ']') END) AS e;