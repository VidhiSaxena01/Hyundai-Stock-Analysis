CREATE DATABASE Hyundai_Stock_Analysis;

Use Hyundai_Stock_Analysis;

-- What is the overall trend in Hyundai's daily closing stock price?

SELECT 
    date, close
FROM
    daily_stock
ORDER BY date ASC;

-- What is the average monthly closing price of Hyundai’s stock?

SELECT 
    date, close
FROM
    monthly_stock
ORDER BY date ASC

-- Which week had the highest stock price (High value)?

SELECT 
    date, high
FROM
    weekly_stock
ORDER BY date ASC

-- Which month had the highest stock trading volume?

SELECT 
    date, volume
FROM
    monthly_stock
ORDER BY date ASC
LIMIT 5

-- What is the volatility range (difference between High and Low) on a daily basis?

SELECT 
    date, (high - low) AS Volatility_range
FROM
    daily_stock
ORDER BY date ASC

-- Total Trading Volume

SELECT 
    SUM(volume) AS Total_trading_volume
FROM
    daily_stock

-- Average Daily Closing Price

SELECT 
    ROUND(AVG(close), 0) AS Avg_daily_closing_price
FROM
    daily_stock


-- Highest Daily Closing Price

SELECT 
    MAX(close) AS Highest_daily_closing_price
FROM
    daily_stock


-- Daily Price Volatility (High-Low Range)

SELECT 
    SUM(high - low) AS Daily_price_volatility
FROM
    daily_stock

-- Monthly Closing Price Change

SELECT YEAR(date) AS year, MONTH(date) AS month, 
       (MAX(close) - LAG(MAX(close), 1) OVER (ORDER BY YEAR(date), MONTH(date))) AS price_change
FROM monthly_stock
GROUP BY YEAR(date), MONTH(date)
ORDER BY YEAR(date), MONTH(date);



