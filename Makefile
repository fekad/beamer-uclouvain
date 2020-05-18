MAKEFLAGS  	:= -j 1
SOURCE_DIR   = style
SOURCE_FILES = beamerthemeuclouvain.sty $(notdir $(wildcard $(SOURCE_DIR)/UCLouvain_logo_*.pdf))

DEST_DIR    ?= $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR  = $(DEST_DIR)/tex/latex/uclouvain


.PHONY: install uninstall

install:
	@echo "Installing the style into: $(INSTALL_DIR)"
	@mkdir -p $(INSTALL_DIR)
	@cp $(addprefix $(SOURCE_DIR)/, $(SOURCE_FILES)) $(INSTALL_DIR)


uninstall:
	@echo "Removing: $(INSTALL_DIR)"
	@rm -f $(addprefix $(INSTALL_DIR)/, $(SOURCE_FILES))
	@rmdir $(INSTALL_DIR)
