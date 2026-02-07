class test ;
	rand bit [7:0]a;
	rand bit [3:0]b;
			constraint c{ b inside {3,5,7};}
									constraint c1	{ 
										if (b==3)
											$countones(a)==4;
										else if (b==5)
											$countones(a)==6;
										else
											$countones(a)==8;
										}
						
endclass

module test1;
	test t;
	
		initial begin
			t=new();
				repeat(5) begin
				assert(t.randomize());
				$display("the value of B is %d: ",t.b);
				$display("the values are :%b",t.a);
				$display("*************************************");
				end
		end
endmodule
