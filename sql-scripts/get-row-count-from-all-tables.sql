SELECT
	o.[Name] 'TableName',
	p.[Rows] 'Rows'
FROM
	SYS.OBJECTS o
JOIN
	SYS.PARTITIONS p
		ON o.[Object_Id] = p.[Object_Id]
WHERE
	(o.[Type] = 'U')
	AND (p.[Index_Id] IN (0,1))
ORDER BY
	p.[Rows] DESC