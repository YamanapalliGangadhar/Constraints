// generate a pattern that have to generate 12435687


// 1  2  4  3  5  6  8  7


// ================================LOGIC 1=================================================//
		class  test ;
			rand bit[3:0]a[];
			bit [3:0]temp;
				constraint c{ a.size==8;
								foreach (a[i]){
												a[i]==i+1;
												}
							}
		// a[0]=1,a[1]=2,a[2]=3,a[3]=4,a[4]=5,a[5]=6,a[6]=7,a[7]=8 
		function void post_randomize();
				foreach(a[i])
						temp=a[3];
						a[3]=a[2];
						a[2]=temp;
						
						temp=a[7];
						a[7]=a[6];
						a[6]=temp;
						$display("%p",a);
		endfunction
	endclass
	
	module test1;
		test obj;
		initial begin	
				obj=new();
				assert(obj.randomize());
				//$display("%p",obj.a);
				end
	endmodule
	
	
//=======================================================LOCIG 2=======================================================//	
	class test ;
		rand bit [3:0] a[];
			bit [3:0]temp;
			constraint c{ a.size==8;
						foreach (a[i])
								{a[i]==i+1;
									}
						}
			function void post_randomize();
					swap(2,3);
					swap(6,7);
						$display("%p",a);
			endfunction
										// Here i am writing user defined functions for swaping
			function void swap(int i,j);
					temp=a[i];
					a[i]=a[j];
					a[j]=temp;
			endfunction	
	endclass
	
	module test1;
			test obj;
			initial begin	
					obj=new();
					assert(obj.randomize());
					
			end
	endmodule
	
//========================================================LOGIC 3=============================================================//	
	class test ;
		rand bit[3:0] a[];
		
			constraint c{ a.size==8;
							foreach (a[i])
									{
									if(i%4==2)
										a[i]==i+2;  // give the next value
									else if (i%4==3)
											a[i]==i; // gives previous value 
									else
										a[i]==i+1;
										}
						}
		endclass
		module test1;
			test obj;
			initial begin	
					obj=new();
					assert(obj.randomize());
					$display("%p",obj.a);
					
			end
	endmodule
	
		
