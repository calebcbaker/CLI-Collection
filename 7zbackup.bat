@echo %DATE% %TIME%
@set /p pwd=Enter Archive Password: 
cls

:: u "updates" older files already in the archive with newer versions and adds files that are not in the archive
:: -ssw Enables 7z to archive files that are open in other programs.
:: -t7z Sets the archive type to 7z, if no type is set 7z will set the type based on file xtension.
:: -p Sets the password. EXAMPLE: -pfuzzybunnies
:: -uq0 deletes files in the archive that do not exist in the backup location i.e. files that have been deleted since last backup
:: -mhe=on Turns encryption on.
:: -xr!"exact\path\to\folder\" excludes a specific folder
:: -xr!"exact\path\to\file.ext excludes a specific file
:: -xr!*.ext excludes all files with the .ext extension
:: -xr!"*\node_modules" excludes all folders named node_modules

@echo Stopping Outlook.exe
@taskkill /IM outlook.exe /f
@echo Performing Backup...
@"C:\Program Files\7-Zip\7z.exe" u -ssw "D:\backup.7z" -t7z -p%pwd% -uq0 -mhe=on "C:\Q" -xr!"System Volume Information" -xr!*.iso -xr!"*\node_modules"
@"C:\Program Files\7-Zip\7z.exe" u -ssw "D:\backup.7z" -t7z -p%pwd% -uq0 -mhe=on "%userprofile%\Desktop" -xr!"System Volume Information" -xr!*.iso -xr!"Recordings"
