#!/bin/bash

#  从  s-qcom-fcnt-dev.xml 文件中找出  我们 project 本地所在的  路径.

src_file=input.txt
xml_file=s-qcom-fcnt-dev.xml



# 从  xml 中找到  本地路径.
function find_local_path() {
   
   grep_result=`grep "$1" $2` # 返回  grep 的命令
   echo " xzb : $grep_result"
     # 找出 本地路径 path= 的字符串
    local_tmp_path=${grep_result#*path=}
    # ${grep_result%*chars}
    #  取出 引号里面的值 
    local_path=`echo $local_tmp_path |awk -F "[\"\"]" '{print $2}'` 
     echo " local:$local_path"
     exit 1
}


cat $src_file | while read line
do 
 # echo " $line"  # 读取到的一行
 #  获得  project_name
  project_name=`echo $line|grep 'project'|awk -F '=' '{print $2}'`
  #判断是否为空行
  if [ -z $project_name ];then
     continue # 空行继续读取下一行
  fi
 # echo " xzb: $project_name"
  # 从  xml 找出匹配的
 grep -E "$project_name" $xml_file > /dev/null
 if [[ $? == 0 ]]  #  表示找到
 then
     echo "find"
     find_local_path $project_name $xml_file
 else 
    echo "not find "
 fi
done

