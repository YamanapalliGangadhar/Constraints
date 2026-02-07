//9,7,0,3,8,0,6,7,0,0,2
/*
class test;
	rand int a[$]='{9,7,0,3,8,0,6,7,0,0,2};
	  int b[$];
	//int j=0;
	constraint c{
		foreach (a[i])
			if(a[i]!=0)
				b==a;
			else 
				b==1;
			}
	function void post_randomize();
	//	foreach(a[i])
	//		if(a[i]!=0)
	//			b.push_back(a[i]);
	endfunction



endclass

module test1;
	test obj=new();
	initial begin
	//	obj=new();
	assert(obj.randomize());
	$display("the values are :%0p",obj.b);
	end
endmodule


class abc;
	int q[$]='{9,7,0,3,8,0,6,7,0,0,2};
	function void post();
		int index=0;
		foreach(q[i]) begin 
			if(q[i]!=0)
			   begin 
				q[index]=q[i];
				index++;
			   end 
		end 
		for(int j=index;j<$size(q);j++)
			begin 
				q[j]=0;
			end 
				
		
	endfunction 
endclass
module top;
	abc h=new();
	initial 
	begin 
	h.post();
	$display("value of array=%0p",h.q);
	end
endmodule


class test ;
	rand int a[$]='{9,8,4,0,7,0,2,1,0,5,0};
	rand int b[$];

		constraint c{
			//	int index==0; // we cant initialize a new variable 
				foreach(a[i])
					{
					if(a[i]!=0)
					{
					  b[index]==a[i];
						index++; // increment operator will not work 	
						}
					for(j=index;j<$size(a);j=j+1)
						begin
						b[j]==0;
						end
				}
endclass

module test1;
	test obj;
	initial begin
		obj=new();
		assert(obj.randomize());
		$display("the values are:%p",obj.b);
	end
endmodule

// 1 0 1 1 0 0 1 1 1 0 0 0

class test ;
	rand int a[];

		constraint c{
				a.size==12; 
				foreach(a[i])
					{
						if(i<2)
							{
							if(i==0)
								a[i]==1;
								else
								a[i]==0;
							}
						if(i>1 && i<6)	
							{
							if(i%4>=2)
								a[i]==1;
							else
								a[i]==0;
							}
						if(i>5 && i<=11)
							{
							if(i%6<3)
								a[i]==1;
							else
								a[i]==0;
							}
				
					}
					}
endclass
module test1;
	test obj;
	initial begin
		obj=new();
		assert(obj.randomize());
		$display("the values are:%p",obj.a);
	end
endmodule




//1 0 1 1 0 0 1 1 1 0 0 0 .........
	class test;
		int da[12];
		int i,x=0;

	function post();
		 
	while(i<$size(da)) 
		begin
		for(int j=0;j<=x;j++)
			begin
				da[i]=1;
				i++;
			end

		for(int j=0;j<=x;j++)
			begin
				da[i]=0;
				i++;			
			end
		x++;	
	end
	endfunction

	endclass

	module test1;
		test obj;
		initial begin
			obj=new();
			obj.post();
		$display("the values are :%p ",obj.da);
		end
	endmodule
			
		


class test;
	rand bit [31:0]a;
	
	constraint c{
					foreach (a[i]){
							$countones(a)==10;
							a[i]==~a[i+1];
							}}
endclass

module test1;
	test obj;
		initial begin
			obj=new();
			assert(obj.randomize());
			$display("%p",obj.a);
		end
endmodule				

//: 10 elements half should be asending amd seconf half should be descending
	
	class test;
			rand bit [3:0]a[10];
				
					constraint c1{
									foreach (a[i])
											{
												if(i%2==0)
														a[i]%2==1;
												else
														a[i]%2==0;
														}
									}
		endclass
		module test1;
				test t;
			initial begin
				t=new();
					repeat (5) begin
				assert(t.randomize());
					$display("the values is %p",t.a);
					$display("*********************");
								end
				end
		endmodule
			
			
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
			
			// Write a constraint to make all elements of a 3×3 matrix lie between 10 and 20.
			
			class matrix ;
				rand bit[4:0] a[3][3];
				
				constraint c{ foreach (a[i,j])
								a[i][j] inside {[10:20]};		
									}
			endclass
			
			module test;
					matrix obj;
					initial begin
						obj =new();	
						assert(obj.randomize());
					foreach(obj.a[i,j]) 
					begin
						$write("%04d",obj.a[i][j]);
						if(j==2)
						$display("");
					end 
					end
					
			endmodule
			
			
			
			//Q2. Write a constraint so that the first row contains only odd numbers.
			  
			  class odd_matrix ;
				rand bit [4:0] a[3][3];
				
				constraint c{foreach (a[i,j])
								i==0 -> a[i][j] %2==1;}
								
				endclass
				
				module test;
					odd_matrix obj;
					
					initial begin
						obj=new();
						assert(obj.randomize());
						foreach(obj.a[i,j])
							begin
								$write("%04d",obj.a[i][j]);
								if(j==2)
								$display("");
							end
					end
				endmodule
			
			
			//Q3. Write a constraint to ensure the diagonal elements are all zero.
			class matrix;
				rand bit[2:0]a[3][3];
				constraint diagonal_elements{foreach (a[i,j])
											i==j -> a[i][j]==0;}
			endclass
			
			module test ;
				matrix obj;
				initial begin
					obj=new();
					assert(obj.randomize());
					foreach(obj.a[i,j])
						begin
						$write("%04d",obj.a[i][j]);
							if(j==2)
							$display("");
						end
				end
			endmodule
			
		//Q4. Write a constraint so that every row is in ascending order.
			
			class matrix_row_asc;
				rand bit [4:0] a[3][3];
				constraint c{
							  foreach(a[i,j])
								foreach(a[n,k])
									if(j>k)
											a[i][j]>a[n][k];
									
						    }
			endclass
			
			module test ;
				matrix_row_asc obj;
				
				initial begin 
				
					obj=new();
					assert(obj.randomize());
						foreach (obj.a[i,j])
							begin
								$write("%04d",obj.a[i][j]);
								if(j==2)
								$display("");
							end
				end
			endmodule
			
			
	====================================================linkdin=================================================================================	
//				Write a SystemVerilog constraint for a 3-column matrix such that:
//				The last column is greater than the first column for every row.
//              The middle column is greater than the last column for every row.
			class matrix_row_c;
				rand bit [4:0] a[3][3];
				constraint c{unique{a};}
				constraint c1{
							  foreach(a[i,j])
								foreach(a[n,k])
								
									if(j>k)
										if((j==2)&&(k==1))
										a[i][j]<a[n][k];
										else
										a[i][j]>a[n][k];		
						    }
			endclass
			
			module test ;
				matrix_row_c obj;
				
				initial begin 
				
					obj=new();
					assert(obj.randomize());
						foreach (obj.a[i,j])
							begin
								$write("%04d",obj.a[i][j]);
								if(j==2)
								$display("");
							end
				end
			endmodule
			
			
			//Q5. Write a constraint so that each column is in descending order.
			class matrix_row_c;
				rand bit [4:0] a[3][3];
				constraint c1{
							  foreach(a[i,j])
								foreach(a[n,k])
								
									if(i>n)
										
										a[i][j]<a[n][k];
								

									
						    }
			endclass
			
			module test ;
				matrix_row_c obj;
				
				initial begin 
				
					obj=new();
					assert(obj.randomize());
						foreach (obj.a[i,j])
							begin
								$write("%04d",obj.a[i][j]);
								if(j==2)
								$display("");
							end
				end
			endmodule
			
			
			//Q6. Write a constraint so that the last row contains unique elements (no duplicates).
			
			class matrix_row_c;
				rand bit [4:0] a[3][3];
				constraint c1{
							  foreach(a[i,j])
								foreach(a[n,k])
									if(i==2 && n==2 && j>k)
										a[i][j]!=a[n][k];
								

									
						    }
			endclass
			
			module test ;
				matrix_row_c obj;
				
				initial begin 
				
					obj=new();
					assert(obj.randomize());
						foreach (obj.a[i,j])
							begin
								$write("%04d",obj.a[i][j]);
								if(j==2)
								$display("");
							end
				end
			endmodule
			
			
			
			//Q7. Write a constraint that ensures no two elements in the entire matrix are equal
			//(without using unique keyword).
			
			class matrix_row_c;
				rand bit [4:0] a[3][3];
				constraint c1{
							  foreach(a[i,j])
								foreach(a[n,k])
									i>n -> a[i][j]!=a[n][k];
								

									
						    }
			endclass
			
			module test ;
				matrix_row_c obj;
				
				initial begin 
				
					obj=new();
					assert(obj.randomize());
						foreach (obj.a[i,j])
							begin
								$write("%04d",obj.a[i][j]);
								if(j==2)
								$display("");
							end
				end
			endmodule
			
			
			
		//Q8. Write a constraint so that the matrix is symmetric
			//(i.e., a[i][j] == a[j][i]).
			
			class matrix_row_c;
				rand bit [4:0] a[3][3];
				constraint c1{
							  foreach(a[i,j])
									i>j-> a[i][j]==a[j][i];		
						    }
			endclass
			
			module test ;
				matrix_row_c obj;
				
				initial begin 
				
					obj=new();
					repeat(5) begin
					assert(obj.randomize());
						foreach (obj.a[i,j])
							begin
								$write("%04d",obj.a[i][j]);
								if(j==2)
								$display("");
								
							end
							$display("====================================");
						end
				end
			endmodule
			
			//Q9. Write a constraint to make the matrix upper triangular (i.e., all elements where i > j are zero).
			
			class matrix_row_c;
				rand bit [4:0] a[3][3];
				constraint c1{
							  foreach(a[i,j])
									i>j-> a[i][j]==0;
								

									
						    }
			endclass
			
			module test ;
				matrix_row_c obj;
				
				initial begin 
				
					obj=new();
					repeat(5) begin
					assert(obj.randomize());
						foreach (obj.a[i,j])
							begin
								$write("%04d",obj.a[i][j]);
								if(j==2)
								$display("");
								
							end
							$display("====================================");
						end
				end
			endmodule
			
			
			
			 pending 
			Q11. Write a constraint where each element must be greater than the element to its left AND above.
			Q12. Write a constraint to create a Latin-Square pattern
				(each row contains numbers 1–N without repeating, rotated by row index).
				
			
			//Q10. Write a constraint ensuring the sum of each row must be exactly 15.
			
			class matrix_row_c;
				rand bit [4:0] a[3][3];
				constraint c1{
							  foreach(a[i])
									 (a[i][0]+a[i][1]+a[i][2])==15; // sum of the elements in the row is 15 
									 
								foreach(a[j])
										 (a[0][j]+a[1][j]+a[2][j])==15; //sum of the elements in the column is 15 
										 
								foreach (a[0][j]){
									(a[0][0] + a[1][1] + a[2][2]) == 15; 		// sum of the elements in the diagonals is 15
									j==2-> (a[0][j]) +(a[1][1])+(a[j][0])==15;
									}
						    }
			endclass
			
			module test ;
				matrix_row_c obj;
				
				initial begin 
				
					obj=new();
					repeat(5) begin
					assert(obj.randomize());
						foreach (obj.a[i,j])
							begin
								$write("%04d",obj.a[i][j]);
								if(j==2)
								$display("");
								
							end
							$display("====================================");
						end
				end
			endmodule
		
			
					//	Q13.write a constraint to generate a patern 9 7 5 3 1 8 6 4 2 0
					
					class pattern ;
						rand bit[3:0] a[10];
							constraint c{ foreach(a[i]){
											i==0 -> a[i]==9
											i>5 -> a[i]==a[i-1]}
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
					


//1 0 1 1 0 0 1 1 1 0 0 0 .........
	class test;
		int da[12];
		int i,x=0;

	function post();
		 
	while(i<$size(da)) 
		begin
		for(int j=0;j<=x;j++)
			begin
				da[i]=1;
				i++;
			end

		for(int j=0;j<=x;j++)
			begin
				da[i]=0;
				i++;			
			end
		x++;	
	end
	endfunction

	endclass

	module test1;
		test obj;
		initial begin
			obj=new();
			obj.post();
		$display("the values are :%p ",obj.da);
		end
	endmodule
			
			
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
				
//Write a constraint to randomly generate 10 unique numbers between 99 to 100				

			class test ;
						rand int a[10];
						real  b[10];
							constraint  c1{ foreach (a[i])
											a[i] inside {[990:1000]};
											unique {a};
											}
						function void post_randomize();
						foreach(a[i])begin
							b[i]=a[i]/10.0;
							end
						endfunction
					endclass
					
					module test1 ;
						test obj;
						initial  begin 
							obj=new();
							assert (obj.randomize());
						$display(" %0.2p",obj.b);

						end
			endmodule
			
	// pattern  1, 2, 2, 3, 3, 3, 4, 4, 4, 4, . . . . .		
		class test;
				rand int a[];
				rand int n;
				
				constraint c1{ n inside{ [3:8] }; }
				constraint c2{ a.size== n * (n + 1) / 2; }
				
			function void post_randomize();
				int index=0;
				for(int i=1;i<=n;i++)
					begin
					for(int j=0;j<i;j++)
						begin
							a[index]=i;
							index++;
						end
					end
			endfunction
		endclass
		
		module top;
			test obj;
			initial begin
				obj=new;
				assert(obj.randomize());
				$display("%p ",obj.a);
			end
	endmodule

	
	//001100110011 or 110011001100
class test;
	rand bit[9:0]a;
	bit b;
			constraint c0{ b inside {[0:1]} ;}
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
		
		
		class test;
  rand int a[];
  parameter int SIZE = 10;

  constraint c1 { a.size() == SIZE; }

  constraint c_equal_sum {
    foreach (a[i]) {
      if (i < SIZE/2)
        a[i] inside { [0:10] };
      else
        a[i] inside { [0:10] };
    }

    ( a[0] + a[1] + a[2] + a[3] + a[4] ) ==
    ( a[5] + a[6] + a[7] + a[8] + a[9] );
  }

endclass


//even numbers 
class test;
	rand bit [5:0]a[10];
		constraint c{
						foreach(a[i])
							a[i]%2==0;
					}
endclass

module test1;
	test obj;
		initial begin
			obj =new();
			assert(obj.randomize());
			$display("the vslues in the array are : %p",obj.a);
		end
endmodule
*/


class matrix ;
	randc bit[5:0]a[3][3];
	
	constraint c{
					foreach(a[i,j])
						{
						 i==j -> a[i][j]%3==0;
						 i>j ->  a[i][j]%4==0;
						 i<j -> a[i][j]%5==0;
						 }
				}
endclass

module test;
	matrix obj;
	initial begin	
		obj=new();
			assert(obj.randomize());
			foreach(obj.a[i,j])
				begin
					$write("%04d",obj.a[i][j]);
					if(j==2)
						$display("");
				end
	end
endmodule
