SELECT
  (CASE WHEN 2 < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('x;y;z', ';'), '$[' || 2 || ']') END) AS v;