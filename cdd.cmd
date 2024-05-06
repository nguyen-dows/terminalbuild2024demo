@echo off
@chcp 65001 1> NUL

if (%1) == () (goto :doprompt)
cd /D %*
:doprompt
set _separator=

set GITBRANCH=
FOR /F "tokens=* USEBACKQ" %%F IN (`git symbolic-ref --short HEAD 2^> NUL`) DO (
SET GITBRANCH=%%F
)
if "%GITBRANCH%" == "" (
    set _GITPROMPT=$e[0m
) else (
    set "_GITPROMPT= $e[43;30m[%GITBRANCH%]$e[0m "
)

set _admin=
net session >nul 2>&1
if %errorLevel% == 0 (
    set _admin=$e[41;97m[!]$e[m
)
PROMPT $e]133;D$e\$e]133;A$e\$e]9;9;$P$e\%_admin%$e[107;30m[$T]$e[97;46m%_separator%$P$e[36;49m%_separator%$e[0m$_$e[0m%_GITPROMPT%$e[94m%username%$e[0m@$e[32m%computername%$e[0m$G$e]133;B$e\

@chcp 437 1> NUL
