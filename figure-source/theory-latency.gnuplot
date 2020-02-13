set term pdf size 4.5,2.9 enhanced font ",16"
set output "theory-latency.pdf"

f_left(x) = 50
f_right(x) = 50 * x
g_right(x) = 5 * x
g_left(x) = 50
g(x) = x > 10 ? g_right(x) : g_left(x)
f(x) = x > 1 ? f_right(x) : f_left(x)

set xlabel "Reliability {/Symbol e}"
set ylabel "Latency"
set xrange [0:20]
set yrange [0:300]
set ytics ("D" 50, "0" 0) nomirror
unset xtics
set key right top nobox
set label "O(1)" at 1.2,180
set label "O(1/m)" at 12,90
plot g(x) title "Prism" with lines lw 3, \
     f(x) title "Nakamoto" with lines lw 3
