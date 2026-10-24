SELECT *
FROM "Olist_o_it";

--NUMBER OF ORDERS PER MONTH--

SELECT
EXTRACT (YEAR FROM "order_purchase_timestamp") AS YEAR,
EXTRACT (MONTH FROM "order_purchase_timestamp") AS MONTH,
COUNT ("order_id") AS "NUMBER_OF_ORDERS"
FROM "Olist_o_it"
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH;

--TURNOVER PER MONTH--

SELECT
EXTRACT (YEAR FROM "order_purchase_timestamp") AS YEAR,
EXTRACT (MONTH FROM "order_purchase_timestamp") AS MONTH,
SUM ("price") AS "Revenue"
FROM "Olist_o_it"
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH;

--EVOLUTION OF REVENUE PER MONTH--

WITH "Monthly_sales" AS (
    SELECT
        EXTRACT(YEAR FROM "order_purchase_timestamp") AS year,
        EXTRACT(MONTH FROM "order_purchase_timestamp") AS month,
        SUM("price") AS "revenue"
    FROM "Olist_o_it"
    GROUP BY year, month
)

SELECT
    year,
    month,
    "revenue",
    LAG("revenue") OVER (ORDER BY year, month) AS "previous_revenue"
FROM "Monthly_sales"
ORDER BY year, month;

--AVERAGE BASKET--

SELECT
    AVG("Revenue") AS "Average_Basket"
FROM (
    SELECT
        "order_id",
        SUM("price") AS "Revenue"
    FROM "Olist_o_it"
    GROUP BY "order_id"
) AS orders;

