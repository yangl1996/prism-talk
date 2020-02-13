set term pdf size 4.5,3.0 font ',15' truecolor enhanced
set output "compare-fig-2.pdf"
set logscale y
set logscale x
set xlabel "Latency (s)"
set xrange [1:2500]
set ylabel "Throughput (tps)"
set format y "10^%T"
set key left bottom nobox
set label '{/Symbol b}=20%' at 6,1500 right 
set label '{/Symbol b}=20%' at 120,20 right 
set label '{/Symbol b}=33%' at 820,20 right 
plot "algorand-faster-frontier.txt" using 6:7 with linespoints ps 1.0 lw 1.5 title "Algorand", \
     "bitcoin-faster.txt" using 5:6 with linespoints ps 1.0 lc 2 lw 1.5 pt 2 title "Longest Chain", \
     "bitcoin-secure.txt" using 5:6 with linespoints ps 1.0 lc 2  lw 1.5 pt 2 notitle, \
     "prism-secure.txt" every ::0::1 using 4:5:(sprintf("{/Symbol b}=%02d%%", $2 * 100)) with labels point lc 7 ps 1.5 lw 1.5 right offset -0.7,-0.7 rotate by 45 title "Prism", \
     "bitng-clean.txt" using 2:3:(sprintf("{/Symbol b}=%02d%%", $1)) with labels point ps 1.5 lw 1.5 lc 4 pt 2 right offset -0.7,-0.7 rotate by 45 title "Bitcoin-NG"
