D@echo %DATE% %TIME%
@set /p pwd=Enter Archive Password: 
cls

:: -t7z Sets the archive type to 7z, if no type is set 7z will set the type based on file xtension.
:: -p Sets the password. EXAMPLE: -pfuzzybunnies
:: -mhe=on Turns encryption on.
:: -r Adds files/folders recursively.
:: -ssw Enables 7z to archive files that are open in other programs.

@echo Stopping Outlook.exe
@taskkill /IM outlook.exe /f
@echo Performing Backup...
@"C:\Program Files\7-Zip\7z.exe" u -ssw "D:\backup.7z" -t7z -p%pwd% -uq0 -mhe=on "C:\Q" -xr!"System Volume Information" -xr!*.iso -xr!"*\node_modules"
@"C:\Program Files\7-Zip\7z.exe" u -ssw "D:\backup.7z" -t7z -p%pwd% -uq0 -mhe=on "%userprofile%\Desktop" -xr!"System Volume Information" -xr!*.iso -xr!"Recordings"
