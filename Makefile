all: calls
extract: extract.mk
	$(MAKE) -f $<
extract.mk: extract.ml
	echo "all:" > $@
	ocaml $< | sed -e 's/^/\t/g' >> $@
N = 1
packatlas:
	sprpack -f abs-atlas-$(shell date --iso)_$(N).png sprites/*.png
IMG = processed/Abstract_RTS-01.jpg
resize:
	for f in $(shell ls processed/*.jpg) ; do $(MAKE) resize1 IMG="$$f"; done
resize1:
	convert $(IMG) -resize 400x400 resized/$(shell basename $(IMG) .jpg).png
clean:
	$(RM) resized/Abs*.png
	$(RM) sprites/Abs*.png
	$(RM) extract.mk
	$(RM) temp.png
calls:
	$(MAKE) resize
	$(MAKE) extract
	$(MAKE) packatlas
