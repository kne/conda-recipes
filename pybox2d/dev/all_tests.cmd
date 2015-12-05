@echo off

cd %SRC_DIR%
echo - Running nose tests
nosetests -v tests

echo - Running simple test (hello)
python -m examples.hello --backend=pyglet --onlyInit >NUL

for /f "tokens=*" %%E in (%RECIPE_DIR%\examples.txt) do (
    echo - Running test: %%~nxE
    python -m examples.%%~nxE --backend=pyglet --onlyInit
)
