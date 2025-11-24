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
