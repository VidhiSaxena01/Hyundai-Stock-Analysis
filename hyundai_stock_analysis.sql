-- What is the average daily, weekly, and monthly stock price (Open/Close)?

SELECT 
    Round(AVG(Open),0) AS avg_daily_open_price, 
    Round(AVG(Close),0) AS avg_daily_close_price 
FROM daily_stock;

SELECT 
    Round(AVG(Open),0) AS avg_weekly_open_price, 
    Round(AVG(Close),0) AS avg_weekly_close_price 
FROM weekly_stock;

SELECT 
    Round(AVG(Open),0) AS avg_monthly_open_price, 
    Round(AVG(Close),0) AS avg_monthly_close_price 
FROM monthly_stock;

-- What is the maximum and minimum stock price by year?

SELECT Year,
    MAX(High) AS highest_price, 
    MIN(Low) AS lowest_price 
FROM daily_stock
group by year;

-- What are the top 5 dates with the highest volume traded?

SELECT 
    Date, Volume 
FROM daily_stock 
ORDER BY Volume DESC 
LIMIT 5;

-- What is the total volume traded on a weekly and monthly basis?

-- For weekly volume
SELECT 
    `Week day`, 
    SUM(Volume) AS total_volume 
FROM weekly_stock 
GROUP BY `Week day` 
ORDER BY total_volume DESC;

-- For monthly volume
SELECT 
    Month, 
    SUM(Volume) AS total_volume 
FROM monthly_stock 
GROUP BY Month 
ORDER BY total_volume DESC;

-- What are the best-performing months based on stock returns?

SELECT 
    Month, 
    ((Close - Open) / Open) * 100 AS return_percentage 
FROM monthly_stock 
ORDER BY return_percentage DESC
limit 5;

-- Is there a trend in stock price movement on specific days of the week?

SELECT 
    `Week day`, 
    round(AVG(Close),0) AS avg_close_price 
FROM weekly_stock 
GROUP BY `Week day`
ORDER BY avg_close_price DESC;

-- What are the overall stock trends year over year?

SELECT 
    Year, 
    round(AVG(Close),0) AS avg_close_price, 
    round(AVG(Volume),0) AS avg_volume_traded 
FROM daily_stock 
GROUP BY Year 
ORDER BY Year;



 