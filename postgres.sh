##  https://www.w3schools.com/postgresql/postgresql_install.php
sudo apt update -y
sudo apt upgrade -y
sudo apt install postgresql -y

sudo vi /etc/postgresql/14/main/pg_hba.conf

# TYPE  DATABASE        USER            ADDRESS                 METHOD
host    all             all             0.0.0.0/0               md5


sudo vi /etc/postgresql/14/main/postgresql.conf
## search --> # - Connection Settings -
# listen_addresses = 'localhost' 
listen_addresses = '*' 

# to check max connections 
# sudo -u postgres psql
# select  * from
# (select count(*) used from pg_stat_activity) q1,
# (select setting::int res_for_super from pg_settings where name=$$superuser_reserved_connections$$) q2,
# (select setting::int max_conn from pg_settings where name=$$max_connections$$) q3;

# To change 
sudo vi /etc/postgresql/14/main/postgresql.conf
 
sudo sed '/max_connections/a\hello' /etc/postgresql/14/main/postgresql.conf



# max_connections = 200

sudo systemctl restart postgresql

sudo -u postgres psql
##..Create a database..

CREATE DATABASE airflow;
##..Create a user..

create user airflow with password 'fst321statusi'; ##passwrd what you want

##Exit the postgres promt
exit