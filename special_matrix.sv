//Q10. Write a constraint ensuring the sum of each row , columns and diagnols must be exactly 15.
			
			class matrix_row_c;
				rand bit [4:0] a[3][3];
				constraint c1{
							  foreach(a[i])
									 (a[i][0]+a[i][1]+a[i][2])==15; // sum of the elements in the row is 15 
								foreach(a[j])
										 (a[0][j]+a[1][j]+a[2][j])==15; //sum of the elements in the column is 15 
								foreach (a[0][j]){
									(a[0][j] + a[1][j] + a[2][j]) == 15; 		// sum of the elements in the diagonals is 15
									j==2-> (a[0][j]) +(a[1][1])+(a[j][0])==15;
									}
						    }
			endclass
			
			module test ;
				matrix_row_c obj;
				
				initial begin 
				
					obj=new();
					repeat(5) begin
					assert(obj.randomize());
						foreach (obj.a[i,j])
							begin
								$write("%04d",obj.a[i][j]);
								if(j==2)
								$display("");
								
							end
							$display("====================================");
						end
				end
			endmodule
