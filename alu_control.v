module AluControl(funct, ALUOp, operation);
  
  input [5:0] funct;
  input [1:0] ALUOp;
  
  output [2:0] operation;
  
  wire outO0;
  wire outO1;
  wire outO2;
  wire outA0;
  wire outA1;
  
  or O0(outO0, funct[0], funct[3]);
  
  and A0(outA0, outO0, ALUOp[1]);
  and A1(outA1, funct[1], ALUOp[1]);
  
  or O1(outO1, funct[2], ALUOp[1]);
  or O2(outO2, outA1, ALUOp[0]);
  
  assign operation[0] = outA0;
  assign operation[1] = outO1;
  assign operation[2] = outO2;
  
endmodule