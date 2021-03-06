CREATE DATABASE IF NOT EXISTS trades;
USE trades;

DROP TABLE IF EXISTS trade;
CREATE TABLE trade(
  id BIGINT NOT NULL, 
  stock_symbol CHAR(5) NOT NULL,
  shares DECIMAL(18,4) NOT NULL,
  share_price DECIMAL(18,4) NOT NULL,
  trade_time DATETIME(6) NOT NULL,
  KEY(stock_symbol) USING CLUSTERED COLUMNSTORE,
  SHARD KEY(stock_symbol)
);

DROP TABLE IF EXISTS company;
CREATE TABLE company(
  symbol CHAR(5) NOT NULL,
  name VARCHAR(50),
  last_sale VARCHAR(10),
  market_cap VARCHAR(15),
  IPO_year INT,
  sector VARCHAR(80),
  industry VARCHAR(80),
  summary_quote VARCHAR(50),
  extra VARCHAR(50)
);
