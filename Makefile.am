###############################################################################
## Makefile for Aragonese-Catalan 
###############################################################################

VERSION=0.1.0
LANG1=arg
LANG2=cat

VAR1=#leave empty
VAR2=_valencia_gva
VAR3=_valencia_uni

LANG2C=$(LANG2)$(VAR1)
LANG2V=$(LANG2)$(VAR2)
LANG2U=$(LANG2)$(VAR3)

PREFIX1=$(LANG1)-$(LANG2)
PREFIX1C=$(LANG1)-$(LANG2C)
PREFIX1V=$(LANG1)-$(LANG2V)
PREFIX1U=$(LANG1)-$(LANG2U)

PREFIX2=$(LANG2)-$(LANG1)
PREFIX2C=$(LANG2C)-$(LANG1)
PREFIX2V=$(LANG2V)-$(LANG1)
PREFIX2U=$(LANG2U)-$(LANG1)

BASENAME=apertium-$(PREFIX1)

TARGETS_COMMON =		\
	$(PREFIX1).automorf.bin	\
	$(PREFIX1).prob		\
	$(PREFIX1).rlx.bin	\
	$(PREFIX1C).autobil.bin  \
 	$(PREFIX1V).autobil.bin  \
 	$(PREFIX1U).autobil.bin  \
	$(PREFIX1).autolex.bin	\
	$(PREFIX1C).autogen.bin  \
 	$(PREFIX1V).autogen.bin  \
 	$(PREFIX1U).autogen.bin  \
	$(PREFIX1C).autopgen.bin		\
	$(PREFIX1V).autopgen.bin		\
	$(PREFIX1U).autopgen.bin		\
	$(PREFIX1).t1x.bin	\
	$(PREFIX2).automorf.bin	\
	$(PREFIX2).prob		\
	$(PREFIX2).rlx.bin	\
	$(PREFIX2).autobil.bin	\
	$(PREFIX2).autolex.bin	\
	$(PREFIX2).autogen.bin	\
	$(PREFIX2).autopgen.bin	\
	$(PREFIX2).t1x.bin


# This include defines goals for install-modes, .deps/.d and .mode files:
@ap_include@

###############################################################################
## Monolingual transducers
###############################################################################

# -------------------
# Aragonese analysis:
# -------------------

$(PREFIX1C).automorf.bin: $(AP_SRC1)/$(LANG1).automorf.bin $(PREFIX1C).autobil.bin
	lt-trim $^ $@

$(PREFIX1V).automorf.bin: $(AP_SRC1)/$(LANG1).automorf.bin $(PREFIX1V).autobil.bin
	lt-trim $^ $@

$(PREFIX1U).automorf.bin: $(AP_SRC1)/$(LANG1).automorf.bin $(PREFIX1V).autobil.bin
	lt-trim $^ $@	

# -------------------
# Aragonese generation:
# ---------------------


$(PREFIX2).autogen.bin: $(AP_SRC1)/$(LANG1).autogen.bin
	cp $< $@

$(PREFIX2).autopgen.bin: $(AP_SRC1)/$(LANG1).autopgen.bin
	cp $< $@


# -------------------
# Catalan analysis:
# -------------------

.deps/$(LANG2).automorf.bin: $(AP_SRC2)/$(LANG2).automorf.bin .deps/.d
	cp $< $@

$(PREFIX2).automorf.bin: .deps/$(LANG2).automorf.bin $(PREFIX2).autobil.bin
	lt-trim $^ $@

# -------------------
# Catalan generation:
# ---------------------

$(PREFIX1C).autogen.bin: $(AP_SRC2)/$(LANG2C).autogen.bin
	cp $< $@

$(PREFIX1V).autogen.bin: $(AP_SRC2)/$(LANG2V).autogen.bin
	cp $< $@

$(PREFIX1U).autogen.bin: $(AP_SRC2)/$(LANG2U).autogen.bin
	cp $< $@

$(PREFIX1C).autopgen.bin: $(AP_SRC2)/$(LANG2C).autopgen.bin
	cp $< $@

$(PREFIX1V).autopgen.bin: $(AP_SRC2)/$(LANG2V).autopgen.bin
	cp $< $@

