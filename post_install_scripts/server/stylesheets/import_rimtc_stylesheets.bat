@echo off

set CUR_DIR=%~dp0

@if not defined TC_BIN ( echo Fatal - required Teamcenter environment not found 
  @exit /b 1)

@if not defined CREDENTIALS ( echo Fatal - required CREDENTIALS environment variable not found, execute SetCredentials.bat for the current environment
  @exit /b 1)


echo Importing TC RIM Stylesheets
install_xml_stylesheet_datasets %CREDENTIALS% -replace -input="%CUR_DIR%rimtc_stylesheets_list.txt"
