CC=gcc
OBJ=main.o enigma.o
LINKOBJ=main.o enigma.o
BIN=prog

CFLAGS=-m32 -Wall
$CBIN: $(OBJ)
	$(CC) $(LINKOBJ) $(CFLAGS) -o $(BIN)

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

enigma.o: enigma.asm
	nasm -f elf enigma.asm

clean:
	rm enigma.o main.o
	rm $(BIN)
