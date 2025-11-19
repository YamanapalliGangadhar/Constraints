class unique_matrix;
		rand bit[5:0] a[5][5];
		
		
	
		constraint c1{unique{a};}
endclass

module test;
	unique_matrix obj;
	
	initial begin 
			obj=new(); 
			assert(obj.randomize());
			foreach(obj.a[i,j])
			begin
				$write("%04d",obj.a[i][j]);
				if(j==4)
				$display("");
			end
	end
endmodule

/*
class unique_matrix;
  rand int a[5][5];

  // Range constraint
  constraint c {
    foreach (a[i,j])
      a[i][j] inside {[1:50]};
  }

  //  unique values
  constraint c1 {
    foreach (a[i,j])
      foreach (a[n,k])
	  if({i,j}!= {n,k})
         a[i][j] != a[n][k];
  }
endclass


module test;
  unique_matrix obj;
  
  initial begin 
    obj = new(); 
    assert(obj.randomize());
    foreach (obj.a[i,j]) begin
      $write("%04d ", obj.a[i][j]);
      if (j == 4)
        $display("");
    end
  end
endmodule
 */
