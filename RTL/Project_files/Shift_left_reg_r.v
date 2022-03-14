`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2022 09:23:22 PM
// Design Name: 
// Module Name: Shift_left_reg_r
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

`define WIDTH_R 4
module Shift_left_reg_r(i_clk , clr_R , in_r , en_r , ld_r  , sl_r , out_r  );
input i_clk ;
input clr_R ;     ///clears the register ///
input [`WIDTH_R-1:0] in_r ;
input ld_r ;       ///load enable  //
input en_r  ;   ///enable the data at input  ///
input sl_r ; ///shift_enable ///
output reg [`WIDTH_R-1:0] out_r  ;  



always @ (posedge i_clk)
 begin 
   if(clr_R==1'b1)
    out_r <= 4'b0000;
      else if(en_r==1'b1)
      begin
            out_r <= in_r ;
           end
                  else if (ld_r==1'b1)
        begin
                   out_r <= {out_r[2:0] , sl_r} ;    //shift_left ///
                end
                    else
          begin
                  out_r <= out_r ;
                  end      
               end         
endmodule
