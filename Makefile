# Project:   BeebIt


# Toolflags:

#Standard tools
#Linkflags =Link -aif -o $@
ObjAsmflags = -depend !Depend -ThrowBack -Stamp -quit -CloseExec -apcs 3/32bit
CMHGflags = 
LibFileflags = -c -o $@
Squeezeflags = -o $@

#Uncoment for Norcroft with DDT debugging
#CCflags = CC -c -depend !Depend -IC: -throwback -apcs3/26bits -g
#Linkflags =Link -aif -D -o $@ $(stubs)
#stubs = C:o.stubs

#Uncoment for Norcroft
CCflags = CC -c -depend !Depend -IC: -throwback -apcs 3/32bit
Linkflags =Link -aif -o $@ $(stubs)
stubs = C:o.stubs

#Uncoment for GCC
#CCflags = GCC -c -mapcs-32 -mfpe=3 -mthrowback -mamu 
#Linkflags =GCC -aif -o $@

#Uncoment for LCC
#CCflags = LCC -c 
#Linkflags =GCC -aif -o $@


# Final targets:
all: @.!RunImage @.RipROMs

RunImage = @.o.main @.o.beebit \
  @.o.6502cpu @.o.6502cpu!! @.o.6502opc07 @.o.6502opc07s \
  @.o.65c12cpu @.o.65c12cpu!! \
  @.o.6522sysvia @.o.6522usrvia @.o.6845crtc @.o.6850acia \
  @.o.76489sound @.o.tube @.o.host @.o.hosts \
  @.o.8271fdc @.o.1770fdc @.o.adc @.o.keyboard @.o.sheila  \
  @.o.scrmode @.o.video @.o.videoscale @.o.videoula @.o.riscos \
  @.o.riscosvid1 @.o.riscosvid2 @.o.riscosvid3 @.o.riscosvid4 \
  @.o.scrsave @.o.snapshots
RipRoms = @.o.RipROMs

# $@ name of target ie o.main
# $* target without extension ie o.main = main
# $< list of inferred prequisites
# $? list of prequisites with respect to which target is out of date??

.suffixes: .o .c .cmhg .s

.c.o:
	$(CCFlags) -o $@ $<
.s.o:
	objasm $(ObjAsmflags) -from $< -to $@
.cmhg.o:
	cmhg $(CMHGflags) $< -o $@ -d h.$*

@.!RunImage: $(RunImage)
	  $(linkflags) $(RunImage)

@.RipROMs: $(RipROMs)
	  $(linkflags) $(RipROMs)

# User-editable dependencies:

# Static dependencies:

