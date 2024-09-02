CC=gcc
LD=ar

CCFLAGS = -g -c -Wall
LDFLAGS = rcs

SRC = $(wildcard src/*.c)
OBJ = $(SRC:src/%.c=bin/obj/%.o)
HDR = $(wildcard src/*.h)

LIB = bin/libosp.a

$(LIB): $(OBJ)
	$(LD) $(LDFLAGS) $@ $(OBJ) 

bin/obj/%.o: src/%.c $(HDR)
	$(CC) $(CCFLAGS) -o $@ $<

install: $(LIB) $(HDR)
	cp $(LIB) /usr/lib/libosp.a
	mkdir -p /usr/include/osp
	cp $(HDR) /usr/include/osp
