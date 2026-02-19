class four;
	 bit[6:0] a;
	 constraint c{ soft a>15;}
endclass
module test;
	four obj;
	initial begin
		obj=new(); repeat(5)begin
		std::randomize(obj.a) with {obj.a<15;};
		$display("%0d",obj.a);
	end end
endmodule 
