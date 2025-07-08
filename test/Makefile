# --- Configuration ---
PREFIX := $(HOME)/alpha-cross/tools
TARGET := alpha-linux-gnu
GCC_VER := 12.3.0

CC := $(PREFIX)/bin/$(TARGET)-gcc
AS := $(PREFIX)/bin/$(TARGET)-as
LD := $(PREFIX)/bin/$(TARGET)-ld

CRT_DIR := $(PREFIX)/$(TARGET)/lib
GCC_LIB := $(PREFIX)/lib/gcc/$(TARGET)/$(GCC_VER)

CFLAGS := -Wall
LDFLAGS := -static -e main --oformat ecoff-littlealpha
LD_OBJS := \
	$(CRT_DIR)/crt1.o \
	$(CRT_DIR)/crti.o \
	$(GCC_LIB)/crtbegin.o \
	hello.o \
	-lgcc -lc \
	$(GCC_LIB)/crtend.o \
	$(CRT_DIR)/crtn.o

# --- Targets ---

all: hello.ecoff

hello.s: hello.c
	$(CC) $(CFLAGS) -S hello.c -o hello.s

hello.o: hello.s
	$(AS) -o hello.o hello.s

hello.ecoff: hello.o
	$(LD) $(LDFLAGS) -o hello.ecoff $(LD_OBJS) \
		-L$(CRT_DIR) -L$(GCC_LIB)

clean:
	rm -f hello.s hello.o hello.ecoff

