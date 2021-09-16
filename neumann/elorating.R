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

compete::org_matrix(creatematrix(res2), "ds")

compete::devries(creatematrix(res2))
compete::ttri(creatematrix(res2))
####

rdata <- randomsequence(alphabet = FALSE, reversals = 0.5)

rdata$seqdat
rdata$pres

range(rdata$seqdat$Date)



xres <- elo.seq(winner = rdata$seqdat$winner, loser = rdata$seqdat$loser, Date = rdata$seqdat$Date,
                presence = rdata$pres)

compete::org_matrix(creatematrix(xres), "ds")
compete::org_matrix(compete::get_di_matrix(creatematrix(xres)), "ds")
compete::devries(creatematrix(xres))
compete::ttri(creatematrix(xres))
compete::ttri_test(creatematrix(xres))

summary(xres)

rdata$pres

range(rdata$seqdat$Date)

eloplot(xres, ids =  colnames(rdata$pres)[-1], from = "2000-01-02", to = "2000-04-09")
stab_elo(xres, from = "2000-01-02", to = "2000-04-09")


# make matrix



#### That sequence is not random !!!
head(xdata)

ids<-matrix(replicate(nrow(xdata), sample(letters[1:10], 2, F)),ncol=2, byrow = T)

xdata.r <- xdata
xdata.r$winner <- ids[,1]
xdata.r$loser <- ids[,2]

head(xdata.r)

seqcheck(winner = xdata.r$winner, loser = xdata.r$loser, Date = xdata.r$Date)

dates <- as.Date(unique(xdata.r$Date), format="%Y-%m-%d")

xdata.r.pres <- data.frame(
  Date = seq(min(dates),max(dates),1),
  a=1,b=1,c=1,d=1,e=1,f=1,g=1,h=1,i=1,j=1
)


seqcheck(winner = xdata.r$winner, loser = xdata.r$loser, 
         Date = xdata.r$Date, presence = xdata.r.pres, 
         draw = xdata.r$Draw)



xres.r <- elo.seq(winner = xdata.r$winner, 
                  loser = xdata.r$loser, 
                  Date = xdata.r$Date,
                presence = xdata.r.pres)

compete::org_matrix(creatematrix(xres.r), "ds")
compete::org_matrix(compete::get_di_matrix(creatematrix(xres.r)), "ds")
compete::devries(creatematrix(xres.r))
compete::ttri(creatematrix(xres.r))
compete::ttri_test(creatematrix(xres.r))


eloplot(xres.r, ids =  letters[1:10], from = "2000-01-02", to = "2000-04-09")
stab_elo(xres.r, from = "2000-01-02", to = "2000-04-09")



