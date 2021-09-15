library(EloRating)

# https://cran.r-project.org/web/packages/EloRating/vignettes/EloRating_tutorial.pdf

xdata <- read.table(system.file("ex-sequence.txt", package = "EloRating"), header = TRUE)

seqcheck(winner = xdata$winner, loser = xdata$loser, Date = xdata$Date)



xpres <- read.table(system.file("ex-presence.txt", package = "EloRating"), header = TRUE)
xpres$Date <- as.Date(as.character(xpres$Date))
head(xpres)

seqcheck(winner = xdata$winner, loser = xdata$loser, Date = xdata$Date, presence = xpres, draw = xdata$Draw)



res2 <- elo.seq(winner = xdata$winner, loser = xdata$loser, Date = xdata$Date, presence = xpres,
                draw = xdata$Draw)

res2

eloplot(res2, ids = c("s", "a", "w", "k", "c"), from = "2000-06-05", to = "2000-07-04")



stab_elo(res2, from = "2000-05-05", to = "2000-06-05")


eloplot(res2, ids = colnames(xpres)[-1], from = "2000-01-01", to = "2000-09-06")

stab_elo(res2, from = "2000-01-02", to = "2000-09-06")

####

head(xdata)
head(xpres)



####

rdata <- randomsequence()

rdata$seqdat

rdata$pres


xres <- elo.seq(winner = rdata$seqdat$winner, loser = rdata$seqdat$loser, Date = rdata$seqdat$Date,
                presence = rdata$pres)


summary(xres)

rdata$pres

eloplot(res2, ids = c("s", "a", "w", "k", "c"), from = "2000-06-05", to = "2000-07-04")


stab_elo(xres, from = "2000-01-02", to = "2000-04-09")


# make matrix

