`include "alu.v"
module alu_tb();
// Declare inputs as regs and outputs as wires
reg [31:0] reg1, reg2;
reg [5:0] funct;

wire [31:0] result;

// Initialize all variables
initial begin        
  $dumpfile("ALU.vcd");
  $dumpvars(0, alu_tb);


  reg1 = 34;
  reg2 = 16;
  funct = 6'b100_000;
  
  #5
  reg1 = 72;
  reg2 = 36;
  funct = 6'b100_100;

  #5 $finish;      // Terminate simulation
end


// Connect DUT to test bench
my_ALU ALU_test (
reg1,
reg2,
funct,
result
);

endmodule
