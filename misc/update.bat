@echo off


@REM Set the below variables to run the following code 
set "tomcat_path=C:\Program Files (x86)\Apache Software Foundation\Tomcat 8.5"
set "tomcat_exe=Tomcat8.exe"



@REM starting the new build process using maven
echo Starting mvn package command...
start /wait cmd /c mvn package
echo mvn package command completed.


@REM getting the project name as parent directory name
set "currentDir=%cd%"
for %%i in ("%currentDir%") do set "parentDir=%%~nxi"
echo Parent directory name is: %parentDir%


@REM setting up the variable names
set "projectName=%parentDir%"
set "ext=.war"
set "source_path=%cd%\target\%projectName%%ext%"
set "destination_path=%tomcat_path%\webapps"
set file_path=%destination_path%%projectName%%ext%
set directory_path=%destination_path%%projectName%
set "run_tomcat=%tomcat_path%\bin\%tomcat_exe%"


@REM  this step will delete the previous build file inside tomcat
echo trying to put the build file in tomcat
if exist "%file_path%" (
  del "%file_path%"
  echo Previous File deleted successfully
) else (
  echo The file does not exist
)
if exist "%directory_path%" (
    rd /s /q "%directory_path%"
    echo Folder deleted successfully.
) else (
    echo Folder not found.
)


@REM  this step will put build file inside tomcat
copy "%source_path%" "%destination_path%"


