module register (
addr1,
addr2,
writeAddr,
writeData,
writeEn,

dataOut1,
dataOut2
); // End of port list
input [4:0] addr1 ;
input [4:0] addr2 ;
input [4:0] writeAddr ;
input [31:0] writeData;
input writeEn;
//-------------Output Ports----------------------------
output [31:0] dataOut1 ;
output [31:0] dataOut2 ;
//-------------Input ports Data Type-------------------
wire [4:0] addr1 ;
wire [4:0] addr2 ;
wire [4:0] writeAddr ;
wire [31:0] writeData ;
wire writeEn;
//-------------Output Ports Data Type------------------
reg [31:0] dataOut1 ;
reg [31:0] dataOut2 ;

//------------Code Starts Here-------------------------
reg [31:0] internalReg [0:31];

always @ (addr1 or addr2 or writeAddr or writeData)
begin // Block Name
  // At every rising edge of clock we check if reset is active
  // If active, we load the counter output with 4'b0000
  if (writeEn == 1'b1) begin
    internalReg[writeAddr] <= writeData;
  end
  else  begin
    internalReg[writeAddr] <= internalReg[writeAddr];
  end
  dataOut1 <= internalReg[addr1];
  dataOut2 <= internalReg[addr2];
end // End of Block COUNTER

endmodule // End of Module counter
