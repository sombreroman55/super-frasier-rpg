TARGET := super-frasier.smc
CONFIG := frasier.cfg
ASSEMBLER := /home/droo/sources/cc65/bin/ca65
LINKER := /home/droo/sources/cc65/bin/ld65
SNES := /home/droo/sources/bsnes-plus/bsnes/out/bsnes
OBJDIR := obj
INCDIR := include
SRCDIR := src
SRCS := $(wildcard src/*.s)
OBJS := $(SRCS:$(SRCDIR)/%.s=$(OBJDIR)/%.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LINKER) -C $(CONFIG) $< -o $(TARGET)

$(OBJS): $(OBJDIR)/%.o: $(SRCDIR)/%.s
	$(ASSEMBLER) -I$(INCDIR) $< -o $@

.PHONY: run clean
run:
	$(SNES) $(TARGET)

clean:
	rm -rf obj/*.o
