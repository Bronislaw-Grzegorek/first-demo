@echo off

set CUR_DIR=%~dp0

@if not defined TC_BIN ( echo Fatal - required Teamcenter environment not found 
  @exit /b 1)

@if not defined CREDENTIALS ( echo Fatal - required CREDENTIALS environment variable not found, execute SetCredentials.bat for the current environment
  @exit /b 1)

if not exist %CUR_DIR%logs mkdir %CUR_DIR%logs

echo.


echo Importing TC RIM Create-Snapshot Workflow...
plmxml_import %CREDENTIALS% -xml_file="%CUR_DIR%RImTC-Create-Snapshot-WF.xml" -transfermode=workflow_template_overwrite -log="%CUR_DIR%logs\rimtc_cresnap_workflow_install.log"

echo Importing TC RIM Development Release Workflow...
plmxml_import %CREDENTIALS% -xml_file="%CUR_DIR%RImTC-Development-Release-WF.xml" -transfermode=workflow_template_overwrite -log="%CUR_DIR%logs\rimtc_devrel_workflow_install.log"

echo Importing TC RIM Obsolete Release Workflow...
plmxml_import %CREDENTIALS% -xml_file="%CUR_DIR%RImTC-Obsolete-Item-WF.xml" -transfermode=workflow_template_overwrite -log="%CUR_DIR%logs\rimtc_docrel_workflow_install.log"

echo Importing TC RIM Production Release Workflow...
plmxml_import %CREDENTIALS% -xml_file="%CUR_DIR%RImTC-Production-Release-WF.xml" -transfermode=workflow_template_overwrite -log="%CUR_DIR%logs\rimtc_prod_rel_workflow_install.log"

echo Importing TC RIM Document Release  Workflow...
plmxml_import %CREDENTIALS% -xml_file="%CUR_DIR%RImTC-Document-Release-WF.xml" -transfermode=workflow_template_overwrite -log="%CUR_DIR%logs\rimtc_docrel_workflow_install.log"

echo Importing TC RIM Simple Change  Workflow...
plmxml_import %CREDENTIALS% -xml_file="%CUR_DIR%RIMTC-Simple-Change-Workflow.xml" -transfermode=workflow_template_overwrite -log="%CUR_DIR%logs\rimtc_simchg_workflow_install.log"

echo Workflow Import Complete


@if not defined FULL_DEPLOY ( echo Log files are located in the %CUR_DIR%logs folder. )