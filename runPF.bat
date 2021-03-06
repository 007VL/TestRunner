@ECHO OFF
::
SET GITHUB_ACCOUNT=[vasily_lukashuk@yahoo.com]
SET WS_DIR=Workspace
SET REPO_NAME=Title_Validation_PF
SET APP_VERSION=1.2
SET MAIN_CLASS=core.IDE
SET v_01=
::
IF "%JAVA_HOME%" == "" GOTO EXIT_JAVA
ECHO Java installed
IF "%M2%"== "" GOTO EXIT_MVN
ECHO Maven installed
CALL git --version > nul 2>&1
IF NOT %ERRORLEVEL% == 0 GOTO EXIT_GIT
ECHO Git installed

GOTO NEXT

:NEXT
IF NOT EXIST C:\%WS_DIR% GOTO NO_WORKSPACE
IF EXIST C:\%WS_DIR%\%REPO_NAME% RMDIR /S /Q C:\%WS_DIR%\%REPO_NAME%
CD C:\%WS_DIR%
git clone https://github.com/vasilylukashuk/Title-Validation-PF.git
CD %REPO_NAME%
SLEEP 5
CALL mvn package
ECHO.
ECHO Executing Java program ...
java -jar C:\%WS_DIR%\%REPO_NAME%\target\%REPO_NAME%-%APP_VERSION%-jar-with-dependencies.jar %MAIN_CLASS% %v_01%
GOTO END

:EXIT_JAVA
ECHO no java installed
GOTO END
:EXIT_MVN
ECHO no maven installed
GOTO END
:EXIT_GIT
ECHO No git installed
GOTO END
:NO_WORKSPACE
ECHO %WS_DIR% is not exists
GOTO END
:END
CD\