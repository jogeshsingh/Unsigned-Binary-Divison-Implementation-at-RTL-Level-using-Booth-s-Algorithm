`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2022 12:28:21 PM
// Design Name: 
// Module Name: ADD_SUB
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


module ADD_SUB(
    input [3:0] in_a,
    input [3:0] in_b,
    input clr_add,
    input add_en,
    output reg [3:0] sum_o
);
always@(*)
 begin
 if(clr_add==1'b1)
  sum_o = 4'b0000;
  else if(add_en==1'b1)
   begin
   sum_o = in_a + in_b ;
     end
   else
       begin  sum_o = in_a - in_b ;
         end
      end   
endmodule
