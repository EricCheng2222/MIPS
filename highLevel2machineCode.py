




import os



MIPS_TABLE=
{
    "add"   :("R", "0x00", "0x20"),
    "addu"  :("R", "0x00", "0x21"),
    "and"   :("R", "0x00", "0x24"),
    "div"   :("R", "0x00", "0x1A"),
    "mult"  :("R", "0x00", "0x18"),
    "multu" :("R", "0x00", "0x19"),
    "nor"   :("R", "0x00", "0x27"),
    "xor"   :("R", "0x00", "0x26"),
    "or"    :("R", "0x00", "0x25"),
    "slt"   :("R", "0x00", "0x2A"),
    "j"     :("J", "0x02", ""),
    "jal"   :("J", "0x03", ""),
    "beq"   :("I", "0x04", ""),
    "blez"  :("I", "0x06", ""),
    "bne"   :("I", "0x05", ""),
    "lw"    :("I", "0x23", ""),
    "sw"    :("I", "0x2B", "")
}

def r_type_machineCode(info, code):
    

def j_type_machineCode(info, code):
    

def i_type_machineCode(info, code):



def mapping(code):
    splitCode = code.split(" ")
    info = MIPS_TABLE[splitCode[0]]
    if    info[0] == "R":
        return r_type_machineCode(info, code)

    elif  info[1] == "J":
        return j_type_machineCode(info, code)

    elif  info[2] == "I":
        return i_type_machineCode(info, code)

    else:
        print("instruction not support")
        exit(1)


def readFile(path):
    rtnLine = ""
    absPath = os.path.join(os.getcwd(), path)
    with open(absPath, "r") as f:
        rtnLine = f.readlines()
    return rtnLine

def Transform(code):
    return [mapping(c) for c in code]


def writeTo(machineCodeList, fileName):
    fileNameWithExt = fileName + ".mips"
    absPath = os.path.join(os.getcwd(), fileNameWithExt)
    newLineCode = '\n'.join(machineCodeList)
    with open(absPath, "w") as f:
        f.write(newLineCode)


def main():
    
    fileName = "example1"
    highLevelCode = readFile(fileName)
    machineCodeList = Transform(highLevelCode)
    writeFile = writeTo(machineCodeList, fileName)



if __name__ == '__main__':
    main()
