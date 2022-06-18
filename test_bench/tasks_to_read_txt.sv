//`include "params.vh"
//---------------------------File variables--------------------//
int fp0,i,j,p;
int fp1,p1;
int fp2,p2;
int fp3,p3;
int fp4,p4;
//-------------------------------------------------------------//


//-----------------Task to get Features--------------------//
task get_features();
fp0=$fopen("./feature.txt","r");
for(j=0;j<num_of_rows_in_f_mem;j++) begin
  for(i=0;i<num_of_elements_in_row;i++) begin
	      p=$fscanf(fp0,"%d\t",Feature_matrix_memory[j][i]);    
end
end
$fclose(fp0);
endtask
//-------------------------------------------------------------//

//-----------------Task to get FA Matrix--------------------//
/*task get_fa_matrix();
fp4=$fopen("./fa_mat.txt","r");
for(j=0;j<num_of_rows_in_f_mem;j++) begin
  for(i=0;i<num_of_elements_in_row;i++) begin
	      p=$fscanf(fp0,"%d\t",Aggregated_matrix_memory_golden[j][i]);    
end
end
$fclose(fp0);
endtask*/
//-------------------------------------------------------------//    

//-----------------Task to get Weights--------------------//
task get_weights();
fp1=$fopen("./Weights.txt","r");
for(j=0;j<num_of_rows_in_w_mem;j++) begin
  for(i=0;i<num_of_elements_in_row;i++) begin
	      p1=$fscanf(fp1,"%d\t",Weight_matrix_memory[j][i]);    
end
end
$fclose(fp1);
endtask
//-------------------------------------------------------------// 
//-------------------------------------------------------------//    

//-----------------Task to get sparse matrix--------------------//
task get_sparse_matrix();
fp2=$fopen("./coo_matrix.txt","r");
for(j=0;j<2;j++) begin
for(i=0;i<num_of_nodes;i++) begin
	p2=$fscanf(fp2,"%d\t",ADJ_matrix_memory[j][i]);       
end
end
$fclose(fp2);
endtask
//-------------------------------------------------------------//    

//-----------------Task to get golden outputs--------------------//
task get_golden_outputs();
fp3=$fopen("./golden_outs.txt","r");
for(i=0;i<num_of_nodes;i++) begin
	p3=$fscanf(fp3,"%d\n",gcn_out_memory_golden[i]);       
end
$fclose(fp3);
endtask
//-------------------------------------------------------------//    


