@echo off
for /f "tokens=1,2 delims==" %%G in (.env) do set %%G=%%H

:: Dump the remote database to a file
set PGPASSWORD=%POSTGRES_REMOTE_PASSWORD%

pg_dump -h %POSTGRES_REMOTE_HOST% -p %POSTGRES_REMOTE_PORT% -U %POSTGRES_REMOTE_USERNAME% -d %POSTGRES_REMOTE_DATABASE% > database_backup.sql

set PGPASSWORD=