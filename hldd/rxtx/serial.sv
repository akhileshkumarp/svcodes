module serial(serial_if intf);
  
  // Instantiate Serial TX
  serial_tx serial_tx(intf.tx_mp);
  
  // Instantiate Serial RX
  serial_rx serial_rx(intf.rx_mp);

endmodule
