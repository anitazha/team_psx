
BIOS = open("lots_of_BIOS/PSX - SCPH7001.BIN", 'rb')
MIF  = open("generated_files/bios_256k.mif", 'w')
MIF0 = open("generated_files/bios_16k_0.mif", 'w')
MIF1 = open("generated_files/bios_16k_1.mif", 'w')
MIF2 = open("generated_files/bios_16k_2.mif", 'w')
MIF3 = open("generated_files/bios_16k_3.mif", 'w')
MIF4 = open("generated_files/bios_16k_4.mif", 'w')
MIF5 = open("generated_files/bios_16k_5.mif", 'w')
MIF6 = open("generated_files/bios_16k_6.mif", 'w')
MIF7 = open("generated_files/bios_16k_7.mif", 'w')
MIF8 = open("generated_files/bios_16k_8.mif", 'w')
MIF9 = open("generated_files/bios_16k_9.mif", 'w')

count = 0


##############################################################
# 256k MIF #                                                 #
##############################################################
MIF.write('DEPTH = 65536;\n')
MIF.write('WIDTH = 32;\n')
MIF.write('ADDRESS_RADIX = HEX;\n')
MIF.write('DATA_RADIX = HEX;\n')
MIF.write('CONTENT\n')
MIF.write('BEGIN\n\n')

while 1:
    byte = BIOS.read(4)
    if not byte:
        break
    else:
        #if (ord(ord(byte[0]) + ord(ord(byte[1]) + ord(ord(byte[2]) + ord(ord(byte[3]) == 0):
            #continue
        MIF.write(hex(count)[2:] + ' : ')
        MIF.write("{:02x}".format(ord(byte[3])) +
                  "{:02x}".format(ord(byte[2])) +
                  "{:02x}".format(ord(byte[1])) +
                  "{:02x}".format(ord(byte[0])))
        MIF.write(';\n')
        count = count + 1
        if (count == 65536):
            break

MIF.write('\nEND;')
MIF.close()

# ZERO REGION START - 0x1237E
# ZERO REGION END   - 0x18FFF

##############################################################
# 16k0 MIF #                                                 #
##############################################################
MIF0.write('DEPTH = 4096;\n')
MIF0.write('WIDTH = 32;\n')
MIF0.write('ADDRESS_RADIX = HEX;\n')
MIF0.write('DATA_RADIX = HEX;\n')
MIF0.write('CONTENT\n')
MIF0.write('BEGIN\n\n')

while 1:
    byte = BIOS.read(4)
    if not byte:
        break
    else:
        #if (ord(ord(byte[0]) + ord(ord(byte[1]) + ord(ord(byte[2]) + ord(ord(byte[3]) == 0):
            #continue
        MIF0.write(hex(count - 65536)[2:] + ' : ')
        MIF0.write("{:02x}".format(ord(byte[3])) +
                   "{:02x}".format(ord(byte[2])) +
                   "{:02x}".format(ord(byte[1])) +
                   "{:02x}".format(ord(byte[0])))
        MIF0.write(';\n')
        count = count + 1
        if (count == 69632):
            break

MIF0.write('\nEND;')
MIF0.close()

##############################################################
# 16k1 MIF #                                                 #
##############################################################
MIF1.write('DEPTH = 4096;\n')
MIF1.write('WIDTH = 32;\n')
MIF1.write('ADDRESS_RADIX = HEX;\n')
MIF1.write('DATA_RADIX = HEX;\n')
MIF1.write('CONTENT\n')
MIF1.write('BEGIN\n\n')

while 1:
    byte = BIOS.read(4)
    if not byte:
        break
    else:
        #if (ord(ord(byte[0]) + ord(ord(byte[1]) + ord(ord(byte[2]) + ord(ord(byte[3]) == 0):
            #continue
        MIF1.write(hex(count - 69632)[2:] + ' : ')
        MIF1.write("{:02x}".format(ord(byte[3])) +
                   "{:02x}".format(ord(byte[2])) +
                   "{:02x}".format(ord(byte[1])) +
                   "{:02x}".format(ord(byte[0])))
        MIF1.write(';\n')
        count = count + 1
        if (count == 73728):
            break

MIF1.write('\nEND;')
MIF1.close()

