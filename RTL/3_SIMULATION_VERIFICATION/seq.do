onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gray90 -height 40 -label clock /tb_seqdet/clock_i
add wave -noupdate -height 40 -label reset /tb_seqdet/areset_ni
add wave -noupdate -color {Green Yellow} -height 40 -label state -radix ascii -radixenum numeric -radixshowbase 0 /tb_seqdet/p_state
add wave -noupdate -color Cyan -height 40 -label input_bit -radix unsigned /tb_seqdet/in_i
add wave -noupdate -color Red -height 40 -label detect /tb_seqdet/out_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {100 ns} 0} {{Cursor 2} {0 ns} 0} {{Cursor 3} {113 ns} 0} {{Cursor 4} {50 ns} 0} {{Cursor 5} {20 ns} 0} {{Cursor 6} {90 ns} 0} {{Cursor 7} {80 ns} 0}
quietly wave cursor active 2
configure wave -namecolwidth 90
configure wave -valuecolwidth 61
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {113 ns}
