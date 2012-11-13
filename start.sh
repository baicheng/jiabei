kill `cat tmp/pids/thin.4567.pid`
kill `cat tmp/pids/thin.4567.pid`
thin config -C /home/yanyan/baicheng/jiabei-master/jiabei.yml -c /home/yanyan/baicheng/jiabei-master/ --servers 1 -e development -p 4567
thin start -C jiabei.yml 
