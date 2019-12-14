`include "mux.v"
module mux_tb();
// Declare inputs as regs and outputs as wires
reg [31:0] in1, in2;
reg sel;

wire [31:0] dataout;

// Initialize all variables
initial begin        
  $dumpfile("mux.vcd");
  $dumpvars(0, mux_tb);

  in1 = 7;
  in2 = 13;
  sel = 0;
  #5 
  
  sel = 1;
  
  #5

  in1 = 19;
  in2 =23;

  #5 $finish;      // Terminate simulation
end


mux mux_test (
in1,
in2,
sel,
dataout
);

endmodule
