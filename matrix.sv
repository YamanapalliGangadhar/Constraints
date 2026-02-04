class matrix;
	rand int a[3][3];
		//constraint c0{a.unique();}
		constraint c{
						foreach (a[i,j])
								{
									a[i][j] inside{[2:50]};
									 i==j -> a[i][j]%3==0;
									 i<j -> a[i][j]%5==0;
									 i>j -> a[i][j]%9==0;
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
						$write("%10d",obj.a[i][j]);
						if(j==2)
						$display("");
					end
			end
	endmodule
