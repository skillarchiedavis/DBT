with creditcard as
    (SELECT [ITEMS]
            ,CAST([COST] AS decimal(25,2)) [COST]
            ,CAST([Cost USD] AS decimal(25,2)) [Cost USD]
            ,[Card Company] Card_Company
            ,[Institution]
            ,[Industry]
            ,[DATE]
            ,[Month]
            ,[Year]
	FROM {{source('estateETL','creditcard_staging')}})
Select * from creditcard;