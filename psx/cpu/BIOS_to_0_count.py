
BIOS = open("SCPH7001.BIN", 'rb')
#COE  = open("bios_32b.coe", 'w')
count = 0

byte2bits = [''.join(['01'[i&(1<<b)>0] for b in xrange(7,-1,-1)]) for i in xrange(256)]

#COE.write('memory_initialization_radix=2;\n')
#COE.write('memory_initialization_vector=\n')

while 1:
    byte = BIOS.read(4)
    if not byte:
        #COE.write(';')
        break
    else:
        #if (count != 0):
        #    COE.write(',\n')
        #COE.write(byte2bits[ord(byte[0])] +
        #          byte2bits[ord(byte[1])] +
        #          byte2bits[ord(byte[2])] +
        #          byte2bits[ord(byte[3])])

        if ((ord(byte[0]) + ord(byte[1]) + ord(byte[2]) + ord(byte[3])) == 0):
            count = count + 1

print count
BIOS.close()
#COE.close()
