IMG = processed/Abstract_RTS-01.jpg
resize:
	for f in $(shell ls processed/*.jpg) ; do $(MAKE) resize1 IMG="$$f"; done
resize1:
	convert $(IMG) -resize 400x400 resized/$(basename $(IMG)).png
clean:
	$(RM) resized/Abs*.png