$(PREFIX1U).autopgen.bin: $(AP_SRC2)/$(LANG2U).autopgen.bin
	cp $< $@

###############################################################################
## Tagger models
###############################################################################

$(PREFIX1).prob: $(AP_SRC1)/$(LANG1).prob
	cp $< $@

$(PREFIX2).prob: $(AP_SRC2)/$(LANG2).prob
	cp $< $@

###############################################################################
## Disambiguation rules
###############################################################################

$(PREFIX1).rlx.bin: $(AP_SRC1)/apertium-$(LANG1).$(LANG1).rlx
	cg-comp $< $@

$(PREFIX2).rlx.bin: $(AP_SRC2)/apertium-$(LANG2).$(LANG2).rlx
	cg-comp $< $@

###############################################################################
## Bilingual dictionaries
###############################################################################

.deps/$(PREFIX1).dix: $(BASENAME).$(PREFIX1).dix .deps/.d
	cp $< $@

.deps/$(PREFIX1).cat.dix: .deps/$(PREFIX1).dix
	python genvrdix.py cat $< >$@

.deps/$(PREFIX1).val_gva.dix: .deps/$(PREFIX1).dix
	python genvrdix.py val_gva $< >$@

.deps/$(PREFIX1).val_uni.dix: .deps/$(PREFIX1).dix
	python genvrdix.py val_uni $< >$@
	
$(PREFIX1C).autobil.bin: .deps/$(PREFIX1).cat.dix
	apertium-validate-dictionary $<
	lt-comp --var-right=cat lr $< $@

$(PREFIX1V).autobil.bin: .deps/$(PREFIX1).val_gva.dix
	apertium-validate-dictionary $<
	lt-comp --var-right=val_gva lr $< $@

$(PREFIX1U).autobil.bin: .deps/$(PREFIX1).val_uni.dix
	apertium-validate-dictionary $<
	lt-comp --var-right=val_uni lr $< $@

$(PREFIX2).autobil.bin: $(BASENAME).$(PREFIX1).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@


###############################################################################
## Lexical selection rules
###############################################################################

$(PREFIX1).autolex.bin: $(BASENAME).$(PREFIX1).lrx
	lrx-comp $< $@

$(PREFIX2).autolex.bin: $(BASENAME).$(PREFIX2).lrx
	lrx-comp $< $@

###############################################################################
## Structural transfer rules
###############################################################################

$(PREFIX1).t1x.bin: $(BASENAME).$(PREFIX1).t1x
	apertium-validate-transfer $<
	apertium-preprocess-transfer $< $@

$(PREFIX2).t1x.bin: $(BASENAME).$(PREFIX2).t1x
	apertium-validate-transfer $<
	apertium-preprocess-transfer $< $@


###############################################################################
## Distribution
###############################################################################

EXTRA_DIST=					\
		$(BASENAME).$(PREFIX1).lrx	\
		$(BASENAME).$(PREFIX1).dix	\
		$(BASENAME).$(PREFIX2).lrx	\
		$(BASENAME).$(PREFIX1).t1x	\
		$(BASENAME).$(PREFIX2).t1x	\
		modes.xml

###############################################################################
## Installation
###############################################################################

apertium_arg_catdir=$(prefix)/share/apertium/$(BASENAME)/

# Files which should be installed to $(prefix)/share/apertium/$(BASENAME)/:
apertium_arg_cat_DATA=	\
	$(TARGETS_COMMON)				\
	$(BASENAME).$(PREFIX1).t1x			\
	$(BASENAME).$(PREFIX2).t1x

# All modes are created by the same goal, listing several will just give problems with make -j2
noinst_DATA=modes/$(PREFIX1).mode

install-data-local: install-modes

###############################################################################
## Cleanup
###############################################################################

CLEANFILES = $(TARGETS_COMMON)
clean-local:
	-rm -rf .deps modes

###############################################################################
## Test
###############################################################################

test: all
	echo "house" | apertium -d . arg-cat | tee .test-mt
	@echo "house" > .test-ref
	@diff .test-ref .test-mt
	echo "house" | apertium -d . cat-arg | tee .test-mt
	@echo "house" > .test-ref
	@diff .test-ref .test-mt
	@rm .test-ref .test-mt

