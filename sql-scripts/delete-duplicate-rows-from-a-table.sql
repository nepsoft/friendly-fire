-- =============================================
-- Description: This script will remove all
-- duplicate rows from a table except for the
-- specified amount to keep.  For instance, if
-- there are 10 duplicates, and you indicate to
-- keep only 2, then it will remove 8 of the
-- entries.
--
-- Parameters:
--	[FIELD_ONE]: The first field to use in the
--		duplicate comparison.
--	[FIELD_TWO]: The second field to use in the
--		duplicate comparison.
--	[FIELD_N]: The nth field to use in the
--		duplicate comparison.
--	[TABLE_NAME]: The table against which this
--		script should run.
--	[NUMBER_OF_ROWS_TO_KEEP]: The number of rows
--		to keep.
-- =============================================

WITH [table] AS
(
	SELECT
		ROW_NUMBER()
	OVER
		(
			PARTITION BY
				[FIELD_ONE],
				[FIELD_TWO],
				-- .
				-- .
				-- .
				-- .
				[FIELD_N]
			ORDER BY
				[FIELD_ONE],
				[FIELD_TWO],
				-- .
				-- .
				-- .
				-- .
				[FIELD_N]
		) AS [rowcount]
	FROM
		[TABLE_NAME]

DELETE FROM [table]
WHERE [rowcount] > [NUMBER_OF_ROWS_TO_KEEP]