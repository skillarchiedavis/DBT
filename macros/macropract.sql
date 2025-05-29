{% macro transform(table_name) %}
    SELECT [ITEMS]
           ,Count(*) as Item_Count
           ,CAST([COST] AS decimal(25,2)) [COST]
           ,CAST([Cost USD] AS decimal(25,2)) [Cost USD]
           ,[Card Company]
           ,[Institution]
           ,[Industry]
           ,[DATE]
           ,[Month]
           ,[Year]
	FROM {{source('estateETL',table_name)}}
    GROUP BY [ITEMS]
            ,[COST]
            ,[Cost USD]
            ,[Card Company]
            ,[Institution]
            ,[Industry]
            ,[DATE]
            ,[Month]
            ,[Year]
{% endmacro %}

{% macro get_column_values(column_name, relation) %}

{% set relation_query %}
select distinct
{{ column_name }}
from {{ relation }}
order by 1
{% endset %}

{% set results = run_query(relation_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{% endmacro %}


{% macro get_payment_methods() %}

{{ return(get_column_values('Institution', ref('balance'))) }}

{% endmacro %}