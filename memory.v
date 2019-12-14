module memory (
addr,
writeAddr,
writeData,
writeEn,

dataOut,
); // End of port list
input [7:0] addr ;
input [7:0] writeAddr ;
input [31:0] writeData;
input writeEn;
//-------------Output Ports----------------------------
output [31:0] dataOut ;
//-------------Input ports Data Type-------------------
wire [7:0] addr ;
wire [7:0] writeAddr ;
wire [31:0] writeData ;
wire writeEn;
//-------------Output Ports Data Type------------------
reg [31:0] dataOut ;

//------------Code Starts Here-------------------------
reg [31:0] internalReg [0:255];

always @ (addr or writeAddr or writeData)
begin // Block Name
  // At every rising edge of clock we check if reset is active
  // If active, we load the counter output with 4'b0000
  if (writeEn == 1'b1) begin
    internalReg[writeAddr] <= writeData;
  end
  else  begin
    internalReg[writeAddr] <= internalReg[writeAddr];
  end
  dataOut <= internalReg[addr];
end // End of Block COUNTER

initial begin
    $readmemh("/Users/work/Desktop/VerilogCode/MIPS/memoryFile", internalReg);
end

endmodule // End of Module counter
