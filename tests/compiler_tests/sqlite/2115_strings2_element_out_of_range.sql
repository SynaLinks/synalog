SELECT
  (CASE WHEN 5 < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('a,b', ','), '$[' || 5 || ']') END) AS s;