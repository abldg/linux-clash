ifneq (Yx86_64X,Y$(shell arch)X)
ifneq (Yaarch64X,Y$(shell arch)X)
only_for_run_on_amd64_or_arm64_machine:
	@echo "[WARN_TIP]: this tool $@ !!!" | sed 's@_@ @g'; true
endif
endif
###------------------------------BGN--------------------------------------------
#en?=1
#dbg?=1
##
VE:=$(if $(en),en,cn)
VD:=$(if $(dbg),1,0)
VX:=$(if $(vx),-x,)
ifeq (,$(VX))
VQ:=@
else
VQ:=
VD:=1
endif
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
V2S+=SW_THZLANG=$(VE)
V2S+=SW_DODEBUG=$(VD)
V2S+=SW_USEMIRR=$(if $(um),1,0)
V2S+=CBYMK=1

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
OPERLST+=enable_proxy
OPERLST+=disable_proxy

##
OPERLST+=uptenv
egs_uptenv+=NEW_LNKURL='$(if $(LNKURL),$(LNKURL),$(if $(url),$(url),))'
egs_uptenv+=NEW_SECRET='$(if $(SECRET),$(SECRET),$(if $(p),$(p),))'

##
OPERLST+=help
OPERLST+=infoproj

##
$(OPERLST):;$(VQ)$(V2S) ACTKW=${@F} ${egs_${@F}} bash $(VX) bin/myctl; true
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.PHONY: $(OPERLST)
###------------------------------END--------------------------------------------
