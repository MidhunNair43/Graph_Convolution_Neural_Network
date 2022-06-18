//---------------Variable Params------------// !!!!! SHOULD BE CHANGED BASED ON DESIGN !!!!!!!!!!
parameter run_time = 1000000;
parameter clk_period = 1000; //In pico seconds
parameter num_of_cols_fm = 96;  // Change to modify the number of cols in feature matrix you can take -- MAX VALUE = 96
parameter num_of_rows_wm = 3;  // Change to modify the number of cols in weight matrix you can take -- MAX_VALUE = 3
parameter num_of_rows_fm = 6;  // Change to modify the number of rows in feature matrix you can take -- MAX_VALUE = 6
parameter num_of_outs = 6;  // Change to modify the number of outpus the design can produce at a time -- MAX_VALUE = 6
parameter cycles_to_finish = 27; // Change to modify the number of cycles it takes for the design to give the final output
//-----------------------------------------//

//---------------Fixed Params--------------// !!!!!!!! NOT MEANT TO BE CHANGED !!!!!!!!!!!!
parameter BW = 5;
parameter num_of_elements_in_col = 6; // For feature matrix
parameter num_of_elements_in_row = 96; // For both features and weights again cause weights are transposed for easier access
parameter num_of_nodes = 6;
parameter bits_to_represent_nodes = $clog2(num_of_nodes);
parameter num_of_rows_in_w_mem = 3;
parameter num_of_rows_in_f_mem = 6; 
//-----------------------------------------//
