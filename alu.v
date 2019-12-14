



module my_ALU(reg1, reg2, funct, outData);

input [31:0] reg1;
input [31:0] reg2;
input [5:0]  funct;

output [31:0] outData;


wire [31:0] reg1;
wire [31:0] reg2;
wire [5:0] funct;

reg [31:0] outData;




always @(reg1 or reg2 or funct)
begin
    casex(funct)
    6'b100_00?:begin //add(0)/addu(1)
        outData <= reg1 + reg2;
    end
    6'b100_100:begin //and
        outData <= reg1 & reg2;
    end
    default : begin
        $display("@%0dns default is selected, opcode %b",$time, funct);
    end
    endcase
end
endmodule


