`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2022 09:38:55 PM
// Design Name: 
// Module Name: Top_level_design_tb
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

`define WID_1 4
`define WID_2 3
`define WID_3 3
module Top_level_design_tb();

reg i_clk ;
reg [`WID_1-1:0] data_in_1 ;     ////divisor B ///
//reg rst_n ;
reg start ;
reg [`WID_1-1:0] data_in_2 ;         ///dividened Q///
wire [`WID_1-1:0] o_reg_B ;
wire [`WID_1-1:0] o_reg_R ;
wire [`WID_1-1:0] o_reg_Q ;
wire [`WID_3-1:0] Count_out ;
wire [`WID_2-1:0] p_STATE ; 
wire done ;


Top_level_design DUT(
i_clk , data_in_1 , data_in_2 ,  start , p_STATE , o_reg_Q , o_reg_R  , o_reg_B ,Count_out,done  );


initial
 begin
  i_clk = 1'b0 ;
  start = 1'b1 ;
//  rst_n = 1'b1 ; 
  //start = 1'b0 ;
  end
 
  always #5 i_clk = ~i_clk ;
  
  initial
   begin
    //#1 rst_n = 1'b0 ;
    #1 start = 1'b1 ;
    #2 data_in_1 = 4'b0010;
    #1 data_in_2 = 4'b1111;
    #300 $stop;
   end
endmodule
