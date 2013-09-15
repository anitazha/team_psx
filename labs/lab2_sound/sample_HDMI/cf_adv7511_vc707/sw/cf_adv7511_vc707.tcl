# tcl script to init arm and run sdk

fpga -f sw/cf_adv7511_vc707.bit
connect mb mdm
dow sw/cf_adv7511_vc707.elf
run
disconnect 0
exit
