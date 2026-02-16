// write a constraint divisible by 4 without using % operator
class four;
	rand int a;
	constraint c{  a[1:0]==2'b00;
					}
	constraint c1{a inside {[1:100]};}
endclass
module test;
	four obj;
	initial begin
		obj=new(); repeat(5)begin
		assert(obj.randomize());
		$display("%0d",obj.a);
	end end
endmodule 
