class dice ;
	rand int player1[5];
	rand int player2[5];
	rand int player3[5];
	rand int player4[5];
	rand int player5[5];
	
	constraint c{  foreach(player1[i]) player1[i] inside {[1:6]};}
	constraint c1{ foreach(player2[i]) player2[i] inside {[1:6]};}
	constraint c2{ foreach(player3[i]) player3[i] inside {[1:6]};}
	constraint c3{ foreach(player4[i]) player4[i] inside {[1:6]};}
	constraint c4{ foreach(player5[i]) player5[i] inside {[1:6]};}
endclass
module test;
	dice obj;
	int temp_sum[5];
	int max;
	int winner;
	initial begin
		obj=new();
		assert(obj.randomize());
		$display("player1 values %p ",obj.player1);
		$display("player2 values %p ",obj.player2);
		$display("player3 values %p ",obj.player3);
		$display("player4 values %p ",obj.player4);
		$display("player5 values %p ",obj.player5);
		
		$display("========================================================");
		
		//$display("player1 sum %0d ",obj.temp_sum1);
		 $display("Player1 sum = %0d", obj.player1.sum());
		 
		// $display("Player1 sum = %0d", obj.player1.sum() with (int'(item)));
		$display("player2 sum %0d ",obj.player2.sum());
		$display("player3 sum %0d ",obj.player3.sum());
		$display("player4 sum %0d ",obj.player4.sum());
		$display("player5 sum %0d ",obj.player5.sum());
		
		$display("========================================================");
		
		temp_sum[0]=obj.player1.sum();
		temp_sum[1]=obj.player2.sum();
		temp_sum[2]=obj.player3.sum();
		temp_sum[3]=obj.player4.sum();
		temp_sum[4]=obj.player5.sum();
		
		max=0;
		winner=1;
		foreach( temp_sum[i])
			begin
				if(temp_sum[i]>max)
					begin
					max=temp_sum[i];
					winner=i+1;
					end
				end	
					$display("winner is player%0d sum is %d",winner,max);
			
	
	end
endmodule







========================================



class dice;

  rand int player[5][5];

  constraint c {
    foreach(player[i,j])
      player[i][j] inside {[1:6]};
  }

endclass


module test;

  dice obj;
  int sum[5];
  int max;
  int winner;

  initial begin
    obj = new();
    assert(obj.randomize());

    // Print values
    foreach(obj.player[i]) begin
      $display("Player%0d values = %p", i+1, obj.player[i]);
      sum[i] = obj.player[i].sum();
      $display("Player%0d Sum = %0d", i+1, sum[i]);
    end

    $display("====================================");

    // Find highest
    max = sum[0];
    winner = 1;

    foreach(sum[i]) begin
      if(sum[i] > max) begin
        max = sum[i];
        winner = i+1;
      end
    end

    $display("Winner is Player%0d with Sum = %0d", winner, max);

  end

endmodule

