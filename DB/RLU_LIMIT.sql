		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[InstrumentName], ft.[InstrumentType], ft.[MarketValue], ft.[Percent], 'Конкретный выпуск' AS [LimitTo], rlu.[Min], rlu.[Max]
			FROM [FactTable] AS ft 
			INNER JOIN [RL_Universal] AS rlu ON (rlu.[ClientId] = ft.[ClientCode] AND rlu.[IssueRid] = ft.[SecurityId] AND rlu.[RestrictType] = 'I')			
			WHERE ft.[MarketValue] > 0 AND ft.[ClientCode] = 1
		UNION
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[InstrumentName], ft.[InstrumentType], ft.[MarketValue], ft.[Percent], (rlu.[TypesList] + ' эмитента') AS [LimitTo], rlu.[Min], rlu.[Max]
			FROM [FactTable] AS ft 
			INNER JOIN [RL_Universal] AS rlu ON (rlu.[ClientId] = ft.[ClientCode] AND ft.[contrid] = rlu.[CORGid] AND rlu.[RestrictType] = 'A' AND rlu.[CORG] = 'C' and rlu.[TypesList] LIKE '%' + ft.InstrumentType + '%')			
			WHERE ft.[MarketValue] > 0 AND ft.[ClientCode] = 1
		UNION
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[InstrumentName], ft.[InstrumentType], ft.[MarketValue], ft.[Percent], (rlu.[TypesList] + ' группы ' + rlu.GroupName) AS [LimitTo], rlu.[Min], rlu.[Max]
			FROM [FactTable] AS ft 
			INNER JOIN 
			(
				SELECT rlu.*, g.GroupName, gc.contrid FROM [RL_Universal] AS rlu
					LEFT JOIN [CL_Groups] AS g ON (g.Rid = rlu.CORGid)
					LEFT JOIN [CL_GroupsContent] AS gc ON (gc.GroupId = g.Id)
					WHERE rlu.CORG = 'G' AND rlu.[RestrictType] = 'A'
			)
			AS rlu ON (rlu.[ClientId] = ft.[ClientCode] AND ft.[contrid] = rlu.[contrid] and rlu.[TypesList] LIKE '%' + ft.InstrumentType + '%')			
			WHERE ft.[MarketValue] > 0 AND ft.[ClientCode] = 1


	SELECT rlu.*, g.Id, g.GroupName, gc.contrid FROM [RL_Universal] AS rlu
		LEFT JOIN [CL_Groups] AS g ON (g.Rid = rlu.CORGid)
		LEFT JOIN [CL_GroupsContent] AS gc ON (gc.GroupId = g.Id)
		WHERE rlu.CORG = 'G'
