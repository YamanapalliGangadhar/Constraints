//.when the transaction class object is randomized, the value of a should not be same as previous  5 occurrences of the value of a

class transaction;
    rand int a;
    static int q[$];

    // Constraint to avoid last 5 values
    constraint c { foreach (q[i]) { a != q[i]; } };

    function void post_randomize();
        q.push_back(a);
        if (q.size() > 5)
            q.pop_front();
    endfunction
endclass


module test;
    transaction t;
    initial begin
        t = new();
        repeat (10) begin
            if (t.randomize()) begin
                $display("The random value is: %0d", t.a);
                $display("*****************************************");
            end
            else
                $display("Randomization failed!");
        end
    end
endmodule
