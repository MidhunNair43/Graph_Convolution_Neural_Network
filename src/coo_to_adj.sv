//coo matrix to adjacency matrix

module coo_to_conv #(parameter num_of_nodes = 6,
					  parameter bits_to_represent_nodes = 3,
					  parameter num_of_coo_cols = 2)
                     (input clk,
                      input conv_start,
                      input [num_of_coo_cols - 1 : 0][(num_of_nodes * bits_to_represent_nodes) - 1 : 0] coo_mat,
                      output logic [num_of_nodes - 1 : 0] adj_mat [num_of_nodes - 1 : 0],
                      output logic coo_adj_done);

    int i, j;
    
    always @(posedge clk) 
    begin
    coo_adj_done = 1'b0;
        for(int row=0; row<num_of_nodes; row++) 
        begin

                // Set Adjacency Matrix rows to all zeros
            adj_mat[row] = '0;
        end
        if(conv_start) 
        begin
            for(int row=0; row<6; row++) 
            begin
                i = coo_mat[0][row * 3 + 2 -: 3]; 
                j = coo_mat[1][row * 3 + 2 -: 3];
                adj_mat[i - 1][j - 1] = 1'b1;
                adj_mat[j - 1][i - 1] = 1'b1;
            end
            coo_adj_done = 1'b1;
            $display("conv-%b", coo_adj_done);
        end
    end

endmodule
