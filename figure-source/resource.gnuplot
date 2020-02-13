set term pdf size 4.5,2.9 font ',15' truecolor enhanced
set output "resource-fig-bw.pdf"
set xlabel "Bandwidth (Mbps)"
set xrange [0:400]
set xtics 0, +100
set ylabel "Throughput (tps)"
set yrange [0:80000]
set ytics 20000, +20000 nomirror
set format y "%.0t{/Symbol \264}10^%T"
set y2label "Confirmation Latency (s)"
set y2range [0:120]
set y2tics 30, +30 nomirror
set key right bottom box
plot "bandwidth.txt" using 1:3 with linespoints ps 0.5 title "Throughput" axis x1y1, \
     "bandwidth.txt" using 1:2 with linespoints ps 0.5 title "Confirmation Latency" axis x1y2

set term pdf size 4.5,2.9 font ',15' truecolor enhanced
set output "resource-fig-cpu.pdf"
set xlabel "#Cores"
set xrange [0:16]
set xtics 0, +2
set ylabel "Throughput (tps)"
unset y2label
unset y2tics
set ytics 20000, +20000 mirror
unset key
plot "perf-normal.txt" using 1:2 with linespoints ps 1.5 lw 2 notitle