##############################################################
# 16k2 MIF #                                                 #
##############################################################
MIF2.write('DEPTH = 4096;\n')
MIF2.write('WIDTH = 32;\n')
MIF2.write('ADDRESS_RADIX = HEX;\n')
MIF2.write('DATA_RADIX = HEX;\n')
MIF2.write('CONTENT\n')
MIF2.write('BEGIN\n\n')

while 1:
    byte = BIOS.read(4)
    if not byte:
        break
    else:
        #if (ord(ord(byte[0]) + ord(ord(byte[1]) + ord(ord(byte[2]) + ord(ord(byte[3]) == 0):
            #continue
        MIF2.write(hex(count - 73728)[2:] + ' : ')
        MIF2.write("{:02x}".format(ord(byte[3])) +
                   "{:02x}".format(ord(byte[2])) +
                   "{:02x}".format(ord(byte[1])) +
                   "{:02x}".format(ord(byte[0])))
        MIF2.write(';\n')
        count = count + 1
        if (count == 77824):
            break

MIF2.write('\nEND;')
MIF2.close()

## READ THROUGH THE ZERO SECTION ##
while 1:
    byte = BIOS.read(4)
    if not byte:
        break
    else:
        count = count + 1
        if (count == 102400):
            break

##############################################################
# 16k3 MIF #                                                 #
##############################################################
MIF3.write('DEPTH = 4096;\n')
MIF3.write('WIDTH = 32;\n')
MIF3.write('ADDRESS_RADIX = HEX;\n')
MIF3.write('DATA_RADIX = HEX;\n')
MIF3.write('CONTENT\n')
MIF3.write('BEGIN\n\n')

while 1:
    byte = BIOS.read(4)
    if not byte:
        break
    else:
        #if (ord(ord(byte[0]) + ord(ord(byte[1]) + ord(ord(byte[2]) + ord(ord(byte[3]) == 0):
            #continue
        MIF3.write(hex(count - 102400)[2:] + ' : ')
        MIF3.write("{:02x}".format(ord(byte[3])) +
                   "{:02x}".format(ord(byte[2])) +
                   "{:02x}".format(ord(byte[1])) +
                   "{:02x}".format(ord(byte[0])))
        MIF3.write(';\n')
        count = count + 1
        if (count == 106496):
            break

MIF3.write('\nEND;')
MIF3.close()

##############################################################
# 16k4 MIF #                                                 #
##############################################################
MIF4.write('DEPTH = 4096;\n')
MIF4.write('WIDTH = 32;\n')
MIF4.write('ADDRESS_RADIX = HEX;\n')
MIF4.write('DATA_RADIX = HEX;\n')
MIF4.write('CONTENT\n')
MIF4.write('BEGIN\n\n')

while 1:
    byte = BIOS.read(4)
    if not byte:
        break
    else:
        #if (ord(ord(byte[0]) + ord(ord(byte[1]) + ord(ord(byte[2]) + ord(ord(byte[3]) == 0):
            #continue
        MIF4.write(hex(count - 106496)[2:] + ' : ')
        MIF4.write("{:02x}".format(ord(byte[3])) +
                   "{:02x}".format(ord(byte[2])) +
                   "{:02x}".format(ord(byte[1])) +
                   "{:02x}".format(ord(byte[0])))
        MIF4.write(';\n')
        count = count + 1
        if (count == 110592):
            break

MIF4.write('\nEND;')
MIF4.close()

##############################################################
# 16k5 MIF #                                                 #
##############################################################
MIF5.write('DEPTH = 4096;\n')
MIF5.write('WIDTH = 32;\n')
MIF5.write('ADDRESS_RADIX = HEX;\n')
MIF5.write('DATA_RADIX = HEX;\n')
MIF5.write('CONTENT\n')
MIF5.write('BEGIN\n\n')

while 1:
    byte = BIOS.read(4)
    if not byte:
        break
    else:
        #if (ord(ord(byte[0]) + ord(ord(byte[1]) + ord(ord(byte[2]) + ord(ord(byte[3]) == 0):
            #continue
        MIF5.write(hex(count - 110592)[2:] + ' : ')
        MIF5.write("{:02x}".format(ord(byte[3])) +
                   "{:02x}".format(ord(byte[2])) +
                   "{:02x}".format(ord(byte[1])) +
                   "{:02x}".format(ord(byte[0])))
        MIF5.write(';\n')
        count = count + 1
        if (count == 114688):
            break

MIF5.write('\nEND;')
MIF5.close()

