
INSERT INTO [dbo].[RL_Universal]
           ([id]
           ,[ClientId]
           ,[CORG]
           ,[CORGid]
           ,[RestrictType]
           ,[IssueRid]
           ,[TypesList]
           ,[LimitType]
           ,[Min]
           ,[Max])
(
	SELECT NEWID() AS [Id]
			,[ClientId]
			, 'C' AS [CORG]
		  ,[rid] AS [CORGid]
		  , 'S' AS [RestrictType]
		  , NULL AS [IssueRid]
		  , 'акция;' AS [TypesList]
		  ,CASE [LimitType] WHEN 'P' THEN 'P' WHEN 'A' THEN 'R' ELSE '' END AS [LimitType]
		  ,0 AS [Min]
		  ,[LimitValue] AS [Max]	  
	FROM [LC3_dev].[dbo].[RestrictList]
	WHERE [Type] = 'AS'
)