// Transformation matrix multiplied with the feature matrix multiplied to the adjacent matrix
module aggregate #(parameter num_of_nodes = 6)
    (
    input clk,
    input coo_adj_done,
    input trans_d,
    input [num_of_nodes - 1:0] adj_mat [num_of_nodes - 1:0],
    input [15:0] trans_feat_mat [5:0][2:0],
    output logic [20:0] aggregation_output [num_of_nodes - 1:0][2:0],
    output logic agg_d);
        int row;
        int col;
    always @(posedge clk) 
    begin
    agg_d = 1'b0; 

    
    for(row=0; row<num_of_nodes; row=row+1) begin
        for(col=0; col<3; col=col+1) begin
		aggregation_output[row][col] = '0;
		end
	end
	
    if (coo_adj_done & trans_d) 
    begin
        for(int j=0; j<num_of_nodes*3 ; j=j+1)
        begin
            row = j/3; 
	        col=  j%3;
                for(int i=0; i<num_of_nodes; i++) 
                    begin
		             aggregation_output[row][col] = aggregation_output[row][col] + {(adj_mat[row][i]) ? trans_feat_mat[i][col]: 0};
                    end
            //end        
          end
         
          
        agg_d = 1'b1;
    end
    else
    agg_d=0;
end
endmodule
