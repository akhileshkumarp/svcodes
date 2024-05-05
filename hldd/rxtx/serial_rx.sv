module serial_rx(serial_if.rx_mp rx_if);
  
  typedef enum logic[2:0]{
    S_IDLE  = 3'b000,
    S_START = 3'b001,
    S_DATA  = 3'b010,
    S_STOP  = 3'b011
  } fsm_state_t;
  
  fsm_state_t curr_state;
  fsm_state_t next_state;
  
  logic [1:0] count;
  logic       serial_d;
  
  always_ff @(posedge rx_if.clk)begin
    if(rx_if.rst)begin
      curr_state <= S_IDLE;
    end else begin
      curr_state <= next_state;
    end
  end
  
  always_comb begin
    case(curr_state)
    
      S_IDLE : begin
        if(!rx_if.serial && serial_d)begin
          next_state = S_START;
        end else begin
          next_state = S_IDLE;
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
  
  always_ff@(posedge rx_if.clk) begin
    if(rx_if.rst)begin
      rx_if.ready      <= 1'b1; // Ideally Ready
      rx_if.data_out   <= 4'h0;
      rx_if.valid_out  <= 1'b0;
      count            <= 2'h0;
      serial_d         <= 1'b0;
    end else begin
      serial_d <= rx_if.serial;
      case(curr_state)
    
        S_IDLE : begin
          rx_if.ready     <= 1'b1;
          rx_if.valid_out <= 1'b0;
        end
      
        S_START : begin
          rx_if.ready <= 1'b0;
          //rx_if.data_out <= {rx_if.serial, rx_if.data_out[3:1]};
        end
      
        S_DATA : begin
          rx_if.ready <= 1'b0;
          rx_if.data_out <= {serial_d, rx_if.data_out[3:1]};
          count    <= count + 1'b1;
        end
      
        S_STOP : begin
          rx_if.ready <= 1'b0;
          rx_if.valid_out <= 1'b1;
        end
      endcase
    end
  end

endmodule
