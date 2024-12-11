SELECT t.[ClientCode], t.Issuer, t.contrid, rlu.TypesList FROM
(
SELECT distinct ft.[ClientCode], ft.Issuer, ft.contrid FROM [FactTable] AS ft 
) AS t
LEFT JOIN 
(
	SELECT [ClientId], [CORGid], [TypesList], [Min], [Max], [LimitType] FROM [RL_Universal] WHERE [CORG] = 'C' AND [RestrictType] = 'S' 
) AS rlu ON (rlu.[ClientId] = t.[ClientCode] AND rlu.[CORGid] = t.contrid)
ORDER BY t.[ClientCode] desc