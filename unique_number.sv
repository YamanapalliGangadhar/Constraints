// generate unique random numbers without using unique keyword and Randc
class unique_numbers;
		rand bit[5:0]a[10];
				
					constraint c{ foreach (a[i])
										{
											if (i !=j)
												a[i]!=a[j];
										}
								}
	endclass
	
	module test ;
			unique_numbers obj;
				initial begin
						obj =new();
						if(obj.randomize())
							$display("the qnique numbers are:%p",obj.a);
							else
							$display("failed");
					end
					
	endmodule
