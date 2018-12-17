// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.2
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module copy_mat (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        src_address0,
        src_ce0,
        src_q0,
        dest_address0,
        dest_ce0,
        dest_we0,
        dest_d0
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [13:0] src_address0;
output   src_ce0;
input  [31:0] src_q0;
output  [13:0] dest_address0;
output   dest_ce0;
output   dest_we0;
output  [31:0] dest_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg src_ce0;
reg dest_ce0;
reg dest_we0;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [13:0] next_mul_fu_78_p2;
reg   [13:0] next_mul_reg_124;
wire    ap_CS_fsm_state2;
wire   [6:0] i_2_fu_90_p2;
reg   [6:0] i_2_reg_132;
wire    ap_CS_fsm_state3;
reg   [13:0] dest_addr_reg_142;
wire   [6:0] j_2_fu_118_p2;
reg   [6:0] j_2_reg_150;
reg   [6:0] i_reg_44;
wire   [0:0] exitcond_fu_112_p2;
reg   [13:0] phi_mul_reg_55;
reg   [6:0] j_reg_67;
wire    ap_CS_fsm_state4;
wire   [0:0] exitcond1_fu_84_p2;
wire   [31:0] tmp_5_cast_fu_106_p1;
wire   [13:0] j_cast1_cast_fu_96_p1;
wire   [13:0] tmp_5_fu_100_p2;
reg   [3:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state3) & (exitcond_fu_112_p2 == 1'd1))) begin
        i_reg_44 <= i_2_reg_132;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_44 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond1_fu_84_p2 == 1'd0))) begin
        j_reg_67 <= 7'd0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        j_reg_67 <= j_2_reg_150;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state3) & (exitcond_fu_112_p2 == 1'd1))) begin
        phi_mul_reg_55 <= next_mul_reg_124;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        phi_mul_reg_55 <= 14'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        dest_addr_reg_142 <= tmp_5_cast_fu_106_p1;
        j_2_reg_150 <= j_2_fu_118_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_2_reg_132 <= i_2_fu_90_p2;
        next_mul_reg_124 <= next_mul_fu_78_p2;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_start) & (1'b1 == ap_CS_fsm_state1)) | ((1'b1 == ap_CS_fsm_state2) & (1'd1 == exitcond1_fu_84_p2)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (1'd1 == exitcond1_fu_84_p2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        dest_ce0 = 1'b1;
    end else begin
        dest_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        dest_we0 = 1'b1;
    end else begin
        dest_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        src_ce0 = 1'b1;
    end else begin
        src_ce0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (1'd1 == exitcond1_fu_84_p2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (exitcond_fu_112_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign dest_address0 = dest_addr_reg_142;

assign dest_d0 = src_q0;

assign exitcond1_fu_84_p2 = ((i_reg_44 == 7'd100) ? 1'b1 : 1'b0);

assign exitcond_fu_112_p2 = ((j_reg_67 == 7'd100) ? 1'b1 : 1'b0);

assign i_2_fu_90_p2 = (i_reg_44 + 7'd1);

assign j_2_fu_118_p2 = (j_reg_67 + 7'd1);

assign j_cast1_cast_fu_96_p1 = j_reg_67;

assign next_mul_fu_78_p2 = (phi_mul_reg_55 + 14'd100);

assign src_address0 = tmp_5_cast_fu_106_p1;

assign tmp_5_cast_fu_106_p1 = tmp_5_fu_100_p2;

assign tmp_5_fu_100_p2 = (phi_mul_reg_55 + j_cast1_cast_fu_96_p1);

endmodule //copy_mat
