
-- Test: Total amounts should be the same between two tables
-- Therefore return table count records where this isn't true to make the test fail.

SELECT *
FROM (
	SELECT 'ANALYTICS"."DBT"."CUMULATIVE_ORDERS_BY_DATE' AS table_name ,
		sum(date_total) as date_total_sum ,
        sum(cumulative_total) as cumulative_total_sum
	FROM  "ANALYTICS"."DBT"."CUMULATIVE_ORDERS_BY_DATE"
	
	UNION

	SELECT 'ANALYTICS"."DBT"."CUMULATIVE_ORDERS_BY_DATE_SAME' AS table_name ,
		sum(date_total) as date_total_sum ,
        sum(cumulative_total) as cumulative_total_sum
	FROM  "ANALYTICS"."DBT"."CUMULATIVE_ORDERS_BY_DATE_SAME"
	)
WHERE (
		    (
			SELECT sum(date_total) 
			FROM "ANALYTICS"."DBT"."CUMULATIVE_ORDERS_BY_DATE"
			) <> (
			SELECT sum(date_total) 
			FROM "ANALYTICS"."DBT"."CUMULATIVE_ORDERS_BY_DATE_SAME"
			)
	    )
        or
        (
		    (
			SELECT sum(cumulative_total)
			FROM "ANALYTICS"."DBT"."CUMULATIVE_ORDERS_BY_DATE"
			) <> (
			SELECT sum(cumulative_total)
			FROM "ANALYTICS"."DBT"."CUMULATIVE_ORDERS_BY_DATE_SAME"
			)
	    )


