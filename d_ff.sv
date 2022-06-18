// module for paramterized d-ff

module d_ff #(parameter num_of_d_ff = 1)
            (input [num_of_d_ff - 1 : 0] d,
             input clk,
             input rst_n,
             output logic [num_of_d_ff - 1 : 0] q);
             
    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            q <= '0;
        end
        
        else begin
            q <= d;
        end
    end
    
endmodule
