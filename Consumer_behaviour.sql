--NUMBER OF UNIQUE CLIENTS PER MONTH--

SELECT
        EXTRACT(YEAR FROM "order_purchase_timestamp") AS YEAR,
        EXTRACT(MONTH FROM "order_purchase_timestamp") AS MONTH,
        COUNT (DISTINCT "customer_unique_id") AS "Unique_clients"
FROM "Olist_o_cu_it"
GROUP BY YEAR, MONTH;


-- AVERAGE OF ORDERS--

SELECT
    AVG("number_of_orders") AS "Average_orders"
FROM(
    SELECT
    "order_id",
    COUNT(DISTINCT "order_id") AS "number_of_orders"
    FROM "Olist_o_cu_it"
    GROUP BY "order_id"
) AS "orders";

--Spending per client--

SELECT
    AVG("amount") AS "Average_amount"
FROM(
    SELECT
    "customer_unique_id",
    SUM("price") AS "amount"
    FROM "Olist_o_cu_it"
    GROUP BY "customer_unique_id"
) AS "orders";
