if not exist C:\dev\swig goto noswig

echo on

set PATH=C:\dev\swig;C:\Program Files (x86)\Microsoft Visual Studio 9.0\VC;%PATH%

rem NOTE: git version tag broken on conda-build-1.18.2 (revert to 1.18.1 or use
rem       the version after when it's released)

@echo off
rem NOTE: If building under MobaSSH, the C:\Windows\System32\bsh\temp path is an issue
rem You'll see something like this after the swig step: 
rem 	c1xx : fatal error C1083: Cannot open compiler intermediate file:
rem           'C:\Windows\system32\bsh\tmp\_CL_96a80b23ex': No such file or directory

echo.%TMP% | findstr /I /C:"system32\bsh">nul && (
    echo "Detected MobaSSH session. Changing TMP path to C:\temp."
    mkdir C:\temp
    set TMP=C:\temp
) || (
    echo "Running under regular command line"    
)
@echo on

"%PYTHON%" setup.py build
"%PYTHON%" setup.py install
if errorlevel 1 exit 1

exit 0

:noswig
echo "Expected SWIG to be in the path C:\dev\swig"
echo "Please install swig >= 3.0.7 there from:"
echo "http://sourceforge.net/projects/swig/files/swigwin/swigwin-3.0.7/swigwin-3.0.7.zip/download"
exit 1
