// module for gcn description

`include "params.vh"
`include "d_ff.sv"
`include "aggregate.sv"
`include "coo_to_conv.sv"
`include "feature_transform_mul_test.sv"
`include "arg_max.sv"

parameter num_of_rows_coo_matrix = 2;
module gcn(
    
    // Inputs  Declaration
    input clk,
    input start,
    input rst_n,
    input [num_of_rows_fm-1:0] [num_of_elements_in_row*BW-1:0] row_features,
    input [num_of_rows_wm-1:0] [num_of_elements_in_row*BW-1:0] row_weights,
    input [num_of_rows_coo_matrix-1:0] [(num_of_nodes * bits_to_represent_nodes) - 1:0] COO_mat,
   
    
    // Outputs Declaration 
    output [num_of_outs-1:0] [2:0] y,
    output logic input_re, 
    output logic [num_of_rows_wm-1:0] [1:0] input_addr_wm,
    output logic [num_of_rows_fm-1:0] [2:0] input_addr_fm_row,
    output logic output_we,
    output logic [num_of_outs-1:0] [2:0] output_addr,
    output logic done);
    
    // Temp wire declared 
    wire q_start;
    wire [num_of_rows_fm-1:0] [num_of_elements_in_row*BW-1:0] dff_q_features_row;
    wire [num_of_rows_wm-1:0] [num_of_elements_in_row*BW-1:0] dff_q_weights_row;
    wire [num_of_rows_coo_matrix-1:0] [(num_of_nodes * bits_to_represent_nodes) - 1:0] dff_q_COO_matrix;
    wire [15:0] trans_feat_mat [5:0][2:0];
    wire [num_of_nodes - 1 : 0] adj_mat [num_of_nodes - 1 : 0];
    logic [20:0] aggregation_output [num_of_nodes - 1:0][2:0];
    wire trans_d;
    wire conv_d;
    wire agg_d;
    wire gen_d;
    wire [num_of_rows_wm-1:0] [1:0] d_input_addr_wm;
    wire [num_of_rows_fm-1:0] [2:0] d_input_addr_fm_row;
        
    logic gen_start;
    logic gen_done;
    
    logic [2:0] feat_row_addr;
    logic [1:0] feat_col_addr;
    
     logic[4:0] count=0;
   /* always @(negedge rst_n)
    count<=0;*/
always @(posedge clk) begin
       //gen_done = 1'b0;
       // $display("Counter in Address generation: %d ",count);
        //input_re = 1'b1;
        /*if(count==4)
        begin
         input_addr_wm=0;
         input_addr_fm_row=0;
        end*/
        //count =count+1;
	if(!rst_n || !start) begin
		count <= 'd0;
                $display("count = %d", count);
	end else begin
		count <= count+1;
		$display("count = %d", count);
	end
end
always_comb begin
feat_row_addr = input_addr_fm_row;
feat_col_addr = input_addr_wm;
        
       // if(q_start && count>4) begin
if(q_start)
begin
//count=0;    
case(count)
          
          5: begin 
          input_re=1'b1;
          input_addr_wm=0;
          input_addr_fm_row=0;
             end
          6: begin
             input_addr_wm=0;
             input_addr_fm_row=1;
	         end
	      7:  begin
	         input_addr_wm=0;
             input_addr_fm_row=2;
	         end
	      8: begin
	         input_addr_wm=0;
             input_addr_fm_row=3;
	        end
          9: begin
	         input_addr_wm=0;
             input_addr_fm_row=4;
	         end
          10:  begin
	         input_addr_wm=0;
             input_addr_fm_row=5;
	          end
	      11: begin
	         input_addr_wm=1;
             input_addr_fm_row=0;
	         end	
          12: begin
             input_addr_wm=1;
             input_addr_fm_row=1;
	          end
	      13: begin
	          input_addr_wm=1;
              input_addr_fm_row=2;
	          end
	      14: begin
	         input_addr_wm=1;
             input_addr_fm_row=3;
	         end
          15: begin
	         input_addr_wm=1;
             input_addr_fm_row=4;
	          end
          16:  begin
	          input_addr_wm=1;
              input_addr_fm_row=5;
	           end
	      17: begin
	         input_addr_wm=2;
             input_addr_fm_row=0;
	          end	
          18: begin
             input_addr_wm=2;
             input_addr_fm_row=1;
	      end
	      19: begin
	         input_addr_wm=2;
             input_addr_fm_row=2;
	      end
	      20: begin
	         input_addr_wm=2;
             input_addr_fm_row=3;
	         end
          21: begin
	         input_addr_wm=2;
             input_addr_fm_row=4;
	          end
          22 :  begin
	         input_addr_wm=2;
             input_addr_fm_row=5;
             input_re=1'b0;
	          end
	    default: begin 
		    input_addr_wm=0;
          	input_addr_fm_row=0;
          	//count<=0;
		 end	
		 
