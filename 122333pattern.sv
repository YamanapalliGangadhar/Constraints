class test;
				rand int a[];
				rand int n;
				
				constraint c1{ n inside{ [3:8] }; }
				constraint c2{ a.size== n * (n + 1) / 2; }
				
			function void post_randomize();
				int index=0;
				for(int i=1;i<=n;i++)
					for(int j=0;j<i;j++)
						begin
							a[index]=i;
							index++;
						end
			endfunction
			
			endclass
	module top;
		test obj;
		initial
			begin
			obj=new;
			assert(obj.randomize());
				$display("%0p ",obj.a);
					end
	endmodule
