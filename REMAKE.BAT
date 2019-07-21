del classdef
copy selector.new selector

if "%1" == "-l" goto Log

sc -O @remake.lst
sc -O gauge
goto Exit

:Log
sc -O @remake.lst >make.log
sc -O gauge >>make.log

:Exit

