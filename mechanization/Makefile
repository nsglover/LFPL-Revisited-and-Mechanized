define prepend
  $(foreach u, $(2), $(1)/$(u))
endef

UNITS = \
	$(call prepend, math, tree nfold div poly exp binom polyd) \
	$(call prepend, turing-machine, tape transition machine) \
	\
	$(call prepend, lfpl-ext/core, language operational denotational equivalence cost) \
	$(call prepend, lfpl-ext/soundness, size bound theorems) \
	\
	$(call prepend, lfpl-min/core, language operational denotational sugar equivalence cost) \
	$(call prepend, lfpl-min/lib/heap-free, contraction surjective) \
	$(call prepend, lfpl-min/lib/tuple, sugar tools) \
	$(call prepend, lfpl-min/lib/list, sugar nat tools) \
	$(call prepend, lfpl-min/lib/memory, mem division) \
	$(call prepend, lfpl-min/lib/stack, interface weakened additive base inductive polynomial) \
	$(call prepend, lfpl-min/completeness, tape step iteration machine theorems) \

.PHONY: all clean 

all : $(foreach i, $(UNITS), $(i).isto $(i).ist)

%.isto : %.ist
	istari $<

clean :
	find . -name "*.isto" -type f -delete