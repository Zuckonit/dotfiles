REM /*
REM                (0.0)
REM               (/o.o\)
REM +--------oO0Ooo0oO0O--------------------+
REM      FileName: install.bat
REM          Desc: install script for windows
REM        Author: Mocker
REM         Email: Zuckerwooo@gmail.com
REM      HomePage: http://hi.baidu.com/new/lsin30
REM       Version: 0.0.1
REM    LastChange: 2012-07-16 16:37:12
REM       History:
REM +---------------------------oo0ooOO------+
REM */

@echo off
set vimtools=%~dp0tools\windows\
set vimfont=%~dp0tools\fonts\

REM add tools to evironment variables
set regpath=HKEY_CURRENT_USER\Environment
reg add "%regpath%" /v "path" /d "%path%;%vimtools%

REM install font
copy %vimfont%*.ttf %windir%\Fonts\
=======
copy %vimfont%*.ttf C:\WINDOWS\Fonts
