task give_outputs(); // For testing purpose
/*
if(count==5) begin // Giving first set of address
  
  input_re = 1'b1;
  input_addr_fm [0] = 0;
  input_addr_fm [1] = 1;
  input_addr_fm [2] = 2;
  input_addr_fm [3] = 3;
  input_addr_fm [4] = 4;
  input_addr_fm [5] = 5;

  input_addr_wm [0] = 0;
  input_addr_wm [1] = 1;
  input_addr_wm [2] = 2;
end
*/

if (count==6) begin // Giving second set of address
  input_re = 1'b1;
  input_addr_fm_row [0] = 0;
  input_addr_fm_col [0] = 1;
  //input_addr_fm_col [0] = 3;
  //input_addr_fm_col [0] = 4;
  //input_addr_fm_col [0] = 5;
  //input_addr_fm_col [0] = 6;
  input_addr_wm [0] = 1;
end

if (count==8) begin
   $display("col_features",col_features[0][4:0]);
   $display("col_features",col_features[0][9:5]);
   $display("col_features",col_features[0][14:10]);
   $display("col_features",col_features[0][19:15]);
   $display("col_features",col_features[0][24:20]);
   $display("col_features",col_features[0][29:25]);
   $display("row_features",row_features[0][4:0]);
   $display("row_features",row_features[0][9:5]);
   $display("row_features",row_features[0][14:10]);
   $display("row_features",row_features[0][19:15]);
   $display("row_features",row_features[0][24:20]);
   $display("row_features",row_features[0][29:25]);

end


if (count == 10) begin // Giving done signal
  output_we = 1;
  Aggregated_out [0] = 5'b00001;
  Aggregated_out [1] = 5'b00010;
  Aggregated_address [0] = 12'b000000_000000;
  Aggregated_address [1] = 12'b000000_000001;
  done = 1'b0;
end
if (count == 11) begin // Giving done signal
  output_we = 1;
  Aggregated_out [0] = 5'b00011;
  Aggregated_out [1] = 5'b00011;
  Aggregated_address [0] = 12'b000000_000000;
  Aggregated_address [1] = 12'b000010_000011;
  done = 1'b1;
end

endtask
// To test single cycle single reads -- DONE
// To test multicycle single reads -- DONE
// To test single cycle multi reads -- DONE
// To test multicycle multi reads -- DONE
// To test single cycle single writes -- DONE
// To test multicycle single writes -- DONE
// To test single cycle multi writes -- DONE
// To test multicycle multi writes -- DONE
// To test single cycle Aggregation out writes -- DONE
// To test multicycle Aggregation out write -- DONE
// To test singlecycle multiaggregation outs --
// To test multicycle multiaggregation outs --