`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2022 09:22:41 PM
// Design Name: 
// Module Name: REG_B
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

`define WIDTH_B 4 
module REG_B(i_clk , ld_b  , in_b , out_b );
input i_clk ;
input ld_b ;    ///load enable 
///input rst_n ;   ///reset//
input [`WIDTH_B-1:0] in_b ;  //data input 8 bit  //
output reg [`WIDTH_B-1:0] out_b ;  ///output data 


always @ (posedge i_clk)
  begin
 if (ld_b)
         begin
               out_b <= in_b ;
          end
          else
            begin
               out_b <= out_b;
             end
       end               
endmodule
