`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2022 09:21:57 PM
// Design Name: 
// Module Name: DATAPATH
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

`define DATA_WIDTH 4
`define DATA_WIDTH_Q 4
`define COUNT_WIDTH 3 
`define STATE_WID 3
module DATAPATH(
i_clk ,
clr_d , 
clr_nn ,   
shift_en_q , 
enable_q , 
enable_r ,
data_in_b ,
data_in_q , 
o_reg_b , 
o_reg_r ,
o_reg_q  ,
load_b ,
load_cnt,
load_r , 
load_q  , 
add_enable ,
R_out , 
clr_ADD ,
clr_Reg_r, 
z_cnt , 
Count_out 
);


input add_enable ;
input load_cnt ; ///it decrements the counter /////
input clr_d ;      ///clears the DFF///
input clr_ADD;  ///resets the add_sub unit to 0000///
input clr_Reg_r ;   ////reset the register r to 0000/ 
input load_q ;    ///enable for shifting operation ///
input load_r ; //// enable for the shifting operation 
input load_b ;    ////load enable for loading the data in reg B ///
input i_clk ;
input shift_en_q ;       ///selection line of mux ///
input clr_nn ;        ///// if it's 1 then it holds the counter to previous state///
input enable_r ;         ///enable the data for reg shift_left_r //
input enable_q ;        //enable the data for Divident (aka: shift_reg_quotient) ///
input [`DATA_WIDTH-1:0] data_in_b ;        ///data input //
input [`DATA_WIDTH_Q-1:0] data_in_q ; ///data input for q //
output [`DATA_WIDTH-1:0] o_reg_b ;       ///output of reg b ///
output [`DATA_WIDTH-1:0] o_reg_r ;         //output of shift_left_r //
output [`DATA_WIDTH_Q-1:0] o_reg_q ;      ///output of reg shift_reg_quotient //
output R_out ;       /////output used for taking the MSB of sum_out ////
output z_cnt     ;   ////it checks if the count has reached the 0 or not //
output [`COUNT_WIDTH-1:0] Count_out ;    ///output of counter ///
  wire [3:0] sum_out ; ///output of adder/ //
wire   mux_out ;    ////output of mux_2 which is provided to shift_enable (sl_q) of Quotient_reg  ;
wire mux_out_1;         //output of mux2 ///
wire m_out ;           //input to the D-ff//
wire shift_q ;     ///output of D-FF ////

REG_B              DUT_B (.i_clk(i_clk) , .ld_b(load_b) , .in_b(data_in_b) , .out_b(o_reg_b) );
Shift_left_reg_r   DUT_R (.i_clk(i_clk) , .clr_R(clr_Reg_r) , .in_r(sum_out) , .en_r(enable_r), .ld_r(load_r)  , .sl_r(Q_msb) , .out_r(o_reg_r)  );
shift_reg_Quotient DUT_Q(.i_clk(i_clk) , .in_q(data_in_q)  , .en_q(enable_q)  , .ld_q(load_q) ,  .out_q(o_reg_q) , .sl_q(shift_q) );
ADD_SUB            AS(.in_a(o_reg_r), .in_b(o_reg_b) , .clr_add(clr_ADD) ,.add_en(add_enable) , .sum_o(sum_out));
mux_2              MUX2(.a_in(R_out) , .b_in(R_out), .sel_1(shift_en_q) , .out(mux_out_1));
D_FF              DFF(.d_in(m_out) , .i_clk(i_clk) , .Q_o(shift_q) , .clr_reg(clr_d));
down_Counter      CNT(.i_clk(i_clk) , .clr_n(clr_nn) , .ld_cnt(load_cnt) , .counter(Count_out) );

assign m_out = ~mux_out_1 ;
  assign z_cnt = (Count_out==0)?1'b1 :1'b0 ;  //output sign whenever counter goes down to 0 then turns high else low and shows the output is available in Quotient and Remainder register//
assign R_out = o_reg_r[3]  ;        ////used for checking the MSB sign of output of remainder ////
assign Q_msb = o_reg_q[3] ;   ////MSB of quotient Register given to the LSB shift en (sl_r) to shift the data serially left//
endmodule
