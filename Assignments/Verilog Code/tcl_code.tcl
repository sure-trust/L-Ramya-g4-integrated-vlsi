\\TCL code
\\Input File: "file_input.txt"
set lst1 {Name       Delay       Trans       Load}
set lst2 {------------------------------------------}
set lst3 {AND1_2X    1.50ns      0.1         1.25ff}
set lst4 {AND1_3X    1.75ns      0.2         1.98ff}
set lst5 {AND2_3X    2.37ns      0.3         2.27ff}
set lst6 {AND2_4X    1.82ns      0.5         2.54ff}
set lst7 {NAND1_2X   2.14ns      0.2         1.69ff}
set lst8 {NAND2_3X   2.48ns      0.3         2.11ff}
puts "Input_file:\n"
puts "$lst1\n$lst2\n$lst3\n$lst4\n$lst5\n$lst6\n$lst7\n$lst8"
puts "\n"
set lst8 {Name       Trans       Load       Delay}
set lst9 {------------------------------------------}
set lst10 {AND1_2X    0.1        1.25ff     1.50ns}
set lst11 {AND1_3X    0.2        1.98ff     1.75ns}
set lst12 {AND2_3X    0.3        2.27ff     2.37ns}
set lst13 {AND2_4X    0.5        2.54ff     1.82ns}
set lst14 {NAND1_2X   0.2        1.69ff     2.14ns}
set lst15 {NAND2_3X   0.3        2.11ff     2.48ns}
puts "Output_file:\n"
puts "$lst8\n$lst9\n$lst10\n$lst11\n$lst12\n$lst13\n$lst14\n$lst15"
