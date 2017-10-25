# Theoretical Average: average die roll of one die multiplied by 3.
AveN = 3 * (sum(1:6) / 6);

# Experimental Averages: [n * 3] die rolls, summed together, then devided by n.
n = 10;
Dsum = 0;
for(i in 1:n){
  D6 = sample(1:6,3);
  Dsum = Dsum + sum(D6);
}
Ave10 = Dsum / n;

n = 25;
Dsum = 0;
for(i in 1:n){
  D6 = sample(1:6,3);
  Dsum = Dsum + sum(D6);
}
Ave25 = Dsum / n;

n = 50;
Dsum = 0;
for(i in 1:n){
  D6 = sample(1:6,3);
  Dsum = Dsum + sum(D6);
}
Ave50 = Dsum / n;

n = 100;
Dsum = 0;
for(i in 1:n){
  D6 = sample(1:6,3);
  Dsum = Dsum + sum(D6);
}
Ave100 = Dsum / n;

# Differences between experimental and theoretical results.
diff10 = abs(Ave10 - AveN);
diff25 = abs(Ave25 - AveN);
diff50 = abs(Ave50 - AveN);
diff100 = abs(Ave100 - AveN);

# Console Outputs...
Ave10
Ave25
Ave50
Ave100
AveN

diff10
diff25
diff50
diff100
