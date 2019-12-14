`include "memory.v"
module memory_tb();
// Declare inputs as regs and outputs as wires
reg [7:0] addr, writeAddr;
reg [31:0] writeData;
reg writeEn;

wire [31:0] dataout;

// Initialize all variables
initial begin        
  $dumpfile("memory.vcd");
  $dumpvars(0, memory_tb);

  writeEn = 0;
  addr = 0;

  #5 
  writeEn = 1;
  writeAddr = 14;
  writeData = 7;
  
  #5

  addr = 14;

  #5 $finish;      // Terminate simulation
end


memory memory_test (
addr,
writeAddr,
writeData,
writeEn,
dataout,
);

endmodule