# Dynamic dependencies:
o.main:	c.main
o.main:	h.beebit
o.main:	h.host
o.main:	h.hostmap
o.main:	h.6502zmap
o.main:	h.6850acia
o.main:	h.8271fdc
o.main:	h.main
o.main:	h.sheila
o.main:	h.swis
o.main:	C:h.kernel
o.main:	h.riscos
o.main:	h.scrmode
o.main:	h.scrsave
o.main:	h.snapshots
o.main:	h.video
o.main:	h.videoscale
o.beebit:	c.beebit
o.beebit:	h.beebit
o.beebit:	h.host
o.beebit:	h.hostmap
o.beebit:	h.6502zmap
o.beebit:	h.1770fdc
o.beebit:	h.8271fdc
o.beebit:	h.6845crtc
o.beebit:	h.6850acia
o.beebit:	h.adc
o.beebit:	C:h.kernel
o.beebit:	h.keyboard
o.beebit:	h.main
o.beebit:	h.riscos
o.beebit:	h.scrmode
o.beebit:	h.scrsave
o.beebit:	h.sheila
o.beebit:	h.swis
o.beebit:	h.video
o.6502cpu:	c.6502cpu
o.6502cpu:	h.beebit
o.6502cpu:	h.6502cpu
o.6502cpu:	h.6502cmap
o.6502cpu:	h.6502zmap
o.6502cpu!!: s.6502cpu!!
o.6502cpu!!: h.6502zmaps
o.6502cpu!!: h.6502cmaps
o.6502cpu!!: h.6502cpus
o.6502cpu!!: h.RegNames
o.6502opc07:	c.6502opc07
o.6502opc07:	h.beebit
o.6502opc07:	h.hostmap
o.6502opc07:	h.6502zmap
o.6502opc07:	h.6502cpu
o.6502opc07:	h.6502cmap
o.6502opc07:	h.6502zmap
o.6502opc07:	h.main
o.6502opc07:	h.riscos
o.6502opc07:	h.swis
o.6502opc07:	C:h.kernel
o.6502opc07s: s.6502opc07s
o.6502opc07s: h.6502zmaps
o.6502opc07s: h.6502cmaps
o.6502opc07s: h.6502cpus
o.6502opc07s: h.hostmaps
o.6502opc07s: h.RegNames
o.6502opc07s: h.SWInames
o.65c12cpu:	c.65c12cpu
o.65c12cpu:	h.beebit
o.65c12cpu:	h.6502cpu
o.65c12cpu:	h.6502cmap
o.65c12cpu:	h.6502zmap
o.65c12cpu!!: s.65c12cpu!!
o.65c12cpu!!: h.6502zmaps
o.65c12cpu!!: h.6502cmaps
o.65c12cpu!!: h.6502cpus
o.65c12cpu!!: h.RegNames
o.6522sysvia:	c.6522sysvia
o.6522sysvia:	h.beebit
o.6522sysvia:	h.host
o.6522sysvia:	h.hostmap
o.6522sysvia:	h.6502zmap
o.6522sysvia:	h.6522sysvia
o.6522sysvia:	h.keyboard
o.6522sysvia:	h.main
o.6522sysvia:	h.riscos
o.6522sysvia:	C:h.kernel
o.6522sysvia:	h.swis
o.6522usrvia:	c.6522usrvia
o.6522usrvia:	h.beebit
o.6522usrvia:	h.host
o.6522usrvia:	h.hostmap
o.6522usrvia:	h.6502zmap
o.6522usrvia:	h.6522usrvia
o.6522usrvia:	h.main
o.6522usrvia:	h.keyboard
o.6522usrvia:	h.riscos
o.6522usrvia:	C:h.kernel
o.6522usrvia:	h.swis
o.6845crtc:	c.6845crtc
o.6845crtc:	h.beebit
o.6845crtc:	h.host
o.6845crtc:	h.hostmap
o.6845crtc:	h.6502zmap
o.6845crtc:	h.6845crtc
o.6845crtc:	h.main
o.6845crtc:	h.video
o.6845crtc:	h.videoula
o.6845crtc:	h.riscos
o.6850acia:	c.6850acia
o.6850acia:	h.beebit
o.6850acia:	h.host
o.6850acia:	h.hostmap
o.6850acia:	h.6502zmap
o.6850acia:	h.6850acia
o.6850acia:	C:h.kernel
o.6850acia:	h.main
o.6850acia:	h.swis
o.76489sound:	c.76489sound
o.76489sound:	h.beebit
o.76489sound:	h.riscos
o.76489sound:	h.76489sound
o.76489sound:	C:h.kernel
o.76489sound:	h.swis
o.tube:	c.tube
o.tube:	h.beebit
o.tube:	C:h.kernel
o.host:	c.host
o.host:	h.beebit
o.host:	h.host
o.host:	h.hostmap
o.host:	h.6502zmap
o.host:	h.6502cpu
o.host:	h.6502cmap
o.host:	h.6502zmap
o.host:	h.sheila
o.host:	h.1770fdc
o.host:	h.6522sysvia
o.host:	h.6522usrvia
o.host:	h.6845crtc
o.host:	h.6850acia
o.host:	h.76489sound
o.host:	h.8271fdc
o.host:	h.adc
o.host:	h.keyboard
o.host:	h.video
o.host:	h.videoula
o.host:	C:h.kernel
o.host:	h.swis
o.hosts: s.hosts
o.hosts: h.6502zmaps
o.hosts: h.6502cmaps
o.hosts: h.6502cpus
o.hosts: h.hostmaps
o.hosts: h.hosts
o.hosts: h.RegNames
o.hosts: h.SWInames
o.8271fdc:	c.8271fdc
o.8271fdc:	h.beebit
o.8271fdc:	h.host
o.8271fdc:	h.hostmap
o.8271fdc:	h.6502zmap
o.8271fdc:	h.8271fdc
o.8271fdc:	h.riscos
o.8271fdc:	h.keyboard
o.1770fdc:	c.1770fdc
o.1770fdc:	h.beebit
o.1770fdc:	h.host
o.1770fdc:	h.hostmap
o.1770fdc:	h.6502zmap
o.1770fdc:	h.1770fdc
o.1770fdc:	h.riscos
o.1770fdc:	C:h.kernel
o.1770fdc:	h.keyboard
o.1770fdc:	h.swis
o.adc:	c.adc
o.adc:	h.beebit
o.adc:	h.host
o.adc:	h.hostmap
o.adc:	h.6502zmap
o.adc:	h.6522sysvia
o.adc:	h.adc
o.adc:	C:h.kernel
o.adc:	h.swis
o.keyboard:	c.keyboard
o.keyboard:	h.beebit
o.keyboard:	h.hostmap
o.keyboard:	h.6502zmap
o.keyboard:	h.6522sysvia
o.keyboard:	C:h.kernel
o.keyboard:	h.riscos
o.keyboard:	h.swis
o.sheila:	c.sheila
o.sheila:	h.beebit
o.sheila:	h.host
o.sheila:	h.hostmap
o.sheila:	h.6502zmap
o.sheila:	h.6502cpu
o.sheila:	h.6502cmap
o.sheila:	h.6502zmap
o.sheila:	h.sheila
o.sheila:	h.6522sysvia
o.sheila:	h.6522usrvia
o.sheila:	h.6845crtc
o.sheila:	h.6850acia
o.sheila:	h.8271fdc
o.sheila:	h.adc
o.sheila:	h.main
o.sheila:	h.riscos
o.sheila:	h.tube
o.sheila:	h.videoula
o.sheila:	h.1770fdc
o.scrmode:	c.scrmode
o.scrmode:	h.main
o.scrmode:	C:h.kernel
o.scrmode:	h.swis
o.scrmode:	h.scrmode
o.scrmode:	h.videoscale
o.video:	c.video
o.video:	h.beebit
o.video:	h.host
o.video:	h.hostmap
o.video:	h.6502zmap
o.video:	C:h.kernel
o.video:	h.main
o.video:	h.riscos
o.video:	h.scrmode
o.video:	h.swis
o.video:	h.6502cmap
o.video:	h.6502zmap
o.video:	h.6502cpu
o.video:	h.6502cmap
o.video:	h.6522sysvia
o.video:	h.6845crtc
o.video:	h.video
o.video:	h.videoscale
o.video:	h.videoula
o.video:	h.adc
o.videoscale:	c.videoscale
o.videoscale:	h.beebit
o.videoscale:	h.hostmap
o.videoscale:	h.6502zmap
o.videoscale:	C:h.kernel
o.videoscale:	h.riscos
o.videoscale:	h.swis
o.videoscale:	h.video
o.videoscale:	h.videoscale
o.videoscale:	h.videoula
o.videoula:	c.videoula
o.videoula:	h.beebit
o.videoula:	h.host
o.videoula:	h.hostmap
o.videoula:	h.6502zmap
o.videoula:	h.6522sysvia
o.videoula:	h.6845crtc
o.videoula:	C:h.kernel
o.videoula:	h.main
o.videoula:	h.riscos
o.videoula:	h.scrmode
o.videoula:	h.swis
o.videoula:	h.adc
o.videoula:	h.video
o.riscos: s.riscos
o.riscos: h.6502zmaps
o.riscos: h.6502cmaps
o.riscos: h.6502cpus
o.riscos: h.hostmaps
o.riscos: h.RegNames
o.riscos: h.SWInames
o.riscosvid1: s.riscosvid1
o.riscosvid1: h.6502zmaps
o.riscosvid1: h.hostmaps
o.riscosvid1: h.RegNames
o.riscosvid1: h.SWInames
o.riscosvid2: s.riscosvid2
o.riscosvid2: h.6502zmaps
o.riscosvid2: h.hostmaps
o.riscosvid2: h.RegNames
o.riscosvid2: h.SWInames
o.riscosvid3: s.riscosvid3
o.riscosvid3: h.RegNames
o.riscosvid3: h.SWInames
o.riscosvid4: s.riscosvid4
o.riscosvid4: h.RegNames
o.riscosvid4: h.SWInames
o.scrsave:	c.scrsave
o.scrsave:	h.beebit
o.scrsave:	h.hostmap
o.scrsave:	h.6502zmap
o.scrsave:	h.main
o.scrsave:	h.swis
o.scrsave:	C:h.kernel
o.scrsave:	h.video
o.snapshots:	c.snapshots
o.snapshots:	h.beebit
o.snapshots:	h.host
o.snapshots:	h.hostmap
o.snapshots:	h.6502zmap
o.snapshots:	h.snapshots
o.snapshots:	h.6502cpu
o.snapshots:	h.6502cmap
o.snapshots:	h.6502zmap
o.snapshots:	h.6522sysvia
o.snapshots:	h.6522usrvia
o.snapshots:	h.video
o.snapshots:	h.6845crtc
o.snapshots:	h.videoula
o.snapshots:	h.sheila
o.RipROMs:	c.RipROMs
o.RipROMs:	C:h.kernel
o.RipROMs:	h.swis
