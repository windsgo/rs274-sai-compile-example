# Use this virtual Makefile to build easily
# especially when you use vim

build_dir := build

############### -------Use your own------- ###################
# choose your own boost root dir(need boost_python2.7)
boost_root := ${HOME}/Boost_1_79_0/lib/cmake/

# choose the installed rs274 lib cmake dir
rs274_dir := ../test_rs274/install/lib/cmake/rs274/
############### -------Use your own------- ###################

default: configure build

configure:
	cmake -B ${build_dir} -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	-DBOOST_ROOT=${boost_root} \
	-Drs274_DIR=${rs274_dir}

build: configure
	cmake --build ${build_dir} -j16

clean:
	rm -rf ${build_dir}

test:
	build/sai -g test.ngc

.PHONY: default configure build clean