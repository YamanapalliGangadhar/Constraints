//001100110011 or 110011001100
class test;
	rand bit[9:0]a;
	bit b;
			constraint c1 {
							foreach (a[i])
								{ a[i] inside {[0:1]};
									if(b)
										{ if(i==0)
											a[i]==0;
											else
												{
												if(i%2==0)
													a[i]==~a[i-1];	
												else
													a[i]==a[i-1];
												}		
										}
										else{
											if(i==0)
												a[i]==1;
											else
												{
												if(i%2==0)
													a[i]==~a[i-1];	
												else
													a[i]==a[i-1];
												}
											}		
								}
							}
endclass
	module test1;
		test obj;
		initial begin
				obj =new();
				repeat (5)
				begin
					assert(obj.randomize());
					$display("%b",obj.b);
					$display("%b",obj.a);
					$display("===================");

				end
		end
	endmodule
