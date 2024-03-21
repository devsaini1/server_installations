## install java.sh
## install python.sh

pip install 'apache-airflow[postgres]==2.8.1'  --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.8.1/constraints-3.8.txt"
echo "export PATH=$PATH:$HOME/.local/bin" >> ~/.bashrc
source ~/.bashrc
pip install psycopg2-binary
 

airflow version
airflow db init
sudo vi airflow/airflow.cfg

# >>>>>>>> our requirnment changes in files
# executor = LocalExecutor
# parallelism = 100
# load_examples = false  
# sql_alchemy_conn = postgresql+psycopg2://airflow:admin123@Private_ip(postgres_server):5432/airflow
# >>>>>>

# in security grp of postger_server add 
# TYPE        SOURCE
# Postgresql  Custom{security grp of airflow server}

airflow db init

airflow users create --username statusi_admin --firstname dev --lastname saini --role Admin --email gkcodelabs@statusi.io
# password promt

airflow webserver -D
airflow scheduler -D

#killl and restart scheduler
sudo kill -9 pid
airflow scheduler -D
