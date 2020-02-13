set term pdf size 4.5,2.9 font ',15' truecolor enhanced

set output "attack-fig-spamming.pdf"
set xlabel "Avg. Added Jitter (s)"
set ylabel "Spam Reduced"
set yrange [0:1]
set ytics 0, +0.2
plot "jitter-clean.txt" using ($2 / 2):(1.0 - $5) with linespoints ps 1.5 lw 2 title ""

set output "attack-fig-censor.pdf"
set xlabel "Adversarial Fraction"
set xrange [0:25]
set xtics 0, +5
set format x "%g%%"
set ylabel "Throughput (tps)"
set yrange [40000:80000]
set ytics 40000, +10000 nomirror
set format y "%.0t{/Symbol \264}10^%T"
set y2label "Confirmation Latency (s)"
set y2range [0:120]
set y2tics 0, +30 nomirror
set key left bottom nobox
plot "attack-censor.txt" using 1:3 with linespoints ps 1 lw 2 title "Throughput" axis x1y1, \
     "attack-censor.txt" using 1:2 with linespoints ps 1 lw 2 title "Confirmation Latency" axis x1y2

set output "attack-fig-balancing.pdf"
set xlabel "Adversarial Fraction"
set xrange [0:25]
set xtics 0, +5
set format x "%g%%"
set ylabel "Throughput (tps)"
set yrange [40000:90000]
set ytics 40000, +10000 nomirror
set format y "%.0t{/Symbol \264}10^%T"
set y2label "Confirmation Latency (s)"
set y2range [0:3000]
set y2tics nomirror autofreq
#set y2tics add ("2600" 2600)
#set log y2
#set key left center box
set key at 0.5,46000 nobox
set label 'Longest Chain Latency' at second 24, 2800 right
set arrow from second 0, 2600 to second 25, 2600  lc 2 lw 2.5 dt 2 nohead front
plot "attack-balance.txt" using 1:3 with linespoints ps 1 lw 2 title "Throughput" axis x1y1, \
     "attack-balance.txt" using 1:2 with linespoints ps 1 lw 2 title "Confirmation Latency" axis x1y2

