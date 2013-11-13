@rem Used by the buildbot "compile" step.
del Python\graminit.c 
del Include\graminit.h 
PCbuild\my_pgen\pgen Grammar\Grammar Include\graminit.h Python\graminit.c 
cmd /c Tools\buildbot\external.bat
call "%VS90COMNTOOLS%vsvars32.bat"
cmd /c Tools\buildbot\clean.bat
vcbuild /useenv PCbuild\kill_python.vcproj "Debug|Win32" && PCbuild\kill_python_d.exe
vcbuild /useenv PCbuild\pcbuild.sln "Debug|Win32"

