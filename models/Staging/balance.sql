
with balance as
    (SELECT [ITEMS]
		  ,CAST([COST] AS decimal(25,2)) [COST]
          ,CAST([Cost USD] AS decimal(25,2)) [Cost USD]
		  ,[Instistution] as Institution
		  ,trim([Industry]) Industry
		  ,[DATE]
		  ,[Month]
		  ,[Year]
	FROM {{source('estateETL','balance_staging')}})
Select * from balance