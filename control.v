module Control(opcode, RegDest, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0);
  
  input [5:0] opcode;
  
  output RegDest;
  output ALUSrc;
  output MemToReg;
  output RegWrite;
  output MemRead;
  output MemWrite;
  output Branch;
  output ALUOp1;
  output ALUOp0;
  
  wire outA0;
  wire outA1;
  wire outA2;
  wire outA3;
  wire outO0;
  wire outO1;
  
  and A0(outA0, !opcode[0], !opcode[1], !opcode[2], !opcode[3], !opcode[4], !opcode[5]);  // R-format
  and A1(outA1, opcode[0], opcode[1], !opcode[2], !opcode[3], !opcode[4], opcode[5]);     // lw
  and A2(outA1, opcode[0], opcode[1], !opcode[2], opcode[3], !opcode[4], opcode[5]);      // sw
  and A3(outA1, !opcode[0], !opcode[1], opcode[2], !opcode[3], !opcode[4], !opcode[5]);   // beq
  
  or O0(outO0, outA1, outA2);
  or O1(outO1, outA0, outA1);
  
  assign RegDest  = outA0;
  assign ALUSrc   = outO0;
  assign MemToReg = outA1;
  assign RegWrite = outO1;
  assign MemWrite = outA2;
  assign Branch   = outA3;
  assign ALUOp1   = outA0;
  assign ALUOp0   = outA3;
  
endmodule