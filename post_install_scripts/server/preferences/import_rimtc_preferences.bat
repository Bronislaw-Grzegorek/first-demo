@echo off

set CUR_DIR=%~dp0

@if not defined TC_BIN ( echo Fatal - required Teamcenter environment not found 
  @exit /b 1)

@if not defined CREDENTIALS ( echo Fatal - required CREDENTIALS environment variable not found, execute SetCredentials.bat for the current environment
  @exit /b 1)


echo Preference Backup Before Import
	@if defined LOGDIR ( call preferences_manager %CREDENTIALS% -mode=export -scope=SITE -out_file="%LOGDIR%\pref_backup_before_import.xml" )
	@if defined TMP_LOGDIR ( call preferences_manager %CREDENTIALS% -mode=export -scope=SITE -out_file="%TMP_LOGDIR%\pref_backup_before_import.xml" )
	@if not defined LOGDIR ( if not defined TMP_LOGDIR ( call preferences_manager %CREDENTIALS% -mode=export -scope=SITE -out_file="%CUR_DIR%backup_before_import.xml" ) )
echo.

echo Import TC RIM Site Preferences
@if not exist %CUR_DIR%rimtc_preferences.xml ( echo FATAL ERROR: ...rimtc_preferences.xml not found )
preferences_manager %CREDENTIALS% -mode=import -scope=SITE -file="%CUR_DIR%rimtc_preferences.xml" -action=OVERRIDE


echo Import TC RIM Stylesheet Preferences
@if not exist %CUR_DIR%rimtc_stylesheet_preferences.xml ( echo FATAL ERROR: ...\rimtc_stylesheet_preferences.xml not found )
preferences_manager %CREDENTIALS% -mode=import -scope=SITE -file="%CUR_DIR%rimtc_stylesheet_preferences.xml" -action=OVERRIDE

echo Preference Backup After Import
	@if defined LOGDIR ( call preferences_manager %CREDENTIALS% -mode=export -scope=SITE -out_file="%LOGDIR%\pref_backup_afterimport.xml" )
	@if defined TMP_LOGDIR ( call preferences_manager %CREDENTIALS% -mode=export -scope=SITE -out_file="%TMP_LOGDIR%\pref_backup_after_import.xml" )
	@if not defined LOGDIR ( if not defined TMP_LOGDIR ( call preferences_manager %CREDENTIALS% -mode=export -scope=SITE -out_file="%CUR_DIR%backup_after_import.xml" ) )

