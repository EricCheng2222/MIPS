`include "register.v"
module register_tb();
// Declare inputs as regs and outputs as wires
reg [4:0] addr1, addr2, writeAddr;
reg [31:0] writeData;
reg writeEn;

wire [31:0] dataout1;
wire [31:0] dataout2;

// Initialize all variables
initial begin        
  $dumpfile("reg.vcd");
  $dumpvars(0, register_tb);

  writeEn = 0;
  addr1 = 0;
  addr2 = 1;

  #5 
  writeEn = 1;
  writeAddr = 14;
  writeData = 7;
  
  #5

  addr1 = 14;

  #5 $finish;      // Terminate simulation
end


// Connect DUT to test bench
register register_test (
addr1,
addr2,
writeAddr,
writeData,
writeEn,
dataout1,
dataout2
);

endmodule
