CMDSEP = ;

PWD = $(shell pwd)

# Prefixes
SCRIPTS_PREFIX ?= /usr
UDEV_PREFIX ?=

# Scripts
SCRIPTS_FOLDER=scripts
SCRIPTS_FULL_NAME := $(shell cd $(SCRIPTS_FOLDER) && find . -type f)

# Strip off a leading ./
SCRIPTS=$(SCRIPTS_FULL_NAME:./%=%)

# Scripts
UDEV_FOLDER=udev
UDEV_FULL_NAME := $(shell cd $(UDEV_FOLDER) && find . -type f)

# Strip off a leading ./
UDEV=$(UDEV_FULL_NAME:./%=%)

.PHONY: all clean mrproper install uninstall

all:

install:
	$(foreach script,$(SCRIPTS),mkdir -p $(dir ${SCRIPTS_PREFIX}/$(script)) $(CMDSEP))
	$(foreach script,$(SCRIPTS),cp --preserve=mode $(SCRIPTS_FOLDER)/$(script) ${SCRIPTS_PREFIX}/$(script) $(CMDSEP))
	$(foreach script,$(UDEV),mkdir -p $(dir ${UDEV_PREFIX}/$(script)) $(CMDSEP))
	$(foreach script,$(UDEV),cp --preserve=mode $(UDEV_FOLDER)/$(script) ${UDEV_PREFIX}/$(script) $(CMDSEP))

uninstall:
	$(foreach script,$(SCRIPTS),rm -f ${SCRIPTS_PREFIX}/$(script) $(CMDSEP))
	$(foreach udev,$(UDEV),rm -f ${UDEV_PREFIX}/$(udev) $(CMDSEP))

realuninstall: uninstall

clean:

realclean: clean

distclean: realclean realuninstall

mrproper: clean

