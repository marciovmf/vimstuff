@echo off

REM ----------------------.vimrc---------------------------
pushd %~dp0
fsutil hardlink list .vimrc|findstr "%HOMEPATH%" 2>&1>nul
IF %ERRORLEVEL% == 0 (
  echo .vimrc was already linked
) ELSE (
  IF EXIST "%USERPROFILE%\\\.vimrc" (
    set BKPFILENAME=.vimrc-backup-%DATE:/=-%-%TIME::=.%
    echo The file ' %USERPROFILE%\.vimrc' exists and is not linked to  %CD%\.vimrc
    echo Renaming it to '%BKPFILENAME%' up the existing file before creating the link
    ren %USERPROFILE%\.vimrc %BKPFILENAME%
  )
  mklink /h %USERPROFILE%\.vimrc .vimrc
)

if NOT EXIST %LOCALAPPDATA%\nvim mkdir %LOCALAPPDATA%\nvim

REM ---------------------init.vim--------------------------
fsutil hardlink list init.vim|findstr "%LOCALAPPDATA:~2%\nvim\init\.vim" 2>&1>NUL
IF %ERRORLEVEL% == 0 (
  echo init.vim was already linked
) ELSE (
  IF EXIST "%LOCALAPPDATA%\nvim\init.vim" (
    set BKPFILENAME=init.vim-backup-%DATE:/=-%-%TIME::=.%
    echo The file ' %LOCALAPPDATA%\nvim\init.vim' exists and is not linked to  %CD%\init.vim
    echo Renaming it to '%BKPFILENAME%' up the existing file before creating the link
    ren %LOCALAPPDATA%\nvim\init.vim %BKPFILENAME%
  )
  mklink /h %LOCALAPPDATA%\nvim\init.vim init.vim
)

REM ---------------------ginit.vim-------------------------
fsutil hardlink list ginit.vim|findstr "%LOCALAPPDATA:~2%\nvim\ginit\.vim" 2>&1>NUL
IF %ERRORLEVEL% == 0 (
  echo ginit.vim was already linked
) ELSE (
  IF EXIST "%LOCALAPPDATA%\nvim\ginit.vim" (
    set BKPFILENAME=ginit.vim-backup-%DATE:/=-%-%TIME::=.%
    echo The file ' %LOCALAPPDATA%\nvim\ginit.vim' exists and is not linked to  %CD%\ginit.vim
    echo Renaming it to '%BKPFILENAME%' up the existing file before creating the link
    ren %LOCALAPPDATA%\nvim\ginit.vim %BKPFILENAME%
  )
  mklink /h %LOCALAPPDATA%\nvim\ginit.vim ginit.vim
)

REM ------------------------.vim---------------------------
dir /AL %USERPROFILE%\ | findstr %CD%\\\.vim 2>&1>NUL
IF %ERRORLEVEL% == 0 (
  echo .vim folder was already linked
) ELSE (
  IF EXIST "%USERPROFILE%\.vim" (
    set BKPFILENAME=.vim-backup-%DATE:/=-%-%TIME::=.%
    echo The fodler  ' %USERPROFILE%\.vim' exists and is not linked to  %CD%\.vim
    echo Renaming it to '%BKPFILENAME%' up the existing file before creating the link
    ren %USERPROFILE%\.vim %BKPFILENAME%
  )
  mklink /j %USERPROFILE%\.vim %CD%\.vim
)
