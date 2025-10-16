module control (instr, PCSel, RegSel, AluOp, regWE, memWE, rs1Sel, rs2Sel);
  
  input [31:0] instr;
  output reg [1:0] PCSel, RegSel;
  output reg [3:0] AluOp;
  output reg regWE, memWE, rs1Sel, rs2Sel;

  localparam ADD = 4'b0000;
  localparam SUB = 4'b0001;  
  localparam AND = 4'b0010;  
  localparam OR  = 4'b0011; 
  localparam XOR = 4'b0100; 
  localparam SLL = 4'b0101; 
  localparam SRL = 4'b0110;
  localparam SRA = 4'b0111;
  localparam EQ =  4'b1000; 
  localparam ULT = 4'b1001; 
  localparam UGTE =4'b1010;
  localparam SLT = 4'b1011;
  localparam SGTE =4'b1100;
  
  wire [6:0] opcode;
  wire [2:0] funct3;
  wire [6:0] funct7;
  
  assign opcode = instr[6:0];
  assign funct3 = instr[14:12];
  assign funct7 = instr[31:25];

  //define
  
  
  always @(*) begin
        case (opcode)
          7'b0110011: // R-Type
            case (funct3)
              3'b000: //add or sub
                begin
                case (funct7)
                  7'b0000000: //add 
                    begin
                      PCSel		=2'b00; // pc = pc+4
                      RegSel	=2'b01; // ALU output
                      AluOp		=ADD; 	
                      regWE		=1'b1; // Write RegFile
                      memWE		=1'b0;  
                      rs1Sel	=1'b0; // 0 -> Rs1; 1 -> PC + 4;
                      rs2Sel	=1'b0; // 0 -> Rs2; 1 -> Immediate;
                    end
                  7'b0100000: //sub 
                    begin
                      PCSel		=2'b00; // pc = pc+4
                      RegSel	=2'b01; // ALU output
                      AluOp		=SUB; 	
                      regWE		=1'b1; // Write RegFile
                      memWE		=1'b0;  
                      rs1Sel	=1'b0; // 0 -> Rs1; 1 -> PC + 4;
                      rs2Sel	=1'b0; // 0 -> Rs2; 1 -> Immediate;
                    end
                endcase
                end
              3'b001: //sll
                begin
                  	  PCSel		=2'b00; // pc = pc+4
                      RegSel	=2'b01; // ALU output
                      AluOp		=SLL; 	
                      regWE		=1'b1; // Write RegFile
                      memWE		=1'b0;  
                      rs1Sel	=1'b0; // 0 -> Rs1; 1 -> PC + 4;
                      rs2Sel	=1'b0; // 0 -> Rs2; 1 -> Immediate;
                  end
             3'b010: //slt
                begin
                  	  PCSel		=2'b00; // pc = pc+4
                      RegSel	=2'b01; // ALU output
                      AluOp		=SLT; 	
                      regWE		=1'b1; // Write RegFile
                      memWE		=1'b0;  
                      rs1Sel	=1'b0; // 0 -> Rs1; 1 -> PC + 4;
                      rs2Sel	=1'b0; // 0 -> Rs2; 1 -> Immediate;
                  end
              3'b011: //sltu
                begin
                  	  PCSel		=2'b00; // pc = pc+4
                      RegSel	=2'b01; // ALU output
                      AluOp		=ULT; 	
                      regWE		=1'b1; // Write RegFile
                      memWE		=1'b0;  
                      rs1Sel	=1'b0; // 0 -> Rs1; 1 -> PC + 4;
                      rs2Sel	=1'b0; // 0 -> Rs2; 1 -> Immediate;
                  end
              3'b100: //xor
                begin
                  	  PCSel		=2'b00; // pc = pc+4
                      RegSel	=2'b01; // ALU output
                      AluOp		=XOR; 	
                      regWE		=1'b1; // Write RegFile
                      memWE		=1'b0;  
                      rs1Sel	=1'b0; // 0 -> Rs1; 1 -> PC + 4;
                      rs2Sel	=1'b0; // 0 -> Rs2; 1 -> Immediate;
                  end
              3'b101: //xor
                begin
                   case (funct7)
                  7'b0000000: //srl 
                    begin
                      PCSel		=2'b00; // pc = pc+4
                      RegSel	=2'b01; // ALU output
                      AluOp		=SRL; 	
                      regWE		=1'b1; // Write RegFile
                      memWE		=1'b0;  
                      rs1Sel	=1'b0; // 0 -> Rs1; 1 -> PC + 4;
                      rs2Sel	=1'b0; // 0 -> Rs2; 1 -> Immediate;
                    end
                  7'b0100000: //sra 
                    begin
                      PCSel		=2'b00; // pc = pc+4
                      RegSel	=2'b01; // ALU output
                      AluOp		=SRA; 	
                      regWE		=1'b1; // Write RegFile
                      memWE		=1'b0;  
                      rs1Sel	=1'b0; // 0 -> Rs1; 1 -> PC + 4;
                      rs2Sel	=1'b0; // 0 -> Rs2; 1 -> Immediate;
                    end
                endcase
                end
             3'b110: //or
                begin
                  	  PCSel		=2'b00; // pc = pc+4
                      RegSel	=2'b01; // ALU output
                      AluOp		=OR; 	
                      regWE		=1'b1; // Write RegFile
                      memWE		=1'b0;  
                      rs1Sel	=1'b0; // 0 -> Rs1; 1 -> PC + 4;
                      rs2Sel	=1'b0; // 0 -> Rs2; 1 -> Immediate;
                  end
              3'b111: //and
                begin
                  	  PCSel		=2'b00; // pc = pc+4
                      RegSel	=2'b01; // ALU output
                      AluOp		=AND; 	
                      regWE		=1'b1; // Write RegFile
                      memWE		=1'b0;  
                      rs1Sel	=1'b0; // 0 -> Rs1; 1 -> PC + 4;
                      rs2Sel	=1'b0; // 0 -> Rs2; 1 -> Immediate;
                  end
            endcase
          end
          7'b0010011: // I-Type
            begin
              case (funct3)
              3'b000: //addi
                begin
                      PCSel		=2'b00; // pc = pc+4
                      RegSel	=2'b01; // ALU output
                      AluOp		=ADD; 	
                      regWE		=1'b1; // Write RegFile
                      memWE		=1'b0;  
                      rs1Sel	=1'b0; // 0 -> Rs1; 1 -> PC + 4;
                      rs2Sel	=1'b1; // 0 -> Rs2; 1 -> Immediate;
                end
                3'b001: //slli
                begin
                      PCSel		=2'b00; // pc = pc+4
                      RegSel	=2'b01; // ALU output
                      AluOp		=SLL; 	
                      regWE		=1'b1; // Write RegFile
                      memWE		=1'b0;  
                      rs1Sel	=1'b0; // 0 -> Rs1; 1 -> PC + 4;
                      rs2Sel	=1'b1; // 0 -> Rs2; 1 -> Immediate;
                end
            end
  
endmodule
