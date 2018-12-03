TARGET_LIB = libcalc.so
LDFLAGS = -shared
LIBS_PATH = libs
RUNTIME_PATH = -Wl,-rpath,${LIBS_PATH}
LIBS = -L${LIBS_PATH} -lcalc ${RUNTIME_PATH}

CFLAGS = -g -Wall -fPIC
CC = g++
RM = /bin/rm -f

SRC = addsub.cpp mul.cpp main.cpp
OBJ = ${SRC:.cpp=.o}

.PHONY: all

all: ${TARGET_LIB} main

%.o: %.cpp
	${CC} ${CFLAGS} -c $< -o $@

${TARGET_LIB} : addsub.o mul.o
	mkdir -p ${LIBS_PATH}
	${CC} ${LDFLAGS} -o ${LIBS_PATH}/$@ $^

main : main.o
	${CC} -o $@ $^ ${LIBS}

.PHONY: clean

clean:
	${RM} *.o main ${LIBS_PATH}/${TARGET_LIB}

.PHONY: re

re: clean all
