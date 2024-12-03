
	SELECT t.[ClientCode], t.[ClientAccount], t.[SummAsset], t.[Issuer], t.[InstrumentName], t.[InstrumentType], t.[MarketValue], t.[Percent] 
	, CONVERT(varchar, CONVERT(decimal, t.[Min])) + ' - ' + CONVERT(varchar, CONVERT(decimal, t.[Max])) + CASE t.[LimitType] WHEN 'P' THEN ' %' ELSE ' руб' END AS [Limit], 
		CASE t.[LimitType] WHEN 'P' 
					THEN CONVERT(varchar, convert(decimal(18,0), convert(float, t.[SummAsset]) * (CONVERT(decimal(18, 6), t.[Max]) - convert(decimal(18, 6), t.[Percent]))) )
					ELSE CONVERT(varchar, CONVERT(decimal(18, 0), t.[Max]) - convert(decimal(18, 0), t.[MarketValue])) 
					END AS [FreeToBuy],
		CASE t.[LimitType] WHEN 'P' 
					THEN CONVERT(varchar, CONVERT(decimal(18, 4), t.[Max]) - convert(decimal(18, 4), t.[Percent]) ) + ' %'
					ELSE 'руб' 
					END AS [FreeToBuyPerc]
		, convert(decimal(18, 8), 
						CASE t.[LimitType]
							WHEN 'P' THEN 
								CASE WHEN t.[Percent] >= t.[Min] THEN
									CASE WHEN t.[Max] > 0 THEN 100 * t.[Percent] / t.[Max] ELSE 101 END
								ELSE
									-101
								END
							WHEN 'R' THEN
								CASE WHEN t.[MarketValue] >= t.[Min] THEN
									CASE WHEN t.[Max] > 0 THEN 100 * t.[MarketValue] / t.[Max] ELSE 101 END
								ELSE
									-101
								END							
							ELSE 101
						END 
					) AS LimitValue	
	FROM
	(
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[InstrumentName], ft.[InstrumentType], ft.[MarketValue], ft.[Percent], 'Конкретный выпуск' AS [LimitTo], rlu.[Min], rlu.[Max], rlu.[LimitType]
			FROM [FactTable] AS ft 
			INNER JOIN [RL_Universal] AS rlu ON (rlu.[ClientId] = ft.[ClientCode] AND rlu.[IssueRid] = ft.[SecurityId] AND rlu.[RestrictType] = 'I')			
			WHERE ft.[MarketValue] > 0 AND ft.[ClientCode] = 1
		UNION
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[InstrumentName], ft.[InstrumentType], ft.[MarketValue], ft.[Percent], ('<' + rlu.[TypesList] + '> эмитента') AS [LimitTo], rlu.[Min], rlu.[Max], rlu.[LimitType]
			FROM [FactTable] AS ft 
			INNER JOIN [RL_Universal] AS rlu ON (rlu.[ClientId] = ft.[ClientCode] AND ft.[contrid] = rlu.[CORGid] AND rlu.[RestrictType] = 'A' AND rlu.[CORG] = 'C' and rlu.[TypesList] LIKE '%' + ft.InstrumentType + '%')			
			WHERE ft.[MarketValue] > 0 AND ft.[ClientCode] = 1
		UNION
		SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[Issuer], ft.[InstrumentName], ft.[InstrumentType], ft.[MarketValue], ft.[Percent], ('<' + rlu.[TypesList] + '> группы ' + rlu.GroupName) AS [LimitTo], rlu.[Min], rlu.[Max], rlu.[LimitType]
			FROM [FactTable] AS ft 
			INNER JOIN 
			(
				SELECT rlu.*, g.GroupName, gc.contrid FROM [RL_Universal] AS rlu
					LEFT JOIN [CL_Groups] AS g ON (g.Rid = rlu.CORGid)
					LEFT JOIN [CL_GroupsContent] AS gc ON (gc.GroupId = g.Id)
					WHERE rlu.CORG = 'G' AND rlu.[RestrictType] = 'A'
			)
			AS rlu ON (rlu.[ClientId] = ft.[ClientCode] AND ft.[contrid] = rlu.[contrid] and rlu.[TypesList] LIKE '%' + ft.InstrumentType + '%')			
			WHERE ft.[MarketValue] > 0
	) AS t
