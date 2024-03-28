-- ---------------------------------Creating Database-----------------------------------------------        
CREATE database STOCKS;
USE STOCKS;
-- ---------------------------------Creating Tables-------------------------------------------
CREATE TABLE stock (
    Date DATE,
    Ticker VARCHAR(10),
    opens FLOAT,
    High FLOAT,
    Low FLOAT,
    Closes FLOAT,
    Volume INT,
    Adjusted_Close FLOAT,
    Dividend_Amount FLOAT,
    Stock_Split INT,
    Moving_Average_10_days FLOAT,
    RSI_14_days FLOAT,
    MACD FLOAT,
    Bollinger_Bands_Upper FLOAT,
    Bollinger_Bands_Lower FLOAT,
    52_Week_High FLOAT,
    52_Week_Low FLOAT,
    Beta FLOAT,
    Market_Cap BIGINT,
    PE_Ratio FLOAT
);

-- -----------------------------------Load the Table --------------------------------------
LOAD DATA INFILE "D:\\Stock market analysis\\synthetic_stock_data.csv" INTO TABLE stock 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select*from stock;

-- ------------------------------------------KPI-1--------------------------------------

select Ticker as "Stock" ,avg(VOLUME) AS "Avg Daily Traded Volume" FROM STOCK 
	group by ticker 
		order by avg(volume)  DESC ;
        
 -- ------------------------------------------KPI-2--------------------------------------       
select Ticker as "Stock" ,round(avg(beta),4) AS "Avg of Beta values" FROM STOCK 
	group by ticker 
		order by avg(beta)  DESC ;
        
-- ------------------------------------------KPI-3--------------------------------------
        
(select Ticker as "Stock" ,sum(dividend_amount) AS "Dividend Amount" 
		FROM STOCK 
			group by ticker 
				order by avg(dividend_amount)  DESC);
                
-- ------------------------------------------KPI-4--------------------------------------
                
(select Ticker as "Stock" , round(avg(PE_ratio),3) AS "Avg P/E Ratio" FROM STOCK 
group by ticker
order by avg(PE_Ratio)  DESC ); 

-- ------------------------------------------KPI-5--------------------------------------

(select Ticker as "Stock" ,CONCAT((ROUND((avg(market_cap)/100000000),1))," B") AS "Avg Market Capital" 
		FROM STOCK 
			group by ticker 
				order by avg(market_cap)  DESC );
-- ------------------------------------------KPI-6--------------------------------------
                
select Ticker as "Stock" ,round(avg(adjusted_close),2)  AS "Avg Stock Price" ,
	max(52_week_high) as "52 Week High" ,round((max(52_week_high)-avg(adjusted_close)),2) as "Difference"
FROM STOCK 
	group by ticker 
		order by ticker  DESC ;
        
-- ------------------------------------------KPI-7--------------------------------------        
select Ticker as "Stock" ,round(avg(adjusted_close),2)  AS "Avg Stock Price" ,
	min(52_week_low) as "52 Week Low" ,round(-(min(52_week_low)-avg(adjusted_close)),2) as "Difference"
FROM STOCK 
	group by ticker 
		order by ticker  DESC ;
-- ------------------------------------------KPI-8--------------------------------------        
	select TICKER,date,rsi_14_days as "RSI (14 Days)",MACD ,
(CASE 
WHEN RSI_14_DAYS <=45 AND MACD >0 THEN "BUY"
WHEN RSI_14_DAYS >=69 AND MACD <0 THEN "SELL"
ELSE "WAIT"
END) AS "Buy/Wait/Sell"
 FROM STOCK;
 