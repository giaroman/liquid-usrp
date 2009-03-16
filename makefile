#
# USRP tests makefile
#

LDFLAGS	= -lusrp -lliquid

local_src	:=		\
	basic.cc		\
	db_base.cc		\
	dbsrx.cc		\
	flex.cc			\
	lf.cc			\
	tvrx.cc

local_progs	:=		\
	src/usrp_init_test.cc	\
	src/gr_usrp_rx_test.cc

sources		= $(addprefix src/,$(local_src))
objects		= $(patsubst %.cc,%.cc.o,$(sources))
programs	= $(patsubst %.cc,%,$(local_progs))

all: $(programs)

$(objects): %.cc.o : %.cc
	g++ -Wall -g -O2 -c $< -o $@

$(programs): % : %.cc $(objects)
	g++ -Wall -g -O2 $(objects) $(LDFLAGS) $< -o $@

clean:
	$(RM) $(objects)
	$(RM) $(programs)
