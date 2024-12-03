
SELECT t.[ClientCode], t.[ClientAccount], t.[SummAsset], t.[Issuer], t.TypesList, t.smarketvalue, t.spercent, rlu.[Min], rlu.[Max] FROM
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
	SELECT [ClientId], [CORGid], [TypesList], [Min], [Max] FROM [RL_Universal] WHERE [CORG] = 'C' AND [RestrictType] = 'S' 
) AS rlu ON (rlu.[ClientId] = t.[ClientCode] AND rlu.[TypesList] = t.[TypesList] AND rlu.[CORGid] = t.contrid)
UNION
SELECT t.[ClientCode], t.[ClientAccount], t.[SummAsset], ('Группа ' + t.[GroupName]) AS [Issuer], t.TypesList, t.smarketvalue, t.spercent, rlu.[Min], rlu.[Max] FROM
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
	SELECT [ClientId], [CORGid], [TypesList], [Min], [Max] FROM [RL_Universal] WHERE [CORG] = 'G' AND [RestrictType] = 'S' 
) AS rlu ON (rlu.[ClientId] = t.[ClientCode] AND rlu.[TypesList] = t.[TypesList] AND rlu.[CORGid] = t.grid)



			/*
	LEFT JOIN [CL_Groups] AS g ON (g.Rid = rlu.CORGid)
					LEFT JOIN [CL_GroupsContent] AS gc ON (gc.GroupId = g.Id)
	INNER JOIN
	(
		SELECT DISTINCT [TypesList], [ClientId]	FROM [RL_Universal] WHERE [CORG] = 'G' AND [RestrictType] = 'S'
	) AS dtl
	ON (dtl.ClientId = ft.[ClientCode] AND dtl.[TypesList] LIKE '%' + ft.InstrumentType + '%')
	GROUP BY ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.contrid, dtl.TypesList

			FROM [FactTable] AS ft 
			INNER JOIN 
			(
				SELECT rlu.*, g.GroupName, gc.contrid FROM [RL_Universal] AS rlu
					
					WHERE rlu.CORG = 'G' AND rlu.[RestrictType] = 'A'
			)
			*/