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
  @.o.6502cpu @.o.6502cpu!! @.o.6502cpu01 @.o.6502cpu23 \
  @.o.6502cpu45 @.o.6502cpu67 @.o.6502cpu89 @.o.6502cpuAB \
  @.o.6502cpuCD @.o.6502cpuEF @.o.6502opc07 @.o.6502opc07s \
  @.o.65c12cpu @.o.65c12cpu!! @.o.65c12cpu01 @.o.65c12cpu23 \
  @.o.65c12cpu45 @.o.65c12cpu67 @.o.65c12cpu89 \
  @.o.65c12cpuCD @.o.65c12cpuEF \
  @.o.6522sysvia @.o.6522usrvia @.o.6845crtc @.o.6850acia \
  @.o.76489sound @.o.tube @.o.hostmap @.o.hostmaps \
  @.o.8271fdc @.o.1770fdc @.o.adc @.o.keyboard @.o.sheila  \
  @.o.video @.o.videoscale @.o.videoula \
	@.o.videobuf @.o.videoout @.o.videoread \
  @.o.riscos @.o.riscoskey \
  @.o.scrmode @.o.scrsave @.o.snapshots
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
o.main:	h.hostmap
o.main:	h.6502zmap
o.main:	h.6850acia
o.main:	h.8271fdc
o.main:	h.main
o.main:	h.beebit
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
o.beebit:	h.hostmap
o.beebit:	h.6502zmap
o.beebit:	h.1770fdc
o.beebit:	h.8271fdc
o.beebit:	h.6845crtc
o.beebit:	h.6850acia
o.beebit:	h.adc
o.beebit:	h.beebit
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
o.6502cpu:	h.6502cpu
o.6502cpu:	h.6502cmap
o.6502cpu:	h.6502zmap
o.6502cpu:	h.beebit
o.6502cpu!!: s.6502cpu!!
o.6502cpu!!: h.6502zmaps
o.6502cpu!!: h.6502cmaps
o.6502cpu!!: h.6502cpus
o.6502cpu!!: h.RegNames
o.6502cpu01: s.6502cpu01
o.6502cpu01: h.6502zmaps
o.6502cpu01: h.6502cmaps
o.6502cpu01: h.6502cpus
o.6502cpu01: h.RegNames
o.6502cpu23: s.6502cpu23
o.6502cpu23: h.6502zmaps
o.6502cpu23: h.6502cmaps
o.6502cpu23: h.6502cpus
o.6502cpu23: h.RegNames
o.6502cpu45: s.6502cpu45
o.6502cpu45: h.6502zmaps
o.6502cpu45: h.6502cmaps
o.6502cpu45: h.6502cpus
o.6502cpu45: h.RegNames
o.6502cpu67: s.6502cpu67
o.6502cpu67: h.6502zmaps
o.6502cpu67: h.6502cmaps
o.6502cpu67: h.6502cpus
o.6502cpu67: h.RegNames
o.6502cpu89: s.6502cpu89
o.6502cpu89: h.6502zmaps
o.6502cpu89: h.6502cmaps
o.6502cpu89: h.6502cpus
o.6502cpu89: h.RegNames
o.6502cpuAB: s.6502cpuAB
o.6502cpuAB: h.6502zmaps
o.6502cpuAB: h.6502cmaps
o.6502cpuAB: h.6502cpus
o.6502cpuAB: h.RegNames
o.6502cpuCD: s.6502cpuCD
o.6502cpuCD: h.6502zmaps
o.6502cpuCD: h.6502cmaps
o.6502cpuCD: h.6502cpus
o.6502cpuCD: h.RegNames
o.6502cpuEF: s.6502cpuEF
o.6502cpuEF: h.6502zmaps
o.6502cpuEF: h.6502cmaps
o.6502cpuEF: h.6502cpus
o.6502cpuEF: h.RegNames
o.6502opc07:	c.6502opc07
o.6502opc07:	h.hostmap
o.6502opc07:	h.6502zmap
o.6502opc07:	h.6502cpu
o.6502opc07:	h.6502cmap
o.6502opc07:	h.6502zmap
o.6502opc07:	h.beebit
o.6502opc07:	h.main
o.6502opc07:	h.riscos
o.6502opc07:	h.swis
o.6502opc07:	C:h.kernel
o.6502opc07s: s.6502opc07s
o.6502opc07s: h.6502zmaps
o.6502opc07s: h.hostmaps
o.6502opc07s: h.6502cmaps
o.6502opc07s: h.6502cpus
o.6502opc07s: h.RegNames
o.6502opc07s: h.SWInames
o.65c12cpu:	c.65c12cpu
o.65c12cpu:	h.6502cpu
o.65c12cpu:	h.6502cmap
o.65c12cpu:	h.6502zmap
o.65c12cpu:	h.beebit
o.65c12cpu!!: s.65c12cpu!!
o.65c12cpu!!: h.6502zmaps
o.65c12cpu!!: h.6502cmaps
o.65c12cpu!!: h.6502cpus
o.65c12cpu!!: h.RegNames
o.65c12cpu01: s.65c12cpu01
o.65c12cpu01: h.6502zmaps
o.65c12cpu01: h.6502cmaps
o.65c12cpu01: h.6502cpus
o.65c12cpu01: h.RegNames
o.65c12cpu23: s.65c12cpu23
o.65c12cpu23: h.6502zmaps
o.65c12cpu23: h.6502cmaps
o.65c12cpu23: h.6502cpus
o.65c12cpu23: h.RegNames
o.65c12cpu45: s.65c12cpu45
o.65c12cpu45: h.6502zmaps
o.65c12cpu45: h.6502cmaps
o.65c12cpu45: h.6502cpus
o.65c12cpu45: h.RegNames
o.65c12cpu67: s.65c12cpu67
o.65c12cpu67: h.6502zmaps
o.65c12cpu67: h.6502cmaps
o.65c12cpu67: h.6502cpus
o.65c12cpu67: h.RegNames
o.65c12cpu89: s.65c12cpu89
o.65c12cpu89: h.6502zmaps
o.65c12cpu89: h.6502cmaps
o.65c12cpu89: h.6502cpus
o.65c12cpu89: h.RegNames
o.65c12cpuCD: s.65c12cpuCD
o.65c12cpuCD: h.6502zmaps
o.65c12cpuCD: h.6502cmaps
o.65c12cpuCD: h.6502cpus
o.65c12cpuCD: h.RegNames
o.65c12cpuEF: s.65c12cpuEF
o.65c12cpuEF: h.6502zmaps
o.65c12cpuEF: h.6502cmaps
o.65c12cpuEF: h.6502cpus
o.65c12cpuEF: h.RegNames
o.6522sysvia:	c.6522sysvia
o.6522sysvia:	h.hostmap
o.6522sysvia:	h.6502zmap
o.6522sysvia:	h.6502cpu
o.6522sysvia:	h.6502cmap
o.6522sysvia:	h.6502zmap
o.6522sysvia:	h.video
o.6522sysvia:	h.6522sysvia
o.6522sysvia:	h.beebit
o.6522sysvia:	C:h.kernel
o.6522sysvia:	h.keyboard
o.6522sysvia:	h.main
o.6522sysvia:	h.riscos
o.6522sysvia:	h.swis
o.6522usrvia:	c.6522usrvia
o.6522usrvia:	h.hostmap
o.6522usrvia:	h.6502zmap
o.6522usrvia:	h.6502cpu
o.6522usrvia:	h.6502cmap
o.6522usrvia:	h.6502zmap
o.6522usrvia:	h.6522usrvia
o.6522usrvia:	h.beebit
o.6522usrvia:	h.main
o.6522usrvia:	C:h.kernel
o.6522usrvia:	h.keyboard
o.6522usrvia:	h.swis
o.6522usrvia:	h.riscos
o.6845crtc:	c.6845crtc
o.6845crtc:	h.hostmap
o.6845crtc:	h.6502zmap
o.6845crtc:	h.6845crtc
o.6845crtc:	h.beebit
o.6845crtc:	h.video
o.6850acia:	c.6850acia
o.6850acia:	h.hostmap
o.6850acia:	h.6502zmap
o.6850acia:	h.6502cpu
o.6850acia:	h.6502cmap
o.6850acia:	h.6502zmap
o.6850acia:	h.6850acia
o.6850acia:	h.beebit
o.6850acia:	C:h.kernel
o.6850acia:	h.main
o.6850acia:	h.swis
o.76489sound:	c.76489sound
o.76489sound:	h.beebit
o.76489sound:	C:h.kernel
o.76489sound:	h.riscos
o.76489sound:	h.76489sound
o.76489sound:	h.swis
o.tube:	c.tube
o.tube:	h.beebit
o.tube:	C:h.kernel
o.hostmap:	c.hostmap
o.hostmap:	h.hostmap
o.hostmap:	h.6502zmap
o.hostmap:	h.6502cpu
o.hostmap:	h.6502cmap
o.hostmap:	h.6502zmap
o.hostmap:	h.sheila
o.hostmap:	h.1770fdc
o.hostmap:	h.6522sysvia
o.hostmap:	h.6522usrvia
o.hostmap:	h.6845crtc
o.hostmap:	h.6850acia
o.hostmap:	h.76489sound
o.hostmap:	h.8271fdc
o.hostmap:	h.adc
o.hostmap:	h.keyboard
o.hostmap:	h.video
o.hostmap:	h.videoula
o.hostmap:	h.beebit
o.hostmaps: s.hostmaps
o.hostmaps: h.6502zmaps
o.hostmaps: h.hostmaps
o.hostmaps: h.6502cmaps
o.hostmaps: h.6502cpus
o.hostmaps: h.RegNames
o.hostmaps: h.SWInames
o.8271fdc:	c.8271fdc
o.8271fdc:	h.hostmap
o.8271fdc:	h.6502zmap
o.8271fdc:	h.6502cpu
o.8271fdc:	h.6502cmap
o.8271fdc:	h.6502zmap
o.8271fdc:	h.8271fdc
o.8271fdc:	h.beebit
o.8271fdc:	h.riscos
o.8271fdc:	h.keyboard
o.1770fdc:	c.1770fdc
o.1770fdc:	h.hostmap
o.1770fdc:	h.6502zmap
o.1770fdc:	h.6502cpu
o.1770fdc:	h.6502cmap
o.1770fdc:	h.6502zmap
o.1770fdc:	h.1770fdc
o.1770fdc:	h.beebit
o.1770fdc:	h.riscos
o.1770fdc:	C:h.kernel
o.1770fdc:	h.keyboard
o.1770fdc:	h.swis
o.adc:	c.adc
o.adc:	h.hostmap
o.adc:	h.6502zmap
o.adc:	h.6522sysvia
o.adc:	h.adc
o.adc:	h.beebit
o.adc:	C:h.kernel
o.adc:	h.swis
o.keyboard:	c.keyboard
o.keyboard:	h.hostmap
o.keyboard:	h.6502zmap
o.keyboard:	h.beebit
o.keyboard:	h.riscos
o.keyboard:	h.6522sysvia
o.keyboard:	h.keyboard
o.sheila:	c.sheila
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
o.sheila:	h.beebit
o.sheila:	h.main
o.sheila:	h.riscos
o.sheila:	h.tube
o.sheila:	h.video
o.sheila:	h.videoula
o.sheila:	h.1770fdc
o.video:	c.video
o.video:	h.hostmap
o.video:	h.6502zmap
o.video:	h.beebit
o.video:	C:h.kernel
o.video:	h.main
o.video:	h.riscos
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
o.videoscale:	c.videoscale
o.videoscale:	h.hostmap
o.videoscale:	h.6502zmap
o.videoscale:	h.beebit
o.videoscale:	C:h.kernel
o.videoscale:	h.riscos
o.videoscale:	h.swis
o.videoscale:	h.video
o.videoscale:	h.videoscale
o.videoscale:	h.videoula
o.videoula:	c.videoula
o.videoula:	h.hostmap
o.videoula:	h.6502zmap
o.videoula:	h.videoula
o.videoula:	h.video
o.videoula:	h.sheila
o.videoula:	h.beebit
o.videobuf:	c.videobuf
o.videobuf:	h.hostmap
o.videobuf:	h.6502zmap
o.videobuf:	h.video
o.videobuf:	h.videoscale
o.videoout:	c.videoout
o.videoout:	h.hostmap
o.videoout:	h.6502zmap
o.videoout:	h.videoscale
o.videoread:	c.videoread
o.videoread:	h.hostmap
o.videoread:	h.6502zmap
o.videoread:	h.beebit
o.videoread:	h.video
o.riscos: s.riscos
o.riscos: h.6502zmaps
o.riscos: h.hostmaps
o.riscos: h.6502cmaps
o.riscos: h.RegNames
o.riscos: h.SWInames
o.riscoskey: s.riscoskey
o.riscoskey: h.6502zmaps
o.riscoskey: h.hostmaps
o.riscoskey: h.RegNames
o.riscoskey: h.SWInames
o.scrmode:	c.scrmode
o.scrmode:	h.hostmap
o.scrmode:	h.6502zmap
o.scrmode:	h.beebit
o.scrmode:	h.main
o.scrmode:	C:h.kernel
o.scrmode:	h.swis
o.scrmode:	h.scrmode
o.scrmode:	h.videoscale
o.scrsave:	c.scrsave
o.scrsave:	h.hostmap
o.scrsave:	h.6502zmap
o.scrsave:	h.main
o.scrsave:	h.beebit
o.scrsave:	h.swis
o.scrsave:	C:h.kernel
o.scrsave:	h.video
o.snapshots:	c.snapshots
o.snapshots:	h.hostmap
o.snapshots:	h.6502zmap
o.snapshots:	h.beebit
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
