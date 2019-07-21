if "%1" == "+b" goto backup
if "%2" == "+b" goto backup
if "%1" == "-b" goto nobackup
if "%2" == "-b" goto nobackup

rem default is
goto nobackup

:backup
call backsys

:nobackup

del classdef
copy selector.new selector

if "%1" == "-l" goto Log
if "%1" == "+l" goto Log
if "%1" == "l" goto Log

rem need files vocabase.vc deriv.txt grammar.txt nlsyms.txt
rem compile vocab.vc using vcomp to test vocabase.vc
rem
call vcpp vocabase.vc vocabase.txt
call vcpp vocab.vc	 vocab.txt
call dc
call gc
call sc -aO @remake.lst
goto Exit

:Log
echo *** make.log *** >remake.log
call vcpp  vocabase.vc vocabase.txt>>remake.log
call vcomp vocab.vc >>remake.log
call dc>>remake.log
call gc>>remake.log
call sc -asO @remake.lst>>remake.log

:Exit

