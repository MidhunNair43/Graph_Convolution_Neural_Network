// module for feature transformation (feature_mat x weight_mat matrix multiplication)

module feature_transform 
    #(parameter num_of_rows = 6,
    parameter num_of_cols = 96)
    (input clk,
     input trans_start,
     input [num_of_rows_fm-1:0] [num_of_elements_in_row*BW-1:0] row_features,
     input [num_of_rows_wm-1:0] [num_of_elements_in_row*BW-1:0] row_weights,
     output logic [15:0] trans_feat_mat [5:0][2:0], // modified from [num_of_rows_fm-1]
     output logic trans_d,
     input logic [2:0] row,
     input logic [1:0] col,
     input logic [4:0] count); 
     
     logic[31:0] a1, a2, a3, a4, a5, a6, a7, a8;
     logic trans_delay;
      //int row=0,col=0;
always_comb begin
	   //if(row<3'd6 && col==2'd2)
        if(trans_start && count>=5) begin
        //row=0; col=0;
           // for(int j=0; j<num_of_rows_fm*num_of_rows_wm; j=j+1) begin
               // row=j/num_of_rows_wm; col=j%num_of_rows_wm;
                //for(int col=0; col<num_of_rows_wm; col++) begin  
                   // $display("row features-%d", row_features);
                    /*$display("%d %d %d", trans_feat_mat[0][0], trans_feat_mat[0][1], trans_feat_mat[0][2]);
                    $display("%d %d %d", trans_feat_mat[1][0], trans_feat_mat[1][1], trans_feat_mat[1][2]);
                    $display("%d %d %d", trans_feat_mat[2][0], trans_feat_mat[2][1], trans_feat_mat[2][2]);
                    $display("%d %d %d", trans_feat_mat[3][0], trans_feat_mat[3][1], trans_feat_mat[3][2]);
                    $display("%d %d %d", trans_feat_mat[4][0], trans_feat_mat[4][1], trans_feat_mat[4][2]);
                    $display("%d %d %d", trans_feat_mat[5][0], trans_feat_mat[5][1], trans_feat_mat[5][2]);
                    $display("row: %d", row);
                    $display("col: %d", col);
                    $display("Display before multiplication");
                    $display("row_features-%d",row_features);
                    $display("row_weights-%d",row_weights);*/
                    //for(int i=0; i<num_of_elements_in_row; i++) begin
//a1=(row_features[0][4:0] * row_weights[0][4:0])+ (row_features[0][9:5] * row_weights[0][9:5]) + (row_features[0][14:10] * row_weights[0][14:10])+(row_features[0][19:15] *row_weights[0][19:15]);
                       
//b=(row_features[0][14:10] * row_weights[0][14:10])+(row_features[0][19:15] * row_weights[0][19:15])+(row_features[0][24:20] * row_weights[0][24:20])+(row_features[0][29:25] * row_weights[0][29:25]);
                        
//c=                        

//trans_feat_mat[row][col] = a+b;


