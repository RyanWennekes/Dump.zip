@ECHO OFF

SET /A parametersExpected = 2

SET source=
SET target=
SET /A numberOfParameters=0

SETLOCAL EnableDelayedExpansion
FOR %%a IN (%*) DO (
	SET /A numberOfParameters+=1

	ECHO SELECT CASE WHEN COUNT(SCHEMA_NAME^) >= 1 THEN CAST(1 as BINARY^) ELSE CAST(0 as BINARY^) END FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '%%a' > temp.sql
	(call mysql.exe -N < temp.sql) > result.temp
	
	SET /p result=<result.temp
	DEL temp.sql
	DEL result.temp
	
	IF !result!==0 (
		ECHO Error: Database '%%a' does not exist
		EXIT /B
	)
)


SET source=%1
SET target=%2

IF NOT !numberOfParameters! EQU !parametersExpected! (
	ECHO Error: Incorrect Format. !numberOfParameters! arguments passed while only 2 were expected. Please provide the source and target database as follows:
	ECHO.
	ECHO    dump ^<source_database_name^> ^<target_database_name^>
	EXIT /B
)

ECHO Dumping MySQL Database '%source%' into '%target%'...
mysqldump %1 > output.sql
mysql %2 < output.sql
DEL output.sql
endlocal

