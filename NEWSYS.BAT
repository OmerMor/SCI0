@echo off
echo Place disk in indicated drive
pause
upd %1 from @sysfiles.lst
xcopy x:sci.exe %1
xcopy x:sc.exe %1
xcopy x:sciv.exe %1
xcopy x:vc.exe %1

