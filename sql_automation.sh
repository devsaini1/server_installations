touch ~/.pgpass
chmod 600 ~/.pgpass

nano ~/.pgpass 
----------------------------------------------------- 
echo >> localhost:5432:statusi:statusi_db:statusi_0F4

<your-db-host>:<your-db-port>:<your-db-name>:<your-db-user>:<your-db-password>
-------------------------------------------------------------------------------

command tobe executed

psql -h 0.0.0.0 -U statusi_db -d statusi -f /home/ubuntu/statusi/backend/sql_scripts/write.sql


/statusi/app