import Image

im = Image.open("5.png");
to = open("d.hex", "wt");
pix = im.load();

addr = 0;

for i in xrange(im.size[1]):
    for j in xrange(0, im.size[0], 2):
        csum = -1 * (pix[j, i][0] + pix[j, i][1] + (addr  & 0xFF) + ((addr >> 8) & 0xFF) + 2);
        to.write(":02" + ("%04X" % (addr)) + "00" + ("%02X" % (pix[j, i][1])) + ("%02X" % (pix[j, i][0])) + ("%02X" % (csum & 0xFF)) + "\n");
        addr += 1;
        csum = -1 * (pix[j+1, i][0] + pix[j, i][2] + (addr  & 0xFF) + ((addr >> 8) & 0xFF) + 2);
        to.write(":02" + ("%04X" % (addr)) + "00" + ("%02X" % (pix[j+1, i][0])) + ("%02X" % (pix[j, i][2])) + ("%02X" % (csum & 0xFF)) + "\n");
        addr += 1;
        csum = -1 * (pix[j+1, i][2] + pix[j+1, i][1] + (addr  & 0xFF) + ((addr >> 8) & 0xFF) + 2);
        to.write(":02" + ("%04X" % (addr)) + "00" + ("%02X" % (pix[j+1, i][2])) + ("%02X" % (pix[j+1, i][1])) + ("%02X" % (csum & 0xFF)) + "\n");
        addr += 1;
        
to.write(":00000001FF");
to.close();
