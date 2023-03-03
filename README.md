# RS274 SAI Compile Example

This is an example for how to link to the `librs274.so` to build
a `Stand Alone Interpreter` outside the project `rs274`.

The `rs274` project is on github made by me, see:
[https://github.com/windsgo/rs274ngc-interpreter](https://github.com/windsgo/rs274ngc-interpreter)

## How to build the example

### Prepare

- A `boost_python27` library

    This is the history of linuxcnc (wtf).

- A `python2` library

- A `rs274` library installed from [windsgo/rs274ngc-interpreter](https://github.com/windsgo/rs274ngc-interpreter)

### Build Step

#### Simple Way

Use the Makefile provided. 

1. Modify the `boost_root` and `rs274_dir` in the Makefile

2. Then build it

```bash
make
```

3. Run test

```bash
make test
```

#### Step-By-Step Way

1. configure

You need to set **your own prefix** in the following command

```cmake
cmake -B build -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	-DBOOST_ROOT=__YOUR_PREFIX_1__/lib \
	-Drs274_DIR=__YOUR_PREFIX_2__/lib/cmake/rs274
```
2. build

```cmake
cmake --build build -j4
```

3. run test

```bash
./test.sh
# or `make test`
```

