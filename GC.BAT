echo off
echo GC: Grammar Compiler version 0.001
echo for use by authorized Sierra programmers only
echo requires MASM assembler
echo -
echo compiling Parser grammar grammar.txt to vocab.900...

masm -ml -s -t -z -w2 grammar.txt,grammar.o > gc.log;
link grammar.o; >> gc.log
exe2bin grammar vocab.900 >> gc.log
del grammar.o >> gc.log
del grammar.exe >> gc.log

echo done.
echo here is the log file gc.log:
more < gc.log