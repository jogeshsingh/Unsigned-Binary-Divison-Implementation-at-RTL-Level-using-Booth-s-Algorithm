`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2022 09:24:28 PM
// Design Name: 
// Module Name: shift_reg_Quotient
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

`define WIDTH_Q 4
module shift_reg_Quotient(
i_clk , in_q  , en_q , ld_q ,  out_q  ,sl_q 
    );
 input i_clk ;
 input [`WIDTH_Q -1:0] in_q ;
 input sl_q ;   ///shift_left_q ///
 input en_q ;  //enable the data //
 input ld_q ;   //load the shifted data ///
 
 output  [`WIDTH_Q-1:0] out_q ;   
 reg [`WIDTH_Q-1:0] temp_q;
 always @ (posedge i_clk)
 begin
    if (en_q==1'b1)
        begin
                 temp_q <= in_q ;
               end
            else if (ld_q ==1'b1)
           begin
                   temp_q <= {temp_q[2:0] , sl_q};    //shift_left ///
                    end
            else
                 begin
                   temp_q <= temp_q;
                  end
            end 
       assign out_q = temp_q ;  
      /// assign out_q[0] = sl_q ;     
endmodule
