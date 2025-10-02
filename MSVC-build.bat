@echo off
setlocal

set CONFIG=%1

if "%CONFIG%"=="" (
    echo select: build.bat [Debug^|Release]
    exit /b 1
)

cmake -S . -B build/%CONFIG% -G "Ninja" -DCMAKE_BUILD_TYPE=%CONFIG%
cmake --build build/%CONFIG%

echo =============================== 
echo Build %CONFIG% Success.
echo ===============================
