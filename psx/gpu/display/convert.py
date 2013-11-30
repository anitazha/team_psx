
BIOS = open("1.bmp", 'rb')
COE  = open("data.dat", 'w')
count = 0

 
while 1:
    byte = BIOS.read(2)
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
