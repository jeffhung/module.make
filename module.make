
_module_eq  = $(and $(findstring $(1),$(2),$(findstring $(2),$(1))))
_module_nwo = $(and $(call _module_eq,2,$(words $(subst /, ,$(1)))),$(1))
_module_src = \
	$(or $(2),$(lastword $(subst /, ,$(1)))) \
	$(if $(or $(filter http://%,$(1)),$(filter https://%,$(1))),\
		$(1),\
		$(if $(call _module_nwo,$(1)),\
			https://raw.githubusercontent.com/$(1)/master/$(or $(2),$(word 2,$(subst /, ,$(1)))),\
			$(error invalid: $(1))))

module = $(or \
	$(wildcard $(firstword $(call _module_src,$(1),$(2)))),\
	$(lastword \
		$(info Downloading $(firstword $(call _module_src,$(1),$(2)))...)\
		$(shell curl --progress-bar -Lo $(call _module_src,$(1),$(2)))\
		$(firstword $(call _module_src,$(1),$(2)))))

