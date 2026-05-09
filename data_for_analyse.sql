/*
1. Total revenue
*/

CREATE VIEW vw_total_revenue AS
SELECT 
	SUM(Sales_Volume * price_usd) AS [total_revenue_usd]
FROM sales;
GO

/*
2. Revenue per product type
*/

CREATE VIEW vw_revenue_per_product_type AS
SELECT 
	terms AS product_type,
	SUM(Sales_Volume * price_usd) AS [total_revenue_usd]
FROM sales
GROUP BY terms;
GO

/*
3. TOP 5 products
*/

CREATE VIEW vw_top_5_products AS
SELECT TOP 5
	PRODUCT_ID,
	name,
	SUM(Sales_Volume * price_usd) AS [product_revenue_usd]
FROM sales
GROUP BY PRODUCT_ID, name
ORDER BY product_revenue_usd DESC;
GO

/*
4. Revenue: promoted vs non-promoted products
*/

CREATE VIEW vw_promotion_impact AS
SELECT 
	promotion,
	SUM(Sales_Volume * price_usd) AS [revenue_usd]
FROM sales
GROUP BY promotion;
GO

/*
5. Revenue: seasonal vs non-seasonal products
*/

CREATE VIEW vw_seasonal_impact AS
SELECT 
	Seasonal,
	SUM(Sales_Volume * price_usd) AS [revenue_usd]
FROM sales
GROUP BY Seasonal;
GO

/*
6. Revenue per section
*/

CREATE VIEW vw_revenue_per_section AS
SELECT 
	section,
	SUM(Sales_Volume * price_usd) AS [revenue_usd]
FROM sales
GROUP BY section;
GO

/*
7. Average product price per product type
*/

CREATE VIEW vw_average_price_per_product_type AS
SELECT 
	terms AS product_type,
	AVG(price_usd) AS [average_price_usd]
FROM sales
GROUP BY terms;
GO

/*
8. Number of products per position in shop
*/

CREATE VIEW vw_product_positions AS
SELECT 
	Product_Position,
	COUNT(*) AS [number_of_products]
FROM sales
GROUP BY Product_Position;
GO

/*
9. Product ranking by revenue
*/

CREATE VIEW vw_product_ranking AS
SELECT 
	PRODUCT_ID,
	name,
	SUM(Sales_Volume * price_usd) AS revenue_usd,
	RANK() OVER (
		ORDER BY SUM(Sales_Volume * price_usd) DESC
	) AS product_rank
FROM sales
GROUP BY PRODUCT_ID, name;
GO

/*
10. Promotion impact by product type
*/

CREATE VIEW vw_promotion_by_product_type AS
SELECT
	terms AS product_type,
	promotion,
	SUM(Sales_Volume * price_usd) AS revenue_usd
FROM sales
GROUP BY terms, promotion;
GO