endcase  
end
else
gen_done = 1'b0;
//end
     
         // $display("input_addr_fm_row: %d",input_addr_fm_row);
		 // $display("input_addr_wm: %d",input_addr_wm);
             /*   
                if(input_addr_fm_row==5)
                begin
                input_addr_fm_row=0;
                if(input_addr_wm!=2)
                  input_addr_wm=input_addr_wm+1;
                else
                begin
                input_addr_wm=0;
                //input_re<= 0'b0;
                end
                
                end
                else input_addr_fm_row= input_addr_fm_row+1;
               // $display("input_addr_fm_row: %d",input_addr_fm_row);
               // $display("input_addr_wm: %d",input_addr_wm);
            //end
            gen_done = 1'b1;

           
        end*/
        //gen_done=1'b1;
        // count <=count+1;
    end
    
   
    d_ff #(.num_of_d_ff(1)) d_ff_initialize(.clk(clk),  
                                    .rst_n(rst_n),
                                    .d(start), 
                                    .q(q_start));
    
    d_ff #(.num_of_d_ff(num_of_rows_fm * num_of_elements_in_row * BW)) d_ff_row_features(
                                    .clk(clk),
                                    .rst_n(rst_n),
                                    .d(row_features),
                                    .q(dff_q_features_row));
                                     
    d_ff #(.num_of_d_ff(num_of_rows_wm * num_of_elements_in_row * BW)) d_ff_row_weights(
                                    .clk(clk),
                                    .rst_n(rst_n),
                                    .d(row_weights),
                                    .q(dff_q_weights_row));
                                     
    d_ff #(.num_of_d_ff(num_of_rows_coo_matrix * num_of_nodes * bits_to_represent_nodes)) d_ff_COO_mat(
                                    .clk(clk),
                                    .d(COO_mat),
                                    .rst_n(rst_n),
                                    .q(dff_q_COO_matrix));
                                     
                                    
    coo_to_conv get_coo_to_adj_results(
                                    .clk(clk),
                                    .conv_start(q_start),
                                    .coo_mat(dff_q_COO_matrix),
                                    .adj_mat(adj_mat),
                                    .coo_adj_done(coo_adj_done));
                                    
    feature_transform get_feature_transform_results(
                                    .clk(clk),
                                    .trans_start(q_start),
                                    .row_features(dff_q_features_row),
                                    .row_weights(dff_q_weights_row),
                                    .trans_feat_mat(trans_feat_mat),
                                    .trans_d(trans_d),.row(input_addr_fm_row),.col(input_addr_wm),.count(count));
    
    aggregate get_aggregation_results(  
                                    .clk(clk),
                                    .coo_adj_done(coo_adj_done),
                                    .trans_d(trans_d),
                                    .adj_mat(adj_mat),
                                    .trans_feat_mat(trans_feat_mat),
                                    .aggregation_output(aggregation_output),
                                    .agg_d(agg_d));
    
    arg_max get_agr_max_results(
                                    .clk(clk),
                                    .rst_n(rst_n),
                                    .max_start(agg_d),
                                    .aggregation_output(aggregation_output),
                                    .out(y),
                                    .output_we(output_we),
                                    .done(done),
                                    .output_addr(output_addr));
                               

    
                                     
endmodule
                                        
    
