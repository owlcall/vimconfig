#!/usr/bin/env python3
#
# project.py 
# Copyright (c) 2017 owl
#
# Create a new CMake project, or modify it by adding libraries/executables
#

"""project.py is a tool used for creating new CMake C++ projects, libraries, and binaries.

Usage:
  project.py create <name>
  project.py <project> add (static|dynamic|binary) <subproject>
  project.py -h | --help

Options:
  -h --help     Show this screen.
"""
from docopt import docopt
import os
import mmap

gPath = os.path.dirname(os.path.realpath(__file__))
gPathDev = os.path.join(gPath, "../dev")

def mkdir(name):
	if not os.path.exists(name):
		os.makedirs(name)

def copy(src, dst):
	import shutil
	if os.path.isdir(src):
		mkdir(dst)
		for item in os.listdir(src):
			s = os.path.join(src, item)
			d = os.path.join(dst, item)
			copy(s, d)
	elif os.path.isfile(src):
		shutil.copy2(src, dst)

def contains_text(text, filename):
	if not os.path.isfile(filename):
		return False
	with open(filename, 'rb') as f, mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ) as s:
		if s.find(text.encode('utf-8')) != -1:
			return True
	return False

def append_text(text, filename):
	if not os.path.isfile(filename):
		return False
	if contains_text(text, filename):
		return True
	with open(filename, 'a') as f:
		f.write(text)

def replace_text(old, new, filename):
	import fileinput
	import sys
	for line in fileinput.input([filename], inplace=True):
		print(line.replace(old, new), end='')



def project_exists(path):
	return os.path.isdir(path) and os.path.isfile(os.path.join(path, "CMakeLists.txt"))



if __name__ == '__main__':
	args = docopt(__doc__, version='0.1')
	# print(args)

	global gPathDev
	projectExists = False
	projectName = None

	# Process 'create project' command
	if(args["create"]):
		print("Creating project", args["<name>"])
		# TODO: check if there is already a root-level cmake file and if so
		# prompt the user to overwrite. Otherwise abort or add -f|--force flag
		projectName = args["<name>"]
		projectExists = project_exists(projectName)
		if projectExists:
			print("error: project '"+args["<name>"]+"' already exists")
			exit(1)

		mkdir(args["<name>"])
		copy(os.path.join(gPathDev,"project"), args["<name>"])
		projectExists = True
		projectName = args["<name>"]

	if not projectExists:
		projectName = args["<project>"]
		projectExists = project_exists(projectName)
		if not projectExists:
			print("error: project '"+projectName+"' does not exist")
			exit(2)

	# Process 'add (sub)' command
	if args["add"]:
		subName = args["<subproject>"]
		subPath = os.path.join(projectName,"src",subName)
		subExists = project_exists(subPath)

		if subExists:
			print("error: subproject '"+subName+"' already exists")
			exit(3)

		projCMake = os.path.join(projectName, "CMakeLists.txt")
		subInc = os.path.join(projectName, "inc")
		subSrc = os.path.join(projectName, "src", subName)

		for sp in ["static","dynamic","binary"]:
			if not args[sp]: continue
			baseInc = os.path.join(gPathDev, sp, "inc")
			baseSrc = os.path.join(gPathDev, sp, "src")
			if os.path.isfile(os.path.join(baseInc, "dummy_header.h")):
				headerSrc = os.path.join(baseInc, "dummy_header.h")
				headerDst = os.path.join(subInc, subName+".h")
				mkdir(os.path.join(subInc))
				copy(headerSrc, headerDst)
				replace_text("dummy_header", subName, headerDst)

			copy(baseSrc, subSrc)

			sourceDst = os.path.join(subSrc, "main.cpp")
			cmakeDst = os.path.join(subSrc, "CMakeLists.txt")
			replace_text("dummy_header", subName, sourceDst)
			replace_text("dummy_"+sp, subName, cmakeDst)

			append_text("add_subdirectory(src/"+subName+")\n", projCMake)


