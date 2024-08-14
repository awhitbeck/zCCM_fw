VIVADO=
TARGETDIR=$(PWD)
PROJECTDIR=$(TARGETDIR)/../../
GHDL=ghdl
GHDL_WORKDIR=ghdl
GHDLFLAGS=  --ieee=synopsys -fexplicit -frelaxed-rules  --warn-no-library
GHDLRUNFLAGS=

all: syntax import makefiles

clean :
	$(GHDL) --clean $(GHDLFLAGS)

import :
	@echo "============================================================================="
	@echo Setting up surf
	@echo "============================================================================="
	cd $(PROJECTDIR)/submodules/surf/ && make src
	@echo "============================================================================="
	@echo Importing: surf
	@echo "============================================================================="
	$(GHDL) -i $(GHDLFLAGS) --work=surf $(PROJECTDIR)/submodules/surf/build/SRC_VHDL/surf/*
	@echo "============================================================================="
	@echo Importing: ruckus
	@echo "============================================================================="
	$(GHDL) -i $(GHDLFLAGS) --work=ruckus $(PROJECTDIR)/submodules/surf/build/SRC_VHDL/ruckus/*
	@echo "============================================================================="
	@echo Importing: axi-soc-core
	@echo "============================================================================="
	$(GHDL) -i $(GHDLFLAGS) --work=axi_soc_ultra_plus_core $(PROJECTDIR)/submodules/axi-soc-ultra-plus-core/shared/rtl/*
	@echo "============================================================================="
	@echo Importing: unisim
	@echo "============================================================================="
	ghdl -i ${GHDLFLAGS} --work=unisim $(VIVADO)/data/vhdl/src/unisims/*vhd
	@echo "============================================================================="
	@echo Importing: work
	@echo "============================================================================="
	$(GHDL) -i $(GHDLFLAGS) --work=work $(PROJECTDIR)/common/rtl/*
	@echo "============================================================================="


syntax: import
	@echo "============================================================================="
	@echo Syntax Checking:
	@echo "============================================================================="
	$(GHDL) -s $(GHDLFLAGS) --work=work $(TARGETDIR)/rtl/test_kv260.vhd
	$(GHDL) -s $(GHDLFLAGS) --work=work $(PROJECTDIR)/common/rtl/Application.vhd

makefiles: import
	@echo "============================================================================="
	@echo Compiling:
	@echo "============================================================================="
	$(GHDL) -m $(GHDLFLAGS) Application


elaborate: $(ENTITIES)

$(ENTITIES) : import syntax
	$(GHDL) -e $(GHDLFLAGS) $@
