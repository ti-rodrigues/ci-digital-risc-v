// Code your design here
module ALU(a, b, ALUControl, result);
	input wire [31:0]	a, b;
	input wire [3:0]	ALUControl;
	output reg [31:0]	result;
  
  wire signed [31:0] signed_a, signed_b;
  
  assign signed_a = a;
  assign signed_b = b;  

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
  

  	always @(*) begin
		case (ALUControl)
          4'd0:
            result = a + b;
          4'd1:
            result = a - b;
          4'b0010:
            result = a & b;
          OR:
            result = a | b;
          XOR: 
            begin
            result = a ^ b;
            end
          SLL:
            result = a << b[4:0];
          SRL:
          	result = a >> b[4:0];
          SRA:
            result = a >>> b[4:0];
          EQ:
            result = (a == b) ? 32'd1 : 32'd0;
          ULT:
            result = (a < b) ? 32'd1 : 32'd0;
          UGTE:
            result = (a >= b) ? 32'd1 : 32'd0;
          SLT:
            result = (signed_a < signed_b) ? 32'd1 : 32'd0;
          SGTE:
            result = (signed_a >= signed_b) ? 32'd1 : 32'd0;
          default:
            result = 32'd0;
        endcase
    end
  
  
endmodule
