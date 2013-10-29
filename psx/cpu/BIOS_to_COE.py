
BIOS = open("SCPH7001.BIN", 'rb')
COE  = open("bios.coe", 'w')
count = 0


COE.write('memory_initialization_radix=16;\n')
COE.write('memory_initialization_vector=\n')

while 1:
    byte = BIOS.read(1)
    if not byte:
        COE.write(';')
        break
    else:
        if (count != 0):
            COE.write(',\n')
        COE.write(byte.encode('hex'))
        count = count + 1

print count
BIOS.close()
COE.close()
