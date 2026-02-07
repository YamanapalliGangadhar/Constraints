class test;
	rand bit [31:0]a;
	constraint c2{$countones(a)==10;}
	
							constraint c{foreach(a[i])
						if(i>0)
						(a[i]&a[i-1])!=1;}
endclass

module test1;
	test obj;
		initial begin
			obj=new();
			assert(obj.randomize());
			$display("%b",obj.a);
		end
endmodule
