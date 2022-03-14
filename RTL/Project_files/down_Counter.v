`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2022 09:48:24 AM
// Design Name: 
// Module Name: down_Counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module down_Counter(
i_clk , clr_n , ld_cnt , counter 
    );
input i_clk ;
input clr_n ;
input ld_cnt ;
output  [2:0] counter ;

reg[2:0] count_out ;
//assign counter = 3'b101;

always@(posedge i_clk)
 begin
  if(clr_n == 1'b1)
      count_out <= count_out;
      else if(ld_cnt==1'b1)
       count_out <= count_out-1'b1; 
       else
       count_out <= 3'b100;
       end    
   assign counter = count_out ;    
endmodule
