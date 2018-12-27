echo DROP DATABASE IF EXISTS db_mfr; > deleteDatabase.bat
echo CREATE DATABASE db_mfr; > createDatabase.bat
mysql -h localhost -u root < deleteDatabase.bat
mysql -h localhost -u root < createDatabase.bat
mysql -h localhost -u root db_mfr < ../database/db_mfr.sql
del deleteDatabase.bat
del createDatabase.bat