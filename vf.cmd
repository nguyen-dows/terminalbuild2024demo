@echo off
if (%1) == () (goto :doprompt)
cd /D %*
:doprompt
call doprompt
