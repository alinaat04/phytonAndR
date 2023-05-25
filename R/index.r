data <- read.csv("election_data.csv")
vote_count <- aggregate(data$votes, by=list(data$candidate), FUN=sum)
names(vote_count) <- c("candidate", "votes")
library(ggplot2)
ggplot(vote_count, aes(x="", y=votes, fill=candidate)) +
 geom_bar(stat="identity", width=1) +
 coord_polar("y", start=0) +
 theme_void()
library(outliers)
grubbs.test(data$votes, opposite=TRUE, two.sided=TRUE, type=10, alpha=0.05)
