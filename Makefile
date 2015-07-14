TARGET = psp2shell
OBJS   = main.o draw.o font_data.o

LIBS = -lc_stub -lSceKernel_stub -lSceDisplay_stub -lSceGxm_stub -lSceCtrl_stub -lSceAppMgr_stub -lvhl_stub

PREFIX  = arm-none-eabi
CC      = $(PREFIX)-gcc
READELF = $(PREFIX)-readelf
OBJDUMP = $(PREFIX)-objdump
CFLAGS  = -Wall -specs=psp2.specs
ASFLAGS = $(CFLAGS)

all: clean $(TARGET).elf

%.elf: %_n.elf
	psp2-fixup -q -S $< $@

$(TARGET)_n.elf: $(OBJS)
	$(CC) $(CFLAGS) $^ $(LIBS) -o $@

clean:
	@rm -rf $(TARGET)_n.elf $(TARGET).elf $(OBJS)
