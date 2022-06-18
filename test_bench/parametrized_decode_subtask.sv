//`include "params.vh"
//int i,j;
/*//-----------------------Feature matrix decoder-----------------------//
// Give the input addr of fm to initialize the FMM. It should be a 2D vector. So addr[0][0]
task get_features_from_memory();
  casex (num_of_cols)
    3'b001: begin
      for (i=0;i<96;i++) begin
       col_features [0] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[0]] [i];
      end
    end
    3'b010: begin
      for (i=0;i<96;i++) begin
       col_features [0] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[0]] [i];
       col_features [1] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[1]] [i];
      end
    end
    3'b011: begin
      for (i=0;i<96;i++) begin
       col_features [0] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[0]] [i];
       col_features [1] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[1]] [i];
       col_features [2] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[2]] [i];
      end
    end
    3'b100: begin
      for (i=0;i<96;i++) begin
       col_features [0] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[0]] [i];
       col_features [1] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[1]] [i];
       col_features [2] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[2]] [i];
       col_features [3] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[3]] [i];
      end
    end
    3'b101: begin
      for (i=0;i<96;i++) begin
       col_features [0] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[0]] [i];
       col_features [1] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[1]] [i];
       col_features [2] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[2]] [i];
       col_features [3] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[3]] [i];
       col_features [4] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[4]] [i];
      end 
    end
    3'b110: begin
      for (i=0;i<96;i++) begin
       col_features [0] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[0]] [i];
       col_features [1] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[1]] [i];
       col_features [2] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[2]] [i];
       col_features [3] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[3]] [i];
       col_features [4] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[4]] [i];
       col_features [5] [5*i+4 -: 5] = Feature_matrix_memory[input_addr_fm[5]] [i];
      end
    end 
    default: begin 
      for (i=0;i<96;i++) begin
      col_features [0] [5*i+4 -: 5] = Feature_matrix_memory[0] [i];
      end
      end
  endcase
  endtask
//---------------------------------------------------------------------------// 

//-------------------------Weight matrix decoder-----------------------------//
task  get_weights_from_memory();
      casex (num_of_rows)
    2'b01:begin
      for (i=0;i<96;i++) begin
       row_weights [0] [5*i+4 -: 5] = Weight_matrix_memory[input_addr_fm[0]] [i];
      end
    end 
    2'b10: begin
     for (i=0;i<96;i++) begin
       row_weights [0] [5*i+4 -: 5] = Weight_matrix_memory[input_addr_fm[0]] [i];
       row_weights [1] [5*i+4 -: 5] = Weight_matrix_memory[input_addr_fm[1]] [i];
      end
    end
    2'b11: begin
     for (i=0;i<96;i++) begin
       row_weights [0] [5*i+4 -: 5] = Weight_matrix_memory[input_addr_fm[0]] [i];
       row_weights [1] [5*i+4 -: 5] = Weight_matrix_memory[input_addr_fm[1]] [i];
       row_weights [2] [5*i+4 -: 5] = Weight_matrix_memory[input_addr_fm[2]] [i];
      end
    end
    default:begin 
      for (i=0;i<96;i++) begin
       row_weights [0] [5*i+4 -: 5] = Weight_matrix_memory[input_addr_fm[0]] [i];
      end
    end
  endcase
endtask
//---------------------------------------------------------------------------// 
*/


//-----------------------Feature matrix decoder_row-----------------------//
task get_features_from_memory_looped();
for(j=0; j<num_of_rows_fm;j++) begin
for (i=0;i<96;i++) begin
       row_features [j] [5*i+4 -: 5] = Feature_matrix_memory [input_addr_fm_row[j]] [i];
    end
end
endtask
//---------------------------------------------------------------------------// 

//-----------------------Feature matrix decoder_col-----------------------//
//logic [num_of_rows_fm-1:0] [num_of_elements_in_col*BW-1:0] col_features;
task get_features_from_memory_looped_col();
for(j=0; j<num_of_cols_fm;j++) begin
for (i=0;i<6;i++) begin
       col_features [j] [5*i+4 -: 5] = Feature_matrix_memory [i] [input_addr_fm_col[j]];
    end
end
endtask
//---------------------------------------------------------------------------//

int k,l;
//-------------------------Weight matrix decoder-----------------------------//
task get_weights_from_memory_looped();
for(k=0; k<num_of_rows_wm;k++) begin
for (l=0;l<96;l++) begin
       row_weights [k] [5*l+4 -: 5] = Weight_matrix_memory[input_addr_wm[k]] [l];
    end
end
endtask
//---------------------------------------------------------------------------// 

//-------------------------COO matrix decoder--------------------------------//
int m;
task get_adj_mat_from_memory();
for(m=0;m<6;m++) begin 
COO_mat [0] [3*m+2 -: 3] = ADJ_matrix_memory [0] [m];
COO_mat [1] [3*m+2 -: 3] = ADJ_matrix_memory [1] [m];
end
endtask
//---------------------------------------------------------------------------// 

//-------------------------Final Out matrix decoder--------------------------//
int o;
task write_back();
if (output_we) begin
for (o=0;o<num_of_outs;o++) begin
  gcn_out_memory [output_addr [o]] = y[o];
end
end
endtask
//---------------------------------------------------------------------------//

//-------------------------Final Aggregated Out matrix decoder---------------//
int q;
task write_back_aggregation();
if (output_we) begin
for (q=0;q<num_of_outs;q++) begin
  Aggregated_matrix_memory [Aggregated_address [0] [6*q+5 -: 6]] [Aggregated_address[1] [6*q+5 -: 6]] = Aggregated_out[q];
end
end
endtask
//---------------------------------------------------------------------------//


