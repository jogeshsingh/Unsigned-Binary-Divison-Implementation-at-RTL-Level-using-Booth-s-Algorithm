`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2022 11:10:03 AM
// Design Name: 
// Module Name: D_FF
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

module D_FF(
d_in , i_clk , Q_o , clr_reg
    );
    
 input i_clk ;
 input clr_reg ;
 input  d_in ;
 output reg Q_o;
 
 
 always @(posedge i_clk)
   begin
      if(clr_reg==1'b1)
      Q_o <= 1'b0;
      else
     Q_o <= d_in ;
     end   
endmodule
