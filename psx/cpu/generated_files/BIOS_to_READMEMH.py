
BIOS = open("SCPH7001.BIN", 'rb')
COE  = open("bios.dat", 'w')
count = 0

 
while 1:
    byte = BIOS.read(4)
    if not byte:
        break
    else:
        if (count != 0):
            COE.write('\n')
        COE.write(byte.encode('hex'))
        count = count + 1

print count
BIOS.close()
COE.close()
