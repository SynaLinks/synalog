SELECT
  FORMAT("%05d", -42) AS a,
  FORMAT("%.2f", 3.14159) AS b,
  FORMAT("%3s|%-3s|", "a", "b") AS c,
  FORMAT("100%%") AS d,
  FORMAT("%d", 1234567) AS e;