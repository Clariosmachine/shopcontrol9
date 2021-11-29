netsh advfirewall firewall add rule name="Porta 1433" dir=in action=allow remoteip=any protocol= TCP localport=1433
netsh advfirewall firewall add rule name="SQL" dir=in action=allow program="C:\Program Files\Microsoft SQL Server\MSSQL11.SHOPCONTROL9\MSSQL\Binn\sqlservr.exe" enable=yes
netsh advfirewall firewall add rule name="Porta 1433" dir=out action=allow protocol= TCP localport=1433
netsh advfirewall firewall add rule name="SQL" dir=out action=allow program="C:\Program Files\Microsoft SQL Server\MSSQL11.SHOPCONTROL9\MSSQL\Binn\sqlservr.exe" enable=yes
Pause