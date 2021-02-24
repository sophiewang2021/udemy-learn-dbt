{{ config(materialized = 'table') }}
WITH order_by_date AS (
		SELECT o_orderdate
			,SUM(o_totalprice) AS date_total
		FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
		GROUP BY o_orderdate
		ORDER BY o_orderdate
		)

SELECT o_orderdate AS order_date
	,date_total
	,sum(date_total) OVER (
		ORDER BY o_orderdate rows BETWEEN unbounded preceding
				AND CURRENT row
		) cumulative_total
FROM order_by_date
ORDER BY o_orderdate