#!/bin/bash
#coding=utf-8

import os,sys
import shlex,subprocess

# 可以使输出改变颜色的库!
from termcolor import colored

ARG = None
if len(sys.argv) == 2:
	ARG = sys.argv[1]
CONTRIB_ROOT="contrib"

# 执行命令
def do_shell(COMMAND):
	print colored('* run command: ' + COMMAND, 'blue')
	lines = subprocess.check_output(shlex.split(COMMAND)).split('\n')

# 拉取最新的shell
def do_repo_sync_shell():
	print '<---------------'
	print colored('* update shell to lastest', 'green')
	try:
		do_shell('git pull')
	except subprocess.CalledProcessError:
		pass
	print '--------------->'

# 拉取各个仓库的分支
def do_repo_sync_branch(REPO_NAME, REPO_BRANCH):
	assert REPO_BRANCH
	print '<---------------'
	print colored('* update %s with branch %s' % (REPO_NAME, REPO_BRANCH), 'yellow')
	do_shell('git fetch origin')
	do_shell('git checkout %s' % (REPO_BRANCH))
	do_shell('git pull origin %s' % (REPO_BRANCH))
	print '--------------->'

# 拉取各个仓库
def do_check_sync(REPO_NAME, REPO_URL, REPO_EXPECT_TYPE, REPO_EXPECT_VALUE):
	# 防止那个参数为空的断言.
	assert REPO_NAME
	assert REPO_URL
	assert REPO_EXPECT_TYPE
	assert REPO_EXPECT_VALUE
	print '调用 do_check_syn方法'
	print colored('调用 do_check_syn方法', 'yellow')
	if not os.path.exists(REPO_NAME):
		do_shell('git clone %s %s' % (REPO_URL, REPO_NAME))
	currdir = os.getcwd()
	os.chdir(REPO_NAME)
	if REPO_EXPECT_TYPE == 'branch':
		do_repo_sync_branch(REPO_NAME, REPO_EXPECT_VALUE)
	os.chdir(currdir)

def do_sync():

	# 拉取最新的shell
	do_repo_sync_shell()

	currdir = os.getcwd()
	print colored('当前路径: %s' % currdir, 'white')

	if os.path.exists('dependencies'):
		fd = open('dependencies')
		raws = fd.readlines()
		print colored('dependencies里的内容: %s' % (raws), 'white')
		fd.close()

		# 如果没有contrib文件夹.就创建一个.
		if not os.path.exists(CONTRIB_ROOT):
			os.mkdir(CONTRIB_ROOT)

		os.chdir(CONTRIB_ROOT)
		for i in xrange(len(raws)):
			raw = raws[i]
			print colored('dependencies里的内容的第%s行: %s' % (i,raw), 'cyan')
			# 以空格为分隔符.分割字符串.
			items = raw.split(' ')
			for i in xrange(len(items)):
				print colored('分割后的字符串:%s' % (items[i]), 'red')

			repo, url, eType, branchType = raw.split(' ')
			do_check_sync(repo, url, eType, branchType)

	# 改变当前目录到该工程根目录
	os.chdir(currdir)

if ARG and ARG.lower() == 'xcode':	
	pass
else:
	do_sync()





