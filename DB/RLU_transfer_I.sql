USE [LC3_dev]
GO

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
				, rl.[ClientId]
				, 'C' AS [CORG]
				, i.[emitents_id] AS [CORGid]
				,  'I' AS [RestrictType]
				, rl.[rid] AS [IssueRid]
				, NULL AS [TypesList]
			    , CASE rl.[LimitType] WHEN 'P' THEN 'P' WHEN 'A' THEN 'R' ELSE '' END AS [LimitType]
			    , 0 AS [Min]
			    , rl.[LimitValue] AS [Max]
		  FROM [dbo].[RestrictList] as rl
		INNER JOIN 
		(
			SELECT t.rid, t.emitents_id, t.FullName FROM
			(
				SELECT rl.rid, i.emitents_id, i.FullName, ROW_NUMBER() OVER(PARTITION BY rl.rid ORDER BY i.emitents_id) AS rn FROM
				(
				SELECT distinct rid FROM [RestrictList] WHERE [Type] = 'I'
				) as rl
				LEFT JOIN [_CL_URL_issues] AS i ON (rl.rid = i.rid)
			) AS t
			WHERE t.rn=1 AND t.emitents_id IS NOT NULL
		) AS i ON (rl.rid = i.rid)
		WHERE rl.[Type] = 'I'
)



