@echo off
echo old path=%path%

:doit
if "%1"=="" goto done
path %1;%path%
shift
goto doit

:done
echo new path=%path%
