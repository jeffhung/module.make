# module.make - manage makefile modules like npm

## Install

Copy the `module.make` file into the same folder with your primary makefile.

Or download with [curl](http://curl.haxx.se/) directly:

```console
curl -L -o module.make https://bit.ly/module-make
```

Or with [wget](https://www.gnu.org/software/wget/):

```console
wget --content-disposition https://bit.ly/module-make
```

## Usage

In your primary makefile, add the following lines to install [`jeffhung/python.make`](http://github.com/jeffhung/python.make) via `module.make`.

```make
.PHONY: all
all:

include module.make
include $(call module,jeffhung/python.make)
```

Or if you want to customize the file name:

```make
include $(call module,jeffhung/python.make,python2.make)
```

Or the url to the file directly:

```make
include $(call module,https://raw.githubusercontent.com/jeffhung/python.make/master/python.make)
```

Or if the file is hosted in somewhere else other than github:

```make
include $(call module,https://bit.ly/python-make,python.make)
```

When running `make`, `python.make` will be downloaded automatically only in first time.

```console
$ make
Downloading python.make...
######################################################################## 100.0%
make: Nothing to be done for `all'.

$ make
make: Nothing to be done for `all'.
```

