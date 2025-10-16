module dmem (clk, reset, a, rd, wd, we, mode);
  
  parameter ADDR_WIDTH = 8;
  parameter DATA_WIDTH = 32;
  
  input clk, reset, we;
  input [2:0] mode;	
  input [DATA_WIDTH-1:0] wd;
  output reg [DATA_WIDTH-1:0] rd;
  input [ADDR_WIDTH-1:0] a;
  
  reg [7:0] mem [2**ADDR_WIDTH];
  
  integer i=0;
  
  always @(posedge clk, reset) 
    begin
		if (reset) 
          begin
            for(i=0; i<(2**ADDR_WIDTH); i=i+1)
              begin
                mem [i] <= 8'h00;
              end
          end
    end
  
  always (*)
    begin
      case (mode)
        3'b000: // 4 bytes
          rd = {mem [a], mem [a+1], mem [a+2], mem [a+3]};
        3'b001: // Unsigned 2 bytes 
          rd = {{16{1'b0}, mem [a], mem [a+1]};
        3'b010: // Signed 2 bytes
          rd = {{16{mem [a][7]}}, mem [a], mem [a+1]};
        3'b011: // Unsigned 1 byte
          rd = {{24{1'b0}, mem [a]};
        3'b100: // Signed 1 byte
          rd = {{24{mem [a][7]}, mem [a]};
        default:
          rd = {mem [a], mem [a+1], mem [a+2], mem [a+3]};
      endcase
    end
                
	always @(posedge clk) 
      begin
        if(we)
          begin
            case (mode)
        	3'b000: // 4 bytes
        		{mem [a], mem [a+1], mem [a+2], mem [a+3]} <= wd;
        	3'b001: // Unsigned 2 bytes 
            	{mem [a], mem [a+1]} = wd[15:0];
        	3'b010: // Signed 2 bytes
          		{mem [a], mem [a+1]} = wd[15:0];
        	3'b011: // Unsigned 1 byte
            	{mem [a]} = wd[7:0];
       	 	3'b100: // Signed 1 byte
         		{mem [a]} = wd[7:0];
        	default:
          		{mem [a], mem [a+1], mem [a+2], mem [a+3]} <= wd;
      		endcase
          end
      end
                
    
  
endmodule
  
  
