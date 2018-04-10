

def zero_count(filename):
    BIOS = open(filename, 'rb')
    count = 0

    while 1:
        byte = BIOS.read(4)
        if not byte:
            break
        else:
            if (ord(byte[0]) + ord(byte[1]) + ord(byte[2]) + ord(byte[3]) == 0):
                count = count + 1

    print filename + " >> " + str(4*(132000 - count))
    BIOS.close()


zero_count("PSX - BIOS41A.BIN")
zero_count("PSX - SCPH101.BIN")
zero_count("PSX - SCPH1000.BIN")
zero_count("PSX - SCPH1001.BIN")
zero_count("PSX - SCPH1002.bin")
zero_count("PSX - SCPH3000.bin")
zero_count("PSX - SCPH3500.bin")
zero_count("PSX - SCPH5000.BIN")
zero_count("PSX - SCPH5500.BIN")
zero_count("PSX - SCPH5502.BIN")
zero_count("PSX - SCPH5552.bin")
zero_count("PSX - SCPH7000.BIN")
zero_count("PSX - SCPH7001.BIN")
zero_count("PSX - SCPH7003.BIN")
zero_count("PSX - SCPH7502.BIN")
