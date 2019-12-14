



module cpu();




wire  [7:0]   fetch_addr, writeAddr;
wire  [31:0]  writeData;
wire          writeEn;
wire  [31:0]  instruction;

wire RegDst;
wire [4:0] reg_write_addr;

wire [31:0] regData1;
wire [31:0] regData2;

memory    code_memory(
    fetch_addr, 
    writeAddr, 
    writeData, 
    writeEn, 
    instruction
);

mux select_write_reg(
    instruction[20:16], 
    instruction[15:11], 
    RegDst, 
    reg_write_addr
);

register  register_mem(
    instruction[25:21], 
    instruction[20:16], 
    reg_write_addr, 
    writeData, 
    writeEn, 
    regData1, 
    regData2
);

mux select_alu_src(
    regData2,
    signExtended,
    aluSrcSel,
    aluInput
);

my_ALU alu(
    regData1,
    aluInput,
    aluControl,
    ALU_output
);

memory data_memory(
    ALU_output,
    ALU_output,
    regData2,
    control_unit_memWrite,
    data_memory_out
);



always @(instruction_32)
begin
    case(sel)
    1'b0:begin //add(0)/addu(1)
        outData <= in1;
    end
    1'b1:begin //and
        outData <= in2;
    end
    default : begin
        $display("mux default is selected");
    end
    endcase
end
endmodule


