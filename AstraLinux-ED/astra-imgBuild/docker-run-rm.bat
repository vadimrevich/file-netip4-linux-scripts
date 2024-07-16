@echo on
rem *******************************************************
rem docker-run-rm.bat
rem This Script will Run a Docker Container
rem *******************************************************
echo off

rem Set a Variables
rem
rem Set Inner Folders Variables
rem (a Full Path to the "./root" directory)
rem
set aROOTDIR=D:\yuden\Dockers\Rus-Linux\astra-imgBuild\root
rem
rem Set a VM Variables
rem
set aVMNAME=astrabuild-rm
set anIMNAME=vadimrevich21/astrabuild:latest

docker run -it ^
--name %aVMNAME% ^
--rm ^
-v "%aROOTDIR%:/root" ^
%anIMNAME% ^
/bin/bash
