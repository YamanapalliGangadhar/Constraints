//Write a SystemVerilog constraint for a 3-column matrix such that:
//The last column is greater than the first column for every row.
//The middle column is greater than the last column for every row.
class matrix_row_c;
				rand bit [4:0] a[3][3];
				constraint c{unique{a};}
				constraint c1{
							  foreach(a[i,j])
								  foreach(a[n,k])
								  	if(j>k)
									  	if((j==2)&&(k==1))
										      a[i][j]<a[n][k];
										  else
										    a[i][j]>a[n][k];		
						        }
			endclass
			
			module test ;
				matrix_row_c obj;
				initial begin 
					obj=new();
					assert(obj.randomize());
						foreach (obj.a[i,j])
							begin
								$write("%04d",obj.a[i][j]);
								if(j==2)
								$display("");
							end
				end
			endmodule
			
