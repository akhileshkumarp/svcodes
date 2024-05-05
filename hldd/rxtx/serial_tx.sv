module serial_tx(serial_if.tx_mp tx_if);

  typedef enum logic[2:0]{
    S_IDLE  = 3'b000,
    S_WAIT  = 3'b001,
    S_START = 3'b010,
    S_DATA  = 3'b011,
    S_STOP  = 3'b100
  } fsm_state_t;
  
  fsm_state_t curr_state;
  fsm_state_t next_state;
  
  logic [3:0] data ;
  logic [1:0] count;
  
  always_ff @(posedge tx_if.clk)begin
    if(tx_if.rst)begin
      curr_state <= S_IDLE;
    end else begin
      curr_state <= next_state;
    end
  end
  
  always_comb begin
    case(curr_state)
    
      S_IDLE : begin
        if(tx_if.ready && tx_if.valid_in)begin
          next_state = S_WAIT;
        end else begin
          next_state = S_IDLE;
        end
      end
      
      S_WAIT : begin
        if(count >= 2'd1)begin
          next_state = S_START;
        end else begin
          next_state = S_WAIT;
        end
      end
      
      S_START : begin
        next_state = S_DATA;
      end
      
      S_DATA : begin
        if(count >= 2'd3)begin
          next_state = S_STOP;
        end else begin
          next_state = S_DATA;
        end
      end
      
      S_STOP : begin
        next_state = S_IDLE;
      end
    endcase
  end
  
  always_ff@(posedge tx_if.clk) begin
    if(tx_if.rst)begin
      tx_if.serial <= 1'b1; // Ideally high
      tx_if.busy_out   <= 1'b0;
      count      <= 2'h0;
      data       <= 4'h0;
    end else begin
      case(curr_state)
    
        S_IDLE : begin
          tx_if.serial <= 1'b1; // Ideally high
          tx_if.busy_out   <= 1'b0;
        end
        
        S_WAIT : begin
          count <= count + 1'b1;
        end
      
        S_START : begin
          data       <= tx_if.data_in;
          tx_if.serial <= 1'b0; // Start Bit
          tx_if.busy_out   <= 1'b1;
          count      <= 4'h0;
        end
      
        S_DATA : begin
          tx_if.serial <= data[0];
          data       <= {data[0], data[3:1]};
          count      <= count + 1'b1;
        end
      
        S_STOP : begin
          tx_if.serial <= 1'b1; // Stop Bit
        end
      endcase
    end
  end

endmodule
