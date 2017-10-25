# Scanning files into variables...
# The assignment problem used values of H = $1 and T = $10
# But this data contains values of 2, 11, and 20?
# I am assuming this data is for two flips at one time...
eSS10 = scan(file="earningsSampleSize10");
eSS100 = scan(file="earningsSampleSize100");
eSS1000 = scan(file="earningsSampleSize1000");
eSS100000 = scan(file="earningsSampleSize10000"); # And this file is the wrong size!

# Experimental Averages of unfair coins
ave10 = sum(eSS10) / 20;
ave100 = sum(eSS100) / 200;
ave1000 = sum(eSS1000) / 2000;
ave100000 = sum(eSS100000) / 200000;

# Theoretical Average of fair coins
#    ave = (pH * $1) + (pT * $10)
aveFair = (0.5 * 1) + (0.5 * 10);
#    ave = (pHH    *   $2) + (2 * (pHT    *   $11)) + (pTT    *   $20)
aveFair2 = (0.5 * 0.5 * 2) + (2 * (0.5 * 0.5 * 11)) + (0.5 * 0.5 * 20);
aveFair2 = aveFair2 / 2;

# ave = (pH * 1) + (pT * 10) --> pT = 1 - pH
# ave = (pH * 1) + ((1 - pH) * 10)
# ave = 1(pH) - 10(pH) + 10
# ave = pH(1 - 10) + 10
# ave = -9(pH) + 10
# pH = (ave - 10) / -9
pH10 = (ave10 - 10) / -9;
pH100 = (ave100 - 10) / -9;
pH1000 = (ave1000 - 10) / -9;
pH100000 = (ave100000 - 10) / -9;
pHFair = (aveFair - 10) / -9;

# Console Output...
ave10
ave100
ave1000
ave100000
aveFair

pH10
pH100
pH1000
pH100000
pHFair