@echo on
rem *******************************************************
rem docker-build.bat
rem This Script will Build a Docker Linux Container
rem *******************************************************
echo off

rem Set a Variables
rem
rem Set a VM Variables
rem
set anIMNAME=vadimrevich21/astrabuild:latest

docker build -t %anIMNAME% .
