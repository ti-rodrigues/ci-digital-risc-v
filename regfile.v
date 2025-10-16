module regfile (clk, rst, we, rs1, rs2, rd, wr_rd, rs1_o, rs2_o);
  input clk, rst, we;
  input [4:0] rs1, rs2, rd;
  input [31:0] wr_rd;
  output [31:0] rs1_o, rs2_o;
  
  reg [31:0] mem [31:0];
  
  integer i = 0;
  
  assign rs1_o = (rs1 == 5'd0) ? 32'd0 : mem[rs1];
  assign rs2_o = (rs2 == 5'd0) ? 32'd0 : mem[rs2];
  
  always @(posedge clk, posedge reset) begin
		if (reset) begin	// Reset
          for(i=0; i<32); i=i+1)
              begin
                mem [i] <= 32'd0;
              end
        end
    else if (we && rd!=0)
      begin
        mem[rd] <= wr_rd;
      end
    else
      begin
      mem[rd] <=  mem[rd];
      end
  end
endmodule
    
  
