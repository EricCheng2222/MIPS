



module mux(in1, in2, sel, outData);

input [31:0] in1;
input [31:0] in2;
input        sel;

output [31:0] outData;



wire [31:0] in1;
wire [31:0] in2;
wire        sel;

reg [31:0] outData;




always @(in1 or in2 or sel)
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


