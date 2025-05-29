with creditcardTransactions as (
    select  [ITEMS]
            ,COUNT(*) ItemCount
            ,SUM([COST]) [COST]
            ,SUM([Cost USD]) [Cost_USD]
            ,[Card_Company]
            ,[Institution]
            ,[Industry]
            ,[DATE]
            ,[Month]
            ,[Year]
    from {{ ref('creditcard') }} 
    {% if is_incremental() %}
          where DATE >= (select max(DATE) from {{ this }})
    {% endif %}
    GROUP BY [ITEMS],
		 [Card_Company],
	       [Institution],
		 [Industry],
	       [DATE],
	       [Month],
		 [Year]
)
select * from creditcardTransactions;