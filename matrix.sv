// write a constraint that has to generate 3X3 matrix , diagnol elements has to print multiples of 3, upper triangle  has to print multiples of 9 and lower triangle has to print multiples of 5  


class matrix;
	rand int a[3][3];
		
		constraint c{
						foreach (a[i,j])
								{
									a[i][j] inside{[2:100]};
									 i=j -> a[i][j]==i%3;
									 i<j -> a[i][j]==i%5;
									 i>j -> a[i][j]==i%9;
									}
					}
endclass

	module test;
			matrix obj;
			initial begin
				obj=new();
		assert(obj.randomize());
			foreach(obj.a[i,j])
					begin
						$write("%0d",obj.a[i][j]);
						if(i==2)
						$display("");
					end
			end
	endmodule
