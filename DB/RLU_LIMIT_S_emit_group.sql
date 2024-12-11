SELECT pf.*, rlu.[Min], rlu.[Max], rlu.[LimitType], rlu.[NoBuy] FROM
(
	SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[contrid], rlug.GroupName, ft.[Issuer], SUM(ft.MarketValue) AS smarketvalue, SUM(ft.[Percent]) AS spercent, rlug.[rlid], rlug.[TypesList] FROM [FactTable] AS ft
	LEFT JOIN 
	(
		SELECT rlu.ClientId, rlu.[id] AS [rlid], rlu.TypesList, g.GroupName, gc.contrid FROM
			(SELECT [id], [ClientId], [CORGid], [TypesList] FROM [RL_Universal] WHERE [CORG] = 'G' AND [RestrictType] = 'S') AS rlu
			INNER JOIN [CL_Groups] AS g ON (g.Rid= rlu.CORGid)
			INNER JOIN [CL_GroupsContent] AS gc ON (gc.GroupId = g.Id)
		UNION
			SELECT [ClientId], [id] AS [rlid], [TypesList], 'эмитент' AS [GroupName], [CORGid] AS contrid FROM [RL_Universal] WHERE [CORG] = 'C' AND [RestrictType] = 'S'
	) AS rlug
	ON (rlug.ClientId = ft.[ClientCode] AND rlug.contrid = ft.contrid AND rlug.[TypesList] LIKE '%' + ft.InstrumentType + '%')
	WHERE ft.ClientCode = 12
	GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[contrid], ft.[Issuer], rlug.GroupName, rlug.[rlid], rlug.[TypesList]
) AS pf
LEFT JOIN [RL_Universal] AS rlu ON (pf.rlid = rlu.id)


/*
SELECT pf.*, rlu.[Min], rlu.[Max], rlu.[LimitType], rlu.[NoBuy]  FROM
(
	SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[contrid], ft.[Issuer], SUM(ft.MarketValue) AS smarketvalue, SUM(ft.[Percent]) AS spercent, rlu.[TypesList] FROM [FactTable] AS ft
	LEFT JOIN 
	(
		SELECT [ClientId], [CORGid], [TypesList] FROM [RL_Universal] WHERE [CORG] = 'C' AND [RestrictType] = 'S' 
	) AS rlu ON (rlu.[ClientId] = ft.[ClientCode] AND rlu.[CORGid] = ft.contrid) AND rlu.[TypesList] LIKE '%' + ft.InstrumentType + '%'
	GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[contrid], ft.[Issuer], rlu.[TypesList]
) AS pf
LEFT JOIN
(
	SELECT [ClientId], [CORGid], [TypesList], [Min], [Max], [LimitType], [NoBuy] FROM [RL_Universal] WHERE [CORG] = 'C' AND [RestrictType] = 'S' 
) AS rlu
ON (rlu.[ClientId] = pf.[ClientCode] AND rlu.[CORGid] = pf.contrid AND rlu.[TypesList] = pf.[TypesList])

*/


	/*
		SELECT t.[ClientCode], t.[ClientAccount], t.[SummAsset], t.[Issuer], t.TypesList, t.smarketvalue, t.spercent, rlu.[Min], rlu.[Max], rlu.[LimitType] FROM
		(
			SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.contrid, 
					SUM(ft.[MarketValue]) AS smarketvalue, sum(ft.[Percent]) AS spercent, dtl.TypesList FROM  [FactTable] AS ft 
			INNER JOIN
			(
				SELECT DISTINCT [TypesList], [ClientId]	FROM [RL_Universal] WHERE [CORG] = 'C' AND [RestrictType] = 'S'
			) AS dtl
			ON (dtl.ClientId = ft.[ClientCode] AND dtl.[TypesList] LIKE '%' + ft.InstrumentType + '%')
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.contrid, dtl.TypesList
		) AS t
		LEFT JOIN 
		(
			SELECT [ClientId], [CORGid], [TypesList], [Min], [Max], [LimitType] FROM [RL_Universal] WHERE [CORG] = 'C' AND [RestrictType] = 'S' 
		) AS rlu ON (rlu.[ClientId] = t.[ClientCode] AND rlu.[TypesList] = t.[TypesList] AND rlu.[CORGid] = t.contrid)
		UNION
		SELECT t.[ClientCode], t.[ClientAccount], t.[SummAsset], ('Группа ' + t.[GroupName]) AS [Issuer], t.TypesList, t.smarketvalue, t.spercent, rlu.[Min], rlu.[Max], rlu.[LimitType] FROM
		(
			SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset],  g.GroupName, g.Rid AS  grid,
					SUM(ft.[MarketValue]) AS smarketvalue, sum(ft.[Percent]) AS spercent, dtl.TypesList FROM  [FactTable] AS ft
					INNER JOIN [CL_GroupsContent] AS gc ON (ft.contrid = gc.contrid)
					INNER JOIN [CL_Groups] AS g ON (g.Id = gc.GroupId)
					INNER JOIN
					(
						SELECT DISTINCT [TypesList], [ClientId]	FROM [RL_Universal] WHERE [CORG] = 'G' AND [RestrictType] = 'S'
					) AS dtl
					ON (dtl.ClientId = ft.[ClientCode] AND dtl.[TypesList] LIKE '%' + ft.InstrumentType + '%')
			GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], g.GroupName, g.Rid, dtl.TypesList
		) AS t
		INNER JOIN 
		(
			SELECT [ClientId], [CORGid], [TypesList], [Min], [Max], [LimitType] FROM [RL_Universal] WHERE [CORG] = 'G' AND [RestrictType] = 'S' 
		) AS rlu ON (rlu.[ClientId] = t.[ClientCode] AND rlu.[TypesList] = t.[TypesList] AND rlu.[CORGid] = t.grid)
	*/