set term pdf size 2.4,1.8 enhanced font ",16"
set output "mining-rate-security.pdf"

f(x) = 1.0 / (x * 1.5 + 2) * 100

set xlabel "Mining rate / Block size"
set ylabel "Security"
set format y "%g%%"
set xrange [0:50]
set yrange [0:50]
set ytics 0, +25 nomirror
unset xtics
plot f(x) notitle with lines lw 3

