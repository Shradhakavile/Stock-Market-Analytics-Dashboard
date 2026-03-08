CREATE DATABASE financial_analytics;
USE financial_analytics;

CREATE TABLE stock_data (
date DATE,
open_price FLOAT,
high_price FLOAT,
low_price FLOAT,
close_price FLOAT,
volume BIGINT,
symbol VARCHAR(10),
daily_return FLOAT,
MA_7 FLOAT
);

SELECT * FROM stock_data
LIMIT 10;

SELECT symbol, ROUND(AVG(close_price),2) AS avg_price
FROM stock_data
GROUP BY symbol
ORDER BY avg_price DESC;

SELECT symbol, date, daily_return
FROM stock_data
ORDER BY daily_return DESC
LIMIT 5;

SELECT symbol, date, daily_return
FROM stock_data
ORDER BY daily_return ASC
LIMIT 5;

SELECT symbol, SUM(volume) AS total_volume
FROM stock_data
GROUP BY symbol
ORDER BY total_volume DESC;

SELECT date, symbol, close_price, MA_7
FROM stock_data
WHERE close_price > MA_7;

SELECT date, symbol, close_price, MA_7
FROM stock_data
WHERE close_price < MA_7;

SELECT symbol, STDDEV(daily_return) AS volatility
FROM stock_data
GROUP BY symbol
ORDER BY volatility DESC;

SELECT symbol,
       ROUND(AVG(daily_return),4) AS avg_return
FROM stock_data
GROUP BY symbol
ORDER BY avg_return DESC;

SELECT symbol,
       MAX(high_price) AS highest_price
FROM stock_data
GROUP BY symbol;

SELECT symbol,
       MIN(low_price) AS lowest_price
FROM stock_data
GROUP BY symbol;

