import Image

def c(v):
    display = Image.new("RGB", (1024, 512));
    mask = Image.new("RGB", (1024, 512));
    vram = open("vram_" + str(v) + "000000.hex", "rt");

    x = 0;
    y = 0;


    for pix in vram.readlines():
        if (pix == ""):
            next;
            
        val = int(pix, 16);
        mask.putpixel((x, y),
                      ((0xFF if ((val >> 15) & 0x1) else 0x00),
                       (0xFF if ((val >> 15) & 0x1) else 0x00),
                       (0xFF if ((val >> 15) & 0x1) else 0x00)));
        display.putpixel((x, y),
                         ((((val >> 0) & 0x1F) << 3),
                          (((val >> 5) & 0x1F) << 3),
                          (((val >> 10) & 0x1F) << 3)));

        if (x == 1023):
            y += 1;
            x = 0;
        else:
            x += 1;

    display.save("vram.png", format="PNG");
    mask.save("vram_mask.png", format="PNG");
    vram.close();
