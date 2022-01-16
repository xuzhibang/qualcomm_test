#! /bin/bash

#find  查找  git 是否已经提交了.

# 1: //1:生成  git_log.txt 文件
#1_1: 记录当前目录
entry_pwd=/home/book/tmp/qualcomm_test
current_pwd=`pwd`;
cd $entry_pwd
#  git log --since=<date>
#echo " current pwd: $current_pwd"
git log > $current_pwd/git_log.txt
cd $current_pwd  #  back 



