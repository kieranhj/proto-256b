@echo off

if NOT EXIST build mkdir build

echo Assembling code...
bin\vasmarm_std_win32.exe -L compile.txt -m250 -Fbin -opt-adr -o build\proto-256b.bin proto-256b.asm

if %ERRORLEVEL% neq 0 (
	echo Failed to assemble code.
	exit /b 1
)

echo Copying binary...
set HOSTFS=..\..\Arculator_V2.0_Windows\hostfs
copy build\proto-256b.bin "%HOSTFS%\256b,ff8"