##############################################################
# 16k6 MIF #                                                 #
##############################################################
MIF6.write('DEPTH = 4096;\n')
MIF6.write('WIDTH = 32;\n')
MIF6.write('ADDRESS_RADIX = HEX;\n')
MIF6.write('DATA_RADIX = HEX;\n')
MIF6.write('CONTENT\n')
MIF6.write('BEGIN\n\n')

while 1:
    byte = BIOS.read(4)
    if not byte:
        break
    else:
        #if (ord(ord(byte[0]) + ord(ord(byte[1]) + ord(ord(byte[2]) + ord(ord(byte[3]) == 0):
            #continue
        MIF6.write(hex(count - 114688)[2:] + ' : ')
        MIF6.write("{:02x}".format(ord(byte[3])) +
                   "{:02x}".format(ord(byte[2])) +
                   "{:02x}".format(ord(byte[1])) +
                   "{:02x}".format(ord(byte[0])))
        MIF6.write(';\n')
        count = count + 1
        if (count == 118784):
            break

MIF6.write('\nEND;')
MIF6.close()

##############################################################
# 16k7 MIF #                                                 #
##############################################################
MIF7.write('DEPTH = 4096;\n')
MIF7.write('WIDTH = 32;\n')
MIF7.write('ADDRESS_RADIX = HEX;\n')
MIF7.write('DATA_RADIX = HEX;\n')
MIF7.write('CONTENT\n')
MIF7.write('BEGIN\n\n')

while 1:
    byte = BIOS.read(4)
    if not byte:
        break
    else:
        #if (ord(ord(byte[0]) + ord(ord(byte[1]) + ord(ord(byte[2]) + ord(ord(byte[3]) == 0):
            #continue
        MIF7.write(hex(count - 118784)[2:] + ' : ')
        MIF7.write("{:02x}".format(ord(byte[3])) +
                   "{:02x}".format(ord(byte[2])) +
                   "{:02x}".format(ord(byte[1])) +
                   "{:02x}".format(ord(byte[0])))
        MIF7.write(';\n')
        count = count + 1
        if (count == 122880):
            break

MIF7.write('\nEND;')
MIF7.close()

##############################################################
# 16k8 MIF #                                                 #
##############################################################
MIF8.write('DEPTH = 4096;\n')
MIF8.write('WIDTH = 32;\n')
MIF8.write('ADDRESS_RADIX = HEX;\n')
MIF8.write('DATA_RADIX = HEX;\n')
MIF8.write('CONTENT\n')
MIF8.write('BEGIN\n\n')

while 1:
    byte = BIOS.read(4)
    if not byte:
        break
    else:
        #if (ord(ord(byte[0]) + ord(ord(byte[1]) + ord(ord(byte[2]) + ord(ord(byte[3]) == 0):
            #continue
        MIF8.write(hex(count - 122880)[2:] + ' : ')
        MIF8.write("{:02x}".format(ord(byte[3])) +
                   "{:02x}".format(ord(byte[2])) +
                   "{:02x}".format(ord(byte[1])) +
                   "{:02x}".format(ord(byte[0])))
        MIF8.write(';\n')
        count = count + 1
        if (count == 126976):
            break

MIF8.write('\nEND;')
MIF8.close()

##############################################################
# 16k9 MIF #                                                 #
##############################################################
MIF9.write('DEPTH = 4096;\n')
MIF9.write('WIDTH = 32;\n')
MIF9.write('ADDRESS_RADIX = HEX;\n')
MIF9.write('DATA_RADIX = HEX;\n')
MIF9.write('CONTENT\n')
MIF9.write('BEGIN\n\n')

while 1:
    byte = BIOS.read(4)
    if not byte:
        break
    else:
        #if (ord(ord(byte[0]) + ord(ord(byte[1]) + ord(ord(byte[2]) + ord(ord(byte[3]) == 0):
            #continue
        MIF9.write(hex(count - 126976)[2:] + ' : ')
        MIF9.write("{:02x}".format(ord(byte[3])) +
                   "{:02x}".format(ord(byte[2])) +
                   "{:02x}".format(ord(byte[1])) +
                   "{:02x}".format(ord(byte[0])))
        MIF9.write(';\n')
        count = count + 1
        #if (count == 106495):
            #break

MIF9.write('\nEND;')
MIF9.close()

print count
BIOS.close()
