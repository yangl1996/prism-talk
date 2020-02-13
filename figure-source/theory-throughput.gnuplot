set term pdf size 4.5,2.9 enhanced font ",16"
set output "theory-throughput.pdf"

f(x) = 1 - x
g_right(x) = (1 - 2 * x) / (5 * x)
g_left(x) = (1 - 1 / 2.71828) * (1 - x)
g(x) = x > 0.224698 ? g_right(x) : g_left(x)

set xlabel "Adversary Power {/Symbol b}"
set ylabel "Throughput"
set format y "%g%%"
set xrange [0:0.5]
set yrange [0:1.2]
set ytics ("C" 1, "0" 0)
set xtics ("0.5" 0.5, "0.25" 0.25)
set key right top nobox
set label "Bitcoin" right at 0.49,0.0082 point ps 1.5 pt 2 lc 7 lw 3 offset -0.5,1
plot f(x) title "Prism" with lines lw 3, \
     g(x) title "Nakamoto" with lines lw 3
