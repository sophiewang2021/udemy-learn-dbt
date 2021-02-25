
-- row counts should be the same
-- Therefore return records where this isn't true to make the test fail.

SELECT *
FROM (
	SELECT 'table 1' AS table_name
		,count(*) AS row_count
	FROM "ANALYTICS"."DBT"."MY_SECOND_DBT_MODEL"
	
	UNION
	
	SELECT 'table 2' AS table_name
		,count(*) AS row_count
	FROM "ANALYTICS"."DBT"."MY_SECOND_DBT_MODEL_SAME"
	)
WHERE (
		(
			SELECT count(*)
			FROM "ANALYTICS"."DBT"."MY_SECOND_DBT_MODEL"
			) <> (
			SELECT count(*)
			FROM "ANALYTICS"."DBT"."MY_SECOND_DBT_MODEL_SAME"
			)
		)
