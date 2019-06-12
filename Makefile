all: imx6_dtc

#imx6: markprint imx6_dtc
imx6: imx6_dtc

#markprint:
#	./version.sh
#cpp -nostdinc -I./arch/arm/boot/dts -I./arch/arm/boot/dts/include -undef -D__DTS__ -x assembler-with-cpp -o xxx.dts.tmp 


imx6_dtc:
	cpp -Iinclude -E -P -x assembler-with-cpp myimx6ek140-6y-256m-nand.dts > myimx6ek140-6y-256m-nand.tmp.dts
	./dtc -I dts -O dtb -o devicetree.dtb myimx6ek140-6y-256m-nand.tmp.dts


clean:
	rm -rf *.dtb
	rm -rf dt_ver.dtsi
	rm -rf *.tmp.dts
	rm -rf *.tmp.dtsi

install:
	cp ./devicetree.dtb $(DTB_DEST)