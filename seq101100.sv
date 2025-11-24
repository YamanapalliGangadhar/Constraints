// 1 0 1 1 0 0 1 1 1 0 0 0

class test ;
	rand int a[];

		constraint c{
				a.size==12; 
				foreach(a[i])
					{
						if(i<2)
							{
							if(i==0)
								a[i]==1;
								else
								a[i]==0;
							}
						if(i>1 && i<6)	
							{
							if(i%4>=2)
								a[i]==1;
							else
								a[i]==0;
							}
						if(i>5 && i<=11)
							{
							if(i%6<3)
								a[i]==1;
							else
								a[i]==0;
							}
					}
					}
endclass
module test1;
	test obj;
	initial begin
		obj=new();
		assert(obj.randomize());
		$display("the values are:%p",obj.a);
	end
endmodule


//==========================================================================OPTIONAL================================================================================//

	class test;
		int da[12];
		int i,x=0;

	function post();
		 
	while(i<$size(da)) 
		begin
		for(int j=0;j<=x;j++)
			begin
				da[i]=1;
				i++;
			end

		for(int j=0;j<=x;j++)
			begin
				da[i]=0;
				i++;			
			end
		x++;	
	end
	endfunction

	endclass

	module test1;
		test obj;
		initial begin
			obj=new();
			obj.post();
		$display("the values are :%p ",obj.da);
		end
	endmodule
