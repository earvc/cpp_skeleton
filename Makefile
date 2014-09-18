# Directories
IDIR      = inc
SRCDIR    = src
ODIR      = obj
BINDIR    = $(ODIR)/bin
LDIR      = lib

# Compiler config
CC        = g++
CFLAGS    = -Wall -Werror
INCLUDE   = -I$(IDIR)

# Target name
TARGET=test

# Enter .h files in DEPS
_DEPS = test.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

# Enter .o files here
_OBJ = main.o test.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: $(SRCDIR)/%.cpp $(DEPS)
		$(CC) -c -o $@ $< $(CFLAGS) $(INCLUDE)

$(BINDIR)/$(TARGET): $(OBJ)
		$(CC) -o $@ $^ $(CFLAGS) $(INCLUDE)

.PHONY: clean

clean:
		rm -rf $(ODIR)/*.o $(TARGET) $(ODIR)

$(shell   mkdir -p $(ODIR))
$(shell   mkdir -p $(BINDIR))