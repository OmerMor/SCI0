@echo off
echo old path=%path%

:doit
if "%1"=="" goto done
path %path%;%1
shift
goto doit

:done
echo new path=%path%
