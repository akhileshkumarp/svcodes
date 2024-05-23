Day = day1

Command = iverilog -o sim.vvp -Wall -Winfloop -Wno-timescale -gno-shared-loop-index -g2012

compile: clean
	$(Command) -s $(Day) $(Day).sv

sim: clean
	$(Command) -s $(Day)_tb $(Day).sv $(Day)_tb.sv
	./sim.vvp

clean:
	rm -rf sim.vvp