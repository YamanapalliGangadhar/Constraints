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

// OUTOUT  :=> 99.6 99.9 99.5 99.8 99.4 99.1 99 99.3 100 99.7
