`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2022 10:24:05 PM
// Design Name: 
// Module Name: CONTROLLER
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
`define S0 3'b000
`define S1 3'b001
`define S2 3'b010
`define S3 3'b011
`define STATE_WIDTH 3
module CONTROLLER(
i_clk, 
clr_d , 
start,
load_r ,
load_b ,
load_q ,
R_out, 
enable_r ,
enable_q , 
p_STATE ,
add_enable , 
done , 
shift_en_q ,
clr_ADD , 
clr_Reg_r , 
load_cnt , 
z_cnt , 
clr_nn);

input i_clk ;
input start ;
input R_out ;    
input z_cnt ;
output  load_r ;
output  load_b ;
output  load_q ;
output  enable_r ;
output  enable_q;
output shift_en_q ;
output  clr_ADD ;
output clr_nn ;
output clr_Reg_r ;
output  done ;
output  add_enable ;
output clr_d ;
output load_cnt ;
reg [12:0] CV ;
assign enable_r     =   CV[12];
assign enable_q     =   CV[11];
assign load_b       =   CV[10] ;
assign load_r       =   CV[9];
assign load_q       =   CV[8] ;
assign shift_en_q   =   CV[7];
assign add_enable   =   CV[6];
assign  clr_ADD     =   CV[5];
assign clr_Reg_r    =   CV[4] ;
assign clr_d        =   CV[3] ;
assign clr_nn       =   CV[2];
assign load_cnt     =   CV[1];
assign done         =   CV[0];

output reg [`STATE_WIDTH-1:0] p_STATE ;

///data register ////
 

  always @ ( posedge i_clk)
      begin
     case (p_STATE)
    `S0: begin
           if (start==1)
                   p_STATE <= `S1;
               else
                   p_STATE <= `S0;
             end
     `S1 : begin
                 p_STATE <= `S2 ; 
               end
       `S2 : begin
                 p_STATE <= `S3 ; 
               end
      `S3 :   begin
                     p_STATE <= `S1;
                      end   
     
                                                              
        default : begin
                 p_STATE <= `S0 ;
                   end
           endcase         
         end                     
 
 always@ (p_STATE , R_out  ,start , z_cnt )
    begin
       case(p_STATE)
       `S0 : begin 
                if(start==1'b1)
                begin
             CV = 13'b01100_1x111000;
                end
                 else
                 begin
             CV = 13'bxxxxx_xxxxxxx0;
                 end   
             end              
       `S1 : begin   
                     if (z_cnt ==1'b1)
                       begin
                          CV = 13'b00101_1010x100;
                          end
                        else  
                          begin
                     CV = 13'b00111_1x10x100; 
                 
                     end
                     end
        `S2 : begin   
                      if (z_cnt ==1'b1)
                       begin
                          CV = 13'b00100_1010x100;
                          end
                          else
                    begin 
                     CV = 13'b10100_1000x100; 
                            end      
                end     
       `S3: begin            
                if(R_out==1) begin
                       CV = 13'b10100_11000011; 
                         end
                 else   begin
                    
                        CV = 13'b00100_10000011;
                       
       end
       end   
           default : begin   CV = 13'b01100_1x111000;
                        
                             end
           
         endcase
      end   
 endmodule
           
                
            
   
                        
   
               
        
                 
