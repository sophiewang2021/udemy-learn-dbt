{{ config(materlized = 'incremental', unique key = 'd_date')}}

select * 
from "SNOWFLAKE_SAMPLE_DATA"."TCPDS_SF10TCL"."DATE_DIM"
where d_date <= current_date

{% if is_incremental() %}
 and d_date > (select max(d_date) from {{this}})
 {% endif %}