@echo off

Set CUR_DIR=%~dp0

@if not defined TC_BIN ( echo Fatal - required Teamcenter environment not found 
  @exit /b 1)

 @if not defined CREDENTIALS ( echo Fatal - required CREDENTIALS environment variable not found, execute SetCredentials.bat for the current environment
  @exit /b 1)


echo AW Column Configuration Backup Before Import
 	@if defined LOGDIR ( call export_uiconfig %CREDENTIALS% -file="%LOGDIR%\uiconfig_backup_before_Import.xml" )
 	@if defined TMP_LOGDIR ( call export_uiconfig %CREDENTIALS% -file="%TMP_LOGDIR%\uiconfig_backup_before_Import.xml" )
 	@if not defined LOGDIR ( if not defined TMP_LOGDIR ( call export_uiconfig %CREDENTIALS% -file="%CUR_DIR%\uiconfig_backup_before_Import.xml" ) )
 echo.

 echo Import Sierra Sapce OccurrenceManagement column configuration
 @if not exist %CUR_DIR%\sierra_column_config.xml ( echo FATAL ERROR: ...\columnconfig\sierra_column_config.xml not found )
 import_uiconfig %CREDENTIALS%  -file="%CUR_DIR%\sierra_column_config.xml"


 echo Preference Backup After Import
 	@if defined LOGDIR ( call export_uiconfig %CREDENTIALS% -file="%LOGDIR%\uiconfig_backup_after_Import.xml" )
 	@if defined TMP_LOGDIR ( call export_uiconfig %CREDENTIALS% -file="%TMP_LOGDIR%\uiconfig_backup_after_Import.xml" )
 	@if not defined LOGDIR ( if not defined TMP_LOGDIR ( call export_uiconfig %CREDENTIALS% -file="%CUR_DIR%\uiconfig_backup_after_Import.xml" ) )