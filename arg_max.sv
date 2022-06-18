// Find the max value

module arg_max #(parameter BW=21, parameter NUM_COLS=3, parameter NUM_ROWS=6)
               (input wire clk,
                input rst_n,
                input wire max_start,
                input logic [BW-1:0] aggregation_output [num_of_nodes - 1:0][2:0],
                output logic [num_of_outs-1:0][2:0] out,
                output logic output_we,
                output logic done,
                output logic [num_of_outs-1:0] [2:0] output_addr);
    reg [BW-1:0] max [NUM_ROWS-1:0];

    always @(posedge clk)begin
        
        output_we = 1'b0;

	    for(int i=0;i<num_of_nodes; i=i+1) begin
            max[i] = 'd0;
        end
    
        if(max_start & rst_n) begin
        out <='0;
        done = 1'b0;
            for(int i=0; i<num_of_nodes; i=i+1) begin
	            for(int j=0;j<NUM_COLS; j=j+1)begin
	                if(aggregation_output[i][j] > max[i]) begin
                        max[i] = aggregation_output[i][j];
                        out[i] <= j[2:0];
    	    	    end
    	    	   // $display("max-%d", aggregation_output[i][j]);
    	        end
             end
             
             for(int i=0; i<num_of_outs; i++) begin
                output_addr[i] = i;
             end
             output_we = 1'b1;
             done = 1'b1;
            // $display("done-%b", done);
        end
        else if(!rst_n) begin
            out <= '0;
           // $display("out-%b", out);
        end
  end
endmodule
