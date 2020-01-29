IDIR =./include
CC=gcc -g
CFLAGS=-I$(IDIR)

ODIR=obj
LDIR =../lib

_DEPS = assist.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = assist-server.o communication.o services.o services-utilities.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -g -Wall -Wextra -c -o $@ $< $(CFLAGS)

assist-server: $(OBJ)
	$(CC) -g -Wall -Wextra -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ assist-server