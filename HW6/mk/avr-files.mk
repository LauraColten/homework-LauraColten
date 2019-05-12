# source files
CSRCS	:= $(shell python $(MK)/pyfind.py avr/$(AVRPROJ) .c)
CXXSRCS	:= $(shell python $(MK)/pyfind.py avr/$(AVRPROJ) .cpp)
SSRCS	:= $(shell python $(MK)/pyfind.py avr/$(AVRPROJ) .S)

# required object files
COBJS	:= $(CSRCS:.c=.o)
CXXOBJS	:= $(CXXSRCS:.cpp=.o)
SOBJS	:= $(SSRCS:.S=.o)
OBJS	:= $(COBJS) $(CXXOBJS) $(SOBJS)
LST		:= $(TARGET).lst