a1 = (row_features[0][4:0] * row_weights[0][4:0])  + (row_features[0][9:5] * row_weights[0][9:5]) + (row_features[0][14:10] * row_weights[0][14:10])+ (row_features[0][19:15] * row_weights[0][19:15])+ (row_features[0][24:20] * row_weights[0][24:20]) + (row_features[0][29:25] * row_weights[0][29:25]) + (row_features[0][34:30] * row_weights[0][34:30])+ (row_features[0][39:35] * row_weights[0][39:35])+ (row_features[0][44:40] * row_weights[0][44:40]) + (row_features[0][49:45] * row_weights[0][49:45])  + (row_features[0][54:50] * row_weights[0][54:50]) + (row_features[0][59:55] * row_weights[0][59:55]);
a2 = (row_features[0][64:60] * row_weights[0][64:60])  + (row_features[0][69:65] * row_weights[0][69:65]) + (row_features[0][74:70] * row_weights[0][74:70])+ (row_features[0][79:75] * row_weights[0][79:75])+ (row_features[0][84:80] * row_weights[0][84:80]) + (row_features[0][89:85] * row_weights[0][89:85]) + (row_features[0][94:90] * row_weights[0][94:90])+ (row_features[0][99:95] * row_weights[0][99:95])+ (row_features[0][104:100] * row_weights[0][104:100]) + (row_features[0][109:105] * row_weights[0][109:105])  + (row_features[0][114:110] * row_weights[0][114:110]) + (row_features[0][119:115] * row_weights[0][119:115]);
a3 = (row_features[0][124:120] * row_weights[0][124:120])  + (row_features[0][129:125] * row_weights[0][129:125]) + (row_features[0][134:130] * row_weights[0][134:130])+ (row_features[0][139:135] * row_weights[0][139:135])+ (row_features[0][144:140] * row_weights[0][144:140]) + (row_features[0][149:145] * row_weights[0][149:145]) + (row_features[0][154:150] * row_weights[0][154:150])+ (row_features[0][159:155] * row_weights[0][159:155])+ (row_features[0][164:160] * row_weights[0][164:160]) + (row_features[0][169:165] * row_weights[0][169:165])  + (row_features[0][174:170] * row_weights[0][174:170]) + (row_features[0][179:175] * row_weights[0][179:175]);
a4 = (row_features[0][184:180] * row_weights[0][184:180])  + (row_features[0][189:185] * row_weights[0][189:185]) + (row_features[0][194:190] * row_weights[0][194:190])+ (row_features[0][199:195] * row_weights[0][199:195])+ (row_features[0][204:200] * row_weights[0][204:200]) + (row_features[0][209:205] * row_weights[0][209:205]) + (row_features[0][214:210] * row_weights[0][214:210])+ (row_features[0][219:215] * row_weights[0][219:215])+ (row_features[0][224:220] * row_weights[0][224:220]) + (row_features[0][229:225] * row_weights[0][229:225])  + (row_features[0][234:230] * row_weights[0][234:230]) + (row_features[0][239:235] * row_weights[0][239:235]);	
a5 = (row_features[0][244:240] * row_weights[0][244:240])  + (row_features[0][249:245] * row_weights[0][249:245]) + (row_features[0][254:250] * row_weights[0][254:250])+ (row_features[0][259:255] * row_weights[0][259:255])+ (row_features[0][264:260] * row_weights[0][264:260]) + (row_features[0][269:265] * row_weights[0][269:265]) + (row_features[0][274:270] * row_weights[0][274:270])+ (row_features[0][279:275] * row_weights[0][279:275])+ (row_features[0][284:280] * row_weights[0][284:280]) + (row_features[0][289:285] * row_weights[0][289:285])  + (row_features[0][294:290] * row_weights[0][294:290]) + (row_features[0][299:295] * row_weights[0][299:295]);
a6 = (row_features[0][304:300] * row_weights[0][304:300])  + (row_features[0][309:305] * row_weights[0][309:305]) + (row_features[0][314:310] * row_weights[0][314:310])+ (row_features[0][319:315] * row_weights[0][319:315])+ (row_features[0][324:320] * row_weights[0][324:320]) + (row_features[0][329:325] * row_weights[0][329:325]) + (row_features[0][334:330] * row_weights[0][334:330])+ (row_features[0][339:335] * row_weights[0][339:335])+ (row_features[0][344:340] * row_weights[0][344:340]) + (row_features[0][349:345] * row_weights[0][349:345])  + (row_features[0][354:350] * row_weights[0][354:350]) + (row_features[0][359:355] * row_weights[0][359:355]);
a7 = (row_features[0][364:360] * row_weights[0][364:360])  + (row_features[0][369:365] * row_weights[0][369:365]) + (row_features[0][374:370] * row_weights[0][374:370])+ (row_features[0][379:375] * row_weights[0][379:375])+ (row_features[0][384:380] * row_weights[0][384:380]) + (row_features[0][389:385] * row_weights[0][389:385]) + (row_features[0][394:390] * row_weights[0][394:390])+ (row_features[0][399:395] * row_weights[0][399:395])+ (row_features[0][404:400] * row_weights[0][404:400]) + (row_features[0][409:405] * row_weights[0][409:405])  + (row_features[0][414:410] * row_weights[0][414:410]) + (row_features[0][419:415] * row_weights[0][419:415]);
a8 = (row_features[0][424:420] * row_weights[0][424:420])  + (row_features[0][429:425] * row_weights[0][429:425]) + (row_features[0][434:430] * row_weights[0][434:430])+ (row_features[0][439:435] * row_weights[0][439:435])+ (row_features[0][444:440] * row_weights[0][444:440]) + (row_features[0][449:445] * row_weights[0][449:445]) + (row_features[0][454:450] * row_weights[0][454:450])+ (row_features[0][459:455] * row_weights[0][459:455])+ (row_features[0][464:460] * row_weights[0][464:460]) + (row_features[0][469:465] * row_weights[0][469:465])  + (row_features[0][474:470] * row_weights[0][474:470]) + (row_features[0][479:475] * row_weights[0][479:475]);


                        
trans_feat_mat[row][col] = {a1+a2+a3+a4+a5+a6+a7+a8 };
                        
                        /*trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][4:0] * row_weights[0][4:0]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][9:5] * row_weights[0][9:5]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][14:10] * row_weights[0][14:10]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][19:15] * row_weights[0][19:15]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][24:20] * row_weights[0][24:20]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][29:25] * row_weights[0][29:25]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][34:30] * row_weights[0][34:30]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][39:35] * row_weights[0][39:35]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][44:40] * row_weights[0][44:40]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][49:45] * row_weights[0][49:45]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][54:50] * row_weights[0][54:50]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][59:55] * row_weights[0][59:55]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][64:60] * row_weights[0][64:60]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][69:65] * row_weights[0][69:65]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][74:70] * row_weights[0][74:70]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][79:75] * row_weights[0][79:75]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][84:80] * row_weights[0][84:80]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][89:85] * row_weights[0][89:85]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][94:90] * row_weights[0][94:90]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][99:95] * row_weights[0][99:95]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][104:100] * row_weights[0][104:100]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][109:105] * row_weights[0][109:105]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][114:110] * row_weights[0][114:110]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][119:115] * row_weights[0][119:115]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][124:120] * row_weights[0][124:120]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][129:125] * row_weights[0][129:125]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][134:130] * row_weights[0][134:130]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][139:135] * row_weights[0][139:135]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][144:140] * row_weights[0][144:140]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][149:145] * row_weights[0][149:145]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][154:150] * row_weights[0][154:150]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][159:155] * row_weights[0][159:155]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][164:160] * row_weights[0][164:160]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][169:165] * row_weights[0][169:165]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][174:170] * row_weights[0][174:170]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][179:175] * row_weights[0][179:175]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][184:180] * row_weights[0][184:180]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][189:185] * row_weights[0][189:185]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][194:190] * row_weights[0][194:190]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][199:195] * row_weights[0][199:195]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][204:200] * row_weights[0][204:200]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][209:205] * row_weights[0][209:205]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][214:210] * row_weights[0][214:210]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][219:215] * row_weights[0][219:215]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][224:220] * row_weights[0][224:220]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][229:225] * row_weights[0][229:225]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][234:230] * row_weights[0][234:230]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][239:235] * row_weights[0][239:235]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][244:240] * row_weights[0][244:240]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][249:245] * row_weights[0][249:245]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][254:250] * row_weights[0][254:250]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][259:255] * row_weights[0][259:255]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][264:260] * row_weights[0][264:260]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][269:265] * row_weights[0][269:265]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][274:270] * row_weights[0][274:270]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][279:275] * row_weights[0][279:275]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][284:280] * row_weights[0][284:280]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][289:285] * row_weights[0][289:285]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][294:290] * row_weights[0][294:290]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][299:295] * row_weights[0][299:295]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][304:300] * row_weights[0][304:300]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][309:305] * row_weights[0][309:305]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][314:310] * row_weights[0][314:310]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][319:315] * row_weights[0][319:315]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][324:320] * row_weights[0][324:320]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][329:325] * row_weights[0][329:325]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][334:330] * row_weights[0][334:330]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][339:335] * row_weights[0][339:335]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][344:340] * row_weights[0][344:340]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][349:345] * row_weights[0][349:345]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][354:350] * row_weights[0][354:350]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][359:355] * row_weights[0][359:355]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][364:360] * row_weights[0][364:360]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][369:365] * row_weights[0][369:365]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][374:370] * row_weights[0][374:370]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][379:375] * row_weights[0][379:375]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][384:380] * row_weights[0][384:380]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][389:385] * row_weights[0][389:385]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][394:390] * row_weights[0][394:390]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][399:395] * row_weights[0][399:395]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][404:400] * row_weights[0][404:400]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][409:405] * row_weights[0][409:405]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][414:410] * row_weights[0][414:410]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][419:415] * row_weights[0][419:415]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][424:420] * row_weights[0][424:420]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][429:425] * row_weights[0][429:425]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][434:430] * row_weights[0][434:430]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][439:435] * row_weights[0][439:435]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][454:450] * row_weights[0][454:450]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][459:455] * row_weights[0][459:455]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][464:460] * row_weights[0][464:460]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][469:465] * row_weights[0][469:465]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][474:470] * row_weights[0][474:470]);
                        trans_feat_mat[row][col] = trans_feat_mat[row][col] + (row_features[0][479:475] * row_weights[0][479:475]); */
                        //$display(row_features[0][0 * 5 + 4 -:5], row_weights[0][0 * 5 + 4 -:5]);
                       //$display("row_features-%d",row_features[0][i * 5 + 4 -:5]);
                       //$display("row_weights-%d",row_weights[0][i * 5 + 4 -:5]);
                       // row=row+1; col=col+1;
                   //$display("transform-%d", trans_feat_mat[row][col]);
                    //$display("row: %d", row);
                    //$display("col: %d", col);
                    //end
                    $display("row_features-%d",row_features);
                    $display("row_weights-%d",row_weights);
                    $display("%d %d %d", trans_feat_mat[0][0], trans_feat_mat[0][1], trans_feat_mat[0][2]);
                    $display("%d %d %d", trans_feat_mat[1][0], trans_feat_mat[1][1], trans_feat_mat[1][2]);
                    $display("%d %d %d", trans_feat_mat[2][0], trans_feat_mat[2][1], trans_feat_mat[2][2]);
                    $display("%d %d %d", trans_feat_mat[3][0], trans_feat_mat[3][1], trans_feat_mat[3][2]);
                    $display("%d %d %d", trans_feat_mat[4][0], trans_feat_mat[4][1], trans_feat_mat[4][2]);
                    $display("%d %d %d", trans_feat_mat[5][0], trans_feat_mat[5][1], trans_feat_mat[5][2]);
                    $display("row: %d", row);
                    $display("col: %d", col);
                  if(row==3'd5 && col==2'd2)
                   trans_delay <= 1'b1;         
                    else
                    begin
                   //trans_feat_mat[row][col] = 'd0;
                   //trans_delay<=1'b0;
                   trans_delay<=1'b0;
                   end
                    end
                else
                begin
                trans_feat_mat[0][0] = 0  ;
                trans_feat_mat[0][1] = 0  ;
                trans_feat_mat[0][2] = 0  ;
                trans_feat_mat[1][0] = 0  ;
                trans_feat_mat[1][1] = 0  ;
                trans_feat_mat[1][2] = 0  ;
                trans_feat_mat[2][0] = 0  ;
                trans_feat_mat[2][1] = 0  ;
                trans_feat_mat[2][2] = 0  ;
                trans_feat_mat[3][0] = 0  ;
                trans_feat_mat[3][1] = 0  ;
                trans_feat_mat[3][2] = 0  ;
                trans_feat_mat[4][0] = 0  ;
                trans_feat_mat[4][1] = 0  ;
                trans_feat_mat[4][2] = 0  ;
                trans_feat_mat[5][0] = 0  ;
                trans_feat_mat[5][1] = 0  ;
                trans_feat_mat[5][2] = 0  ;
                end
                trans_d <= trans_delay;
               end
                
            //end 

           
            //for(int i=0;i<6;i++);
            //begin
           // $display("%d %d %d", trans_feat_mat[i][0], trans_feat_mat[i][1], trans_feat_mat[i][2]);
            //$display("\n");
           // trans_d = 1'b1;
            //end
            
    //end
    
           
endmodule
                
                                           
                                     
