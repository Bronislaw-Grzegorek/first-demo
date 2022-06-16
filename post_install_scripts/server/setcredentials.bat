@echo off

@if not defined TC_BIN ( echo Fatal - required Teamcenter environment not found 
  @exit /b 1)

rem
rem Ensure TC_PASSWORD points to the password file for the desired environment. The file may have a different name.
rem

@if not exist %TC_ROOT%\security\tcdb_infodba.pwf ( echo FATAL ERROR: %TC_ROOT%\security\tcdb_infodba.pwf not found )

set TC_PASSWORD=%TC_ROOT%\security\tcdb_infodba.pwf
set CREDENTIALS=-u=infodba -pf=%TC_PASSWORD% -g=dba

rem
rem Ensure LOGDIR points to an existing Log Directory for the desired environment.
rem When exicuting the Full Deploy Scripts, logs will be placed in the following folder(s):
rem 	%LOGDIR%\%COMPUTERNAME%\%DATESTMP%
rem If LOGDIR is not set, the logs will be placed in a LOGS folder under the directory where the Pre & Post BMIDE batch files are stored:
rem 	%BASE_DIR%\LOGS\%COMPUTERNAME%\%DATESTMP%
rem

REM set LOGDIR=F:\ConfigLogs

:end
