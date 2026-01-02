.PHONY: all clean paper mechanization

all : paper mechanization

clean :
	cd paper ; make clean
	cd mechanization ; make clean

paper :
	cd paper ; make pdf

mechanization :
	cd mechanization ; make all