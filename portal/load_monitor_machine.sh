. 0-set-config.sh
. ~/keystonerc_admin
sed -i -e 's/^database_host.*/database_host = "'"$virtual_ip"'"/' physical_machine_loader.py
sed -i -e 's/^database_password.*/database_password = "'"$password_galera_root"'"/' physical_machine_loader.py
python physical_machine_loader.py
mysql -uroot -p$password_galera_root -h $virtual_ip -e "use cloud;select * from physical_machine;
select * from physical_machine_physical_machine_type;
select * from machine_service_monitor_record;
select * from alarm_setting;"
 
