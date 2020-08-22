COLLAPSE_BUTTON_ENABLED?=0

CFLAGS?=  -Os -std=c11 #-g
CFLAGS+=  -Wall -Werror -DCOLLAPSE_BUTTON_ENABLED=$(COLLAPSE_BUTTON_ENABLED)

CFLAGS+=  -I/usr/include/X11
LDFLAGS+= -L/usr/lib/X11
LDLIBS+=  -lX11 -lXext

PROG= classic-wm
SRCS= main.c decorations.c pool.c
OBJS= $(SRCS:.c=.o)

$(PROG): $(OBJS)
	$(CC) $(LDFLAGS) $(LDLIBS) -o $@ $(OBJS)
	echo "$(CC) $(CFLAGS) $(LDFLAGS) $(LDLIBS) -o $@ $(OBJS)"

clean:
	rm -f $(PROG) $(OBJS)

.PHONY: clean


install:
	sudo cp classic-wm /usr/local/bin/
