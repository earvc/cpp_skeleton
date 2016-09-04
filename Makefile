# Directories
IDIR      = inc
SRCDIR    = src
ODIR      = obj
BINDIR    = $(ODIR)/bin
LDIR      = lib

# Compiler config
CC        = g++
CFLAGS    = -Wall -Werror -std=c++11
INCLUDE   = -I$(IDIR)

# Target name
TARGET=main

# Enter .h files in DEPS
_DEPS = 
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

# Enter .o files here
_OBJ = main.o 
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
