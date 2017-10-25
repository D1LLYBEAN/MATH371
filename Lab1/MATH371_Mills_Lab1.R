// Dillon Mills
// MATH 371
// Laboratory 1

//-----// Problem 2 //-----//
// Murder
boxplot(Murder, horizontal = TRUE, xlab = "Murder Arrests", axes = FALSE)
axis(1,at = 0:ceiling(max(Murder)))
axis(2, at = 0:2, labels = FALSE)
title("Murder Arrests Per 100,000 People")
// Assault
boxplot(Assault, horizontal = TRUE, xlab = "Assault Arrests", axes = FALSE)
axis(1,at = 0:ceiling(max(Assault)))
axis(2, at = 0:2, labels = FALSE)
title("Assault Arrests Per 100,000 People")
// Rape
boxplot(Rape, horizontal = TRUE, xlab = "Rape Arrests", axes = FALSE)
axis(1,at = 0:ceiling(max(Rape)))
axis(2, at = 0:2, labels = FALSE)
title("Rape Arrests Per 100,000 People")

//-----// Problem 5 //-----//
hist(Rape, breaks = 10, xlim = (0:1) * 50)

//-----// Problem 7 //-----//
// move lab1_examScores.dat into working directory
// Part 1
testScores = read.table("lab1_examScores.dat")
testScores = testScores[,1]
mean(testScores)
median(testScores)
hg = hist(testScores, breaks = 10)
hg$counts
// Part 2
d = testScores[1:99]
mean(d)
median(d)
hg = hist(d, breaks = 10)
hg$counts