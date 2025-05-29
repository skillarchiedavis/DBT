
with estateTransaction as (
    select  [ITEMS]
            ,COUNT(*) ItemCount
            ,SUM([COST]) [COST]
            ,SUM([Cost USD]) [Cost_USD]
            ,[Institution]
            ,[Industry]
            ,[DATE]
            ,[Month]
            ,[Year]
    from {{ ref('balance') }} 
    {% if is_incremental() %}
          where DATE >= (select max(DATE) from {{ this }})
    {% endif %}
    GROUP BY [ITEMS],
			 [Institution],
			 [Industry],
			 [DATE],
			 [Month],
		     [Year]
)
select * from estateTransaction;