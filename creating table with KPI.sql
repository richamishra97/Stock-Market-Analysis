use stocks;

 CREATE TABLE KPI1 AS
(SELECT TICKER AS Stock , Date , Volume from STOCK );

CREATE TABLE KPI2 AS 
(SELECT TICKER AS Stock , Date , Beta from STOCK );

CREATE TABLE KPI3 AS
(SELECT TICKER AS Stock , Date ,Dividend_Amount from STOCK );

CREATE TABLE KPI4 AS
(SELECT TICKER AS Stock , Date , pe_ratio as "P/E Ratio" from STOCK );

CREATE TABLE KPI5 AS
(SELECT TICKER AS Stock , Date , Market_Cap from STOCK );

CREATE TABLE KPI6 AS
(SELECT TICKER AS Stock , Date , Adjusted_Close , 52_week_high from STOCK );

CREATE TABLE KPI6a AS
(SELECT TICKER AS Stock , Date , Adjusted_Close , 52_week_low from STOCK );

CREATE TABLE KPI7 AS
(SELECT TICKER AS Stock , Date , rsi_14_days as 'RSI(14 Days)',MACD from STOCK );

create table date as ( SELECT 
    date,
    LEFT(date, 4) AS year,
    MID(date, 6, 2) AS month,
    RIGHT(date, 2) AS day 
FROM 
    stock);




