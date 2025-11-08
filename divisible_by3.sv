// 	write a constraint to generate numbers divisible by 3	
			class test;
				rand bit[5:0] a;
					constraint c{ a%3==0;}
			endclass
			
			module x;
				test obj;
				initial begin
					repeat(5) begin
					obj =new();
						assert(obj.randomize());
						$display("the values are %d",obj.a);
					end
				end
			endmodule
			
