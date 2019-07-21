echo off

rem SCPP.BAT front-end batch file for SCPPRINT.EXE

rem          by Pablo Ghenis 09/21/88

rem          (c) Sierra On-line, 1988

if "%1"=="" goto teach
goto doit

:teach
echo usage:     scpp FILENAME
echo            original file is saved with extension .BAK
echo            to format MULTIPLE files use scppall.bat
echo examples:  scpp myfile.sc
echo            scppall (defaults to *.sc and *.sh)
echo            scppall rm*.sc
goto done

:doit

rem set DRV, DIR, NAM, EXT environment variables
call namsplit %1

:allset
scpprint <%1 >%drv%%dir%%nam%.tmp

if exist %drv%%dir%%nam%.tmp goto shuffle
echo scpp error: no output produced 
goto done

:shuffle
rem better safe than sorry
copy %1 %drv%%dir%%nam%.bak  > nul

copy %drv%%dir%%nam%.tmp  %1 > nul
del  %drv%%dir%%nam%.tmp     > nul

echo %1

rem get outta here
:done