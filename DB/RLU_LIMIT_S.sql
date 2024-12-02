/*
SELECT t.*, rlu.[Min], rlu.[Max] FROM
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

WHERE t.ClientCode = 1
ORDER BY t.[TypesList], t.[Issuer]
*/



	SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.InstrumentName, ft.InstrumentType, ft.[Issuer], g.GroupName, g.Rid, 
			ft.[MarketValue], ft.[Percent], dtl.TypesList FROM  [FactTable] AS ft
			INNER JOIN [CL_GroupsContent] AS gc ON (ft.contrid = gc.contrid)
			INNER JOIN [CL_Groups] AS g ON (g.Id = gc.GroupId)
			INNER JOIN
			(
				SELECT DISTINCT [TypesList], [ClientId]	FROM [RL_Universal] WHERE [CORG] = 'G' AND [RestrictType] = 'S'
			) AS dtl
			ON (dtl.ClientId = ft.[ClientCode] AND dtl.[TypesList] LIKE '%' + ft.InstrumentType + '%')
	WHERE ft.[ClientCode] = 1
	ORDER BY g.GroupName, ft.[InstrumentName] 

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