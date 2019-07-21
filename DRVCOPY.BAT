rem This batch file will copy drivers from the network
rem to your shipping disk in the approved order

rem copy video drivers 
copy s:ega320.drv %1
copy s:mcga320.drv %1
copy s:tandy320.drv %1
copy s:cga320bw.drv %1
copy s:cga320c.drv %1
copy s:hercmono.drv %1
copy s:pcjr320.drv %1

rem copy sound drivers
copy s:std.drv %1
copy s:jr.drv %1
copy s:tandy.drv %1
copy s:adl.drv %1
copy s:imf.drv %1
copy s:fb01.drv %1
copy s:cms.drv %1
copy s:mt540.drv %1
copy s:csm1.drv %1
copy s:mt32.drv %1

rem copy keyboard drivers
copy s:ibmkbd.drv %1
copy s:tandykbd.drv %1

rem copy input drivers
copy s:joystick.drv %1

