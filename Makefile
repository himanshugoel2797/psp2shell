TARGET = psp2shell
OBJS   = main.o draw.o font_data.o

LIBS = -lc_stub -lSceKernel_stub -lSceDisplay_stub -lSceGxm_stub -lSceCtrl_stub

PREFIX  = $(DEVKITARM)/bin/arm-none-eabi
CC      = $(PREFIX)-gcc
READELF = $(PREFIX)-readelf
OBJDUMP = $(PREFIX)-objdump
CFLAGS  = -Wall -specs=$(PSP2SDK)/psp2.specs -I$(DEVKITARM)/include -L$(PSP2SDK)/lib
ASFLAGS = $(CFLAGS)

all: clean VHL.o $(TARGET)_fixup.elf

%_fixup.elf: %.elf
	psp2-fixup -q -S $< $@

$(TARGET).elf: $(OBJS)
	$(CC) $(CFLAGS) VHL_HEAD.o VHL_NIDS.o VHL_load_hbrew.o VHL_start_hbrew.o $^ $(LIBS) -o $@


VHL.o:
	$(CC) -DHEAD -c VHL.S -o VHL_HEAD.o
	$(CC) -DNIDS -c VHL.S -o VHL_NIDS.o
	$(CC) -DFUNC=0x00000001 -c VHL.S -o VHL_load_hbrew.o
	$(CC) -DFUNC=0x00000002 -c VHL.S -o VHL_start_hbrew.o

clean:
	@rm -rf $(TARGET)_fixup.elf $(TARGET).elf $(OBJS) VHL_HEAD.o VHL_NIDS.o VHL_load_hbrew.o VHL_start_hbrew.o
