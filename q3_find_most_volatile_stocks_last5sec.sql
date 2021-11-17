SELECT stock_symbol, VARIANCE(share_price) var 
  FROM trade 
  WHERE trade_time * 1 > ( NOW() - 5 ) 
  GROUP BY stock_symbol 
  ORDER BY var DESC limit 10;
