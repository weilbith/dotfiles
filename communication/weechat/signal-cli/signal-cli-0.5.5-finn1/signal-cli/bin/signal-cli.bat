@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  signal-cli startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and SIGNAL_CLI_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\signal-cli-0.5.5.jar;%APP_HOME%\lib\signal-service-java-2.5.0_unofficial_1.jar;%APP_HOME%\lib\bcprov-jdk15on-1.55.jar;%APP_HOME%\lib\argparse4j-0.7.0.jar;%APP_HOME%\lib\dbus-java-2.7.0.jar;%APP_HOME%\lib\protobuf-java-2.5.0.jar;%APP_HOME%\lib\libphonenumber-8.0.0.jar;%APP_HOME%\lib\jackson-databind-2.5.0.jar;%APP_HOME%\lib\signal-protocol-java-2.4.0.jar;%APP_HOME%\lib\okhttp-3.5.0.jar;%APP_HOME%\lib\httpclient-4.4.jar;%APP_HOME%\lib\unix-0.5.1.jar;%APP_HOME%\lib\jackson-annotations-2.5.0.jar;%APP_HOME%\lib\jackson-core-2.5.0.jar;%APP_HOME%\lib\curve25519-java-0.3.0.jar;%APP_HOME%\lib\okio-1.11.0.jar;%APP_HOME%\lib\httpcore-4.4.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\commons-codec-1.9.jar;%APP_HOME%\lib\debug-1.1.1.jar;%APP_HOME%\lib\hexdump-0.2.1.jar

@rem Execute signal-cli
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %SIGNAL_CLI_OPTS%  -classpath "%CLASSPATH%" org.asamk.signal.Main %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable SIGNAL_CLI_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%SIGNAL_CLI_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
