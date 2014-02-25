日志统计：
cat access.log | awk '{print $1}' | sort -n | uniq -c | sort -nr | head -10
日志操作：
find / -name "*.log" -and -mtime +3 -exec rm -rf {} \;删除3天前
大于100Kb的文件移动到/tmp
find ./ -size +100k -exec mv {}  /tmp \;

查找当前目录下（含子目录），文件内容中含有sina且文件名以".config"结尾的文件
grep -lr "sina" ./ | grep -P "(.*)(\.config$)"

用shell查询以“.”结尾的文件，并加上后缀“.ts”
find ./ -name "*." -exec mv {} {}ts \;

把文件B中有的，但是文件A中没有的所有行，保存为文件C，并统计C的行数
diff B A | grep "<" | sed 's/< //' > C
