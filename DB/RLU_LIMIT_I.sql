SELECT ft.[ClientCode], ft.[ClientAccount], ft.[SummAsset], ft.[contrid], rlug.GroupName, ft.[Issuer], ft.MarketValue, ft.[Percent],
				ISNULL(rlug.[rlid], rlui.[rlid]), ISNULL(rlug.[TypesList], CASE WHEN rlui.[rlid] IS NOT NULL THEN 'конкретный выпуск' ELSE NULL END) AS [TypesList] FROM [FactTable] AS ft
LEFT JOIN 
(				
	SELECT rlu.ClientId, rlu.[id] AS [rlid], rlu.TypesList, g.GroupName, gc.contrid FROM
		(SELECT [id], [ClientId], [CORGid], [TypesList] FROM [RL_Universal] WHERE [CORG] = 'G' AND [RestrictType] = 'A') AS rlu
		INNER JOIN [CL_Groups] AS g ON (g.Rid= rlu.CORGid)
		INNER JOIN [CL_GroupsContent] AS gc ON (gc.GroupId = g.Id)
	UNION
		SELECT [ClientId], [id] AS [rlid], [TypesList], 'эмитент' AS [GroupName], [CORGid] AS contrid FROM [RL_Universal] WHERE [CORG] = 'C' AND [RestrictType] = 'A'
) AS rlug
ON (rlug.ClientId = ft.[ClientCode] AND rlug.contrid = ft.contrid AND rlug.[TypesList] LIKE '%' + ft.InstrumentType + '%')
LEFT JOIN
(
	SELECT [ClientId], [id] AS [rlid], [IssueRid] FROM [RL_Universal] WHERE [RestrictType] = 'I'
) AS rlui
ON (rlui.[ClientId] = ft.[ClientCode] AND rlui.[IssueRid] = ft.[SecurityId])

WHERE ft.[ClientCode] = 1