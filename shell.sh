#日志统计：
cat access.log | awk '{print $1}' | sort -n | uniq -c | sort -nr | head -10

#日志操作：
find / -name "*.log" -and -mtime +3 -exec rm -rf {} \; #删除3天前

#大于100Kb的文件移动到/tmp
find ./ -size +100k -exec mv {}  /tmp \;

#查找当前目录下（含子目录），文件内容中含有sina且文件名以".config"结尾的文件
grep -lr "sina" ./ | grep -P "(.*)(\.config$)"

#用shell查询以“.”结尾的文件，并加上后缀“.ts”
find ./ -name "*." -exec mv {} {}ts \;

#把文件B中有的，但是文件A中没有的所有行，保存为文件C，并统计C的行数
diff B A | grep "<" | sed 's/< //' > C

find .|xargs grep -ri 'str' #查找字符串

rsync -avz user@host:srcpath despath #同步文件

#netstat查看当前网络并发连接数
netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}' 
#CLOSED      //无连接是活动的或正在进行
#LISTEN       //服务器在等待进入呼叫
#SYN_RECV  //一个连接请求已经到达，等待确认
#SYN_SENT  //应用已经开始，打开一个连接
#ESTABLISHED  //正常数据传输状态/当前并发连接数
#FIN_WAIT1     //应用说它已经完成
#FIN_WAIT2     //另一边已同意释放
#ITMED_WAIT  //等待所有分组死掉
#CLOSING      //两边同时尝试关闭
#TIME_WAIT   //另一边已初始化一个释放
#LAST_ACK    //等待所有分组死掉
