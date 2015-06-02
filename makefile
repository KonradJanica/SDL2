PLATFORM := $(shell uname)

KNOWN_PLATFORM = 0

ifneq (, $(findstring CYGWIN, $(PLATFORM)))
	KNOWN_PLATFORM = 1
	SUDO =
endif

ifneq (, $(findstring Linux, $(PLATFORM)))
	KNOWN_PLATFORM = 1
	SUDO = sudo
endif

nothing:
	@echo Please specify all, SDL2, or SDL2_mixer

all:
ifeq ($(KNOWN_PLATFORM),1)
	# build SDL2
	cd SDL; mkdir build; cd build; make clean; ../configure; make; $(SUDO) make install
	# build SDL2_mixer
	cd SDL_mixer; ./autogen.sh; make clean; ./configure; make; $(SUDO) make install
endif
ifeq ($(KNOWN_PLATFORM),1)
	@echo Unknown Platform
endif

SDL2:
ifeq ($(KNOWN_PLATFORM),1)
	# build SDL2
	cd SDL; mkdir build; cd build; make clean; ../configure; make; $(SUDO) make install
endif
ifeq ($(KNOWN_PLATFORM),1)
	@echo Unknown Platform
endif

SDL2_mixer:
ifeq ($(KNOWN_PLATFORM),1)
	# build SDL2_mixer
	cd SDL_mixer; ./autogen.sh; make clean; ./configure; make; $(SUDO) make install
endif
ifeq ($(KNOWN_PLATFORM),1)
	@echo Unknown Platform
endif
