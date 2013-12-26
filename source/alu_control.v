`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:47 12/26/2013 
// Design Name: 
// Module Name:    alu_control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu_control(data1_out, data2_out, data3_out, sel, tclk, alu_data_1, alu_data_2, alu_out,
						reg_on, reg_w, reg_data_in, reg_addr);
	input [`WORD_SIZE-1: 0] data1_out;
	input [`WORD_SIZE-1: 0] data2_out;
	input [`WORD_SIZE-1: 0] data3_out;
	input [`OP_SIZE-1: 0] sel;
	input tclk;
	input [`WORD_SIZE-1: 0] alu_out;
	
	output [`WORD_SIZE-1: 0] alu_data_1;
	output [`WORD_SIZE-1: 0] alu_data_2;
	output [`WORD_SIZE-1: 0] reg_data_in;
	output [`OP_SIZE-1: 0] reg_addr;
	output reg_on, reg_w;
	
	
	reg [`WORD_SIZE-1: 0] tmp_alu_data_1;
	reg [`WORD_SIZE-1: 0] tmp_alu_data_2;
	reg [`WORD_SIZE-1: 0] tmp_reg_data_in;
	reg [`OP_SIZE-1: 0] tmp_reg_addr;
	reg tmp_reg_on, tmp_reg_w;
	
	assign alu_data_1 = tmp_alu_data_1;
	assign alu_data_2 = tmp_alu_data_2;
	assign reg_data_in = tmp_reg_data_in;
	assign reg_addr = tmp_reg_addr;
	assign reg_on = tmp_reg_on;
	assign reg_w = tmp_reg_w;
	
	always @(sel)
		begin
			tmp_alu_data_1 = data2_out;
			tmp_alu_data_2 = data3_out;
			#20 tmp_reg_data_in = alu_out;
			tmp_reg_addr = data1_out [3:0];
			tmp_reg_w = 1;
			tmp_reg_on = 1;
		end
endmodule