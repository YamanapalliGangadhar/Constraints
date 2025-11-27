// 0 0 1 0 0 2 0 0 3 0 0 4 ..............		
	class pattern ;
						rand bit[3:0] a[20];
							constraint c{ foreach(a[i]){
														if(i%3<2)
														a[i]==0;
														else
														a[i]==((i+3)/3);
														}
										}
					endclass
					
					module test ;
						pattern obj;
						initial  begin 
							obj=new();
							assert (obj.randomize());
							$display("%p",obj.a);
						end
	endmodule
